@implementation REEngineDefaultsClass

Class __get_REEngineDefaultsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_REEngineDefaults");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_REEngineDefaultsClass_block_invoke_cold_1();
    free(v3);
  }
  get_REEngineDefaultsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
  {
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_REEngineDefaults");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_REEngineDefaultsClass_block_invoke_cold_1_0();
    free(v3);
  }
  get_REEngineDefaultsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
  {
    RelevanceEngineLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_REEngineDefaults");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_REEngineDefaultsClass_block_invoke_cold_1_0();
    free(v3);
  }
  get_REEngineDefaultsClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_2(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_3)
  {
    RelevanceEngineLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!RelevanceEngineLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_REEngineDefaults");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_REEngineDefaultsClass_block_invoke_cold_1_0();
    free(v3);
  }
  get_REEngineDefaultsClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_REEngineDefaultsClass_block_invoke_3(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_4)
  {
    RelevanceEngineLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    if (!RelevanceEngineLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_REEngineDefaults");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_REEngineDefaultsClass_block_invoke_cold_1_0();
    free(v3);
  }
  get_REEngineDefaultsClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_REEngineDefaultsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2_cold_1(v0);
}

uint64_t __get_REEngineDefaultsClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __49__RETrainingSimulationClient__handleInterruption__block_invoke_cold_1(v0);
}

@end
