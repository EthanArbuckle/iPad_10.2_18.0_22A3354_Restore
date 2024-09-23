@implementation PlayableStorage

- (void)fireTimerWithTimer:(id)a3
{
  void (*v5)(uint64_t);
  id v6;
  _TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage *v7;
  uint64_t v8;
  void *v9;

  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_action);
  swift_beginAccess();
  v6 = a3;
  v7 = self;
  v8 = swift_bridgeObjectRetain();
  v5(v8);
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_invalidate);
  v9 = *(Class *)((char *)&v7->super.isa
                + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_timer);
  *(Class *)((char *)&v7->super.isa
           + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_timer) = 0;

}

- (_TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage)init
{
  _TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage *result;

  result = (_TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;

  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_validType;
  v4 = sub_20E4A4E68();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_timer));
  v5 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_chained);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_chained) = 0;
  if (v5)
  {
    while (1)
    {
      v8 = v5;
      if (!swift_isUniquelyReferenced())
        break;
      v6 = *(char **)&v8[OBJC_IVAR____TtC18_JetEngine_SwiftUIP33_A88781FDD5080888A74F07BF6234265B15PlayableStorage_chained];
      v7 = v6;

      v5 = v6;
      if (!v6)
        goto LABEL_6;
    }
    v5 = v8;
  }
LABEL_6:

}

@end
