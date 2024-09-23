@implementation BKSharedWithYouProvider

- (_TtC5Books23BKSharedWithYouProvider)init
{
  objc_class *ObjectType;
  void *v4;
  id v5;
  _TtC5Books23BKSharedWithYouProvider *v6;
  _TtC5Books23BKSharedWithYouProvider *v7;
  uint64_t v8;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for BSUISharedWithYouController(0);
  v4 = (void *)static BSUISharedWithYouController.shared.getter();
  v5 = objc_allocWithZone(ObjectType);
  sub_1003665F8(v4);
  v7 = v6;
  v8 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v8, 24, 7);
  return v7;
}

- (BSUIDynamicArray)dynamicArray
{
  return (BSUIDynamicArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC5Books23BKSharedWithYouProvider_dynamicArray));
}

- (void)update:(id)a3
{
  id v4;
  _TtC5Books23BKSharedWithYouProvider *v5;

  v4 = a3;
  v5 = self;
  BKSharedWithYouProvider.update(_:)();

}

- (void)refresh
{
  _TtC5Books23BKSharedWithYouProvider *v2;

  v2 = self;
  sub_10001153C();

}

- (void).cxx_destruct
{

}

@end
