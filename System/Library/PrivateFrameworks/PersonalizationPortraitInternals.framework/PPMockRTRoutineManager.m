@implementation PPMockRTRoutineManager

- (PPMockRTRoutineManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPMockRTRoutineManager;
  return -[PPMockRTRoutineManager init](&v3, sel_init);
}

- (void)fetchLocationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4 withHandler:(id)a5
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a5;
  v6 = (void *)_mockLocationsOfInterest;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PPMockRTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke;
  v8[3] = &unk_1E7E15878;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "runWithLockAcquired:", v8);

}

uint64_t __94__PPMockRTRoutineManager_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)initialize
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v6 = (id)objc_opt_new();
    v4 = objc_msgSend(v3, "initWithGuardedData:", v6);
    v5 = (void *)_mockLocationsOfInterest;
    _mockLocationsOfInterest = v4;

  }
}

+ (void)setMockLocationsOfInterest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)_mockLocationsOfInterest;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PPMockRTRoutineManager_setMockLocationsOfInterest___block_invoke;
  v6[3] = &unk_1E7E15850;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "runWithLockAcquired:", v6);

}

+ (id)defaultManager
{
  return (id)objc_opt_new();
}

void __53__PPMockRTRoutineManager_setMockLocationsOfInterest___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
}

@end
