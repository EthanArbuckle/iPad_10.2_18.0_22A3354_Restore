@implementation SBDesiredIconStateMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  _BOOL8 v15;
  _BOOL8 v16;
  PETScalarEventTracker *loadEventTracker;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 == 35)
  {
    objc_msgSend(a4, "eventPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE10]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v7);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "hasPrefix:", CFSTR("com.apple."));
          v10 += v14;
          v11 += v14 ^ 1;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
      v15 = v10 != 0;
      v16 = v11 != 0;
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    loadEventTracker = self->_loadEventTracker;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETScalarEventTracker trackEventWithPropertyValues:](loadEventTracker, "trackEventWithPropertyValues:", v20);

  }
  return a3 == 35;
}

- (SBDesiredIconStateMetric)init
{
  SBDesiredIconStateMetric *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  PETScalarEventTracker *loadEventTracker;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SBDesiredIconStateMetric;
  v2 = -[SBDesiredIconStateMetric init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v4 = MEMORY[0x1E0C9AAB0];
    v5 = MEMORY[0x1E0C9AAA0];
    v20[0] = MEMORY[0x1E0C9AAB0];
    v20[1] = MEMORY[0x1E0C9AAA0];
    v21[0] = CFSTR("Y");
    v21[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("HasAppleApps"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D80F20];
    v18[0] = v4;
    v18[1] = v5;
    v19[0] = CFSTR("Y");
    v19[1] = CFSTR("N");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyWithName:enumMapping:", CFSTR("HasNonAppleApps"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D80F38]);
    v17[0] = v7;
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("IconModelWithDesiredIconStateLoaded"), v12);
    loadEventTracker = v2->_loadEventTracker;
    v2->_loadEventTracker = (PETScalarEventTracker *)v13;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadEventTracker, 0);
}

@end
