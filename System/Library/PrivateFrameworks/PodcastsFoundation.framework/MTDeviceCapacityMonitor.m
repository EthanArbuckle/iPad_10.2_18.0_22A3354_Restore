@implementation MTDeviceCapacityMonitor

- (void)setActiveNotificationName:(id)a3
{
  MTDeviceCapacityMonitor *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A93F152C(a3);

}

+ (MTDeviceCapacityMonitor)shared
{
  if (qword_1ED2A2E08 != -1)
    swift_once();
  return (MTDeviceCapacityMonitor *)(id)qword_1ED2A2E00;
}

- (NSString)activeNotificationName
{
  os_unfair_lock_s **v3;
  os_unfair_lock_s *v4;
  void **v5;
  MTDeviceCapacityMonitor *v6;
  void *v7;
  void *v9;

  v3 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void **)&(*v3)[4];
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_1A93F0DF0(v5, &v9);
  os_unfair_lock_unlock(v4 + 6);
  v7 = v9;

  swift_release();
  return (NSString *)v7;
}

- (void)capacityLevel:(id)a3
{
  void *v4;
  MTDeviceCapacityMonitor *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A93F1110((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)dealloc
{
  MTDeviceCapacityMonitor *v2;

  v2 = self;
  DeviceCapacityMonitor.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR___MTDeviceCapacityMonitor_url;
  v4 = sub_1A93F726C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (int64_t)addCapacityChangeObserverWithOptions:(int64_t)a3 callback:(id)a4
{
  char v4;
  void *v6;
  MTDeviceCapacityMonitor *v7;
  int64_t v8;

  v4 = a3;
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  v8 = sub_1A93F13F4(v4, (uint64_t)v7, v6);
  _Block_release(v6);
  _Block_release(v6);

  return v8;
}

- (void)removeCapacityChangeObserverWith:(int64_t)a3
{
  os_unfair_lock_s *v3;
  MTDeviceCapacityMonitor *v4;

  v3 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
  v4 = self;
  swift_retain();
  os_unfair_lock_lock(v3 + 6);
  sub_1A93F1650((uint64_t)&v3[4]);
  os_unfair_lock_unlock(v3 + 6);

  swift_release();
}

- (MTDeviceCapacityMonitor)init
{
  MTDeviceCapacityMonitor *result;

  result = (MTDeviceCapacityMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
