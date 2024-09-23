@implementation PXImageLayerGainMapOrderInAction

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(&unk_1E53EA200, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(&unk_1E53EA200);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CD27C8], "animation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDelegate:", self);
        objc_msgSend(v6, "superlayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSourceLayer:", v13);

        objc_msgSend(v12, "setKeyPath:", v11);
        objc_msgSend(v12, "setDuration:", INFINITY);
        objc_msgSend(v11, "stringByAppendingString:", CFSTR("Animation"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addAnimation:forKey:", v12, v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(&unk_1E53EA200, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }
  objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);
  objc_msgSend(v6, "superlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourceLayer:", v16);

  objc_msgSend(v15, "setUsesNormalizedCoordinates:", 1);
  objc_msgSend(v15, "setAppliesScale:", 0);
  objc_msgSend(v15, "setAppliesRotation:", 0);
  objc_msgSend(v15, "setDuration:", INFINITY);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourcePoints:", v18);

  objc_msgSend(v6, "addAnimation:forKey:", v15, CFSTR("positionAnimation"));
}

@end
