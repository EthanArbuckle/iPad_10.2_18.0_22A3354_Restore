@implementation TextView.Coordinator

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100682DF4(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100682F18(v4);

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100683070(v4);

}

- (_TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator)init
{
  _TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator *result;

  result = (_TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("Books.Coordinator", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator__text);
  v4 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator__text];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_text[OBJC_IVAR____TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator__text
                                                  + 16]);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(*(_QWORD *)&self->_text[OBJC_IVAR____TtCV5BooksP33_B79FF19A106F9D407BB73D2F778CFAEA8TextView11Coordinator_placeholder]);
}

@end
