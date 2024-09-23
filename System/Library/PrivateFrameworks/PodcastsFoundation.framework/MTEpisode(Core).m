@implementation MTEpisode(Core)

- (void)setAssetURL:()Core
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[MTEpisode setSecurityScopedAssetData:](self, "setSecurityScopedAssetData:", 0);
    v4 = 0;
  }
  -[MTEpisode _setAssetUrl:](self, "_setAssetUrl:", v4);

}

- (void)setPodcastUuid:()Core .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "podcastUuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1A904E000, a2, OS_LOG_TYPE_FAULT, "Setting podcastUuid from %@ to nil will cause an exception on context save. Episode: %@", (uint8_t *)&v6, 0x16u);

}

@end
