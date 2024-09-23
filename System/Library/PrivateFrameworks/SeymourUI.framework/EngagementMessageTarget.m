@implementation EngagementMessageTarget

- (_TtC9SeymourUI23EngagementMessageTarget)init
{
  _TtC9SeymourUI23EngagementMessageTarget *result;

  result = (_TtC9SeymourUI23EngagementMessageTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23EngagementMessageTarget_onBannerUpdate));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23EngagementMessageTarget_onBannerRemoval));
}

- (NSString)targetIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  _TtC9SeymourUI23EngagementMessageTarget *v13;

  v8 = sub_22BA8067C();
  v10 = v9;
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_22B560524(a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (BOOL)shouldBeNotifiedOfNilPriorityMessageAfterRegistration
{
  return 1;
}

@end
