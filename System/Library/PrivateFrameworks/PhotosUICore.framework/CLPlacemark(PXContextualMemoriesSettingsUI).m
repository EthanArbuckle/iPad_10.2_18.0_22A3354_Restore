@implementation CLPlacemark(PXContextualMemoriesSettingsUI)

- (id)px_title
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "areasOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(a1, "areasOfInterest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_px_dynamicLocationString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)px_subtitle
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "areasOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(a1, "_px_dynamicLocationString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_px_dynamicLocationString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(&unk_1E53E93A8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(&unk_1E53E93A8);
      objc_msgSend(a1, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v2;
      v10 = v8;
      v11 = objc_msgSend(v10, "length");
      if (v11)
      {
        if (objc_msgSend(v9, "length"))
          objc_msgSend(v9, "appendFormat:", CFSTR(", %@"), v10);
        else
          objc_msgSend(v9, "appendString:", v10);
      }

      if (v11)
        ++v5;

      if (v5 == 2)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(&unk_1E53E93A8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v4)
          goto LABEL_3;
        return v2;
      }
    }
  }
  return v2;
}

@end
