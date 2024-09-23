@implementation NSBundle(SafariSharedExtras)

+ (id)safari_safariSharedBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)safari_safariSharedBundle_bundle;
  if (!safari_safariSharedBundle_bundle)
  {
    objc_msgSend(a1, "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)safari_safariSharedBundle_bundle;
    safari_safariSharedBundle_bundle = v3;

    v2 = (void *)safari_safariSharedBundle_bundle;
  }
  return v2;
}

+ (id)safari_bundlesFromDirectory:()SafariSharedExtras bundleType:
{
  CFArrayRef BundlesFromDirectory;
  void *v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFBundle *v11;
  id v12;
  CFURLRef v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(0, directoryURL, bundleType);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[__CFArray count](BundlesFromDirectory, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = BundlesFromDirectory;
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(__CFBundle **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0CB34D0]);
        v13 = CFBundleCopyBundleURL(v11);
        v14 = (void *)objc_msgSend(v12, "initWithURL:", v13, (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

@end
