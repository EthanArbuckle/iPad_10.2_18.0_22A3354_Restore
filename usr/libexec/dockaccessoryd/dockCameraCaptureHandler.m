@implementation dockCameraCaptureHandler

- (_TtC14dockaccessoryd24dockCameraCaptureHandler)init
{
  return (_TtC14dockaccessoryd24dockCameraCaptureHandler *)sub_1000AD2C8();
}

- (void)getSystemTrackingEnabledWithAppID:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000ADBCC);
}

- (void)getClientConfigurationUpdatesWithAppID:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000ADEA8);
}

- (void)updateCameraSessionWithSession:(id)a3 new:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  _TtC14dockaccessoryd24dockCameraCaptureHandler *v10;

  v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_1000AE1C0(v9, v5, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)updateTrackingSummaryWithData:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000AE564);
}

- (void)updateTrackingSummaryDebugWithData:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000AF66C);
}

- (void)selectSubjectResponseWithAppID:(id)a3 err:(id)a4 completion:(id)a5
{
  sub_1000AD544(self, (int)a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))sub_100166E10, "completing original selectSubject with err %@", &OBJC_IVAR____TtC14dockaccessoryd21DockAccessoryDatabase__subjectSelectionCompletions);
}

- (void)setRectOfInterestResponseWithAppID:(id)a3 err:(id)a4 completion:(id)a5
{
  sub_1000AD544(self, (int)a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))sub_100166F54, "completing original setRectOfInterest with err %@", &OBJC_IVAR____TtC14dockaccessoryd21DockAccessoryDatabase__rectOfInterestCompletions);
}

- (void)getPairedWithCompletion:(id)a3
{
  sub_1000AD708(self, (int)a2, a3, (void (*)(void *))sub_1000B0660);
}

- (void)getConnectedWithCompletion:(id)a3
{
  sub_1000AD618(self, (int)a2, a3, &OBJC_IVAR____TtC14dockaccessoryd21DockAccessoryDatabase_connected);
}

- (void)getDockedWithCompletion:(id)a3
{
  sub_1000AD618(self, (int)a2, a3, &OBJC_IVAR____TtC14dockaccessoryd21DockAccessoryDatabase_docked);
}

- (void)getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  _TtC14dockaccessoryd24dockCameraCaptureHandler *v9;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  v8 = a3;
  v9 = self;
  sub_1000B0848((uint64_t)v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

}

- (void)getTrackingButtonStateWithCompletion:(id)a3
{
  sub_1000AD708(self, (int)a2, a3, (void (*)(void *))sub_1000B0A94);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd24dockCameraCaptureHandler_logger;
  v3 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
