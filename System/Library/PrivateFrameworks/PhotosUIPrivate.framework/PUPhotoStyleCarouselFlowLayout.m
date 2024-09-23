@implementation PUPhotoStyleCarouselFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x;
  double y;
  double v6;
  _TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  x = a4.x;
  y = a3.y;
  v6 = a3.x;
  v7 = self;
  sub_1AAC8EA50(v6, y, x);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  _TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1AAC8ED4C(x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout)init
{
  return (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout *)sub_1AAC8EFA8();
}

- (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivate30PUPhotoStyleCarouselFlowLayout *)sub_1AAC8EFF8(a3);
}

@end
