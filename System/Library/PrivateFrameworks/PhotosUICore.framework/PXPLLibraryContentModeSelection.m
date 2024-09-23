@implementation PXPLLibraryContentModeSelection

+ (int)getPersistedLibraryContentModeSelection
{
  void *v2;
  int v3;

  if (!+[PXPLLibraryContentModeSelection hasPersistedLibraryContentModeSelection](PXPLLibraryContentModeSelection, "hasPersistedLibraryContentModeSelection"))return -1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("LastSelectedTabMode"));

  return v3;
}

+ (BOOL)hasPersistedLibraryContentModeSelection
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LastSelectedTabMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)setPersistedLibraryContentModeSelection:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("LastSelectedTabMode"));

}

+ (int)contentModeForNavigationDestination:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  if ((unint64_t)(v3 - 1) > 0x1B)
    return -1;
  else
    return dword_1A7C0A1D8[v3 - 1];
}

+ (int)launchContentModeForNavigationDestination:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 12;
  switch(objc_msgSend(v3, "type"))
  {
    case 8:
      v4 = 10;
      if (objc_msgSend(v3, "assetCollectionType") != 2)
      {
        if (objc_msgSend(v3, "assetCollectionSubtype") == 200)
          v4 = 10;
        else
          v4 = 13;
      }
      break;
    case 14:
      break;
    case 16:
      v4 = 990;
      break;
    case 17:
      if (objc_msgSend(v3, "collectionListType") != 2 || objc_msgSend(v3, "collectionListSubtype") != 1000000101)
        goto LABEL_11;
      v4 = 13;
      break;
    case 18:
    case 20:
      v4 = 11;
      break;
    default:
LABEL_11:
      v4 = 10;
      break;
  }

  return v4;
}

@end
