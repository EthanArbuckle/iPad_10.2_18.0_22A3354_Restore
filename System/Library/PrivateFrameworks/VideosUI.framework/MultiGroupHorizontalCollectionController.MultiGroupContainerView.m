@implementation MultiGroupHorizontalCollectionController.MultiGroupContainerView

- (_TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9FF48AC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v5 = self;
  v6 = OUTLINED_FUNCTION_21_4();
  sub_1D9FF4948(a4, v6);

  v7 = OUTLINED_FUNCTION_63_0();
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView)initWithFrame:(CGRect)a3
{
  sub_1D9FF4BE0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_collectionView));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_headerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_decorationView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_shelfLayout);
  swift_release();
}

@end
