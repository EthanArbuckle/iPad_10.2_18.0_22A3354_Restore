@implementation SearchUIOpenPunchoutHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(a4, "selectableGridPunchoutIndex");
  objc_msgSend(v5, "punchouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 < 1 || objc_msgSend(v7, "count") <= (unint64_t)v6)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "preferredOpenableURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setPunchout:", v9);
  }

  return v10;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;

  -[SearchUIOpenPunchoutHandler destinationPunchout](self, "destinationPunchout", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUIOpenPunchoutHandler handlePunchout:triggerEvent:](SearchUIOpenPunchoutHandler, "handlePunchout:triggerEvent:", v6, a4);

}

+ (void)handlePunchout:(id)a3 triggerEvent:(unint64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "preferredOpenableURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.contacts"));

  if (a4 == 7)
  {
    if ((objc_msgSend(v5, "isFileURL") ^ 1 | v7) != 1)
      goto LABEL_7;
LABEL_6:
    +[SearchUIUtilities openPunchout:](SearchUIUtilities, "openPunchout:", v8);
    goto LABEL_7;
  }
  if (a4 != 22 || ((objc_msgSend(v5, "isFileURL") ^ 1 | v7) & 1) != 0)
    goto LABEL_6;
LABEL_7:

}

- (BOOL)prefersModalPresentation
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUIOpenPunchoutHandler url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("events.shazam.apple.com"));

  return v4;
}

- (id)destinationPunchout
{
  void *v2;
  void *v3;

  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)url
{
  void *v2;
  void *v3;

  -[SearchUIOpenPunchoutHandler destinationPunchout](self, "destinationPunchout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredOpenableURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)schemeSupportedForCopyAndShare
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIOpenPunchoutHandler url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(&unk_1EA228CF0, "containsObject:", v4);
  return (char)v2;
}

- (void)fetchShareableURLWithCompletionHandler:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[SearchUIOpenPunchoutHandler url](self, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)defaultTitle
{
  return CFSTR("Open Link");
}

- (id)defaultSymbolName
{
  return CFSTR("safari");
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SearchUIOpenPunchoutHandler destinationPunchout](self, "destinationPunchout", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "urls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v6)
  {
    v16 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  v8 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_msgSend(v10, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("stocks")))
      {
        objc_msgSend((id)objc_opt_class(), "queryItemValueForName:inURL:", CFSTR("symbol"), v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DACC68]), "initWithStockTicker:", v17);

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(v10, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("weather.apple.com"));

      if (v13)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB00]), "initWithURL:", v10);
        goto LABEL_19;
      }
      if (objc_msgSend(MEMORY[0x1E0D614B0], "canOpenURL:", v10))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D614B0]), "initWithURL:", v10);
        objc_msgSend(v16, "setLinkPreviewing:", 1);
        goto LABEL_19;
      }
      if ((objc_msgSend(v4, "hasClip") & 1) == 0)
      {
        if (objc_msgSend(&unk_1EA228D08, "containsObject:", v11))
        {
          objc_msgSend(v10, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(&unk_1EA228D20, "containsObject:", v14);

          if ((v15 & 1) == 0)
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v10);
            objc_msgSend(v16, "_setShowingLinkPreviewWithMinimalUI:", 1);
            goto LABEL_19;
          }
        }
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v16 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_20:

  return v16;
}

+ (id)queryItemValueForName:(id)a3 inURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "queryItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)itemProvider
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB36C8]);
  -[SearchUIOpenPunchoutHandler url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObject:", v4);

  return v5;
}

@end
