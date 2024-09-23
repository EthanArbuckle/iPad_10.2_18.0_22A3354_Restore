@implementation ActivitySharingReplyMessageComposerView.Coordinator

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  _TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator *v7;

  v6 = a3;
  v7 = self;
  sub_10014ED70(a4);

}

- (_TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator)init
{
  _TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator *result;

  result = (_TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.Coordinator", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator__pendingOutgoingReply);
  v3 = *(_QWORD *)&self->_pendingOutgoingReply[OBJC_IVAR____TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator__pendingOutgoingReply
                                             + 16];
  swift_release(*(_QWORD *)&self->_pendingOutgoingReply[OBJC_IVAR____TtCV10FitnessApp39ActivitySharingReplyMessageComposerView11Coordinator__pendingOutgoingReply]);
  swift_release(v2);
  swift_bridgeObjectRelease(v3);
}

@end
