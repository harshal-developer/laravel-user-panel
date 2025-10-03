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
    table tr {
        transition: background-color 0.5s ease;
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
                    <div  class="alert alert-success text-center mb-0 flash-message">
                        {{ session('success') }}
                    </div>
                    @endif
                    @if(session('error'))
                        <div class="alert alert-danger text-center mb-0 flash-message">
                            {{ session('error') }}
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
                                <button type="button" class="btn btn-sm btn-info check-btn"  data-gender="{{ strtolower($user->gender) }}"><i class="fas fa-check"></i> Check</button>
                                <button type="button" class="btn btn-success btn-sm view-btn"  data-id="{{ $user->id }}"><i class="fas fa-eye"></i> View</button>
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
    {{-- Bootstrap modal  --}}
    <!-- User Details Modal -->
    <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userModalLabel">User Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Name:</strong> <span id="modal-name"></span></p>
                <p><strong>Email:</strong> <span id="modal-email"></span></p>
                <p><strong>Phone:</strong> <span id="modal-phone"></span></p>
                <p><strong>Gender:</strong> <span id="modal-gender"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
            </div>
        </div>
    </div>
    {{-- Here this mdoal ends  --}}

</main>
@endsection

@stack('scripts')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    setTimeout(function() {
        let flash = document.querySelector('alert-msg');
        if (flash) {
            flash.style.display = 'none';
        }
    }, 5000);

    // Genedar with color identification 
    document.addEventListener('DOMContentLoaded', function() {
        const checkButtons = document.querySelectorAll('.check-btn');

        checkButtons.forEach(button => {
            button.addEventListener('click', function() {
                const gender = this.getAttribute('data-gender');
                const row = this.closest('tr');
                let originalColor = row.style.backgroundColor; // store original
                if (gender === 'male') {
                    row.style.backgroundColor = 'lightgreen';
                } else if (gender === 'female') {
                    row.style.backgroundColor = 'lightcoral';
                } else {
                    row.style.backgroundColor = 'orange';
                }
                 setTimeout(() => {
                    row.style.backgroundColor = originalColor;
                }, 3000); //looks nice due to this
            });
        });
    });

    $(document).ready(function() {
        $(document).on('click', '.view-btn', function() {
        var userId = $(this).data('id');
            $.ajax({
                url: "{{ route('users.view') }}",
                type: "POST",
                data: {
                    id: userId,
                    _token: "{{ csrf_token() }}"
                },
                success: function(response) {
                    if (response.status) {
                        $('#modal-name').text(response.data.name);
                        $('#modal-email').text(response.data.email);
                        $('#modal-phone').text(response.data.phone);
                        $('#modal-gender').text(response.data.gender);
                        $('#userModal').modal('show');
                    } else {
                        alert(response.message || 'User not found');
                    }
                },
                error: function(xhr) {
                    console.error(xhr.responseText);
                    alert('Something went wrong. Please try again.');
                }
            });
        });
    });
</script>
