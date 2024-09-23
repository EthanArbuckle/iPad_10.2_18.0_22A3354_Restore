@implementation PaymentRequestViewInterfaceFactory

+ (id)interfaceForConfiguration:(id)a3 withDelegate:(id)a4
{
  id v4;
  id v5;
  _BYTE v7[32];

  v4 = a3;
  swift_unknownObjectRetain();
  sub_19DE8868C();
  swift_unknownObjectRelease();
  swift_getObjCClassMetadata();
  v5 = static PaymentRequestViewInterfaceFactory.interface(forConfiguration:withDelegate:)(v4, (uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (_TtC9PassKitUI34PaymentRequestViewInterfaceFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaymentRequestViewInterfaceFactory();
  return -[PaymentRequestViewInterfaceFactory init](&v3, sel_init);
}

@end
