@implementation SharingBackedAuthenticationPrimitives

- (_TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives)init
{
  _TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *result;

  result = (_TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2458911D4((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_continuityDevice);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_authenticationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_authenticationQueue));
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_trustDeviceContinuation, &qword_2574BAB58);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockDeviceContinuation, &qword_2574BAB58);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockGeneration, &qword_2574BAB60);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_resetGeneration, &qword_2574BAB60);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_disableDeviceContinuation, &qword_2574BAB58);
  sub_2458987D8((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_approveByMacDelegate);
}

- (void)manager:(id)a3 didEnableAuthenticationForSessionWithID:(id)a4
{
  sub_245895428(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_2458959FC);
}

- (void)manager:(id)a3 didFailToEnableDeviceForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *v14;
  uint64_t v15;

  v8 = sub_24595589C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245955878();
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_245895D8C((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  sub_245895428(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_245896258);
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
  sub_245895428(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_2458964F0);
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *v14;
  uint64_t v15;

  v8 = sub_24595589C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245955878();
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_245897B78((uint64_t)v11, v13, &OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockDeviceContinuation, &OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockGeneration, "Failed to unlock paired iPhone with error: %{public}s", "Authentication failed for a different unlock generation: %{public}s due to: %{public}s", "unlockDeviceContinuation is not available.");

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)manager:(id)a3 didReceiveRequestToApproveForSessionID:(id)a4 info:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *v18;
  uint64_t v19;

  v10 = sub_24595589C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_245955878();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a3;
  v17 = a5;
  v18 = self;
  sub_245896ED0((uint64_t)v13, v17, (uint64_t)sub_2458987D0, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)manager:(id)a3 didDisableAuthenticationForSessionWithID:(id)a4
{
  sub_245895428(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_2458972A0);
}

- (void)manager:(id)a3 didFailToDisableDeviceForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *v14;
  uint64_t v15;

  v8 = sub_24595589C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245955878();
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_245897B78((uint64_t)v11, v13, &OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_disableDeviceContinuation, &OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_resetGeneration, "Failed to disable paired iPhone with error: %{public}s", "Disable device failed for a different reset generation: %{public}s due to: %{public}s", "disableDeviceContinuation is not available.");

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end
