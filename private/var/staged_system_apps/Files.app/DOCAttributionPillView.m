@implementation DOCAttributionPillView

- (_TtC5Files22DOCAttributionPillView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files22DOCAttributionPillView *)sub_10028BC20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files22DOCAttributionPillView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028D594();
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCAttributionPillView();
  return -[DOCAttributionPillView isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Files22DOCAttributionPillView *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCAttributionPillView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[DOCAttributionPillView isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[DOCAttributionPillView setHighlighted:](&v8, "setHighlighted:", v3);
  sub_10028BEE4(v7);

}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC5Files22DOCAttributionPillView *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3)
    -[DOCAttributionPillView sendActionsForControlEvents:](v5, "sendActionsForControlEvents:", 64);

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCAttributionPillView();
  v2 = (char *)v4.receiver;
  -[DOCAttributionPillView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Files22DOCAttributionPillView_backgroundView];
  objc_msgSend(v3, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "_setContinuousCornerRadius:", CGRectGetHeight(v5) * 0.5);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC5Files22DOCAttributionPillView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10028D720();

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->senderName[OBJC_IVAR____TtC5Files22DOCAttributionPillView_senderName]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCAttributionPillView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCAttributionPillView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCAttributionPillView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCAttributionPillView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCAttributionPillView_chevronView));
  sub_10008D9C4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC5Files22DOCAttributionPillView____lazy_storage___baseFont));
  sub_10008D9C4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC5Files22DOCAttributionPillView____lazy_storage___senderFont));
  sub_10008D9C4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC5Files22DOCAttributionPillView____lazy_storage___chevronFont));
}

@end
