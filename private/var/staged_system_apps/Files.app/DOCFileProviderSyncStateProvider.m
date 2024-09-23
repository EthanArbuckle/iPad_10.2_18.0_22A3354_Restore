@implementation DOCFileProviderSyncStateProvider

- (void)didUpdateSyncInAppMessage
{
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  swift_beginAccess(&self->didUpdateSyncStateInAppMessageHandler[7], v6, 0, 0);
  v3 = *(void (**)(uint64_t))&self->didUpdateSyncStateInAppMessageHandler[7];
  if (v3)
  {
    v4 = *(_QWORD *)&self->didUpdateSyncStateInAppMessageHandler[15];
    swift_retain();
    v5 = sub_10008BA00((uint64_t)v3, v4);
    v3(v5);
    sub_100087534((uint64_t)v3, v4);
    swift_release(self);
  }
}

- (void)didUpdateSyncProgress
{
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  swift_beginAccess(&self->didUpdateInProgressFileOperationsHandler[7], v6, 0, 0);
  v3 = *(void (**)(uint64_t))&self->didUpdateInProgressFileOperationsHandler[7];
  if (v3)
  {
    v4 = *(_QWORD *)&self->didUpdateInProgressFileOperationsHandler[15];
    swift_retain();
    v5 = sub_10008BA00((uint64_t)v3, v4);
    v3(v5);
    sub_100087534((uint64_t)v3, v4);
    swift_release(self);
  }
}

@end
