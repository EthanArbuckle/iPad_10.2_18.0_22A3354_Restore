@implementation TTRIMarginTransferringContainerStackView

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = sub_1B4437E60(self, a3.width, a3.height, (uint64_t)a2, (void (*)(void))TTRIMarginTransferringContainerStackView.marginTransferHelper.getter, (uint64_t (*)(uint64_t))type metadata accessor for TTRIMarginTransferringContainerStackView);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  sub_1B4437FA8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (void (*)(void))TTRIMarginTransferringContainerStackView.marginTransferHelper.getter, (uint64_t (*)(uint64_t))type metadata accessor for TTRIMarginTransferringContainerStackView);
}

- (_TtC15RemindersUICore40TTRIMarginTransferringContainerStackView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore40TTRIMarginTransferringContainerStackView *)sub_1B44381E4((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC15RemindersUICore40TTRIMarginTransferringContainerStackView____lazy_storage___marginTransferHelper, type metadata accessor for TTRIMarginTransferringContainerStackView);
}

- (_TtC15RemindersUICore40TTRIMarginTransferringContainerStackView)initWithArrangedSubviews:(id)a3
{
  return (_TtC15RemindersUICore40TTRIMarginTransferringContainerStackView *)sub_1B4438384((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15RemindersUICore40TTRIMarginTransferringContainerStackView____lazy_storage___marginTransferHelper, (uint64_t (*)(uint64_t))type metadata accessor for TTRIMarginTransferringContainerStackView);
}

- (_TtC15RemindersUICore40TTRIMarginTransferringContainerStackView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore40TTRIMarginTransferringContainerStackView *)sub_1B44384B0((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15RemindersUICore40TTRIMarginTransferringContainerStackView____lazy_storage___marginTransferHelper, type metadata accessor for TTRIMarginTransferringContainerStackView);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
