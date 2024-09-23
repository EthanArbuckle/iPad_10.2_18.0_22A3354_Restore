@implementation UIBridgeServiceDelegateWrapper

- (void)uiBridgeServiceWillStartAttending
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v2;

  v2 = self;
  sub_247455D6C();

}

- (void)uiBridgeServiceDidStartAttending
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v2;

  v2 = self;
  sub_247455DAC();

}

- (void)uiBridgeServiceDidStartAttendingWithRootRequestId:(id)a3
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v4;

  if (a3)
    sub_24745C80C();
  v4 = self;
  sub_247455DEC();

  swift_bridgeObjectRelease();
}

- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v4;

  v4 = self;
  sub_247455F5C(a3);

}

- (void)uiBridgeServiceDetectedSpeechStart
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v2;

  v2 = self;
  sub_247455FA8();

}

- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v4;

  v4 = self;
  sub_247455FE8(a3);

}

- (void)uiBridgeServiceDetectedSiriDirectedSpeech
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v2;

  v2 = self;
  sub_247456110();

}

- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v4;

  v4 = self;
  sub_247456150(a3);

}

- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v2;

  v2 = self;
  sub_2474561E4();

}

- (void)uiBridgeServiceReceivedRequestProgress:(id)a3
{
  id v4;
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_2474562EC(v4);

}

- (void)uiBridgeServiceDidReceiveTasks:(id)a3
{
  uint64_t v4;
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v5;

  sub_247459420();
  v4 = sub_24745C83C();
  v5 = self;
  sub_24745634C(v4);

  swift_bridgeObjectRelease();
}

- (void)uiBridgeServiceTaskDidEnd:(id)a3
{
  sub_247456768(self, (uint64_t)a2, (uint64_t)a3, sub_2474564B0);
}

- (void)uiBridgeServiceTaskDidCancel:(id)a3
{
  sub_247456768(self, (uint64_t)a2, (uint64_t)a3, sub_2474564D0);
}

- (void)uiBridgeServiceReceivedSiriResponse:(id)a3
{
  id v4;
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_2474567EC(v4);

}

- (void)uiBridgeServiceDidDetectLanguageMismatch:(id)a3
{
  _TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper *v4;

  sub_24745C80C();
  v4 = self;
  sub_247456924();

  swift_bridgeObjectRelease();
}

- (_TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper)init
{
  sub_2474590D4();
}

- (void).cxx_destruct
{
  sub_2474595FC((uint64_t)self + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue));
}

@end
