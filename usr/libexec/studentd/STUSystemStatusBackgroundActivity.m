@implementation STUSystemStatusBackgroundActivity

- (void)dealloc
{
  _TtC8studentd33STUSystemStatusBackgroundActivity *v2;

  v2 = self;
  STUSystemStatusBackgroundActivity.__deallocating_deinit();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution));
}

+ (id)cancelableWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s8studentd33STUSystemStatusBackgroundActivityC10cancelable10identifierSo13CRKCancelable_pSo012STBackgroundE10Identifiera_tFZ_0(v3);

  return v4;
}

- (void)cancel
{
  _TtC8studentd33STUSystemStatusBackgroundActivity *v2;

  v2 = self;
  STUSystemStatusBackgroundActivity.cancel()();

}

- (_TtC8studentd33STUSystemStatusBackgroundActivity)init
{
  _TtC8studentd33STUSystemStatusBackgroundActivity *result;

  result = (_TtC8studentd33STUSystemStatusBackgroundActivity *)_swift_stdlib_reportUnimplementedInitializer("studentd.STUSystemStatusBackgroundActivity", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
