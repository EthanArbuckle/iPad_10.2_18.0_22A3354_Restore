@implementation TintColorObservingView

- (void)tintColorDidChange
{
  char *v2;
  char *v3;
  void (*v4)(void);
  uint64_t v5;
  id v6;
  void *v7;
  char v8[24];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TintColorObservingView();
  v2 = (char *)v9.receiver;
  -[TintColorObservingView tintColorDidChange](&v9, "tintColorDidChange");
  v3 = &v2[OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback];
  swift_beginAccess(&v2[OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback], v8, 0, 0);
  v4 = *(void (**)(void))v3;
  if (!*(_QWORD *)v3)
    goto LABEL_4;
  v5 = *((_QWORD *)v3 + 1);
  v6 = objc_msgSend(v2, "tintColor", swift_retain(v5).n128_f64[0]);
  if (v6)
  {
    v7 = v6;
    v4();

    sub_5C198((uint64_t)v4, v5);
LABEL_4:

    return;
  }
  __break(1u);
}

- (_TtC16MusicApplication22TintColorObservingView)initWithFrame:(CGRect)a3
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
               + OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback);
  v9 = (objc_class *)type metadata accessor for TintColorObservingView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[TintColorObservingView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication22TintColorObservingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplication22TintColorObservingView *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TintColorObservingView();
  v5 = a3;
  v6 = -[TintColorObservingView initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback), *(_QWORD *)&self->tintColorDidChangeCallback[OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback]);
}

@end
