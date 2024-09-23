@implementation MediaBackdropSnapshotRendererOperation

- (void)main
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC10TemplateUI38MediaBackdropSnapshotRendererOperation *v7;
  uint64_t v8;
  uint64_t v9;

  sub_17CB70(&qword_2CB090);
  __chkstk_darwin();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = (_QWORD *)swift_allocObject(&unk_243978, 40, 7);
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = self;
  v7 = self;
  v8 = sub_17C65C((uint64_t)v4, (uint64_t)&unk_2CB0A0, (uint64_t)v6);
  swift_release(v8);
  OS_dispatch_semaphore.wait()();

}

- (_TtC10TemplateUI38MediaBackdropSnapshotRendererOperation)init
{
  _TtC10TemplateUI38MediaBackdropSnapshotRendererOperation *result;

  result = (_TtC10TemplateUI38MediaBackdropSnapshotRendererOperation *)_swift_stdlib_reportUnimplementedInitializer("TemplateUI.MediaBackdropSnapshotRendererOperation", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_content));
  swift_release(*(_QWORD *)&self->content[OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_completion]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_semaphore));
}

@end
