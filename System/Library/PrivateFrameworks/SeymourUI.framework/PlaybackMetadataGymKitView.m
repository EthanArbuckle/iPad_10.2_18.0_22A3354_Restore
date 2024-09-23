@implementation PlaybackMetadataGymKitView

- (id)viewForBaselineLayout
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_titleLabel));
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI26PlaybackMetadataGymKitView *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_imageView);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  v6 = *(Class *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_titleLabel);
  objc_msgSend(v6, sel_intrinsicContentSize);
  v8 = v5 + v7;
  objc_msgSend(v6, sel_intrinsicContentSize);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC9SeymourUI26PlaybackMetadataGymKitView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26PlaybackMetadataGymKitView *)sub_22B5ACB10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26PlaybackMetadataGymKitView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5AD7A0();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI26PlaybackMetadataGymKitView *v2;

  v2 = self;
  sub_22B5AD228();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26PlaybackMetadataGymKitView_titleLabel));
}

@end
