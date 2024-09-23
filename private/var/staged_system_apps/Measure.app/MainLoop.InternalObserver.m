@implementation MainLoop.InternalObserver

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  _TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver *v7;

  v6 = a3;
  v7 = self;
  sub_1000E53F0(a4);

}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  uint64_t Strong;
  id v8;
  id v9;
  _TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver *v10;
  id v11;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver_mainLoop, a2);
  if (Strong)
  {
    v11 = (id)Strong;
    v8 = a3;
    v9 = a4;
    v10 = self;
    sub_1000E376C();

  }
}

- (_TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver)init
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  _TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, __n128);
  __n128 v10;
  objc_super v12;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver_mainLoop, 0);
  v3 = OBJC_IVAR____TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver__resetEvent;
  KeyPath = swift_getKeyPath(&unk_1003B6638);
  v5 = sub_10000EDC8((uint64_t *)&unk_100482EE8);
  v6 = qword_10047AD88;
  v7 = self;
  if (v6 != -1)
    swift_once(&qword_10047AD88, sub_1001883CC);
  v8 = qword_1004AF890;
  v9 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(v5 + 272);
  v10 = swift_retain();
  *(Class *)((char *)&v7->super.isa + v3) = (Class)v9(KeyPath, v8, v10);

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for MainLoop.InternalObserver();
  return -[MainLoop.InternalObserver init](&v12, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver_mainLoop, a2);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver__resetEvent));
}

@end
