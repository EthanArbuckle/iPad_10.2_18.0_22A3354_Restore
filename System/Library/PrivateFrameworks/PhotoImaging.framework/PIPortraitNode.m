@implementation PIPortraitNode

+ (id)vectorWithFloats:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 0x1F)
    v4 = 32;
  else
    v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "subarrayWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "doubleValue", (_QWORD)v15);
        *v10++ = v12;
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", v20, objc_msgSend(v6, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)isPortraitStageEffect:(id)a3
{
  return objc_msgSend(&unk_1E5058DA0, "containsObject:", a3);
}

+ (BOOL)isPortraitMonoEffect:(id)a3
{
  return objc_msgSend(&unk_1E5058DB8, "containsObject:", a3);
}

- (NURenderNode)input
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("inputImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NURenderNode *)v3;
}

- (NURenderNode)blurMap
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("inputBlurMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NURenderNode *)v3;
}

- (BOOL)shouldDisableGainMap
{
  return 0;
}

- (id)_evaluateImageProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PIPortraitNode input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageProperties:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && -[PIPortraitNode shouldDisableGainMap](self, "shouldDisableGainMap"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52360]), "initWithProperties:", v6);
    objc_msgSend(v7, "setAuxiliaryImageProperties:forType:", 0, 7);

    v6 = v7;
  }
  return v6;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  void *v5;
  int v6;

  -[PIPortraitNode input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPropagateOriginalAuxiliaryData:", a3);

  if (a3 == 7 && v6)
    return !-[PIPortraitNode shouldDisableGainMap](self, "shouldDisableGainMap");
  return v6;
}

@end
