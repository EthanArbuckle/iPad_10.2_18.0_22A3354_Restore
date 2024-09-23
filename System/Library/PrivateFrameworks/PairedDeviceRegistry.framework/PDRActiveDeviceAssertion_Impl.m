@implementation PDRActiveDeviceAssertion_Impl

- (BOOL)isActive
{
  uint64_t v2;
  PDRActiveDeviceAssertion_Impl *v3;
  uint64_t v4;
  void *v5;
  Swift::String v6;

  v2 = one-time initialization token for instance;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = *(uint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_);
  v5 = *(void **)(&v3->super._isActive + OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_);
  swift_retain();
  v6._countAndFlagsBits = v4;
  v6._object = v5;
  LOBYTE(v4) = RegistryCrux.isAssertionActive(identifier:)(v6);

  swift_release();
  return v4 & 1;
}

- (PDRDevice)device
{
  return (PDRDevice *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                              + OBJC_IVAR___PDRActiveDeviceAssertion_Impl_device_));
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v4;
  PDRActiveDeviceAssertion_Impl *v5;
  uint64_t v6;
  void *v7;
  Swift::String v8;
  PDRActiveDeviceAssertion_Impl *v9;

  v2 = OBJC_IVAR___PDRActiveDeviceAssertion_Impl_valid;
  if (*((_BYTE *)&self->super.super.isa + OBJC_IVAR___PDRActiveDeviceAssertion_Impl_valid) == 1)
  {
    v4 = one-time initialization token for instance;
    v5 = self;
    v9 = v5;
    if (v4 != -1)
    {
      swift_once();
      v5 = v9;
    }
    v6 = *(uint64_t *)((char *)&v5->super.super.isa + OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_);
    v7 = *(void **)(&v5->super._isActive + OBJC_IVAR___PDRActiveDeviceAssertion_Impl_identifier_);
    swift_retain();
    v8._countAndFlagsBits = v6;
    v8._object = v7;
    RegistryCrux.invalidateSwitchAssertion(identifier:)(v8);
    swift_release();
    *((_BYTE *)&self->super.super.isa + v2) = 0;

  }
}

- (void)dealloc
{
  PDRActiveDeviceAssertion_Impl *v2;
  objc_super v3;

  v2 = self;
  -[PDRActiveDeviceAssertion_Impl invalidate](v2, sel_invalidate);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActiveDeviceAssertion_Impl();
  -[PDRActiveDeviceAssertion_Impl dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (PDRActiveDeviceAssertion_Impl)init
{
  PDRActiveDeviceAssertion_Impl *result;

  result = (PDRActiveDeviceAssertion_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
