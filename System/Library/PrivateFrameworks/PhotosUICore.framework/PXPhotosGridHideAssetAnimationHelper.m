@implementation PXPhotosGridHideAssetAnimationHelper

+ (id)_createDecorationAnimationsForLayout:(id)a3 scope:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PXPhotosGridHideAssetAnimationHelper__createDecorationAnimationsForLayout_scope___block_invoke;
  v10[3] = &unk_1E5126B58;
  v12 = a4;
  v8 = v7;
  v11 = v8;
  _CreateAnimationOnDecoratingLayouts(v6, v10);

  return v8;
}

+ (id)createDecorationAnimationsForLayout:(id)a3 animationType:(int64_t)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotosGridHideAssetAnimationHelper.m"), 55, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "_createDecorationAnimationsForLayout:scope:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __83__PXPhotosGridHideAssetAnimationHelper__createDecorationAnimationsForLayout_scope___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "createAnimation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurve:", 0);
  objc_msgSend(v3, "setDuration:", 0.3);
  objc_msgSend(v3, "setScope:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
