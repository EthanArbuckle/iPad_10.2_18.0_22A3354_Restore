@implementation SocialOnboardingNetworkFriendsMatchingRequestOperation

- (void)execute
{
  _TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation *v2;

  v2 = self;
  sub_25ABD4();

}

- (void)finishWithError:(id)a3
{
  _TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_25B544((uint64_t)a3);

}

- (_TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation)init
{
  _TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation *result;

  result = (_TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SocialOnboardingNetworkFriendsMatchingRequestOperation", 71, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->networkIdentifier[OBJC_IVAR____TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation_networkIdentifier]);
  sub_5C198(*(_QWORD *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation_responseHandler], *(_QWORD *)&self->networkIdentifier[OBJC_IVAR____TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation_responseHandler]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication54SocialOnboardingNetworkFriendsMatchingRequestOperation_matchedFriends]);
}

@end
