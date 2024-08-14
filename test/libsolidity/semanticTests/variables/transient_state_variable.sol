contract C {
    uint transient public x;

    function f() public {
        x = 8;
    }
    function g() public returns (uint) {
        x = 0;
        f();
        return x;
    }
    function h() public returns (uint) {
        return x;
    }
}
// ====
// EVMVersion: >=cancun
// compileViaYul: false
// ----
// x() -> 0
// g() -> 8
// h() -> 0
