@implementation ExtendedTabBarItem

- (_TtC5Books18ExtendedTabBarItem)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExtendedTabBarItem();
  return -[ExtendedTabBarItem init](&v3, "init");
}

- (BKRootBarItem)rootBarItem
{
  return (BKRootBarItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem));
}

- (void)setRootBarItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem) = (Class)a3;
  v3 = a3;

}

- (_TtC5Books18ExtendedTabBarItem)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExtendedTabBarItem();
  return -[ExtendedTabBarItem initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
