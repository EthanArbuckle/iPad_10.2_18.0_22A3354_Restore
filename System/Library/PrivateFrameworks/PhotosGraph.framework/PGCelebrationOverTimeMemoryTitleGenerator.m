@implementation PGCelebrationOverTimeMemoryTitleGenerator

- (PGCelebrationOverTimeMemoryTitleGenerator)initWithMomentNodes:(id)a3 titleGenerationContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGCelebrationOverTimeMemoryTitleGenerator;
  return -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v5, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, 0, 0, 0, 0, 0, a4);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, void *);

  v6 = (void (**)(id, void *, void *))a3;
  -[PGCelebrationOverTimeMemoryTitleGenerator _celebrationTitle](self, "_celebrationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCelebrationOverTimeMemoryTitleGenerator _celebrationSubtitle](self, "_celebrationSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v4, v5);

}

- (id)_celebrationTitle
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__33698;
  v20 = __Block_byref_object_dispose__33699;
  v21 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    v5 = MEMORY[0x1E0C809B0];
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v4)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __62__PGCelebrationOverTimeMemoryTitleGenerator__celebrationTitle__block_invoke;
      v11[3] = &unk_1E842FD68;
      v11[4] = &v16;
      objc_msgSend(v7, "enumerateCelebratedHolidayNodesUsingBlock:", v11);
      if (objc_msgSend((id)v17[5], "length"))
        break;
      if (v3 == ++v6)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

  v8 = v17[5];
  if (v8)
  {
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v8, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (id)_celebrationSubtitle
{
  PGTimeTitleOptions *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTimeTitleOptions setAllowedFormats:](v2, "setAllowedFormats:", 16);
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v3, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __62__PGCelebrationOverTimeMemoryTitleGenerator__celebrationTitle__block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length");
    v5 = v10;
    *a3 = v9 != 0;
  }

}

@end
