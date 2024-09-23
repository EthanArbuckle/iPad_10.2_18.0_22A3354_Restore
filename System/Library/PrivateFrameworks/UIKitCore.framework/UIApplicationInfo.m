@implementation UIApplicationInfo

uint64_t __33___UIApplicationInfo_folderNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_loadFolderNamesIfNecessary");
}

uint64_t __40___UIApplicationInfo_fallbackFolderName__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_loadFolderNamesIfNecessary");
}

id __54___UIApplicationInfo__lock_loadFolderNamesIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_UIApplicationInfo _localizedFolderNameForName:](_UIApplicationInfo, "_localizedFolderNameForName:", a2);
}

id __54___UIApplicationInfo__lock_loadFolderNamesIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    +[_UIApplicationInfo _genreNameForID:](_UIApplicationInfo, "_genreNameForID:", objc_msgSend(a2, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    a2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a2)
    v8 = a2;
  else
    v8 = v5;
  v9 = v8;

  return v9;
}

@end
