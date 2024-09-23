@implementation PersonalMixFeedbackQuestionsRequestOperation

- (void)execute
{
  _TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation *v2;

  v2 = self;
  sub_8B7140();

}

- (_TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation)init
{
  _TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation *result;

  result = (_TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PersonalMixFeedbackQuestionsRequestOperation", 61, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  swift_release(*(_QWORD *)&self->responseHandler[OBJC_IVAR____TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation_responseHandler]);
  v3 = &self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation_baseURL];
  v4 = type metadata accessor for URL(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->responseHandler[OBJC_IVAR____TtC16MusicApplication44PersonalMixFeedbackQuestionsRequestOperation_playlistGlobalID]);
}

@end
