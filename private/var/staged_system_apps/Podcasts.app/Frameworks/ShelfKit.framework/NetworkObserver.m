@implementation NetworkObserver

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE v12[24];
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess(self->delegateScheduler, v12, 0, 0);
  sub_150C8((uint64_t)self->delegateScheduler, (uint64_t)v13);
  v9 = v14;
  v10 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  v11 = (_QWORD *)swift_allocObject(&unk_38F0D0, 40, 7);
  v11[2] = self;
  v11[3] = sub_2BAB98;
  v11[4] = self;
  swift_retain_n(self, 4);
  dispatch thunk of TaskScheduler.schedule(task:)(sub_2BAC18, v11, v9, v10);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v13);
  swift_release_n(self, 2);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

@end
