@implementation TUISmartReplyResponse

- (TCSmartRepliesResponse)srResponse
{
  return (TCSmartRepliesResponse *)sub_18C793F38((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse);
}

- (void)setSrResponse:(id)a3
{
  sub_18C793FD4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse);
}

- (NSError)error
{
  return (NSError *)sub_18C793F38((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error);
}

- (void)setError:(id)a3
{
  sub_18C793FD4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error);
}

- (NSString)threadIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18C802B6C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setThreadIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_18C802B78();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)contentWarning
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning);
  swift_beginAccess();
  return *v2;
}

- (void)setContentWarning:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)modelInfoString
{
  return (NSString *)sub_18C7945DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

- (void)setModelInfoString:(id)a3
{
  sub_18C7946B8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

- (NSString)userFeedbackInputString
{
  return (NSString *)sub_18C7945DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

- (void)setUserFeedbackInputString:(id)a3
{
  sub_18C7946B8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

- (_TtC11TextInputUI21TUISmartReplyResponse)initWithSrResponse:(id)a3 threadIdentifier:(id)a4 type:(int64_t)a5 contentWarning:(int64_t)a6 error:(id)a7 modelInfoString:(id)a8 userFeedbackInputString:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  _TtC11TextInputUI21TUISmartReplyResponse *v23;

  v12 = (uint64_t)a9;
  v13 = sub_18C802B78();
  v15 = v14;
  if (!a8)
  {
    v16 = 0;
    v18 = 0;
    if (a9)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v16 = sub_18C802B78();
  v18 = v17;
  if (!a9)
    goto LABEL_5;
LABEL_3:
  v12 = sub_18C802B78();
  v20 = v19;
LABEL_6:
  v21 = a7;
  v22 = a3;
  v23 = (_TtC11TextInputUI21TUISmartReplyResponse *)sub_18C796F38(a3, v13, v15, a5, a6, a7, v16, v18, v12, v20);

  return v23;
}

- (void)printValues
{
  _TtC11TextInputUI21TUISmartReplyResponse *v2;

  v2 = self;
  sub_18C79496C();

}

- (_TtC11TextInputUI21TUISmartReplyResponse)init
{
  _TtC11TextInputUI21TUISmartReplyResponse *result;

  result = (_TtC11TextInputUI21TUISmartReplyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
