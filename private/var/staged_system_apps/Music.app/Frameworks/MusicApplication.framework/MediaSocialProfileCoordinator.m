@implementation MediaSocialProfileCoordinator

- (_TtC16MusicApplication29MediaSocialProfileCoordinator)init
{
  return (_TtC16MusicApplication29MediaSocialProfileCoordinator *)sub_80E564();
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  _TtC16MusicApplication29MediaSocialProfileCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_812950((uint64_t)&unk_1384168, (uint64_t)sub_81300C, (uint64_t)&block_descriptor_78_0);

}

- (void)handleProfileDidExpire:(id)a3
{
  id v4;
  _TtC16MusicApplication29MediaSocialProfileCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_811108(v4);

}

- (void).cxx_destruct
{
  _QWORD v3[19];

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_accessQueue));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_accountStoreDidChangeNotificationObserver));
  sub_812730((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_lastAuthenticationAttempt);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_profileInvalidationTimer));
  sub_812580((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_state, (uint64_t)v3);
  sub_1EADE4(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_8125B8);
}

@end
