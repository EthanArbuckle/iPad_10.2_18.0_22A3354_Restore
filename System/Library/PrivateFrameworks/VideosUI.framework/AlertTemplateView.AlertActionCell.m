@implementation AlertTemplateView.AlertActionCell

- (NSArray)preferredFocusEnvironments
{
  _TtCC8VideosUI17AlertTemplateView15AlertActionCell *v2;
  void *v3;

  v2 = self;
  sub_1D9C60DD0();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F022FE00);
  v3 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)v3;
}

- (void)prepareForReuse
{
  _TtCC8VideosUI17AlertTemplateView15AlertActionCell *v2;

  v2 = self;
  sub_1D9C60E50();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)layoutSubviews
{
  _TtCC8VideosUI17AlertTemplateView15AlertActionCell *v2;

  v2 = self;
  sub_1D9C60EC8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtCC8VideosUI17AlertTemplateView15AlertActionCell)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI17AlertTemplateView15AlertActionCell *result;

  sub_1D9C60FA8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI17AlertTemplateView15AlertActionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C610B0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI17AlertTemplateView15AlertActionCell_buttonView));
}

@end
