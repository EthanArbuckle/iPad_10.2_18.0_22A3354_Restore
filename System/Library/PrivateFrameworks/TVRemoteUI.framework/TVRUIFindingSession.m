@implementation TVRUIFindingSession

- (BOOL)isFindingSessionActive
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_findingVC);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_isBeingPresented);
  return (char)v2;
}

- (id)startFindingSessionForDevice:(id)a3 dismissedHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  TVRUIFindingSession *v8;
  void *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = TVRUIFindingSession.start(for:dismissedHandler:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v7);
  swift_unknownObjectRelease();

  swift_release();
  return v9;
}

- (void)stopFindingSession
{
  TVRUIFindingSession *v2;

  v2 = self;
  TVRUIFindingSession.stop()();

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

- (TVRUIFindingSession)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_findingVC) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_findingSessionPresentationController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TVRUIFindingSession_device) = 0;
  v3.receiver = self;
  v3.super_class = (Class)TVRUIFindingSession;
  return -[TVRUIFindingSession init](&v3, sel_init);
}

@end
