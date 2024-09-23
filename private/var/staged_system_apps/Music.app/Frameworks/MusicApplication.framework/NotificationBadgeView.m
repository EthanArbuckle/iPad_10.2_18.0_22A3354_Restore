@implementation NotificationBadgeView

- (_TtC16MusicApplication21NotificationBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AAEDC();
}

- (int64_t)value
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_value);
}

- (void)setValue:(int64_t)a3
{
  _TtC16MusicApplication21NotificationBadgeView *v4;

  v4 = self;
  sub_A9EF8((id)a3);

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NotificationBadgeView();
  -[NotificationBadgeView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC16MusicApplication21NotificationBadgeView *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for NotificationBadgeView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[NotificationBadgeView frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v18.receiver = v9;
  v18.super_class = v8;
  -[NotificationBadgeView setFrame:](&v18, "setFrame:", x, y, width, height);
  type metadata accessor for CGSize(0);
  -[NotificationBadgeView frame](v9, "frame");
  v17[0] = v14;
  v17[1] = v15;
  v16[0] = v11;
  v16[1] = v13;
  if ((static ApproximatelyEquatable.!=~ infix(_:_:)(v17, v16) & 1) != 0)
  {
    sub_AA4F0();
    sub_AA5AC();
  }

}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NotificationBadgeView();
  v2 = (char *)v11.receiver;
  -[NotificationBadgeView layoutSubviews](&v11, "layoutSubviews");
  objc_msgSend(v2, "bounds", v11.receiver, v11.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_backgroundImageView], "setFrame:");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_valueLabel], "setFrame:", v4, v6, v8, v10);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication21NotificationBadgeView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_AA1AC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplication21NotificationBadgeView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_AA2DC();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NotificationBadgeView();
  v2 = v3.receiver;
  -[NotificationBadgeView tintColorDidChange](&v3, "tintColorDidChange");
  sub_AA4F0();

}

- (_TtC16MusicApplication21NotificationBadgeView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication21NotificationBadgeView *result;

  result = (_TtC16MusicApplication21NotificationBadgeView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.NotificationBadgeView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_AAE88(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_style));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_valueLabel));
}

@end
