@implementation LearnMoreSmartFoldersFiltersView

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC11MobileNotes32LearnMoreSmartFoldersFiltersView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView____lazy_storage___collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_diffableDataSource) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[LearnMoreSmartFoldersFiltersView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_1003DFFDC();

  return v9;
}

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView *)sub_1003E031C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_diffableDataSource));
}

@end
