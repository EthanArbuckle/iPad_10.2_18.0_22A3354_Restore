@implementation RETrainingSimulationCoordinator

+ (void)prewarm
{
  id v2;

  v2 = +[RESingleton sharedInstance](RETrainingSimulationCoordinator, "sharedInstance");
}

- (id)_init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RETrainingSimulationCoordinator;
  v2 = -[RESingleton _init](&v11, sel__init);
  if (v2)
  {
    if (_fetchedInternalBuildOnceToken_1 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_1, &__block_literal_global_6);
    if (_isInternalDevice_1)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)*((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 2) = v3;

      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)*((_QWORD *)v2 + 3);
      *((_QWORD *)v2 + 3) = v5;

      +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v7;

      objc_msgSend(*((id *)v2 + 1), "addObserver:", v2);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__relevanceEnginesDidChange, CFSTR("RERelevanceEngineDebuggerAvailableEnginesDidChange"), 0);

    }
  }
  return v2;
}

uint64_t __40__RETrainingSimulationCoordinator__init__block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_1 = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("RERelevanceEngineDebuggerAvailableEnginesDidChange"), 0);

  v4.receiver = self;
  v4.super_class = (Class)RETrainingSimulationCoordinator;
  -[RETrainingSimulationCoordinator dealloc](&v4, sel_dealloc);
}

- (void)_relevanceEnginesDidChange
{
  -[RETrainingSimulationServer availableRelevanceEnginesDidChange](self->_server, "availableRelevanceEnginesDidChange");
}

- (id)_engineWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engineWithName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accesssEngineWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke;
    block[3] = &unk_24CF8AA00;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_engineWithName:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerQueue");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke_2;
    v5[3] = &unk_24CF8B2E0;
    v7 = *(id *)(a1 + 48);
    v6 = v2;
    dispatch_async(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __69__RETrainingSimulationCoordinator__accesssEngineWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_unavailableEngineWithNameError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No Relevance engine with name \"%@\" found"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RECreateErrorWithCodeAndMessage(1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  RETrainingSimulationCoordinator *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(a4, "mutableCopy");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke;
  v14[3] = &unk_24CF8D928;
  v15 = v10;
  v16 = self;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[RETrainingSimulationCoordinator _accesssEngineWithName:completion:](self, "_accesssEngineWithName:completion:", v12, v14);

}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_unavailableEngineWithNameError:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("section"));
  objc_msgSend(v3, "elementFromDictionary:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    RECreateErrorWithCode(2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v6 = (void *)v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  objc_msgSend(v3, "addElement:section:", v6, v4);
  objc_msgSend(v3, "subsystemQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_2;
  block[3] = &unk_24CF8D900;
  v13 = v3;
  v11 = *(id *)(a1 + 56);
  v14 = 0;
  v15 = v11;
  dispatch_async(v10, block);

LABEL_9:
}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "subsystemQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_3;
  v3[3] = &unk_24CF8B2E0;
  v5 = a1[6];
  v4 = a1[5];
  dispatch_async(v2, v3);

}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_4;
  v2[3] = &unk_24CF8B2E0;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_4(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_5;
  v2[3] = &unk_24CF8B2E0;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __91__RETrainingSimulationCoordinator_relevanceEngine_createElementFromDescription_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  RETrainingSimulationCoordinator *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke;
  v18[3] = &unk_24CF8D990;
  v19 = v11;
  v20 = self;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  -[RETrainingSimulationCoordinator _accesssEngineWithName:completion:](self, "_accesssEngineWithName:completion:", v16, v18);

}

void __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("sysdiagnose")))
    {
      if (_fetchedInternalBuildOnceToken_1 != -1)
        dispatch_once(&_fetchedInternalBuildOnceToken_1, &__block_literal_global_25);
      if (_isInternalDevice_1 && (REProcessIsRelevanced() & 1) != 0)
        goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("begin")))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isActivelyTraining") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "setIsActivelyTraining:", 1);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "postNotificationName:object:", CFSTR("RETrainingSimulationCoordinatorDidBeginTraining"), *(_QWORD *)(a1 + 40));

      }
      objc_msgSend(v3, "pauseForSimulation");
      goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("end")))
    {
      +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setOverrideLocation:forEngine:", -1, *(_QWORD *)(a1 + 48));

      +[RESingleton sharedInstance](REDailyRoutinePredictor, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setOverrideRoutineType:", 0);

      if (objc_msgSend(*(id *)(a1 + 40), "isActivelyTraining"))
      {
        objc_msgSend(*(id *)(a1 + 40), "setIsActivelyTraining:", 0);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "postNotificationName:object:", CFSTR("RETrainingSimulationCoordinatorDidEndTraining"), *(_QWORD *)(a1 + 40));

      }
      objc_msgSend(v3, "resumeFromSimulation");
      goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("reset")))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x24BDBD1A8];
      if (v9)
        v11 = (void *)v9;
      v12 = v11;

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v3, "removeElement:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v14);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
      goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("clear")))
    {
      objc_msgSend(v3, "trainPendingEventsWithCompletion:", 0);
      objc_msgSend(v3, "modelManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "performModelClearWithCompletion:", &__block_literal_global_36);

LABEL_31:
      v5 = 0;
      goto LABEL_32;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("train")))
    {
      objc_msgSend(v3, "trainPendingEventsWithCompletion:", 0);
      goto LABEL_31;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("set_core_routine")))
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("core_routine"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = RELocationPredictorUserLocationFromString(v5);
      +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setOverrideLocation:forEngine:", v18, *(_QWORD *)(a1 + 48));

      v20 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_4;
      block[3] = &unk_24CF8B1B0;
      v31 = *(id *)(a1 + 64);
      dispatch_after(v20, MEMORY[0x24BDAC9B8], block);
      v21 = v31;
LABEL_38:

      goto LABEL_33;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("set_routine_type")))
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("routine_type"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = REDailyRoutineTypeFromString(v5);
      +[RESingleton sharedInstance](REDailyRoutinePredictor, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_setOverrideRoutineType:", v22);

      v24 = dispatch_time(0, 1000000000);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_5;
      v28[3] = &unk_24CF8B1B0;
      v29 = *(id *)(a1 + 64);
      dispatch_after(v24, MEMORY[0x24BDAC9B8], v28);
      v21 = v29;
      goto LABEL_38;
    }
    objc_msgSend(v3, "trainingManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentTrainingContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if ((objc_msgSend(v26, "performSimulationCommand:withOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56)) & 1) != 0)
      {
        v5 = 0;
LABEL_45:

        goto LABEL_32;
      }
      v27 = 100;
    }
    else
    {
      v27 = 3;
    }
    RECreateErrorWithCode(v27);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  objc_msgSend(*(id *)(a1 + 40), "_unavailableEngineWithNameError:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_33:

}

uint64_t __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_2()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_1 = result;
  return result;
}

uint64_t __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__RETrainingSimulationCoordinator_relevanceEngine_performCommand_withOptions_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)availableRelevanceEngines:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableEngines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v3[2](v3, v4, 0);
}

- (void)fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__RETrainingSimulationCoordinator_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_24CF8D9B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[RETrainingSimulationCoordinator _accesssEngineWithName:completion:](self, "_accesssEngineWithName:completion:", v9, v10);

}

void __90__RETrainingSimulationCoordinator_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  RESectionPath *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (objc_msgSend(v9, "numberOfElementsInSection:", CFSTR("defaultSectionIdentifier")))
    {
      v4 = 0;
      do
      {
        v5 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", CFSTR("defaultSectionIdentifier"), v4);
        objc_msgSend(v9, "elementAtPath:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v6, "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v7);

        }
        ++v4;
      }
      while (v4 < objc_msgSend(v9, "numberOfElementsInSection:", CFSTR("defaultSectionIdentifier")));
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_unavailableEngineWithNameError:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__RETrainingSimulationCoordinator_fetchAllElementsInRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_24CF8D9B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[RETrainingSimulationCoordinator _accesssEngineWithName:completion:](self, "_accesssEngineWithName:completion:", v9, v10);

}

void __80__RETrainingSimulationCoordinator_fetchAllElementsInRelevanceEngine_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  RESectionPath *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (objc_msgSend(v13, "numberOfElementsInSection:", CFSTR("defaultSectionIdentifier")))
    {
      v4 = 0;
      do
      {
        v5 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", CFSTR("defaultSectionIdentifier"), v4);
        objc_msgSend(v13, "elementAtPath:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v13, "dictionaryFromElement:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)objc_msgSend(v7, "mutableCopy");

          objc_msgSend(v13, "predictionForElementAtPath:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "probability");
          objc_msgSend(v10, "numberWithFloat:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("probability"));

          objc_msgSend(v3, "addObject:", v8);
        }

        ++v4;
      }
      while (v4 < objc_msgSend(v13, "numberOfElementsInSection:", CFSTR("defaultSectionIdentifier")));
      v12 = 0;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_unavailableEngineWithNameError:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[RETrainingSimulationCoordinator _engineWithName:](self, "_engineWithName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __85__RETrainingSimulationCoordinator_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke;
    v9[3] = &unk_24CF8D9E0;
    v10 = v6;
    objc_msgSend(v7, "storeDiagnosticLogsToFile:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RETrainingSimulationCoordinatorErrorDomain"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v8);

  }
}

void __85__RETrainingSimulationCoordinator_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  RETrainingSimulationCoordinator *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke;
  v14[3] = &unk_24CF8DA58;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v18 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[RETrainingSimulationCoordinator _accesssEngineWithName:completion:](self, "_accesssEngineWithName:completion:", v11, v14);

}

void __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  RESectionPath *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[4];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_unavailableEngineWithNameError:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v3, "numberOfElementsInSection:", CFSTR("defaultSectionIdentifier")))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to find element with description %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeAndMessage(4, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  v5 = 0;
  while (1)
  {
    v6 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", CFSTR("defaultSectionIdentifier"), v5);
    objc_msgSend(v4, "elementAtPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v22[0] = CFSTR("REContentDescription1TextKey");
    v22[1] = CFSTR("REContentCLKDescription1TextKey");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2;
    v15[3] = &unk_24CF8DA08;
    v16 = *(id *)(a1 + 32);
    v17 = &v18;
    REEnumerateContentAttributesOfElement(v8, v7, v15);
    if (*((_BYTE *)v19 + 24))
      break;

    _Block_object_dispose(&v18, 8);
    if (++v5 >= (unint64_t)objc_msgSend(v4, "numberOfElementsInSection:", CFSTR("defaultSectionIdentifier")))
      goto LABEL_6;
  }
  objc_msgSend(v7, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3;
  v13[3] = &unk_24CF8DA30;
  v14 = *(id *)(a1 + 56);
  v12 = (void *)MEMORY[0x2199B2434](v13);
  objc_msgSend(v11, "setObject:forKey:", v12, v10);

  objc_msgSend(v10, "setForceExecution:", 1);
  objc_msgSend(v10, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v10, "_performWithContext:", MEMORY[0x24BDBD1B8]);

  _Block_object_dispose(&v18, 8);
LABEL_9:

}

uint64_t __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __97__RETrainingSimulationCoordinator_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    RECreateErrorWithCode(101);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke;
  v12[3] = &unk_24CF8DA80;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[RETrainingSimulationCoordinator _accesssEngineWithName:completion:](self, "_accesssEngineWithName:completion:", a3, v12);

}

void __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  REJSONExportedValueEncoder *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  if (v3)
  {
    v13 = -[REExportedValueEncoder initWithOptions:]([REJSONExportedValueEncoder alloc], "initWithOptions:", 0);
    +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v6 = MEMORY[0x24BDAC760];
      do
      {
        if (objc_msgSend(v5, "type") == 2 && objc_msgSend(v5, "propertyCount") == 1)
        {
          v15 = 0;
          v16 = &v15;
          v17 = 0x3032000000;
          v18 = __Block_byref_object_copy__13;
          v19 = __Block_byref_object_dispose__13;
          v20 = 0;
          v14[0] = v6;
          v14[1] = 3221225472;
          v14[2] = __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke_62;
          v14[3] = &unk_24CF8AEA0;
          v14[4] = &v15;
          objc_msgSend(v5, "enumerateValuesUsingBlock:", v14);
          v7 = (void *)v16[5];
          if (v7)
          {
            v8 = v7;

            v5 = v8;
          }
          _Block_object_dispose(&v15, 8);

          if (v7)
            continue;
        }
        objc_msgSend(v4, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeObjectAtIndex:", 0);
        objc_msgSend(v5, "exportedValueForKey:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v10;
      }
      while (objc_msgSend(v4, "count"));
    }
    -[REExportedValueEncoder dataFromExportedValue:](v13, "dataFromExportedValue:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);

  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__RETrainingSimulationCoordinator_relevanceEngine_encodedObjectAtPath_completion___block_invoke_62(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)elementAction:(id)a3 didFinishTask:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__RETrainingSimulationCoordinator_elementAction_didFinishTask___block_invoke;
  block[3] = &unk_24CF8C8B8;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__RETrainingSimulationCoordinator_elementAction_didFinishTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, *(unsigned __int8 *)(a1 + 48));
    v2 = v3;
  }

}

- (void)elementAction:(id)a3 wantsViewControllerDisplayed:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v15 = xmmword_24CF8DAA0;
    v16 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (UIKitLibraryCore_frameworkLibrary)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v7 = (void *)getUIWindowClass_softClass;
    v14 = getUIWindowClass_softClass;
    if (!getUIWindowClass_softClass)
    {
      *(_QWORD *)&v15 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v15 + 1) = 3221225472;
      v16 = __getUIWindowClass_block_invoke;
      v17 = &unk_24CF8AC38;
      v18 = &v11;
      __getUIWindowClass_block_invoke((uint64_t)&v15);
      v7 = (void *)v12[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v8, "keyWindow", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v6, 0, 0);

  }
}

- (BOOL)isActivelyTraining
{
  return self->_isActivelyTraining;
}

- (void)setIsActivelyTraining:(BOOL)a3
{
  self->_isActivelyTraining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_elementsAddedByEngine, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
