@implementation PersonalMixSendFeedbackRequestOperation

- (void)execute
{
  _TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation *v2;

  v2 = self;
  sub_72A020();

}

- (_TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation)init
{
  _TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation *result;

  result = (_TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PersonalMixSendFeedbackRequestOperation", 56, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->playlistGlobalID[OBJC_IVAR____TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation_baseURL];
  v4 = type metadata accessor for URL(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->playlistGlobalID[OBJC_IVAR____TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation_playlistGlobalID
                                                             + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->playlistGlobalID[OBJC_IVAR____TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation_songStoreID
                                                             + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->playlistGlobalID[OBJC_IVAR____TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation_choices]);
  swift_release(*(_QWORD *)&self->playlistGlobalID[OBJC_IVAR____TtC16MusicApplication39PersonalMixSendFeedbackRequestOperation_responseHandler
                                                 + 8]);
}

@end
