@implementation WorkoutKitXPCServiceHelper

+ (id)sharedInstance
{
  return -[WorkoutKitXPCServiceHelper _init]([WorkoutKitXPCServiceHelper alloc], "_init");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WorkoutKitXPCServiceHelper;
  return -[WorkoutKitXPCServiceHelper init](&v3, sel_init);
}

- (void)presentWorkoutCompositionData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_2;
  v8[3] = &unk_251BECCA0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "presentWorkoutCompositionData:completion:", v6, v8);

}

void __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openWorkoutAppWithWorkoutPlanData:(id)a3 completion:(id)a4
{
  -[WorkoutKitXPCServiceHelper openWorkoutAppWithWorkoutPlanData:autostartWorkoutPlan:completion:](self, "openWorkoutAppWithWorkoutPlanData:autostartWorkoutPlan:completion:", a3, 0, a4);
}

- (void)openWorkoutAppWithWorkoutPlanData:(id)a3 autostartWorkoutPlan:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke;
  v17[3] = &unk_251BECD18;
  v18 = v7;
  v20 = a4;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = (void *)MEMORY[0x24BD154E4](v17);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_3;
  v15[3] = &unk_251BECCF0;
  v16 = v10;
  v13 = v10;
  v14 = (void *)MEMORY[0x24BD154E4](v15);
  _WorkoutKitConnectWithBlock(v12, v14);

}

void __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_2;
  v9[3] = &unk_251BECCA0;
  v10 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v8 = v5;
  objc_msgSend(a2, "openWorkoutAppWithWorkoutPlanData:autostartWorkoutPlan:completion:", v7, v6, v9);

}

void __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openWorkoutAppWithActivityType:(int64_t)a3 autostart:(BOOL)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  BOOL v18;

  v7 = a5;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke;
  v15[3] = &unk_251BECD68;
  v17 = a3;
  v18 = a4;
  v9 = v7;
  v16 = v9;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v9;
  v11 = v9;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_2;
  v9[3] = &unk_251BECD40;
  v10 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v8 = v5;
  objc_msgSend(a2, "openWorkoutAppWithActivityType:autostart:completion:", v7, v6, v9);

}

void __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endActiveWorkoutPlanWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_2;
  v8[3] = &unk_251BECCA0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "endActiveWorkoutPlanWithIdentifier:completion:", v6, v8);

}

void __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveWorkoutCompositionData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_2;
  v8[3] = &unk_251BECCA0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "saveWorkoutCompositionData:completion:", v6, v8);

}

void __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addScheduledWorkouts:(id)a3 sourceBundleId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke;
  v19[3] = &unk_251BECD90;
  v20 = v7;
  v21 = v8;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v13 = v7;
  v14 = (void *)MEMORY[0x24BD154E4](v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_3;
  v17[3] = &unk_251BECCF0;
  v18 = v11;
  v15 = v11;
  v16 = (void *)MEMORY[0x24BD154E4](v17);
  _WorkoutKitConnectWithBlock(v14, v16);

}

void __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_2;
  v9[3] = &unk_251BECCA0;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(a2, "addScheduledWorkouts:sourceBundleId:completion:", v6, v7, v9);

}

void __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeScheduledWorkouts:(id)a3 sourceBundleId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke;
  v19[3] = &unk_251BECD90;
  v20 = v7;
  v21 = v8;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v13 = v7;
  v14 = (void *)MEMORY[0x24BD154E4](v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_3;
  v17[3] = &unk_251BECCF0;
  v18 = v11;
  v15 = v11;
  v16 = (void *)MEMORY[0x24BD154E4](v17);
  _WorkoutKitConnectWithBlock(v14, v16);

}

void __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_2;
  v9[3] = &unk_251BECCA0;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(a2, "removeScheduledWorkouts:sourceBundleId:completion:", v6, v7, v9);

}

void __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeScheduledWorkoutCompositions:(id)a3 sourceBundleId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke;
  v19[3] = &unk_251BECD90;
  v20 = v7;
  v21 = v8;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v13 = v7;
  v14 = (void *)MEMORY[0x24BD154E4](v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_3;
  v17[3] = &unk_251BECCF0;
  v18 = v11;
  v15 = v11;
  v16 = (void *)MEMORY[0x24BD154E4](v17);
  _WorkoutKitConnectWithBlock(v14, v16);

}

void __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_2;
  v9[3] = &unk_251BECCA0;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(a2, "storeScheduledWorkoutCompositions:sourceBundleId:completion:", v6, v7, v9);

}

void __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveScheduledWorkoutCompositionsForSourceBundleId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2;
  v8[3] = &unk_251BECDB8;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "retrieveScheduledWorkoutCompositionsForSourceBundleId:completion:", v6, v8);

}

void __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteScheduledWorkoutCompositionsForSourceBundleId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2;
  v8[3] = &unk_251BECCA0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "deleteScheduledWorkoutCompositionsForSourceBundleId:completion:", v6, v8);

}

void __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)iconForBundleId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_2;
  v8[3] = &unk_251BECDE0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "iconForBundleId:completion:", v6, v8);

}

void __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveWorkoutCompositionFromWorkout:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_2;
  v8[3] = &unk_251BECDE0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "retrieveWorkoutCompositionFromWorkout:completion:", v6, v8);

}

void __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveWorkoutCompositionFromWorkoutUUID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_2;
  v8[3] = &unk_251BECDE0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "retrieveWorkoutCompositionFromWorkoutUUID:completion:", v6, v8);

}

void __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveAuthorizationStateForBundleId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_2;
  v8[3] = &unk_251BECE08;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "retrieveAuthorizationStateForBundleId:completion:", v6, v8);

}

void __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationForBundleId:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_2;
  v8[3] = &unk_251BECE08;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "requestAuthorizationForBundleId:completion:", v6, v8);

}

void __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAuthorizationState:(id)a3 forBundleId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke;
  v19[3] = &unk_251BECD90;
  v20 = v7;
  v21 = v8;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v13 = v7;
  v14 = (void *)MEMORY[0x24BD154E4](v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_3;
  v17[3] = &unk_251BECCF0;
  v18 = v11;
  v15 = v11;
  v16 = (void *)MEMORY[0x24BD154E4](v17);
  _WorkoutKitConnectWithBlock(v14, v16);

}

void __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_2;
  v9[3] = &unk_251BECCA0;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(a2, "setAuthorizationState:forBundleId:completion:", v6, v7, v9);

}

void __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleUninstalledAppIds:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke;
  v15[3] = &unk_251BECCC8;
  v16 = v5;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v10 = (void *)MEMORY[0x24BD154E4](v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_3;
  v13[3] = &unk_251BECCF0;
  v14 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x24BD154E4](v13);
  _WorkoutKitConnectWithBlock(v10, v12);

}

void __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_2;
  v8[3] = &unk_251BECCA0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "handleUninstalledAppIds:completion:", v6, v8);

}

void __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
