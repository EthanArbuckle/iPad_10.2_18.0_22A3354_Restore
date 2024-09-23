@implementation SocialOnboardingContactsMatchingRequestOperation

- (void)execute
{
  _TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation *v2;

  v2 = self;
  sub_721000();

}

- (void)finishWithError:(id)a3
{
  _TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_7215C4((uint64_t)a3);

}

- (_TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation)init
{
  _TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation *result;

  result = (_TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SocialOnboardingContactsMatchingRequestOperation", 65, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_5C198(*(_QWORD *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation__responseHandler], *(_QWORD *)&self->accessQueue[OBJC_IVAR____TtC16MusicApplication48SocialOnboardingContactsMatchingRequestOperation__responseHandler]);
}

@end
