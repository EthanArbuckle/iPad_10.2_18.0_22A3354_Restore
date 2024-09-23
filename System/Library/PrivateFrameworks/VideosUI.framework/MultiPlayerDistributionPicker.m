@implementation MultiPlayerDistributionPicker

- (_TtC8VideosUI29MultiPlayerDistributionPicker)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI29MultiPlayerDistributionPicker *result;

  sub_1D9F47844();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI29MultiPlayerDistributionPicker)initWithCoder:(id)a3
{
  _TtC8VideosUI29MultiPlayerDistributionPicker *result;

  sub_1D9F4791C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  _TtC8VideosUI29MultiPlayerDistributionPicker *v2;
  void *v3;

  v2 = self;
  sub_1D9F47A00();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F022FE00);
  v3 = (void *)OUTLINED_FUNCTION_10_17();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29MultiPlayerDistributionPicker____lazy_storage___featuredDistributionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29MultiPlayerDistributionPicker____lazy_storage___equalDistributionButton));
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI29MultiPlayerDistributionPicker_onDistributionChange));
}

@end
