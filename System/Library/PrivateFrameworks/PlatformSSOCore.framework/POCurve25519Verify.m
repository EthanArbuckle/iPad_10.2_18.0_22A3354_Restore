@implementation POCurve25519Verify

- (BOOL)verifyKey:(__SecKey *)a3
{
  __SecKey *v4;
  _TtC15PlatformSSOCore18POCurve25519Verify *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = _s15PlatformSSOCore18POCurve25519VerifyC9verifyKeyySbSo03SecF3RefaF_0(v4);

  return v6 & 1;
}

- (_TtC15PlatformSSOCore18POCurve25519Verify)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[POCurve25519Verify init](&v3, sel_init);
}

@end
