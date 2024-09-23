@implementation CRLiOSFolderGridViewController.Item.ViewController.FavoriteButton

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)init
{
  return (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton *)sub_100B324CC();
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100B365FC();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)buttonType
{
  return 0;
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)initWithFrame:(CGRect)a3
{
  sub_100B33E4C((uint64_t)self, (uint64_t)a2, (uint64_t)"Freeform.FavoriteButton", 23);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton_favoriteIconFillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton_favoriteIconOuterGlowImageView));
  sub_1004CBB0C((uint64_t)self+ OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton_accessibilityDelegate);
}

@end
