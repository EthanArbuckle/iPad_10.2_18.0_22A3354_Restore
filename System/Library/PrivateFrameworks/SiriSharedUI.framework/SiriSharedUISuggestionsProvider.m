@implementation SiriSharedUISuggestionsProvider

- (_TtC12SiriSharedUI31SiriSharedUISuggestionsProvider)init
{
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_suggestionsExposureCallback);
  *v3 = 0;
  v3[1] = 0;
  v4 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_currentRequestId;
  v5 = sub_1DE12FEA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_cachedAutoCompletionsFacade) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SiriSharedUISuggestionsProvider();
  return -[SiriSharedUISuggestionsProvider init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_1DE0F2F88(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_suggestionsExposureCallback));
  sub_1DE0EDB88((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI31SiriSharedUISuggestionsProvider_currentRequestId, &qword_1F0433BB8);
  swift_release();
}

@end
