@implementation ICRecoverNoteAlertController

- (ICNote)note
{
  return (ICNote *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___ICRecoverNoteAlertController_note));
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter));
}

- (void)setNotificationCenter:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter) = (Class)a3;
  v3 = a3;

}

- (_NSRange)selectedRange
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR___ICRecoverNoteAlertController_selectedRange;
  v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_selectedRange);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSString)title
{
  return (NSString *)sub_1003300FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICRecoverNoteAlertController_title);
}

- (NSString)message
{
  return (NSString *)sub_1003300FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICRecoverNoteAlertController_message);
}

- (NSString)detail
{
  return (NSString *)sub_1003300FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICRecoverNoteAlertController_detail);
}

- (NSString)cancelButtonTitle
{
  return (NSString *)sub_1003300FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICRecoverNoteAlertController_cancelButtonTitle);
}

- (NSString)recoverButtonTitle
{
  return (NSString *)sub_1003300FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICRecoverNoteAlertController_recoverButtonTitle);
}

- (ICRecoverNoteAlertController)initWithNote:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  ICRecoverNoteAlertController *v7;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = (ICRecoverNoteAlertController *)sub_100331254(v6, location, length);

  return v7;
}

- (ICRecoverNoteAlertController)initWithNote:(id)a3
{
  return -[ICRecoverNoteAlertController initWithNote:selectedRange:](self, "initWithNote:selectedRange:", a3, 0, 0);
}

- (void)recoverNote
{
  ICRecoverNoteAlertController *v2;

  v2 = self;
  sub_1003301FC();

}

- (void)recoverNotePostingNotifications
{
  void *v2;
  id v3;
  NSString v4;
  ICRecoverNoteAlertController *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter);
  v5 = self;
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "postNotificationName:object:", v4, v5);

  sub_1003301FC();
  sub_100330A60();

}

- (BOOL)showFromViewController:(id)a3
{
  id v4;
  ICRecoverNoteAlertController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1003305B8(v4);

  return self & 1;
}

- (ICRecoverNoteAlertController)init
{
  ICRecoverNoteAlertController *result;

  result = (ICRecoverNoteAlertController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.RecoverNoteAlertController", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->note[OBJC_IVAR___ICRecoverNoteAlertController_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->note[OBJC_IVAR___ICRecoverNoteAlertController_message]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->note[OBJC_IVAR___ICRecoverNoteAlertController_detail]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->note[OBJC_IVAR___ICRecoverNoteAlertController_cancelButtonTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->note[OBJC_IVAR___ICRecoverNoteAlertController_recoverButtonTitle]);
}

@end
