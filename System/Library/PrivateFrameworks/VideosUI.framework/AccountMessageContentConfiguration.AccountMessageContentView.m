@implementation AccountMessageContentConfiguration.AccountMessageContentView

- (_TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C39C58();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1D9C39CD8(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView *v2;

  v2 = self;
  sub_1D9C39DF8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView)initWithFrame:(CGRect)a3
{
  sub_1D9C39FB8();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView_accountMessageView));
}

@end
