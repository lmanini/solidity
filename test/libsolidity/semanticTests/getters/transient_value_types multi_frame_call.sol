contract C {
}

contract D {
    int8 public transient x;

    function f() public returns(int8) {
        x = -1;
        return h();
    }
    function g() public {
        x = x - 1;
    }
    function h() public returns(int8) {
        g();
        return this.x();
    }
}
// ====
// EVMVersion: >=cancun
// compileViaYul: false
// ----
// x() -> 0
// f() -> -2
// h() -> -1
// x() -> 0
