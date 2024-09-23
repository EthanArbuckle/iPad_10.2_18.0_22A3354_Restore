@implementation FMNoLocationBackgroundView

- (_TtC6FindMy26FMNoLocationBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC6FindMy26FMNoLocationBackgroundView *)sub_1000128B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6FindMy26FMNoLocationBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A8EE8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMNoLocationBackgroundView();
  v4 = a3;
  v5 = v6.receiver;
  -[FMNoLocationBackgroundView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10000FC1C();

}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[9];
  _OWORD v9[2];

  v3 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 136];
  v8[8] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 120];
  v9[0] = v3;
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle
                                                             + 145];
  v4 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 72];
  v8[4] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 56];
  v8[5] = v4;
  v5 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 104];
  v8[6] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 88];
  v8[7] = v5;
  v6 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle);
  v8[1] = v6;
  v7 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 40];
  v8[2] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 24];
  v8[3] = v7;
  sub_100281480((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_centerCircle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_centerPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_centerImage));
}

@end
