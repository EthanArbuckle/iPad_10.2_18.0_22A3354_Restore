@implementation AccountButton

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountButton();
  return -[AccountButton tintColor](&v3, sel_tintColor);
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AccountButton();
  v2 = (char *)v4.receiver;
  -[AccountButton layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightView], sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);

}

- (void)setTintColor:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AccountButton();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[AccountButton setTintColor:](&v8, sel_setTintColor_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC9SeymourUI13AccountButton_imageView];
  v7 = objc_msgSend(v5, sel_tintColor, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_setTintColor_, v7);

}

- (_TtC9SeymourUI13AccountButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13AccountButton *)AccountButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13AccountButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B52841C();
}

- (void)tappedDown
{
  _TtC9SeymourUI13AccountButton *v2;

  v2 = self;
  sub_22B527934();

}

- (void)tappedUp
{
  uint64_t v2;
  _TtC9SeymourUI13AccountButton *v3;
  _TtC9SeymourUI13AccountButton *v4;

  v2 = OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightTask;
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightTask))
  {
    v3 = self;
    swift_retain();
    sub_22BA803A0();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v2) = 0;
  swift_release();
  sub_22B527DD8(0);

}

- (void)longPressWithGesture:(id)a3
{
  id v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  _TtC9SeymourUI13AccountButton *v7;

  v4 = a3;
  v7 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.super.isa
                                        + OBJC_IVAR____TtC9SeymourUI13AccountButton_onLongPressed);
    if (v5)
    {
      v6 = swift_retain();
      v5(v6);
      sub_22B0FAA68((uint64_t)v5);
    }
  }

}

- (void).cxx_destruct
{
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13AccountButton_onLongPressed));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13AccountButton_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13AccountButton_avatarViewController));
  swift_release();
}

@end
