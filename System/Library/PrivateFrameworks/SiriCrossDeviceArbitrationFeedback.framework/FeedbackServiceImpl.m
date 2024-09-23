@implementation FeedbackServiceImpl

+ (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)sharedService
{
  return (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *)static FeedbackServiceImpl.sharedService.getter();
}

- (_TtP34SiriCrossDeviceArbitrationFeedback23FeedbackServiceDelegate_)delegate
{
  return (_TtP34SiriCrossDeviceArbitrationFeedback23FeedbackServiceDelegate_ *)(id)sub_24628C764();
}

- (void)setDelegate:(id)a3
{
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_24628C7F4((uint64_t)a3);

}

- (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_)globals
{
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_24628CA9C();
  v4 = v3;

  return (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_ *)v4;
}

- (void)setGlobals:(id)a3
{
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_24628CB74((uint64_t)a3);

}

+ (NSURL)receivedArbitrationsDirectoryURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_2462AEC18();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static FeedbackServiceImpl.receivedArbitrationsDirectoryURL.getter();
  v6 = (void *)sub_2462AEBE8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (void)add:(id)a3
{
  id v4;
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v5;

  v4 = a3;
  v5 = self;
  sub_24628CC0C((uint64_t)v4);

}

- (void)addWithParticipation:(id)a3 directoryPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v10;

  v6 = sub_2462AEF54();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_24628CD18((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)handleAssistantDismissed
{
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v2;

  v2 = self;
  sub_24628E5E4();

}

- (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)init
{
  return (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *)FeedbackServiceImpl.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl____lazy_storage___notificationService));
  swift_unknownObjectRelease();
}

- (void)handleWithResponse:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_24628E890(v7, (uint64_t)v8, (void (**)(_QWORD))v6);
  _Block_release(v6);

}

@end
