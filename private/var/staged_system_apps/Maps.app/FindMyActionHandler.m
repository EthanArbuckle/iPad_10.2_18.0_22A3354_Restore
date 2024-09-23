@implementation FindMyActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;

  v5 = a3;
  swift_unknownObjectRetain(a4);
  sub_10000E144(v5, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (FindMyActionHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FindMyActionHandler();
  return -[FindMyActionHandler init](&v3, "init");
}

@end
