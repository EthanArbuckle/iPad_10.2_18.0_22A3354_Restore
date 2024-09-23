@implementation RE

void ____RE_Cached_Get__ShowAllElements_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(soft__REEngineDefaults(), "defaultsForEngine:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, "_registerCallback:forKey:", &__block_literal_global_244, CFSTR("ShowAllElements"));

    }
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    objc_msgSend(soft__REEngineDefaults(), "globalDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "_registerCallback:forKey:", &__block_literal_global_245, CFSTR("ShowAllElements"));

    }
  }
}

void ____RE_Cached_Get__DisplayDebugProbabilities_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (RelevanceEngineLibraryCore_frameworkLibrary_1)
  {
    objc_msgSend(soft__REEngineDefaults_0(), "defaultsForEngine:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, "_registerCallback:forKey:", &__block_literal_global_164_1, CFSTR("DisplayDebugProbabilities"));

    }
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  if (RelevanceEngineLibraryCore_frameworkLibrary_1)
  {
    objc_msgSend(soft__REEngineDefaults_0(), "globalDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "_registerCallback:forKey:", &__block_literal_global_165, CFSTR("DisplayDebugProbabilities"));

    }
  }
}

void ____RE_Cached_Get__ShowAllElements_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
    RelevanceEngineLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (RelevanceEngineLibraryCore_frameworkLibrary_2)
  {
    objc_msgSend(soft__REEngineDefaults_1(), "defaultsForEngine:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, "_registerCallback:forKey:", &__block_literal_global_36_0, CFSTR("ShowAllElements"));

    }
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_2)
    RelevanceEngineLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (RelevanceEngineLibraryCore_frameworkLibrary_2)
  {
    objc_msgSend(soft__REEngineDefaults_1(), "globalDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "_registerCallback:forKey:", &__block_literal_global_37_0, CFSTR("ShowAllElements"));

    }
  }
}

@end
