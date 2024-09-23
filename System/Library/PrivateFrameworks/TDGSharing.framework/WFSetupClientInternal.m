@implementation WFSetupClientInternal

- (void)provisionAnisetteWithCompletion:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  WFSetupClientInternal *v6;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CD1118;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_247CD0F14((uint64_t)v4, v5, (uint64_t)sub_247CD1974, (uint64_t)&block_descriptor_27, (SEL *)&selRef_provisionWithCompletion_);
  sub_247CBDE58((uint64_t)v4);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  uint64_t (*v5)();
  WFSetupClientInternal *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  WFSetupClientInternal *v11;

  v5 = (uint64_t (*)())_Block_copy(a4);
  if (!a3)
  {
    v11 = self;
    v9 = 0xF000000000000000;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v6 = self;
  v7 = a3;
  a3 = (id)sub_247CEF4FC();
  v9 = v8;

  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v5;
  v5 = sub_247CD1118;
LABEL_6:
  _s10TDGSharing13WFSetupClientC12syncAnisette11withSIMData10completiony10Foundation4DataVSg_ySb_s5Error_pSgtcSgtF_0((uint64_t)a3, v9, v5, v10);
  sub_247CBDE58((uint64_t)v5);
  sub_247CB64F0((uint64_t)a3, v9);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  WFSetupClientInternal *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CD10F4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_247CD0F14((uint64_t)v4, v5, (uint64_t)sub_247CD1974, (uint64_t)&block_descriptor_21, (SEL *)&selRef_eraseWithCompletion_);
  sub_247CBDE58((uint64_t)v4);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t (*v5)();
  uint64_t v6;
  WFSetupClientInternal *v7;

  v5 = (uint64_t (*)())_Block_copy(a4);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_247CD1114;
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  sub_247CD0F14((uint64_t)v5, v6, (uint64_t)sub_247CDA3F0, (uint64_t)&block_descriptor_18, (SEL *)&selRef_anisetteDataWithCompletion_);
  sub_247CBDE58((uint64_t)v5);

}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  WFSetupClientInternal *v11;

  v6 = (void (*)(uint64_t, uint64_t))_Block_copy(a4);
  v7 = v6;
  if (!a3)
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = sub_247CEF658();
  a3 = v9;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v7;
  v7 = sub_247CD10EC;
LABEL_6:
  v11 = self;
  _s10TDGSharing13WFSetupClientC18legacyAnisetteData7forDSID14withCompletionySSSg_ySo010AKAnisetteF0CSg_s5Error_pSgtcSgtF_0(v8, a3, v7, v10);
  sub_247CBDE58((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (OS_dispatch_queue)dispatchQueue
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  return (OS_dispatch_queue *)*v2;
}

- (void)setDispatchQueue:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)interruptionHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_interruptionHandler, (uint64_t)sub_247CBF050, (uint64_t)&block_descriptor_131_0);
}

- (void)setInterruptionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CDA2F8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_interruptionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)invalidationHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_invalidationHandler, (uint64_t)sub_247CBF050, (uint64_t)&block_descriptor_124);
}

- (void)setInvalidationHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CDA0C4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_invalidationHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (SFDevice)peerDevice
{
  return (SFDevice *)sub_247CD1E8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_peerDevice);
}

- (void)setPeerDevice:(id)a3
{
  sub_247CD1F28((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___WFSetupClientInternal_peerDevice);
}

- (CUMessageSession)messageSessionTemplate
{
  return (CUMessageSession *)sub_247CD1E8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
}

- (void)setMessageSessionTemplate:(id)a3
{
  sub_247CD1F28((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
}

- (id)setupProgressEventHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler, (uint64_t)sub_247CD1610, (uint64_t)&block_descriptor_118);
}

- (void)setSetupProgressEventHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CDA058;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)userInteractionProgressEventHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler, (uint64_t)sub_247CBD984, (uint64_t)&block_descriptor_112);
}

- (void)setUserInteractionProgressEventHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CCFB34;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)setupSecurePairingCompletionHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler, (uint64_t)sub_247CD1570, (uint64_t)&block_descriptor_106);
}

- (void)setSetupSecurePairingCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CCFB4C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)receivedObjectHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler, (uint64_t)sub_247CD16F0, (uint64_t)&block_descriptor_100);
}

- (void)setReceivedObjectHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CD9FD8;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)showPinHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupClientInternal_showPinHandler, (uint64_t)sub_247CD2480, (uint64_t)&block_descriptor_94);
}

- (void)setShowPinHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CD9F88;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupClientInternal_showPinHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (WFSetupClientInternal)init
{
  void *v3;
  WFSetupClientInternal *v4;

  sub_247CBBA5C(0, (unint64_t *)&qword_2576F1D40);
  v3 = (void *)sub_247CEF70C();
  v4 = -[WFSetupClientInternal initWithQueue:deviceIdentifier:](self, sel_initWithQueue_deviceIdentifier_, v3, 0);

  return v4;
}

- (WFSetupClientInternal)initWithQueue:(id)a3 deviceIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v5 = sub_247CEF658();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  return (WFSetupClientInternal *)WFSetupClient.init(queue:deviceIdentifier:)(a3, v5, v7);
}

- (void)dealloc
{
  WFSetupClientInternal *v2;

  v2 = self;
  WFSetupClient.__deallocating_deinit();
}

- (void).cxx_destruct
{

  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_interruptionHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_invalidationHandler));

  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupClientInternal_showPinHandler));
  swift_release();

}

- (void)invalidate
{
  WFSetupClientInternal *v2;

  v2 = self;
  WFSetupClient.invalidate()();

}

- (void)sendUserInteractionEventInEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WFSetupClientInternal *v10;

  v7 = _Block_copy(a5);
  v8 = sub_247CEF61C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_247CD0088;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  WFSetupClient.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(v8, a4, (void (*)(_QWORD, _QWORD, _QWORD))v7, v9);
  sub_247CBDE58((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)activate
{
  WFSetupClientInternal *v2;

  v2 = self;
  WFSetupClient.activate()();

}

- (void)sendObject:(id)a3 encrypted:(BOOL)a4
{
  uint64_t v6;
  WFSetupClientInternal *v7;

  v6 = sub_247CEF61C();
  v7 = self;
  WFSetupClient.sendObject(_:encrypted:)((Swift::OpaquePointer)v6, a4);

  swift_bridgeObjectRelease();
}

@end
