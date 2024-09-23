@implementation CRLiOSFolderGridViewController.ListItem

- (_TtCC8Freeform30CRLiOSFolderGridViewController8ListItem)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController8ListItem____lazy_storage___listViewController) = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s8ListItemCMa(0);
  return -[CRLiOSFolderGridViewController.Item initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController8ListItem)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController8ListItem____lazy_storage___listViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s8ListItemCMa(0);
  return -[CRLiOSFolderGridViewController.Item initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController8ListItem____lazy_storage___listViewController));
}

@end
