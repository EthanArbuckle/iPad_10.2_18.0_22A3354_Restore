@implementation DebugViewControllerPriceTracking

- (DebugViewControllerPriceTracking)initWithOwner:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___DebugViewControllerPriceTracking_owner, 0);
  swift_unknownObjectWeakAssign(v6, a3);
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[DebugViewControllerPriceTracking init](&v8, "init");
}

- (DebugViewControllerPriceTracking)init
{
  DebugViewControllerPriceTracking *result;

  result = (DebugViewControllerPriceTracking *)_swift_stdlib_reportUnimplementedInitializer("Books.PriceTracking", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___DebugViewControllerPriceTracking_owner);
}

- (BKDebugViewSection)section
{
  DebugViewControllerPriceTracking *v2;
  id v3;

  v2 = self;
  v3 = sub_100266CE0();

  return (BKDebugViewSection *)v3;
}

@end
