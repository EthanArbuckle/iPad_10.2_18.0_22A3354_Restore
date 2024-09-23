@implementation SearchUIGradientColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(id, void *);
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v15 = (void (**)(id, void *))a4;
  v6 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SearchUIColorGenerator sfColor](self, "sfColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
        {
          v14 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v13, "searchUI_colorGeneratorClass")), "initWithSFColor:", v13);
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __75__SearchUIGradientColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
          v16[3] = &unk_1EA1F6480;
          v17 = v6;
          objc_msgSend(v14, "generateUIColorsIsDark:completionHandler:", v4, v16);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v15[2](v15, v6);
}

uint64_t __75__SearchUIGradientColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

@end
