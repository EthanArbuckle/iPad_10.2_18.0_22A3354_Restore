@implementation PXStoryMomentRecipeState

- (PXStoryMomentRecipeState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 43, CFSTR("%s is not available as initializer"), "-[PXStoryMomentRecipeState init]");

  abort();
}

- (PXStoryMomentRecipeState)initWithRandomNumberGenerator:(id)a3
{
  id v4;
  char *v5;
  PXStoryMomentRecipeState *v6;
  void *v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PFStoryAutoEditFrequencyTable *basicRecipeFrequencyTable;
  objc_super v21;
  _QWORD v22[10];

  v22[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryMomentRecipeState;
  v5 = -[PXStoryMomentRecipeState init](&v21, sel_init);
  v6 = (PXStoryMomentRecipeState *)v5;
  if (v5)
  {
    *((_QWORD *)v5 + 9) = 0;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaleRecipeRelativeFrequency");
    v9 = (uint64_t)(v8 * 10.0);
    objc_msgSend(v7, "panRecipeRelativeFrequency");
    v11 = (uint64_t)(v10 * 10.0);
    objc_msgSend(v7, "exposeToBlackRecipeRelativeFrequency");
    v13 = (uint64_t)(v12 * 10.0);
    v22[0] = &unk_1E53EB9D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    v22[2] = &unk_1E53EB9D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v16;
    v22[5] = &unk_1E53EB9D0;
    v22[6] = &unk_1E53EB9D0;
    v22[7] = &unk_1E53EB9D0;
    v22[8] = &unk_1E53EB9D0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752A8]), "initWithValueCounts:randomNumberGenerator:fallbackValue:", v17, v4, &unk_1E53EB9E8);
    basicRecipeFrequencyTable = v6->_basicRecipeFrequencyTable;
    v6->_basicRecipeFrequencyTable = (PFStoryAutoEditFrequencyTable *)v18;

  }
  return v6;
}

- (unint64_t)nextPanDirection
{
  unint64_t v2;

  v2 = 1;
  if (self->_previousPanDirection != 2)
    v2 = 2;
  self->_previousPanDirection = v2;
  return v2;
}

- (unint64_t)next2UpPanRelativeMotion
{
  unint64_t v2;

  v2 = 1;
  if (self->_previous2UpPanRelativeMotion != 2)
    v2 = 2;
  self->_previous2UpPanRelativeMotion = v2;
  return v2;
}

- (unint64_t)next3UpPanRelativeMotion
{
  unint64_t v2;

  v2 = 1;
  if (self->_previous3UpPanRelativeMotion != 2)
    v2 = 2;
  self->_previous3UpPanRelativeMotion = v2;
  return v2;
}

- (unint64_t)nextNUpPanRelativeMotionWithN:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == 3)
    return -[PXStoryMomentRecipeState next3UpPanRelativeMotion](self, "next3UpPanRelativeMotion");
  if (a3 != 2)
  {
    v13 = v4;
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 104, CFSTR("N should be 2 or 3"));

    abort();
  }
  return -[PXStoryMomentRecipeState next2UpPanRelativeMotion](self, "next2UpPanRelativeMotion");
}

- (unint64_t)nextScaleDirection
{
  unint64_t v2;

  v2 = 1;
  if (self->_previousScaleDirection != 2)
    v2 = 2;
  self->_previousScaleDirection = v2;
  return v2;
}

- (unint64_t)nextRotateDirection
{
  unint64_t v2;

  v2 = 1;
  if (self->_previousRotateDirection == 1)
    v2 = 2;
  self->_previousRotateDirection = v2;
  return v2;
}

- (unint64_t)nextBaseMomentRecipe
{
  PFStoryAutoEditFrequencyTable *basicRecipeFrequencyTable;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];

  basicRecipeFrequencyTable = self->_basicRecipeFrequencyTable;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PXStoryMomentRecipeState_nextBaseMomentRecipe__block_invoke;
  v7[3] = &unk_1E513F6B8;
  v7[4] = self;
  -[PFStoryAutoEditFrequencyTable nextValuePassingTest:](basicRecipeFrequencyTable, "nextValuePassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  self->_previousBaseMomentRecipe = v5;

  return v5;
}

- (unint64_t)_nextModuleRecipeWithModuleClipRange:(_NSRange)a3 clipCatalog:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  if (!length)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleClipRange.length != 0"));

  }
  objc_msgSend(v8, "clipAtIndex:", location);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "moduleInfo");
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 154, CFSTR("Unhandled module type"));

      abort();
    }
    v11 = 6;
  }
  else
  {
    if (self->_previousPortraitMomentRecipe == 2
      || !+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", location, length, v8, 0))
    {
      v11 = 6;
    }
    else
    {
      v11 = 2;
    }
    self->_previousPortraitMomentRecipe = v11;
  }

  return v11;
}

- (unint64_t)nextSingleAssetMomentRecipe
{
  unint64_t v2;

  v2 = 7;
  if (self->_previousSingleAssetMomentRecipe == 7)
    v2 = 8;
  self->_previousSingleAssetMomentRecipe = v2;
  return v2;
}

- (int64_t)nextEmptySpaceStrategy
{
  int64_t v2;

  v2 = 1;
  if (self->_previousEmptySpaceStrategy == 1)
    v2 = 2;
  self->_previousEmptySpaceStrategy = v2;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicRecipeFrequencyTable, 0);
}

BOOL __48__PXStoryMomentRecipeState_nextBaseMomentRecipe__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

@end
