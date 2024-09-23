@implementation TapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_22F078(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_touchesBegan_withEvent_, &OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchDown);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_22F078(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, &OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_22F078(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, &OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp);
}

- (void)ignoreTouch:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void (*v9)(__n128);
  uint64_t v10;
  __n128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TapGestureRecognizer();
  v6 = a3;
  v7 = a4;
  v8 = (char *)v12.receiver;
  -[TapGestureRecognizer ignoreTouch:forEvent:](&v12, "ignoreTouch:forEvent:", v6, v7);
  v9 = *(void (**)(__n128))&v8[OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp];
  if (v9)
  {
    v10 = *(_QWORD *)&v8[OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp
                       + 8];
    v11 = swift_retain(v10);
    v9(v11);
    sub_5C198((uint64_t)v9, v10);
  }

}

- (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer *)sub_22F258((uint64_t)v8, (uint64_t)a4);
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchDown), *(_QWORD *)&self->onTouchDown[OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchDown]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp), *(_QWORD *)&self->onTouchDown[OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp]);
}

@end
