@implementation DOCProgressCollectionIndicatorView

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorView();
  return -[DOCProgressCollectionIndicatorView isHidden](&v3, "isHidden");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 40.0;
  v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didTap
{
  void *Strong;
  void *v4;
  _TtC5Files34DOCProgressCollectionIndicatorView *v5;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_delegate, a2);
  if (Strong)
  {
    v4 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "progressIndicatorViewDidReceiveTap:") & 1) != 0)
    {
      v5 = self;
      objc_msgSend(v4, "progressIndicatorViewDidReceiveTap:", v5);

    }
    swift_unknownObjectRelease(v4);
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC5Files34DOCProgressCollectionIndicatorView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_100242F98();

  return v9;
}

- (void)didMoveToWindow
{
  id v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorView();
  v2 = v4.receiver;
  -[DOCProgressCollectionIndicatorView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (char *)v2;
  sub_100243204(v3, (unsigned __int8 *)v3);

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Files34DOCProgressCollectionIndicatorView *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCProgressCollectionIndicatorView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[DOCProgressCollectionIndicatorView isHidden](&v9, "isHidden");
  v8.receiver = v6;
  v8.super_class = v5;
  -[DOCProgressCollectionIndicatorView setHidden:](&v8, "setHidden:", v3);
  sub_1002418C8(v7);

}

- (_TtC5Files34DOCProgressCollectionIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC5Files34DOCProgressCollectionIndicatorView *result;

  result = (_TtC5Files34DOCProgressCollectionIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCProgressCollectionIndicatorView", 40, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_preferredIconColor));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_source));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_progressGroup));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView____lazy_storage___didTapGestureRecognizer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->combinedProgress[OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_debugID
                                                             + 7]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_pointerInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCProgressCollectionIndicatorView_aggregateIndicatorView));
}

@end
