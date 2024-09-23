@implementation PLStickerSuggestionDominantSceneAreaMinThreshold

void __PLStickerSuggestionDominantSceneAreaMinThreshold_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("PLStickerSuggestionDominantSceneAreaMinThreshold"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    PLStickerSuggestionDominantSceneAreaMinThreshold_threshold = v2;
    PLSearchBackendModelTranslationGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = PLStickerSuggestionDominantSceneAreaMinThreshold_threshold;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Overriding PLStickerSuggestionDominantSceneAreaMinThreshold with user default value: %f", (uint8_t *)&v4, 0xCu);
    }

  }
}

@end
