@implementation AmbientMatchUIView

- (_TtC11ShazamKitUI18AmbientMatchUIView)initWithFrame:(CGRect)a3
{
  _TtC11ShazamKitUI18AmbientMatchUIView *result;

  sub_2287C7A70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC11ShazamKitUI18AmbientMatchUIView)initWithCoder:(id)a3
{
  _TtC11ShazamKitUI18AmbientMatchUIView *result;

  sub_2287C91F0(a3);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC11ShazamKitUI18AmbientMatchUIView *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  CGSize result;

  v2 = self;
  v3 = -[AmbientMatchUIView superview](v2, sel_superview);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = sub_2287C78FC();
  objc_msgSend(v9, sel_setConstant_, v8 + -98.0);

  v10 = v6;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint));
}

@end
