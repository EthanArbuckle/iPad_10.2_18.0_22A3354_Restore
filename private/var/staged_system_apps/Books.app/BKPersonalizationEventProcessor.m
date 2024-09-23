@implementation BKPersonalizationEventProcessor

- (BKPersonalizationEventProcessor)initWithDonor:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKPersonalizationEventProcessor_donor) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PersonalizationEventProcessor();
  v4 = a3;
  return -[BKPersonalizationEventProcessor init](&v6, "init");
}

- (BKPersonalizationEventProcessor)init
{
  BKPersonalizationEventProcessor *result;

  result = (BKPersonalizationEventProcessor *)_swift_stdlib_reportUnimplementedInitializer("Books.PersonalizationEventProcessor", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
