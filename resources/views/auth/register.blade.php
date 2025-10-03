@extends('layouts.auth')

@section('title', 'Register')

@section('content')
<div class="row justify-content-center">
    <div class="col-lg-5">
        <div class="card shadow-lg border-0 rounded-lg mt-5">
            <div class="card-header">
                <h3 class="text-center font-weight-light my-4">Sign Up</h3>
            </div>
            <div class="card-body">
                <form method="POST" action="{{ route('register.post') }}">
                    @csrf

                    <div class="form-floating mb-3">
                        <input class="form-control" id="name" type="text" name="name" maxlength="50" value="{{ old('name') }}" placeholder="Enter Name" required />
                        <label for="name">Full Name</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input class="form-control" id="email" type="email" name="email" maxlength="30" value="{{ old('email') }}" placeholder="Enter E-mail" required />
                        <label for="email">Email address</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input class="form-control" id="password" type="password" name="password" placeholder="Password" required />
                        <label for="password">Password</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input class="form-control" id="password_confirmation" type="password" name="password_confirmation" placeholder="Confirm Password" required />
                        <label for="password_confirmation">Confirm Password</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select" id="gender" name="gender" required>
                            <option value="">Select Gender</option>
                            <option value="male" {{ old('gender')=='male'?'selected':'' }}>Male</option>
                            <option value="female" {{ old('gender')=='female'?'selected':'' }}>Female</option>
                            <option value="other" {{ old('gender')=='other'?'selected':'' }}>Prefer not to say</option>
                        </select>
                        <label for="gender">Gender</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input class="form-control" id="phone" type="text" name="phone" maxlength="15" value="{{ old('phone') }}" placeholder="Mobile Number" />
                        <label for="phone">Mobile</label>
                    </div>
                    <div class="form-floating mb-3">
                        @if ($errors->any())
                            <div class="mt-2 alert alert-danger " id="alert-msg">
                                <ul class="mb-0">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                    </div>
                    <div class="mt-4 mb-0">
                        <button class="btn btn-primary float-end" type="submit">Register</button>
                    </div>
                </form>
            </div>
            <div class="card-footer text-center py-3">
                <div class="small">
                    Already have an account? <a href="{{ route('login') }}">Login here!</a>
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
    }, 5000);
</script>


