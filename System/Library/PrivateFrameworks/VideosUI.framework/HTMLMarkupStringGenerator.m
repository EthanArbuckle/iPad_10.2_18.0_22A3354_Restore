@implementation HTMLMarkupStringGenerator

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator_parser));
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator_logger;
  v4 = sub_1DA13FFD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator_accumulator));
  OUTLINED_FUNCTION_1_19();
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator *v10;

  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1D97CF044(v6, v8);

  OUTLINED_FUNCTION_1_19();
}

- (_TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator)init
{
  sub_1D9A525BC();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_4_11();
  v6 = v4;
  sub_1D9A52630(v7);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v6 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = v5;
  sub_1D9A527EC(v4);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  void *v4;
  id v5;
  id v6;

  v5 = a3;
  v6 = OUTLINED_FUNCTION_4_11();
  sub_1D9A528DC();

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)parserDidFindNewline:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1D9A52998();

  OUTLINED_FUNCTION_4_3(v5);
}

@end
