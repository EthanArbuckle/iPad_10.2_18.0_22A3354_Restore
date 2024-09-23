@implementation RESwizzleInterface

void __41___RESwizzleInterface__configuredObjects__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_configuredObjects_ConfiguredObjects;
  _configuredObjects_ConfiguredObjects = v0;

}

uint64_t __50___RESwizzleInterface__re_runAfterEngineIsLoaded___block_invoke(uint64_t a1)
{
  void *v2;

  os_unfair_lock_lock(&_re_runAfterEngineIsLoaded__ConfigurationLock);
  objc_msgSend((id)objc_opt_class(), "_configuredObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  os_unfair_lock_unlock(&_re_runAfterEngineIsLoaded__ConfigurationLock);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __92___RESwizzleInterface__re_swizzled_relevanceEngine_createElementFromDescription_completion___block_invoke(_QWORD *a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngine:createElementFromDescription:completion:", a1[4], a1[5], a1[6]);

}

void __90___RESwizzleInterface__re_swizzled_relevanceEngine_performCommand_withOptions_completion___block_invoke(_QWORD *a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngine:performCommand:withOptions:completion:", a1[4], a1[5], a1[6], a1[7]);

}

void __62___RESwizzleInterface__re_swizzled_availableRelevanceEngines___block_invoke(uint64_t a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableRelevanceEngines:", *(_QWORD *)(a1 + 32));

}

void __91___RESwizzleInterface__re_swizzled_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke(uint64_t a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAllElementIdentifiersInRelevanceEngine:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __81___RESwizzleInterface__re_swizzled_fetchAllElementsInRelevanceEngine_completion___block_invoke(uint64_t a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAllElementsInRelevanceEngine:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __86___RESwizzleInterface__re_swizzled_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke(uint64_t a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gatherDiagnosticLogsForRelevanceEngine:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __98___RESwizzleInterface__re_swizzled_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke(_QWORD *a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngine:runActionOfElementWithDescription1:completion:", a1[4], a1[5], a1[6]);

}

void __83___RESwizzleInterface__re_swizzled_relevanceEngine_encodedObjectAtPath_completion___block_invoke(_QWORD *a1)
{
  id v2;

  +[RETrainingSimulationServer sharedServer](RETrainingSimulationServer, "sharedServer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngine:encodedObjectAtPath:completion:", a1[4], a1[5], a1[6]);

}

@end
