@implementation TintColorObservingView

- (void)tintColorDidChange
{
  char *v2;
  void (*v3)(void);
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TintColorObservingView();
  v2 = (char *)v7.receiver;
  -[TintColorObservingView tintColorDidChange](&v7, "tintColorDidChange");
  v3 = *(void (**)(void))&v2[OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback];
  if (!v3)
    goto LABEL_4;
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback + 8];
  swift_retain();
  v5 = objc_msgSend(v2, "tintColor", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    v3();

    sub_145A0((uint64_t)v3, v4);
LABEL_4:

    return;
  }
  __break(1u);
}

- (_TtC12NowPlayingUI22TintColorObservingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback);
  v9 = (objc_class *)type metadata accessor for TintColorObservingView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[TintColorObservingView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI22TintColorObservingView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback);
  v6 = (objc_class *)type metadata accessor for TintColorObservingView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[TintColorObservingView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback), *(_QWORD *)&self->tintColorDidChangeCallback[OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback]);
}

@end
