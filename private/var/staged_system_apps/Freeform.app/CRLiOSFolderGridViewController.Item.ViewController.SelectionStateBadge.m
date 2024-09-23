@implementation CRLiOSFolderGridViewController.Item.ViewController.SelectionStateBadge

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)init
{
  _TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge *result;

  sub_100B33134();
  return result;
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100B36700();
}

- (CGSize)intrinsicContentSize
{
  _TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_100B33434();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100B33564(x, y, width, height);

}

- (void)updateConstraints
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s4ItemC14ViewControllerC19SelectionStateBadgeCMa();
  v2 = v3.receiver;
  -[CRLiOSFolderGridViewController.Item.ViewController.SelectionStateBadge updateConstraints](&v3, "updateConstraints");
  sub_100B33C80();

}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge)initWithFrame:(CGRect)a3
{
  sub_100B33E4C((uint64_t)self, (uint64_t)a2, (uint64_t)"Freeform.SelectionStateBadge", 28);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_baseCheckedImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_baseUncheckedImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_checkedImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController19SelectionStateBadge_uncheckedImage));
}

@end
