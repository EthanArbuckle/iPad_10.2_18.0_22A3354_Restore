@implementation PXDefaultAppleMusicStatusProvider

- (PXDefaultAppleMusicStatusProvider)init
{
  return (PXDefaultAppleMusicStatusProvider *)sub_1A6941634();
}

- (int64_t)statusForCapability:(int64_t)a3
{
  PXDefaultAppleMusicStatusProvider *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  int64_t v8;
  uint64_t v10;

  swift_getObjectType();
  v4 = self;
  sub_1A6941EBC(0, 0);
  v5 = *(os_unfair_lock_s **)((char *)&v4->super.isa + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_lockedState);
  v6 = (uint64_t)&v5[4];
  v7 = v5 + 8;
  os_unfair_lock_lock(v5 + 8);
  sub_1A6942944(v6, &v10);
  os_unfair_lock_unlock(v7);
  v8 = v10;

  return v8;
}

- (void)requestStatusForCapability:(int64_t)a3 handler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  PXDefaultAppleMusicStatusProvider *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = sub_1A694290C;
  v9[4] = v7;
  v9[5] = a3;
  v10 = self;
  sub_1A7ADBF34();
  sub_1A7ADBF34();
  sub_1A6941EBC((uint64_t)sub_1A6942A44, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)startGatheringCapabilityStatuses
{
  PXDefaultAppleMusicStatusProvider *v2;

  v2 = self;
  sub_1A6941EBC(0, 0);

}

- (NSError)error
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  PXDefaultAppleMusicStatusProvider *v5;
  void *v6;
  void *v7;
  void *v9;

  v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_lockedState);
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 8;
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A6941E2C(v3, &v9);
  os_unfair_lock_unlock(v4);
  v6 = v9;

  if (!v6)
    return (NSError *)0;
  v7 = (void *)sub_1A7ADC69C();

  return (NSError *)v7;
}

- (PXObservable)observable
{
  return (PXObservable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_observable));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXDefaultAppleMusicStatusProvider____lazy_storage___cloudStatusMonitor));

  swift_release();
}

@end
