@implementation NqmlStringGenerator

- (void)parserDidStartDocument:(id)a3
{
  uint64_t v5;
  uint64_t inited;
  void *v7;
  id v8;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v9;
  NSString *v10;
  id v11;
  _QWORD *v12;
  _BYTE v13[72];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_3C7F10);
  inited = swift_initStackObject(v5, v13);
  *(_OWORD *)(inited + 16) = xmmword_2EA0D0;
  *(_QWORD *)(inited + 32) = NSFontAttributeName;
  v7 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration];
  *(_QWORD *)(inited + 64) = sub_327F8(0, (unint64_t *)&qword_3B3240, UIFont_ptr);
  *(_QWORD *)(inited + 40) = v7;
  v8 = a3;
  v9 = self;
  v10 = NSFontAttributeName;
  v11 = v7;
  v12 = (_QWORD *)sub_2881B4(inited);
  sub_2D322C(v12);

  swift_bridgeObjectRelease();
}

- (void)parserDidEndDocument:(id)a3
{
  char *v5;
  id v6;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v7;
  _BYTE v8[24];

  v5 = (char *)self + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack, v8, 33, 0);
  if (*(_QWORD *)(*(_QWORD *)v5 + 16))
  {
    v6 = a3;
    v7 = self;
    if (!sub_2D43AC())
      sub_2D2738(*(_QWORD *)(*(_QWORD *)v5 + 16) - 1);
    swift_bridgeObjectRelease();
    swift_endAccess(v8);

  }
  else
  {
    __break(1u);
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2D48A4((uint64_t)v8);

}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v14;

  type metadata accessor for NqmlAttributeName(0);
  v10 = v9;
  v11 = sub_F1C0(&qword_3B0820, type metadata accessor for NqmlAttributeName, (uint64_t)&unk_2E9F88);
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v10, &type metadata for String, v11);
  v13 = a3;
  v14 = self;
  sub_2D4A7C(a4, v12);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_2D5020(a4);

}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v6;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = a3;
  v7 = self;
  sub_2D50FC();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v5;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v6;

  v5 = a3;
  v6 = self;
  sub_2D5210();

}

- (void)parserDidStartListElement:(id)a3
{
  id v4;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_2D36BC();

}

- (void)parserDidFindNewline:(void *)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2D36BC();

}

- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4
{
  id v5;
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *v6;

  v5 = a3;
  v6 = self;
  sub_2D52D4();

}

- (_TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator)init
{
  _TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *result;

  result = (_TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.NqmlStringGenerator", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_parser));
  v3 = *(_QWORD *)&self->parser[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                    + 8];
  v6 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                     + 24];
  v7 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                    + 32];
  v8 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                     + 40];
  swift_bridgeObjectRelease(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                                          + 48]);
  swift_bridgeObjectRelease(v8);

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack));
}

@end
