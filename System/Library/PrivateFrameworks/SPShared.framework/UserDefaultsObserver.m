@implementation UserDefaultsObserver

- (void)dealloc
{
  _TtC8SPShared20UserDefaultsObserver *v2;
  objc_super v3;

  v2 = self;
  sub_1B695AF1C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for UserDefaultsObserver();
  -[UserDefaultsObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC8SPShared20UserDefaultsObserver *v13;
  void (*v14)(uint64_t, uint64_t);
  id v15;
  _TtC8SPShared20UserDefaultsObserver *v16;
  _OWORD v17[2];

  if (a3)
  {
    v9 = sub_1B6987730();
    v11 = v10;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      v12 = a5;
      v13 = self;
      sub_1B6987ACC();
      swift_unknownObjectRelease();
      if (a5)
        goto LABEL_4;
LABEL_8:
      if (v11)
        goto LABEL_5;
LABEL_9:

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  memset(v17, 0, sizeof(v17));
  v15 = a5;
  v16 = self;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1B695B220();
  sub_1B6987670();

  if (!v11)
    goto LABEL_9;
LABEL_5:
  v14 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                                + OBJC_IVAR____TtC8SPShared20UserDefaultsObserver_notify);
  swift_retain();
  v14(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_10:
  sub_1B695B1E0((uint64_t)v17);
}

- (_TtC8SPShared20UserDefaultsObserver)init
{
  _TtC8SPShared20UserDefaultsObserver *result;

  result = (_TtC8SPShared20UserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
