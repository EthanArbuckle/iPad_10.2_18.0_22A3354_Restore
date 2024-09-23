@implementation PXStoryRecipeClipTransitionProvider

- (PXStoryRecipeClipTransitionProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeClipTransitionProvider.m"), 29, CFSTR("%s is not available as initializer"), "-[PXStoryRecipeClipTransitionProvider init]");

  abort();
}

- (PXStoryRecipeClipTransitionProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXStoryRecipeClipTransitionProvider *v13;
  PXStoryRecipeClipTransitionProvider *v14;
  void *v15;
  uint64_t v16;
  PFStoryAutoEditFrequencyTable *baseTransitionTable;
  void *v18;
  void *v19;
  uint64_t v20;
  PFStoryAutoEditFrequencyTable *interMomentTransitionTable;
  void *v22;
  void *v23;
  uint64_t v24;
  PFStoryAutoEditFrequencyTable *portraitTransitionTable;
  void *v26;
  void *v27;
  uint64_t v28;
  PFStoryAutoEditFrequencyTable *nUpTransitionTable;
  void *v30;
  void *v31;
  uint64_t v32;
  PFStoryAutoEditFrequencyTable *interModuleTransitionTable;
  void *v35;
  objc_super v36;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PXStoryRecipeClipTransitionProvider;
  v13 = -[PXStoryRecipeClipTransitionProvider init](&v36, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_songPace = a5;
    objc_msgSend(v10, "defaultTransitionTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transitionsForColorGrade:songPace:", v11, a5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v35, v12, &unk_1E53EF108);
    baseTransitionTable = v14->_baseTransitionTable;
    v14->_baseTransitionTable = (PFStoryAutoEditFrequencyTable *)v16;

    objc_msgSend(v10, "interMomentTransitionTable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transitionsForColorGrade:songPace:", v11, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v19, v12, &unk_1E53EF120);
    interMomentTransitionTable = v14->_interMomentTransitionTable;
    v14->_interMomentTransitionTable = (PFStoryAutoEditFrequencyTable *)v20;

    objc_msgSend(v10, "portraitTransitionTable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transitionsForColorGrade:songPace:", v11, a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v23, v12, &unk_1E53EF138);
    portraitTransitionTable = v14->_portraitTransitionTable;
    v14->_portraitTransitionTable = (PFStoryAutoEditFrequencyTable *)v24;

    objc_msgSend(v10, "nUpTransitionTable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "transitionsForColorGrade:songPace:", v11, a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v27, v12, &unk_1E53EF150);
    nUpTransitionTable = v14->_nUpTransitionTable;
    v14->_nUpTransitionTable = (PFStoryAutoEditFrequencyTable *)v28;

    objc_msgSend(v10, "interModuleTransitionTable");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "transitionsForColorGrade:songPace:", v11, a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v31, v12, &unk_1E53EF138);
    interModuleTransitionTable = v14->_interModuleTransitionTable;
    v14->_interModuleTransitionTable = (PFStoryAutoEditFrequencyTable *)v32;

    objc_storeStrong((id *)&v14->_randomNumberGenerator, a6);
  }

  return v14;
}

- (BOOL)_cameraMovement:(int64_t)a3 allowsTransition:(int64_t)a4
{
  BOOL v4;

  v4 = a4 != 5 || a3 == 1;
  if (a4 == 6)
    v4 = a3 == 2;
  if (a4 == 7)
    return a3 == 3;
  else
    return v4;
}

- ($CB94F14F4A03AD88347CF1141E14C943)_nextTransitionFromTable:(SEL)a3 currentMotion:(id)a4 nextMotion:(id *)a5
{
  int64_t var0;
  void *v11;
  int64_t v12;
  __int16 v13;
  $5767588AEF0F8E3E6A6260ECEE6A0599 var1;
  NSObject *v15;
  $CB94F14F4A03AD88347CF1141E14C943 *result;
  uint8_t v17[16];
  _QWORD v18[6];

  var0 = a5->var0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__PXStoryRecipeClipTransitionProvider__nextTransitionFromTable_currentMotion_nextMotion___block_invoke;
  v18[3] = &unk_1E513B230;
  v18[4] = self;
  v18[5] = var0;
  objc_msgSend(a4, "nextValuePassingTest:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  if (v12 == 8)
  {
    if (a6->var0 == 1 || (a6 = a5, a5->var0 == 1))
    {
      v13 = 512;
      switch(a6->var1.var0.var0)
      {
        case 0uLL:
          goto LABEL_11;
        case 1uLL:
        case 4uLL:
          v13 = 256;
          break;
        case 2uLL:
        case 3uLL:
          break;
        default:
          PXAssertGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Unknown transition direction", v17, 2u);
          }

          v13 = 0;
          break;
      }
    }
    else
    {
LABEL_11:
      if (-[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2))
      {
        v13 = 256;
      }
      else
      {
        v13 = 512;
      }
    }
    retstr->var0 = 8;
    retstr->var1 = 0.0;
    retstr->var2.var0.var0 = 0;
    retstr->var2.var0.var1 = 0;
    LOWORD(retstr->var2.var0.var0) = v13;
  }
  else
  {
    var1 = a5->var1;
    retstr->var0 = v12;
    retstr->var1 = 0.0;
    retstr->var2.var0.var0 = 0;
    retstr->var2.var0.var1 = 0;
    if (v12 == 7 || v12 == 6)
    {
      retstr->var2.var0.var0 = var1.var0.var0;
    }
    else if (v12 == 5)
    {
      retstr->var2 = ($68806D11CD65D8BE2A2DEF98801EDCF4)var1;
    }
  }

  return result;
}

- ($CB94F14F4A03AD88347CF1141E14C943)nextIntraMomentTransition
{
  PFStoryAutoEditFrequencyTable *baseTransitionTable;
  _QWORD v5[3];
  _QWORD v6[3];

  baseTransitionTable = self->_baseTransitionTable;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2 = 0u;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  return -[PXStoryRecipeClipTransitionProvider _nextTransitionFromTable:currentMotion:nextMotion:](self, "_nextTransitionFromTable:currentMotion:nextMotion:", baseTransitionTable, v6, v5);
}

- (void)provideTransitionsForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  NSUInteger v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  int v23;
  char v24;
  __int16 v25;
  __int16 v26;
  int v27;
  void *v28;
  PFStoryAutoEditFrequencyTable *v29;
  _BOOL4 v30;
  PFStoryAutoEditFrequencyTable **p_nUpTransitionTable;
  uint64_t v32;
  PFStoryAutoEditFrequencyTable *v33;
  void *v34;
  void *v35;
  void (*v36)(_QWORD *, __int128 *, NSUInteger);
  void *v37;
  NSUInteger v38;
  _QWORD *v39;
  unint64_t v41;
  void *v42;
  _BOOL4 v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v55 = 0u;
  v56 = 0u;
  v9 = length - 1;
  v38 = length - 1 + location;
  v39 = a5;
  if (!__CFADD__(length - 1, location))
  {
    v10 = 0;
    v37 = v8;
    do
    {
      v11 = location + 1;
      v12 = objc_msgSend(v8, "numberOfClips");
      objc_msgSend(v8, "clipAtIndex:", location);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (location + 1 >= v12)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v8, "clipAtIndex:", location + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "displayAssets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      v41 = v16;
      v42 = v14;
      if (v11 >= v12)
      {
        v18 = objc_msgSend(v13, "moduleInfo");
        objc_msgSend(v13, "moduleInfo");
        v21 = v24;
        v19 = 0;
        v23 = 0;
        v43 = 1;
      }
      else
      {
        objc_msgSend(v14, "displayAssets");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (unint64_t)objc_msgSend(v17, "count") < 2;

        v18 = objc_msgSend(v13, "moduleInfo");
        v19 = objc_msgSend(v14, "moduleInfo");
        objc_msgSend(v13, "moduleInfo");
        v21 = v20;
        objc_msgSend(v14, "moduleInfo");
        v23 = v22 & 1;
      }
      objc_msgSend(v13, "moduleInfo");
      v26 = v25;
      if (v18 == v19)
        v27 = v23;
      else
        v27 = 1;
      v44 = v27;
      v53 = 0u;
      v54 = 0u;
      if ((v21 & 1) != 0 || v23 || !v18 || v18 != v19)
      {
        v29 = self->_baseTransitionTable;
        v30 = v41 < 2 && v43;
        p_nUpTransitionTable = &self->_nUpTransitionTable;
        if (!v30)
          goto LABEL_27;
        v32 = 24;
        if (!v9)
          v32 = 16;
        p_nUpTransitionTable = (Class *)((char *)&self->super.isa + v32);
        if (!v9
          || (v21 & 1) != 0
          || (p_nUpTransitionTable = &self->_interModuleTransitionTable, (v44 & (v10 ^ 1) & 1) != 0)
          || (p_nUpTransitionTable = &self->_interModuleTransitionTable, (v26 & 0x100) != 0))
        {
LABEL_27:
          v33 = *p_nUpTransitionTable;

          v29 = v33;
        }
        v8 = v37;
        v28 = v42;
        objc_msgSend(v37, "clipAtIndex:", location);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v45 = 0uLL;
        *(_QWORD *)&v46 = 0;
        if (v34)
          objc_msgSend(v34, "motionInfo");
        v51 = 0uLL;
        v52 = 0;
        if (v43)
        {
          v51 = 0uLL;
          v52 = 0;
        }
        else if (v42)
        {
          objc_msgSend(v42, "motionInfo");
        }
        v49 = v45;
        v50 = v46;
        v47 = v51;
        v48 = v52;
        -[PXStoryRecipeClipTransitionProvider _nextTransitionFromTable:currentMotion:nextMotion:](self, "_nextTransitionFromTable:currentMotion:nextMotion:", v29, &v49, &v47);

      }
      else
      {
        v53 = v55;
        v54 = v56;
        v8 = v37;
        v28 = v42;
      }
      v36 = (void (*)(_QWORD *, __int128 *, NSUInteger))v39[2];
      v45 = v53;
      v46 = v54;
      v36(v39, &v45, location);
      v55 = v53;
      v56 = v54;

      --v9;
      v10 = v44;
      ++location;
    }
    while (v11 <= v38);
  }

}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)songPace
{
  return self->_songPace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_interModuleTransitionTable, 0);
  objc_storeStrong((id *)&self->_nUpTransitionTable, 0);
  objc_storeStrong((id *)&self->_portraitTransitionTable, 0);
  objc_storeStrong((id *)&self->_interMomentTransitionTable, 0);
  objc_storeStrong((id *)&self->_baseTransitionTable, 0);
}

uint64_t __89__PXStoryRecipeClipTransitionProvider__nextTransitionFromTable_currentMotion_nextMotion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cameraMovement:allowsTransition:", *(_QWORD *)(a1 + 40), objc_msgSend(a2, "integerValue"));
}

@end
