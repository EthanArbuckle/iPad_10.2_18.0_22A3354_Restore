@implementation ICLaunchTaskCancellationToken

- (void)cancel
{
  ICLaunchTaskCancellationToken *v2;

  v2 = self;
  Task.cancel()();

}

- (ICLaunchTaskCancellationToken)init
{
  ICLaunchTaskCancellationToken *result;

  result = (ICLaunchTaskCancellationToken *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.CancellationToken", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICLaunchTaskCancellationToken_task));
}

@end
