@implementation AngelServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC16ScreenSharingKit11AngelServer *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_2458A8540(v9, a5);

  swift_unknownObjectRelease();
}

- (void)pingWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16ScreenSharingKit11AngelServer *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574BAB90);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_245956460();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2574BB6B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2574BB6C0;
  v12[5] = v11;
  v13 = self;
  sub_2458A7CDC((uint64_t)v7, (uint64_t)&unk_2574BB6C8, (uint64_t)v12);
  swift_release();
}

- (void)stopCommandLineSessionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16ScreenSharingKit11AngelServer *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574BAB90);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_245956460();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2574BB680;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2574BB688;
  v12[5] = v11;
  v13 = self;
  sub_2458A7CDC((uint64_t)v7, (uint64_t)&unk_2574BB690, (uint64_t)v12);
  swift_release();
}

- (void)currentCommandLineSessionStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC16ScreenSharingKit11AngelServer *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574BAB90);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_245956460();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2574BB630;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2574BB640;
  v12[5] = v11;
  v13 = self;
  sub_2458A7CDC((uint64_t)v7, (uint64_t)&unk_2574BB650, (uint64_t)v12);
  swift_release();
}

- (_TtC16ScreenSharingKit11AngelServer)init
{
  _TtC16ScreenSharingKit11AngelServer *result;

  result = (_TtC16ScreenSharingKit11AngelServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  char *v5;
  uint64_t v6;

  v3 = *(void **)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_commandLineServiceSpecification
                                                      + 24];
  v4 = *(void **)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_commandLineServiceSpecification
                                                      + 32];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2458BB084(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentServerState));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_telemetryVendor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_signpostVendor);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_sceneInteractorVendor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_deviceInformationPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_sessionHistoryTracker);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_companionDeviceID, &qword_2574BAB60);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_bringupMicrophoneDeviceSensorPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_inSessionMicrophoneDeviceSensorPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_cameraDeviceSensorPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_deviceEligibilityPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_deviceRestrictionPrimitives);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_continuityDevicePrimitives);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer____lazy_storage___commandLineListener));
  if (*(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_displayRegistrarVendor
                                                       + 16])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_displayRegistrarVendor);
  if (*(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_screenContinuityLiveActivityVendor
                                                       + 16])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_screenContinuityLiveActivityVendor);
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer__bringUpDeviceSensorsInUse;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B9848);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_mediaTransportActivationContinuation, (uint64_t *)&unk_2574BB6A0);
  swift_release();
  swift_release();
  swift_release();
  sub_2458BB2C8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration), *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 8], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 16], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 24], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 32], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 40], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 48], *(_QWORD *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 56], *(_QWORD *)&self->commandLineConnections[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration], *(_QWORD *)&self->currentServerState[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentDisplayRegistrar, &qword_2574BBBA8);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentSceneInteractor, &qword_2574BBBB0);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentContinuityLiveActivity, &qword_2574BBBB8);
  sub_2458BB334(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentSceneInteractorStep), self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentSceneInteractorStep]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_mediaPlaybackStatusPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_taskSleepPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_userDefaultsPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_powerPrimitives);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
