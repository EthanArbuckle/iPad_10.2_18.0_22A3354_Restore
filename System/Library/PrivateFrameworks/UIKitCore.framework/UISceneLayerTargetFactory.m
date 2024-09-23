@implementation UISceneLayerTargetFactory

+ (id)targetForUIWindow:(id)a3
{
  id v5;
  _UISceneLayerTargetWithContext *v6;
  id v7;
  _UISceneLayerTargetWithContext *v8;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UISceneLayerTarget.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

  }
  v6 = [_UISceneLayerTargetWithContext alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__UISceneLayerTargetFactory_targetForUIWindow___block_invoke;
  v11[3] = &unk_1E16C7FE0;
  v12 = v5;
  v7 = v5;
  v8 = -[_UISceneLayerTargetWithContext initWithContext:equalityType:matchingBlock:](v6, "initWithContext:equalityType:matchingBlock:", v7, 0, v11);

  return v8;
}

+ (id)targetForContextID:(unsigned int)a3
{
  uint64_t v3;
  _UISceneLayerTargetWithContext *v4;
  void *v5;
  _UISceneLayerTargetWithContext *v6;
  void *v10;
  _QWORD v11[4];
  int v12;

  v3 = *(_QWORD *)&a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UISceneLayerTarget.m"), 18, CFSTR("ContextID cannot be 0."));

  }
  v4 = [_UISceneLayerTargetWithContext alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__UISceneLayerTargetFactory_targetForContextID___block_invoke;
  v11[3] = &__block_descriptor_36_e25_B24__0_8__FBSceneLayer_16l;
  v12 = v3;
  v6 = -[_UISceneLayerTargetWithContext initWithContext:equalityType:matchingBlock:](v4, "initWithContext:equalityType:matchingBlock:", v5, 1, v11);

  return v6;
}

BOOL __48__UISceneLayerTargetFactory_targetForContextID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v3;

  v3 = *(_DWORD *)(a1 + 32);
  return v3 == objc_msgSend(a3, "contextID");
}

BOOL __47__UISceneLayerTargetFactory_targetForUIWindow___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  _BOOL8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "_contextId") || objc_msgSend(v4, "contextID")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "_contextId");
    v6 = v5 == objc_msgSend(v4, "contextID");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
