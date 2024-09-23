@implementation RemoveActionItem

- (_TtC5Books16RemoveActionItem)init
{
  _TtC5Books16RemoveActionItem *result;

  result = (_TtC5Books16RemoveActionItem *)_swift_stdlib_reportUnimplementedInitializer("Books.RemoveActionItem", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books16RemoveActionItem_context));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books16RemoveActionItem_data));

  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books16RemoveActionItem_figaroProvider));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books16RemoveActionItem_libraryOperationProvider));
  v3 = (char *)self + OBJC_IVAR____TtC5Books16RemoveActionItem_type;
  v4 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
