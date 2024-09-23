@implementation SDAuthenticationSecurityManager

- (void)handleKeyBagStateChanged
{
  _TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager *v2;

  v2 = self;
  sub_1002D375C((uint64_t)sub_1002D4AB0, (uint64_t)&unk_1007213E8);

}

- (void)handleOnWristStateChanged
{
  _TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager *v2;

  v2 = self;
  sub_1002D375C((uint64_t)sub_1002D4AA8, (uint64_t)&unk_1007213C0);

}

- (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager)init
{
  _TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager *result;

  result = (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAuthenticationSecurityManager", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002D4730((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockDate);
  sub_1002D4730((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastLockDate);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_wristDetectionGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_wristDetectionGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceUnlockedGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceUnlockedGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceBiolockedGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceBiolockedGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceHasPasscodeGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceHasPasscodeGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_sleepModeGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_sleepModeGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lostModeGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lostModeGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_motionGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_motionGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_faceIDEnabledGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_faceIDEnabledGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_raiseToWakeHandler), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_raiseToWakeHandler]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockedByPairedUnlockGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockedByPairedUnlockGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsBioUnarmedGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsBioUnarmedGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsInClassDGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsInClassDGenerator]);
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsInAssertDelayGenerator), *(_QWORD *)&self->wristDetectionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsInAssertDelayGenerator]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_queue));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_raiseToWakeTimes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_pearlDevice));
  sub_1002D4730((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockedAndOnWristDate);
}

@end
