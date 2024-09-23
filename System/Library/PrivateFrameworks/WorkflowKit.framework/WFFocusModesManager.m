@implementation WFFocusModesManager

+ (id)activeMode
{
  void *v2;
  void *v3;

  objc_msgSend(getFCActivityManagerClass(), "sharedActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)availableModes
{
  void *v2;
  void *v3;

  objc_msgSend(getFCActivityManagerClass(), "sharedActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)availableModesForAutomationsDisplay
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "availableModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_60587);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultActivity
{
  void *v2;
  void *v3;

  objc_msgSend(getFCActivityManagerClass(), "sharedActivityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)glyphToFilledGlyphMapping
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_1E7B8DB98, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_1E7B8DB98);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.fill"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v8, v7);

      }
      v4 = objc_msgSend(&unk_1E7B8DB98, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  objc_msgSend(v2, "setObject:forKey:", CFSTR("emoji.face.grinning.inverse"), CFSTR("emoji.face.grinning"));
  return v2;
}

+ (id)enteringSymbolForSymbolName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "glyphToFilledGlyphMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(a1, "glyphToFilledGlyphMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.circle"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v7 = v10;
    }
    else
    {
      objc_msgSend(a1, "glyphToFilledGlyphMapping");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.square"), v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v14 = v13;
      else
        v14 = v4;
      v7 = v14;

    }
  }

  return v7;
}

+ (id)exitingSymbolForSymbolName:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(&unk_1E7B8DBB0, "containsObject:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.circle"), v3);
LABEL_5:
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(&unk_1E7B8DBC8, "containsObject:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.square"), v3);
    goto LABEL_5;
  }
  if (objc_msgSend(&unk_1E7B8DBE0, "containsObject:", v3)
    || !objc_msgSend(v3, "containsString:", CFSTR(".fill")))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".fill"), &stru_1E7AFA810);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v5 = v4;

  return v5;
}

id __58__WFFocusModesManager_availableModesForAutomationsDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.sleep.sleep-mode"));

  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = v2;

  return v5;
}

@end
