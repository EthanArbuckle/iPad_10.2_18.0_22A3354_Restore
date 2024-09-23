@implementation PLCameraCaptureTaskConstraints

void __72__PLCameraCaptureTaskConstraints_startConstrainingTasksWithCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  v6 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (v6)
    v8 = 0;
  else
    v8 = v7 == 1;
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    if (v9)
    {
      PLCameraTaskConstraintsGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: become active for camera activity", (uint8_t *)&v13, 0xCu);
      }

      +[PLPhotoLibrary cameraPhotoLibrary](PLPhotoLibrary, "cameraPhotoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "disableOpportunisticTasks");

    }
  }
}

- (void)startConstrainingTasksWithCoordinator:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLSafeRunWithUnfairLock();

}

+ (PLCameraCaptureTaskConstraints)sharedTaskConstraints
{
  pl_dispatch_once();
  return (PLCameraCaptureTaskConstraints *)(id)sharedTaskConstraints_pl_once_object_15;
}

- (PLCameraCaptureTaskConstraints)init
{
  PLCameraCaptureTaskConstraints *v2;
  PLCameraCaptureTaskConstraints *v3;
  uint64_t v4;
  PFStateCaptureHandler *stateHandler;
  PLCameraCaptureTaskConstraints *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCameraCaptureTaskConstraints;
  v2 = -[PLCameraCaptureTaskConstraints init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_taskConstraintCoordinatorLock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71088]), "initWithProvider:", v2);
    stateHandler = v3->_stateHandler;
    v3->_stateHandler = (PFStateCaptureHandler *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)stopConstrainingTasksWithCoordinator:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLSafeRunWithUnfairLock();

}

- (id)taskConstraintStatus
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__67688;
  v8 = __Block_byref_object_dispose__67689;
  v9 = 0;
  PLSafeRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)stateCaptureDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = v3;
  PLSafeRunWithUnfairLock();
  v13[0] = CFSTR("coordinators");
  v13[1] = CFSTR("photoStreamsPaused");
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v10 + 24), v7, 3221225472, __56__PLCameraCaptureTaskConstraints_stateCaptureDictionary__block_invoke, &unk_1E3676EA0, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong(&self->_mstreamdPauseContext, 0);
  objc_storeStrong((id *)&self->_taskConstraintCoordinators, 0);
}

void __56__PLCameraCaptureTaskConstraints_stateCaptureDictionary__block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1[4] + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)a1[5];
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "description", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 24) != 0;
}

void __54__PLCameraCaptureTaskConstraints_taskConstraintStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Camera capture task constraints are active (%ld coordinators activated)"), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR(", photo streams are paused"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(_QWORD *)(a1 + 32);
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = *(id *)(v6 + 16);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Camera capture task constraints are not active"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

void __71__PLCameraCaptureTaskConstraints_stopConstrainingTasksWithCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (v2 == 1 && v3 == 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    if (v5)
    {
      PLCameraTaskConstraintsGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: resign active for camera activity", (uint8_t *)&v9, 0xCu);
      }

      +[PLPhotoLibrary cameraPhotoLibrary](PLPhotoLibrary, "cameraPhotoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enableOpportunisticTasks");

    }
  }
}

void __55__PLCameraCaptureTaskConstraints_sharedTaskConstraints__block_invoke()
{
  PLCameraCaptureTaskConstraints *v0;
  void *v1;

  v0 = objc_alloc_init(PLCameraCaptureTaskConstraints);
  v1 = (void *)sharedTaskConstraints_pl_once_object_15;
  sharedTaskConstraints_pl_once_object_15 = (uint64_t)v0;

}

@end
