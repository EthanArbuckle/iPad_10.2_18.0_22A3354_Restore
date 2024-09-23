@implementation ConversationViewModel

- (_TtC17SequoiaTranslator21ConversationViewModel)init
{
  _TtC17SequoiaTranslator21ConversationViewModel *result;

  result = (_TtC17SequoiaTranslator21ConversationViewModel *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.ConversationViewModel", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_speechManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_ttsManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_languagesService));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_session));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_errorStateContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_translationOptions));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_deviceHelper));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel____lazy_storage___textManager));
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__deviceOwnerLocale;
  v4 = sub_100006DF4(&qword_10028F270);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partnerLocale, v4);
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__disableMicrophone;
  v7 = sub_100006DF4((uint64_t *)&unk_1002987F0);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__isListening, v7);
  v9 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partialSpeechResult;
  v10 = sub_100006DF4(&qword_10028EFB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partialTextResult;
  v12 = sub_100006DF4(&qword_10028F728);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__deviceOwnerText;
  v14 = sub_100006DF4(&qword_10028B5B8);
  v15 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
  v15(v13, v14);
  v15((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partnerText, v14);
  v16 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__stateError;
  v17 = sub_100006DF4(&qword_10028DF20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__transactionalError;
  v19 = sub_100006DF4(&qword_10028DF18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  v8((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__showErrorAlert, v7);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_currentRecordingStopTonePlaybackTask));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_subscriptions));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_currentSelfLoggingInvocation));
  swift_bridgeObjectRelease(*(_QWORD *)&self->translator[OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_lastEnteredText]);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_lastSourceLocale, (uint64_t *)&unk_10028FE50);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_lastTargetLocale, (uint64_t *)&unk_10028FE50);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__selfAutoTranslateSessionId, (uint64_t *)&unk_10028F1B0);
}

@end
