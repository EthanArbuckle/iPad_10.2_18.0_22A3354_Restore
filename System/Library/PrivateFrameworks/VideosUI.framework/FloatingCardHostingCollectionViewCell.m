@implementation FloatingCardHostingCollectionViewCell

- (BOOL)_disableRasterizeInAnimations
{
  _TtC8VideosUI37FloatingCardHostingCollectionViewCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1D9BDEEBC();

  return v3 & 1;
}

- (_TtC8VideosUI37FloatingCardHostingCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI37FloatingCardHostingCollectionViewCell *result;

  sub_1D9BDEFB0();
  return result;
}

- (_TtC8VideosUI37FloatingCardHostingCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9BDF038();
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI37FloatingCardHostingCollectionViewCell *v2;

  v2 = self;
  sub_1D9BDF0C4();

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end
