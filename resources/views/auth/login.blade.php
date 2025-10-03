@extends('layouts.auth')

@section('title', 'Login')

@section('content')
<div class="row justify-content-center">
    <div class="col-lg-5">
        <div class="card shadow-lg border-0 rounded-lg mt-5">
            <div class="card-header">
                <h3 class="text-center font-weight-light my-4">Login</h3>
            </div>
            <div class="card-body">
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="flash-message">
                        {{ session('success') }}
                    </div>
                @endif
                <form method="POST" action="{{ route('login.post') }}">
                    @csrf
                    <div class="form-floating mb-3">
                        <input class="form-control" id="inputEmail" type="email" name="email" maxlength="30" placeholder="Enter E-mail" required />
                        <label for="inputEmail">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input class="form-control" id="inputPassword" type="password" name="password" placeholder="Password" required />
                        <label for="inputPassword">Password</label>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" id="inputRememberPassword" type="checkbox" name="remember" />
                        <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                    </div>
                    <div class="form-floating mb-3">
                    @if ($errors->any())
                        <div class="mt-2 alert alert-danger" id="alert-msg">
                            {{ $errors->first() }}
                        </div>
                    @endif
                    </div>
                    <div class="mt-4 mb-0">
                        <button class="btn btn-primary float-end" type="submit">Login</button>
                    </div>
                </form>
            </div>
            <div class="card-footer text-center py-3">
                <div class="small">
                    <a href="{{ route('register') }}">Need an account? Sign up!</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@stack('scripts')
    <script>
    setTimeout(function() {
        let flash = document.getElementById('alert-msg');
        if (flash) {
            flash.style.display = 'none';
        }
    }, 3000);
</script>
