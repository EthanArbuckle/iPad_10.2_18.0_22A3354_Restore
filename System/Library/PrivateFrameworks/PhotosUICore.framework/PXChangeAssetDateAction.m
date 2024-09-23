@implementation PXChangeAssetDateAction

- (PXChangeAssetDateAction)initWithAssets:(id)a3 date:(id)a4 timeZone:(id)a5
{
  id v9;
  id v10;
  PXChangeAssetDateAction *v11;
  PXChangeAssetDateAction *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXChangeAssetDateAction;
  v11 = -[PXAssetsAction initWithAssets:](&v14, sel_initWithAssets_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_changeDate, a4);
    objc_storeStrong((id *)&v12->_timeZone, a5);
  }

  return v12;
}

- (PXChangeAssetDateAction)initWithAssets:(id)a3 dateOffset:(double)a4 timeZone:(id)a5
{
  id v9;
  PXChangeAssetDateAction *v10;
  PXChangeAssetDateAction *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXChangeAssetDateAction;
  v10 = -[PXAssetsAction initWithAssets:](&v13, sel_initWithAssets_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_dateOffset = a4;
    objc_storeStrong((id *)&v10->_timeZone, a5);
  }

  return v11;
}

- (id)actionIdentifier
{
  return CFSTR("ChangeAssetDate");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXAdjustDateAndTimeActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  PXChangeAssetDateAction *v16;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__PXChangeAssetDateAction_performAction___block_invoke;
  v12[3] = &unk_1E513DD48;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v16 = self;
  v9 = v8;
  v10 = v7;
  v11 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v12, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  -[PXChangeAssetDateAction originalDateByLocalIdentifier](self, "originalDateByLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXChangeAssetDateAction originalTimeZoneByLocalIdentifier](self, "originalTimeZoneByLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__PXChangeAssetDateAction_performUndo___block_invoke;
  v9[3] = &unk_1E51457C8;
  v9[4] = self;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v9, v4);

}

- (id)_timeZoneForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "fetchPropertySetsIfNeeded");
  objc_msgSend(v3, "originalMetadataProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setDate:(id)a3 timeZone:(id)a4 forAsset:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v11)
  {
    objc_msgSend(v8, "creationDate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v9, "setCreationDate:");
  if (v7)
LABEL_3:
    objc_msgSend(v10, "setTimeZone:withDate:", v7, v11);
LABEL_4:

}

- (NSDate)changeDate
{
  return self->_changeDate;
}

- (double)dateOffset
{
  return self->_dateOffset;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDictionary)originalDateByLocalIdentifier
{
  return self->_originalDateByLocalIdentifier;
}

- (void)setOriginalDateByLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originalDateByLocalIdentifier, a3);
}

- (NSDictionary)originalTimeZoneByLocalIdentifier
{
  return self->_originalTimeZoneByLocalIdentifier;
}

- (void)setOriginalTimeZoneByLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originalTimeZoneByLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalTimeZoneByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_originalDateByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_changeDate, 0);
}

uint64_t __39__PXChangeAssetDateAction_performUndo___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1[4], "assets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "localIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "_setDate:timeZone:forAsset:", v9, v10, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[4], "setOriginalDateByLocalIdentifier:", 0);
  return objc_msgSend(a1[4], "setOriginalTimeZoneByLocalIdentifier:", 0);
}

uint64_t __41__PXChangeAssetDateAction_performAction___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a1[4];
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "localIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "creationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v8, v7);
        objc_msgSend(a1[7], "_timeZoneForAsset:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v9, v7);

        objc_msgSend(a1[7], "changeDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(a1[7], "dateOffset");
          objc_msgSend(v8, "dateByAddingTimeInterval:");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        v14 = a1[7];
        objc_msgSend(v14, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setDate:timeZone:forAsset:", v13, v15, v6);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

  objc_msgSend(a1[7], "setOriginalDateByLocalIdentifier:", a1[5]);
  return objc_msgSend(a1[7], "setOriginalTimeZoneByLocalIdentifier:", a1[6]);
}

@end
