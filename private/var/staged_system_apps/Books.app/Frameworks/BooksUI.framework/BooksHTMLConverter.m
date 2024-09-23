@implementation BooksHTMLConverter

- (_TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter)init
{
  _TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *result;

  result = (_TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *)_swift_stdlib_reportUnimplementedInitializer("BooksUI.BooksHTMLConverter", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_parser));
  v3 = (char *)self + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_currentString;
  v4 = type metadata accessor for AttributedString(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_tagStack));
  swift_bridgeObjectRelease(*(_QWORD *)&self->parser[OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_html]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_font));
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  _TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *v14;

  type metadata accessor for NQMLAttributeName(0);
  v10 = v9;
  v11 = sub_155EB0();
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v10, &type metadata for String, v11);
  v13 = a3;
  v14 = self;
  sub_155194(a4, v12);

  swift_bridgeObjectRelease(v12);
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  char *v6;
  id v7;
  _TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];

  v6 = (char *)self + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_tagStack;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_tagStack, v12, 33, 0);
  if (*(_QWORD *)(*(_QWORD *)v6 + 16))
  {
    v7 = a3;
    v8 = self;
    sub_155130();
    v10 = v9;
    if (v9 == 1)
    {
      sub_155044(*(_QWORD *)(*(_QWORD *)v6 + 16) - 1);
      v10 = v11;
    }
    swift_endAccess(v12);

    swift_bridgeObjectRelease(v10);
  }
  else
  {
    __break(1u);
  }
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_15537C(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)parserDidFindNewline:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  _TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *v10;
  char *v11;
  _BYTE v13[24];

  v5 = type metadata accessor for AttributedString(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = a3;
  v10 = self;
  AttributedString.init(stringLiteral:)(10, 0xE100000000000000);
  v11 = (char *)v10 + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_currentString;
  swift_beginAccess((char *)v10 + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_currentString, v13, 33, 0);
  static AttributedString.+= infix(_:_:)(v11, v8);
  swift_endAccess(v13);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_155924((uint64_t)v8);

}

@end
