@implementation PXPeopleNamingCreator

+ (id)namingViewControllerFor:(id)a3 presentationEnvironment:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_unknownObjectRetain();
  v5 = (void *)sub_1A70CA1FC(v4);

  swift_unknownObjectRelease();
  return v5;
}

- (PXPeopleNamingCreator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PXPeopleNamingCreator init](&v3, sel_init);
}

@end
