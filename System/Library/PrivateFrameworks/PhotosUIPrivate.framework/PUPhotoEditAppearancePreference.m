@implementation PUPhotoEditAppearancePreference

+ (int64_t)preferredAppearance
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PUPhotoEditAppearancePreference _userDefaults](PUPhotoEditAppearancePreference, "_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("PUPhotoEditAppearanceKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(a1, "_identifierForAppearance:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = 0;
  while (1)
  {
    objc_msgSend(a1, "_identifierForAppearance:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if ((v7 & 1) != 0)
      break;
    if (++v5 == 3)
    {
      PLPhotoEditGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to restore edit appearance preference with identifier %@", (uint8_t *)&v10, 0xCu);
      }

      v5 = 1;
      break;
    }
  }

  return v5;
}

+ (void)setPreferredAppearance:(int64_t)a3
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_identifierForAppearance:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditAppearancePreference _userDefaults](PUPhotoEditAppearancePreference, "_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PUPhotoEditAppearanceKey"));

}

+ (id)_identifierForAppearance:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PUPhotoEditAppearanceSystem");
  if (a3 == 1)
    v3 = CFSTR("PUPhotoEditAppearanceDark");
  if (a3 == 2)
    return CFSTR("PUPhotoEditAppearanceLight");
  else
    return (id)v3;
}

@end
