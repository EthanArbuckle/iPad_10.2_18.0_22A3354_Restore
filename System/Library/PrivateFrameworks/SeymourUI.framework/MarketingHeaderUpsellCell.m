@implementation MarketingHeaderUpsellCell

- (_TtC9SeymourUI25MarketingHeaderUpsellCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25MarketingHeaderUpsellCell *)sub_22BA08EB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25MarketingHeaderUpsellCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA09D6C();
}

- (void)prepareForReuse
{
  _TtC9SeymourUI25MarketingHeaderUpsellCell *v2;

  v2 = self;
  sub_22BA09390();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI25MarketingHeaderUpsellCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[MarketingHeaderUpsellCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_itemInfo);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onElementAppearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onElementDisappearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onVisibleBoundsChange));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_onImpressionableBoundsChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25MarketingHeaderUpsellCell_marketingView));
}

@end
