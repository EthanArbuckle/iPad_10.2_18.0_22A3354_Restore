@implementation MediaBackdropSnapshotRendererOperation

- (void)main
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _TtC7BooksUI38MediaBackdropSnapshotRendererOperation *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_5440(&qword_25E2E8);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject(&unk_24B3B0, 40, 7);
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  v9 = sub_13BC30((uint64_t)v5, (uint64_t)&unk_25E2F8, (uint64_t)v7);
  swift_release(v9);
  OS_dispatch_semaphore.wait()();

}

- (_TtC7BooksUI38MediaBackdropSnapshotRendererOperation)init
{
  _TtC7BooksUI38MediaBackdropSnapshotRendererOperation *result;

  result = (_TtC7BooksUI38MediaBackdropSnapshotRendererOperation *)_swift_stdlib_reportUnimplementedInitializer("BooksUI.MediaBackdropSnapshotRendererOperation", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7BooksUI38MediaBackdropSnapshotRendererOperation_content));
  swift_release(*(_QWORD *)&self->content[OBJC_IVAR____TtC7BooksUI38MediaBackdropSnapshotRendererOperation_completion]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7BooksUI38MediaBackdropSnapshotRendererOperation_semaphore));
}

@end
