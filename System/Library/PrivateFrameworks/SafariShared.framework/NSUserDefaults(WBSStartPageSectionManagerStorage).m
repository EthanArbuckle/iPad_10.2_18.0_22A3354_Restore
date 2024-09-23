@implementation NSUserDefaults(WBSStartPageSectionManagerStorage)

- (id)startPageSectionDescriptors
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  objc_msgSend(a1, "objectForKey:", CFSTR("StartPageSections"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  +[WBSStartPageSectionSerialization decodeSectionsFromData:expectedFormat:allowingFallbackFormats:error:](WBSStartPageSectionSerialization, "decodeSectionsFromData:expectedFormat:allowingFallbackFormats:error:", v1, 0, 0, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NSUserDefaults(WBSStartPageSectionManagerStorage) startPageSectionDescriptors].cold.1(v4, v3);
  }

  return v2;
}

- (void)setStartPageSectionDescriptors:()WBSStartPageSectionManagerStorage
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  +[WBSStartPageSectionSerialization encodeSectionsAsLocalData:error:](WBSStartPageSectionSerialization, "encodeSectionsAsLocalData:error:", a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSUserDefaults(WBSStartPageSectionManagerStorage) setStartPageSectionDescriptors:].cold.1(v6, v5);
  }
  objc_msgSend(a1, "setObject:forKey:", v4, CFSTR("StartPageSections"));

}

- (void)startPageSectionDescriptors
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to decode section data: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)setStartPageSectionDescriptors:()WBSStartPageSectionManagerStorage .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to serialize section data: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end
