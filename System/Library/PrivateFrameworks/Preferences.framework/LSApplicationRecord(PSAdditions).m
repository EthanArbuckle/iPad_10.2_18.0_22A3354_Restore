@implementation LSApplicationRecord(PSAdditions)

- (uint64_t)supportsJournalingSuggestions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
  {
    v12 = xmmword_1E4A67FE8;
    v13 = 0;
    MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getMOApprovedApplicationsManagerClass_softClass;
  v11 = getMOApprovedApplicationsManagerClass_softClass;
  if (!getMOApprovedApplicationsManagerClass_softClass)
  {
    *(_QWORD *)&v12 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = __getMOApprovedApplicationsManagerClass_block_invoke;
    v14 = &unk_1E4A65650;
    v15 = &v8;
    __getMOApprovedApplicationsManagerClass_block_invoke((uint64_t)&v12);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedInstance", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isJournalingSuggestionsAvailableForBundleIdentifier:", v5);

  return v6;
}

@end
