@implementation PXGOverlayTextureManager

- (id)overlayTexturesByPresentationTypeForTextures:(id)a3 spriteDataStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  unsigned int v18;
  PXGRemoteEffectOverlayTexture *v19;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E53EDF98);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v23 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v6;
    v10 = objc_msgSend(objc_retainAutorelease(v6), "infos");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isAtlas", v21) & 1) == 0)
          {
            objc_msgSend(v16, "spriteIndexes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "firstIndex");

            if (*(_BYTE *)(v10 + 40 * v18 + 1) == 2 && (*(_BYTE *)(v10 + 40 * v18 + 34) & 0x10) == 0)
            {
              v19 = -[PXGRemoteEffectOverlayTexture initWithMetalSpriteTexture:]([PXGRemoteEffectOverlayTexture alloc], "initWithMetalSpriteTexture:", v16);
              objc_msgSend(v9, "addObject:", v19);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v7 = v23;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v9, &unk_1E53EDFB0);

    v8 = v21;
    v6 = v22;
  }

  return v7;
}

- (BOOL)wantsOverlayTextures
{
  return self->_wantsOverlayTextures;
}

@end
