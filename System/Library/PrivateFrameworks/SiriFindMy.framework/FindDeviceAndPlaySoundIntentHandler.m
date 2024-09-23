@implementation FindDeviceAndPlaySoundIntentHandler

- (id)handlerForIntent:(id)a3
{
  void *v3;
  _QWORD v5[4];

  sub_1CCC77B74(v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1CCCF3258();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (void)resolveDevicesForFindDeviceAndPlaySound:(id)a3 withCompletion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCC77C00);
}

- (void)confirmFindDeviceAndPlaySound:(id)a3 completion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCC7888C);
}

- (void)handleFindDeviceAndPlaySound:(id)a3 completion:(id)a4
{
  sub_1CCBC0EE4(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1CCC79010);
}

- (_TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler)init
{
  sub_1CCC7A3CC();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler_deviceState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler_appInstalledState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler_deviceLockStateProvider);
  swift_release();
}

@end
