@implementation DefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver *v18;
  _OWORD v19[2];

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = v9;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v19, 0, sizeof(v19));
    v17 = a5;
    v18 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v11 = a5;
  v12 = self;
  _bridgeAnyObjectToAny(_:)(a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v14 = v13;
  v15 = sub_100008DB0(&qword_1009D0598, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_10070D4B8);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);

LABEL_8:
  (*(void (**)(uint64_t))((char *)&self->super.isa
                                  + OBJC_IVAR____TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver_callback))(v16);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v16);
  sub_100010960((uint64_t)v19, (uint64_t *)&unk_1009D04E0);
}

- (_TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver)init
{
  _TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver *result;

  result = (_TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer("Books.DefaultsObserver", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->keyPath[OBJC_IVAR____TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver_keyPath]);
  swift_release(*(_QWORD *)&self->keyPath[OBJC_IVAR____TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver_callback]);
}

@end
