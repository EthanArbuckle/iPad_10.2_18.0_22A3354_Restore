@implementation UIManager

- (_TtC21ProximityReaderDaemon9UIManager)init
{
  return (_TtC21ProximityReaderDaemon9UIManager *)sub_244DD847C();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_244DB4E08(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_invalidationHandler));
}

- (void)updateWithTransactionEvent:(int64_t)a3
{
  sub_244DDD0D8((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_updateWithTransactionEvent_);
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  void *v4;
  _TtC21ProximityReaderDaemon9UIManager *v5;
  void *v6;

  sub_244E4E4CC();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI);
  if (v4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    v6 = (void *)sub_244E4E4C0();
    objc_msgSend(v4, sel_vasReadSuccessWithMerchantNames_, v6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)closeUI
{
  sub_244DDD38C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_closeUI);
}

- (void)closeUIImmediate
{
  sub_244DDD38C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_closeUIImmediate);
}

- (void)requiresCardPIN:(id)a3
{
  id v4;
  _TtC21ProximityReaderDaemon9UIManager *v5;

  v4 = a3;
  v5 = self;
  sub_244DD8770((uint64_t)v4);

}

- (void)closePINUI
{
  sub_244DDD38C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_closePINUI);
}

- (void)closePINUIImmediate
{
  sub_244DDD38C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_closePINUIImmediate);
}

- (void)errorInDaemonWithError:(int64_t)a3
{
  sub_244DDD0D8((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_errorInDaemonWithError_);
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
  sub_244DDD0D8((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_transactionUI, (SEL *)&selRef_updateSessionEventWithSessionEvent_);
}

- (void)tapUIDidLoad
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DD89A0();

}

- (void)tapUIRequestingCancel
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DD8E14("daemon | tapUIRequestingCancel", (SEL *)&selRef_tapUIRequestingCancel);

}

- (void)tapUIRequestingRetry
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DD8E14("daemon | tapUIRequestingRetry", (SEL *)&selRef_tapUIRequestingRetry);

}

- (void)tapUIFinishedWithExpected:(BOOL)a3 issuerPIN:(BOOL)a4
{
  _TtC21ProximityReaderDaemon9UIManager *v6;

  v6 = self;
  sub_244DD8FF0(a3, a4);

}

- (void)reportGuidanceUpdateWithVisible:(BOOL)a3 trigger:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  _TtC21ProximityReaderDaemon9UIManager *v8;
  id v9;

  v4 = a3;
  sub_244E4E31C();
  v6 = MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = self;
    v9 = (id)sub_244E4E2F8();
    objc_msgSend(v7, sel_reportGuidanceUpdateWithVisible_trigger_, v4, v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)reportProxEventInRange:(BOOL)a3 inRangeTime:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  _TtC21ProximityReaderDaemon9UIManager *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v8 = (id)MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate, a2);
  v7 = self;
  objc_msgSend(v8, sel_reportProxEventInRange_inRangeTime_, v5, v4);

}

- (void)pinUIDidLoad
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DD9360();

}

- (void)pinDataReceivedWithPinData:(id)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  _TtC21ProximityReaderDaemon9UIManager *v14;
  id v15;

  v9 = a5;
  v10 = a4;
  v15 = (id)MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate, a2);
  v13 = a3;
  v14 = self;
  objc_msgSend(v15, sel_pinDataReceivedWithPinData_isCardRequest_isAccessibilityEnabled_accessibilityEntryType_drawNumberFailures_, v13, v10, v9, a6, a7);

}

- (void)reportPINErrorWithError:(int64_t)a3 isCardRequest:(BOOL)a4 isAccessibilityEnabled:(BOOL)a5 accessibilityEntryType:(int64_t)a6 drawNumberFailures:(int64_t)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  _TtC21ProximityReaderDaemon9UIManager *v12;

  v9 = a5;
  v10 = a4;
  v12 = self;
  sub_244DD95A8(a3, v10, v9, a6, a7);

}

- (void)pinValidateSession
{
  sub_244DD981C((char *)self, (uint64_t)a2, (SEL *)&selRef_pinValidateSession);
}

- (void)pinAuthNeeded
{
  sub_244DD981C((char *)self, (uint64_t)a2, (SEL *)&selRef_pinAuthNeeded);
}

- (void)pinAuthResultWithError:(id)a3 cancelsFlow:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC21ProximityReaderDaemon9UIManager *v9;
  uint64_t v10;
  id v11;

  if (a3)
  {
    sub_244E4E31C();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = self;
    if (v6)
      v10 = sub_244E4E2F8();
    else
      v10 = 0;
    v11 = (id)v10;
    objc_msgSend(v8, sel_pinAuthResultWithError_cancelsFlow_);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)setVoiceOverWithEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _TtC21ProximityReaderDaemon9UIManager *v5;
  id v6;

  v3 = a3;
  v6 = (id)MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_delegate, a2);
  v5 = self;
  objc_msgSend(v6, sel_setVoiceOverWithEnabled_, v3);

}

- (void)notifyRegUIResultWithResult:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC21ProximityReaderDaemon9UIManager *v7;

  v4 = sub_244E4E31C();
  v6 = v5;
  v7 = self;
  sub_244DDADE4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)closeRegUI
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DDB314(0x67655265736F6C63, 0xEC00000029284955, (SEL *)&selRef_closeRegUI);

}

- (void)closeRegUIImmediate
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DDB314(0xD000000000000015, 0x8000000244E59B10, (SEL *)&selRef_closeRegUIImmediate);

}

- (void)regUIDidLoad
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DDB59C();

}

- (void)regUIAccountWithAccount:(id)a3
{
  id v4;
  _TtC21ProximityReaderDaemon9UIManager *v5;

  v4 = a3;
  v5 = self;
  sub_244DDBAC0(v4);

}

- (void)regUIFinishedWithUserCancelled:(BOOL)a3 regStatus:(BOOL)a4
{
  _TtC21ProximityReaderDaemon9UIManager *v6;

  v6 = self;
  sub_244DDBCA4(a3, a4);

}

- (void)updateAccountSubscription
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DDBEC4();

}

- (void)updateUIState:(int64_t)a3
{
  sub_244DDD0D8((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityUI, (SEL *)&selRef_updateUIState_);
}

- (void)displayIdentityInformation:(id)a3
{
  sub_244DDD0D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityUI, (SEL *)&selRef_displayIdentityInformation_);
}

- (void)identityUIDidLoad
{
  sub_244DDD460((char *)self, (uint64_t)a2, (void (*)(void))sub_244E22A04);
}

- (void)identityUIFinished
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DDD534(sub_244E22ECC);

}

- (void)requestCancelReadWithIsEngagementTransition:(BOOL)a3
{
  sub_244DDD1E4((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_244E2304C);
}

- (void)readDocumentFromScannedQRCodeWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _TtC21ProximityReaderDaemon9UIManager *v10;

  v4 = a3;
  v10 = self;
  v5 = sub_244E4C324();
  v7 = v6;

  v8 = MEMORY[0x249528470]((char *)v10 + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate);
  if (v8)
  {
    v9 = (void *)v8;
    sub_244E23478(v5, v7);

  }
  sub_244D651AC(v5, v7);

}

- (void)requestRestartReadWithTriggeredByMultipleCheck:(BOOL)a3
{
  sub_244DDD1E4((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_244E236BC);
}

- (void)qrCodeScanInitiated
{
  sub_244DDD460((char *)self, (uint64_t)a2, (void (*)(void))sub_244E34E68);
}

- (void)qrCodeScanErrorWithError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC21ProximityReaderDaemon9UIManager *v8;
  id v9;

  v4 = sub_244E4E31C();
  v6 = v5;
  v7 = MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate);
  if (v7)
  {
    v9 = (id)v7;
    v8 = self;
    sub_244E350C0(v4, v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)notifyUIButtonTapWithButton:(int64_t)a3
{
  uint64_t v5;
  _TtC21ProximityReaderDaemon9UIManager *v6;
  id v7;

  v5 = MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate, a2);
  if (v5)
  {
    v7 = (id)v5;
    v6 = self;
    sub_244E23AFC(a3);

  }
}

- (void)closeIdentityRegUI
{
  sub_244DDD38C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityRegistrationUI, (SEL *)&selRef_closeIdentityRegUI);
}

- (void)registerWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC21ProximityReaderDaemon9UIManager *v7;
  id v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate);
  if (v6)
  {
    v8 = (id)v6;
    v7 = self;
    sub_244E24260((uint64_t)sub_244DDD8A0, v5);

    swift_release();
  }
  else
  {
    swift_release();
  }
}

- (void)cancelRegistration
{
  sub_244DDD460((char *)self, (uint64_t)a2, sub_244E245F4);
}

- (void)identityRegUIDidLoad
{
  uint64_t v3;
  _TtC21ProximityReaderDaemon9UIManager *v4;
  id v5;

  v3 = MEMORY[0x249528470]((char *)self + OBJC_IVAR____TtC21ProximityReaderDaemon9UIManager_identityDelegate, a2);
  if (v3)
  {
    v5 = (id)v3;
    v4 = self;
    -[IdentityReaderService identityRegUIDidLoad]_0();

  }
}

- (void)identityRegUIFinished
{
  _TtC21ProximityReaderDaemon9UIManager *v2;

  v2 = self;
  sub_244DDD534(sub_244E227A0);

}

@end
