@implementation WFSetupServerInternal

- (OS_dispatch_queue)dispatchQueue
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  return (OS_dispatch_queue *)*v2;
}

- (void)setDispatchQueue:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)completionHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_completionHandler, (uint64_t)sub_247CD1570, (uint64_t)&block_descriptor_156);
}

- (void)setCompletionHandler:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_247CCFF54;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_completionHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)activationHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_activationHandler, (uint64_t)sub_247CD1570, (uint64_t)&block_descriptor_149);
}

- (void)setActivationHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_activationHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)setupProgressEventHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler, (uint64_t)sub_247CD1610, (uint64_t)&block_descriptor_143);
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
    v4 = sub_247CCFB44;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)userInteractionProgressEventHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler, (uint64_t)sub_247CBD984, (uint64_t)&block_descriptor_137);
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)setupPromptPinHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler, (uint64_t)sub_247CBDADC, (uint64_t)&block_descriptor_131);
}

- (void)setSetupPromptPinHandler:(id)a3
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
    v4 = sub_247CCFB20;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (id)receivedObjectHandler
{
  return sub_247CBDC2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler, (uint64_t)sub_247CD16F0, (uint64_t)&block_descriptor_125);
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
    v4 = sub_247CCFB18;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_247CBDE58(v7);
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  return (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)*v2;
}

- (void)setAnisetteDataProvider:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (WFSetupServerInternal)init
{
  return (WFSetupServerInternal *)WFSetupServer.init()();
}

- (WFSetupServerInternal)initWithQueue:(id)a3
{
  id v4;
  WFSetupServerInternal *v5;
  void **v6;
  void *v7;

  v4 = a3;
  v5 = -[WFSetupServerInternal init](self, sel_init);
  v6 = (void **)((char *)&v5->super.isa + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  v7 = *v6;
  *v6 = v4;

  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  WFSetupServerInternal *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_2576F1D00;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_247CAF000, v5, v6, "WFSetupServer deinit.", v7, 2u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  sub_247CC3E8C();
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for WFSetupServer();
  -[WFSetupServerInternal dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{

  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_completionHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_activationHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler));
  sub_247CBDE58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler));

  sub_247CBCE98((uint64_t)self + OBJC_IVAR___WFSetupServerInternal_peer, &qword_2576F2728);
  swift_release();

}

- (void)prepareToRun
{
  WFSetupServerInternal *v2;

  v2 = self;
  WFSetupServer.prepareToRun()();

}

- (void)activate
{
  WFSetupServerInternal *v2;

  v2 = self;
  WFSetupServer.activate()();

}

- (void)invalidate
{
  WFSetupServerInternal *v2;

  v2 = self;
  WFSetupServer.invalidate()();

}

- (void)sendObjectWithObject:(id)a3 encrypted:(BOOL)a4
{
  uint64_t v6;
  WFSetupServerInternal *v7;

  v6 = sub_247CEF61C();
  v7 = self;
  WFSetupServer.sendObject(object:encrypted:)((Swift::OpaquePointer)v6, a4);

  swift_bridgeObjectRelease();
}

- (void)sendSetupWithAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WFSetupServerInternal *v10;

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
  WFSetupServer.sendSetup(action:info:responseHandler:)(a3, v8, (void (*)(void *, _QWORD, _QWORD))v7, v9);
  sub_247CBDE58((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)sendUserInteractionEventInEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WFSetupServerInternal *v10;

  v7 = _Block_copy(a5);
  v8 = sub_247CEF61C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_247CCFB10;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  WFSetupServer.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(v8, a4, (void (*)(void *, _QWORD, _QWORD))v7, v9);
  sub_247CBDE58((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)startSecureChannelPairingWith:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  WFSetupServerInternal *v9;

  v5 = a3;
  v7 = _Block_copy(a5);
  v8 = sub_247CEF61C();
  _Block_copy(v7);
  v9 = self;
  sub_247CCD8D4(v5, v8, (uint64_t)v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)startSecureChannelPairingWith:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  WFSetupServerInternal *v7;

  v4 = a3;
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_247CCE4D4(v4, (uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)tryPin:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  WFSetupServerInternal *v7;
  Swift::String v8;

  v4 = sub_247CEF658();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  WFSetupServer.tryPin(_:)(v8);

  swift_bridgeObjectRelease();
}

@end
