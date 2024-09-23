@implementation _Capability.AssertionObserver

- (void).cxx_destruct
{
  sub_245DB4668(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__willInvalidate));
  sub_245DB4668(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__didInvalidate));
  swift_release();
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_245DB37D4(&OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__didInvalidate);

}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  _TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver *v5;

  v4 = a3;
  v5 = self;
  sub_245DB37D4(&OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__willInvalidate);

}

- (_TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver)init
{
  _TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver *result;

  result = (_TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
