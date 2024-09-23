@implementation CancelSession

- (void)cancel
{
  _TtC18VisualIntelligence13CancelSession *v2;

  v2 = self;
  sub_1D484C994();

}

- (_TtC18VisualIntelligence13CancelSession)init
{
  _TtC18VisualIntelligence13CancelSession *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v2 = self;
  sub_1D4920FCC();
  *((_BYTE *)&v2->super.isa + OBJC_IVAR____TtC18VisualIntelligence13CancelSession__isCanceled) = 0;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC18VisualIntelligence13CancelSession_onCancels) = (Class)MEMORY[0x1E0DEE9D8];
  v3 = OBJC_IVAR____TtC18VisualIntelligence13CancelSession_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED98EB70);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 16) = 0;
  *(Class *)((char *)&v2->super.isa + v3) = (Class)v4;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CancelSession();
  return -[CancelSession init](&v6, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC18VisualIntelligence13CancelSession_identifier;
  v3 = sub_1D4920FD8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
