@implementation RDXPCDaemon

- (_TtC7remindd11RDXPCDaemon)init
{
  _TtC7remindd11RDXPCDaemon *result;

  result = (_TtC7remindd11RDXPCDaemon *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCDaemon", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7remindd11RDXPCDaemon_daemon);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd11RDXPCDaemon_syncInterfacePerformerFactory));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd11RDXPCDaemon_dataAccessRequestsWriter));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd11RDXPCDaemon_contactInteractionWriter));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd11RDXPCDaemon_coreSuggestionsHandler));
}

@end
