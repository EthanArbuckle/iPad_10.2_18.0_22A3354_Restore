@implementation SESecureCaptureOpenApplicationAfterTransitionCompletionAction

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  return -[SESecureCaptureOpenApplicationAfterTransitionCompletionAction initWithInfo:responder:](&v3, sel_initWithInfo_responder_, 0, 0);
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithUserActivity:(id)a3 responder:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(userActivity:responder:)(v5, a4);
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  return -[SESecureCaptureOpenApplicationAfterTransitionCompletionAction initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithXPCDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  return -[SESecureCaptureOpenApplicationAfterTransitionCompletionAction initWithXPCDictionary:](&v4, sel_initWithXPCDictionary_, a3);
}

- (NSSet)launchActions
{
  SESecureCaptureOpenApplicationAfterTransitionCompletionAction *v2;
  void *v3;

  v2 = self;
  SESecureCaptureOpenApplicationAfterTransitionCompletionAction.launchActions.getter();

  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v3 = (void *)sub_245BD8BF4();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v5;
  id v6;
  SESecureCaptureOpenApplicationAfterTransitionCompletionAction *result;

  v5 = a3;
  v6 = a4;
  result = (SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SESecureCaptureOpenApplicationAfterTransitionCompletionAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v8;
  id v9;
  SESecureCaptureOpenApplicationAfterTransitionCompletionAction *result;

  _Block_copy(a6);
  v8 = a3;
  v9 = a5;
  result = (SESecureCaptureOpenApplicationAfterTransitionCompletionAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
