@extends('layouts.app')

@section('title', 'Users')

@section('content')
<style>
    .pagination {
        font-size: 0.8rem;   /* text chhota kare */
    }

    .pagination li {
        margin: 0 2px;       /* buttons ke beech kam space */
    }

    .pagination a,
    .pagination span {
        padding: 4px 8px;    /* button size chhota kare */
    }
</style>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Users</h1>
        <ol class="breadcrumb mb-4">
            {{-- <li class="breadcrumb-item active">Users</li> --}}
        </ol>

        {{-- Add User Button + Search --}}
        <div class="d-flex justify-content-between mb-3">
            <form method="GET" action="{{ route('users.index') }}" class="d-flex" style="margin-bottom:0px" >
                <input type="text" name="q" value="{{ old('q', $q ?? '') }}" class="form-control me-2" placeholder="Search(name,email,phone)">
                <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
            </form>
            <a href="{{ route('users.create') }}" class="btn btn-success"><i class="fas fa-plus"></i> Create</a>
        </div>

        {{-- Users Table --}}
        <div class="card mb-4">
            <div class="card-header">
                <div class="card-title mb-0" id="alert-msg">
                    @if(session('success'))
                    <div id="flash-message" class="alert alert-success text-center mb-0">
                        {{ session('success') }}
                    </div>
                    @endif
                </div>
            </div>
            <div class="card-body">
                <table id="datatablesSimple" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                       @forelse($users as $key => $user)
                        <tr>
                            <td>{{ $users->firstItem() + $key }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->phone }}</td>
                            <td>{{ ucfirst($user->gender) }}</td>
                            <td>
                                <a href="{{ route('users.edit', $user) }}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</a>
                                <form action="{{ route('users.destroy', $user) }}" method="POST" style="display:inline" onsubmit="return confirm('Delete {{ $user->email }}?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"> </i>Delete</button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6">No users found.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        {{-- Pagination --}}
        <div class="d-flex justify-content-center">
            <ul class="pagination pagination-sm">
                {{ $users->withQueryString()->links() }}
            </ul>
        </div>
    </div>
</main>
@endsection
@stack('scripts')
    <script>
    setTimeout(function() {
        let flash = document.getElementById('alert-msg');
        if (flash) {
            flash.style.display = 'none';
        }
    }, 5000);
</script>
