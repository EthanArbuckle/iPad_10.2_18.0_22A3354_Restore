@implementation PVMotionEffectTextComponent

- (void)dealloc
{
  void **textObjectIDs;
  void *v4;
  objc_super v5;

  textObjectIDs = (void **)self->_textObjectIDs;
  if (textObjectIDs)
  {
    v4 = *textObjectIDs;
    if (*textObjectIDs)
    {
      textObjectIDs[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1B5E29170](textObjectIDs, 0x10C402FEFCB83);
    self->_textObjectIDs = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffectTextComponent;
  -[PVMotionEffectTextComponent dealloc](&v5, sel_dealloc);
}

- (PVMotionEffectTextComponent)initWithMotionEffect:(id)a3
{
  PVMotionEffectTextComponent *v3;
  PVMotionEffectTextComponent *v4;
  NSArray *defaultAttributedStrings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffectTextComponent;
  v3 = -[PVMotionEffectComponent initWithMotionEffect:](&v7, sel_initWithMotionEffect_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_textObjectIDs = 0;
    defaultAttributedStrings = v3->_defaultAttributedStrings;
    v3->_defaultAttributedStrings = 0;

  }
  return v4;
}

- (void)storeDefaultStrings:(const void *)a3
{
  void *v5;
  void *v6;
  unsigned int **v7;
  NSArray *v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  NSMutableAttributedString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *defaultAttributedStrings;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsReady");

  if (!self->_defaultAttributedStrings)
  {
    v7 = -[PVMotionEffectTextComponent _textObjectIDs_NoLock:](self, "_textObjectIDs_NoLock:", a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7[1] - *v7);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = *v7;
    v9 = v7[1];
    if (*v7 != v9)
    {
      do
      {
        v11 = *v10;
        v12 = (NSMutableAttributedString *)objc_opt_new();
        if (OZXGetTextAttributedString(*(void **)a3, v11, v12))
        {
          -[PVMotionEffectComponent motionEffect](self, "motionEffect");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PVMotionEffectComponent motionEffect](self, "motionEffect");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "debugDisplayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("WARNING: could not get text attributes (%p, %@)"), v13, v15);

        }
        else
        {
          -[NSArray addObject:](v8, "addObject:", v12);
        }

        ++v10;
      }
      while (v10 != v9);
    }
    defaultAttributedStrings = self->_defaultAttributedStrings;
    self->_defaultAttributedStrings = v8;

  }
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke;
  v8[3] = &unk_1E64D4CC0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke_2;
  v3[3] = &unk_1E64D4C98;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "runWithInspectableProperties:", v3);

}

void __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "attributedStringAtIndex_NoLock:properties:", *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)attributedStringAtIndex_NoLock:(unint64_t)a3 properties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentStatusIsReady");

  -[PVMotionEffectTextComponent defaultAttributedStringAtIndex_NoLock:](self, "defaultAttributedStringAtIndex_NoLock:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 <= 1)
  {
    v11 = kPVTitleEffect_MainTitleStringKey;
    if (a3)
      v11 = kPVTitleEffect_SubTitleStringKey;
    objc_msgSend(v6, "objectForKeyedSubscript:", *v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v10 = v9;
    if (v12)
    {
      v14 = objc_msgSend(v12, "length");
      if (v14 >= objc_msgSend(v9, "length"))
        v15 = objc_msgSend(v9, "length");
      else
        v15 = objc_msgSend(v13, "length");
      objc_msgSend(v9, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v16);

    }
  }

  return v10;
}

- (id)defaultAttributedString:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PVMotionEffectTextComponent_defaultAttributedString___block_invoke;
  v8[3] = &unk_1E64D4CE8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__PVMotionEffectTextComponent_defaultAttributedString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultAttributedStringAtIndex_NoLock:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)resetDefaultStrings:(const void *)a3
{
  void *v4;
  void *v5;
  NSArray *defaultAttributedStrings;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentStatusIsReady");

  defaultAttributedStrings = self->_defaultAttributedStrings;
  self->_defaultAttributedStrings = 0;

}

- (id)defaultAttributedStringAtIndex_NoLock:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsReady");

  if (-[NSArray count](self->_defaultAttributedStrings, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_defaultAttributedStrings, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setString:(id)a3 atIndex:(unint64_t)a4
{
  __CFString **v6;
  __CFString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 >= 2)
    NSLog(CFSTR("Error: Only MainTitle and SubTitle are supported now"));
  if (a4)
  {
    if (a4 != 1)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = kPVTitleEffect_SubTitleStringKey;
  }
  else
  {
    v6 = kPVTitleEffect_MainTitleStringKey;
  }
  v7 = *v6;
LABEL_9:
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setString:forKey:", v9, v7);

}

- (void)setAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v5;

  objc_msgSend(a3, "string");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PVMotionEffectTextComponent setString:atIndex:](self, "setString:atIndex:");

}

- (id)mainTitle
{
  void *v2;
  void *v3;

  -[PVMotionEffectTextComponent attributedStringAtIndex:](self, "attributedStringAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMainTitle:(id)a3
{
  -[PVMotionEffectTextComponent setString:atIndex:](self, "setString:atIndex:", a3, 0);
}

- (id)subtitle
{
  void *v2;
  void *v3;

  -[PVMotionEffectTextComponent attributedStringAtIndex:](self, "attributedStringAtIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSubtitle:(id)a3
{
  -[PVMotionEffectTextComponent setString:atIndex:](self, "setString:atIndex:", a3, 1);
}

- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  void *v13;
  id v14;
  _QWORD v16[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __122__PVMotionEffectTextComponent_textEditingBoundsAtTime_forcePosterFrame_useParagraphBounds_includeDropShadow_includeMasks___block_invoke;
  v16[3] = &unk_1E64D4D10;
  v18 = a4;
  v17 = *a3;
  v19 = a6;
  v20 = a7;
  v21 = a5;
  v16[4] = self;
  v16[5] = &v22;
  objc_msgSend(v13, "runEnsuringDocumentReadyAndLockingDocument:", v16);

  v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __122__PVMotionEffectTextComponent_textEditingBoundsAtTime_forcePosterFrame_useParagraphBounds_includeDropShadow_includeMasks___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  char v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (*(_BYTE *)(a1 + 72))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timelineComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isForceRenderAtPosterFrameEnabled");

  }
  v31 = 0;
  v32 = 0;
  v33 = 0;
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timelineComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v29 = *(_OWORD *)(a1 + 48);
  v30 = *(_QWORD *)(a1 + 64);
  if (v8)
  {
    objc_msgSend(v8, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v29, v4, a2);
  }
  else
  {
    v31 = 0;
    v32 = 0;
    v33 = 0;
  }

  v10 = objc_msgSend(*(id *)(a1 + 32), "_textObjectIDs_NoLock:", a2);
  v11 = *(unsigned int **)v10;
  v12 = *(unsigned int **)(v10 + 8);
  if (*(unsigned int **)v10 != v12)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    v25 = _Q0;
    do
    {
      v18 = 2 * *(_BYTE *)(a1 + 73);
      if (*(_BYTE *)(a1 + 74))
        v18 |= 4u;
      v19 = v18 | *(_BYTE *)(a1 + 75);
      v26 = 0.0;
      v27 = 0.0;
      v28 = v25;
      OZXGetObjectBounds(*a2, (uint64_t)&v31, *v11, v19, (uint64_t)&v26);
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v20)
      {
        v21 = objc_opt_new();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v26, v27, v28, v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v24);

      ++v11;
    }
    while (v11 != v12);
  }
}

- (id)textEditingBounds:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PVMotionEffectTextComponent textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:](self, "textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:", &v4, 0, 1, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](self, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v7, a4, 1, *(_QWORD *)&a6, a5.width, a5.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a3;
  -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](self, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v8, a4, a5, 1, *(_QWORD *)&a7, a6.width, a6.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  CGFloat height;
  CGFloat width;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[10];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26;
  int v27;
  int v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  height = a7.height;
  width = a7.width;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "outputSize");
  v18 = v17;
  v20 = v19;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v21, "origin");

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __142__PVMotionEffectTextComponent_textTransformsAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke;
  v25[3] = &unk_1E64D4D60;
  v29 = a4;
  v26 = *a3;
  v25[4] = self;
  v25[5] = &v32;
  v30 = a5;
  v31 = a6;
  v25[6] = v18;
  v25[7] = v20;
  v27 = (int)v16;
  v28 = a8;
  *(CGFloat *)&v25[8] = width;
  *(CGFloat *)&v25[9] = height;
  objc_msgSend(v22, "runEnsuringDocumentReadyAndLockingDocument:", v25);

  v23 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __142__PVMotionEffectTextComponent_textTransformsAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  if (*(_BYTE *)(a1 + 112))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timelineComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isForceRenderAtPosterFrameEnabled");

  }
  v27 = 0uLL;
  v28 = 0;
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timelineComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v25 = *(_OWORD *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 96);
  if (v8)
  {
    objc_msgSend(v8, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v25, v4, a2);
  }
  else
  {
    v27 = 0uLL;
    v28 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = 3221225472;
  v11 = *(_OWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 32);
  v18 = v27;
  v20 = *(_OWORD *)(a1 + 80);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = &__142__PVMotionEffectTextComponent_textTransformsAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2;
  v13[3] = &unk_1E64D4D38;
  v15 = a2;
  v19 = v28;
  v21 = *(_QWORD *)(a1 + 96);
  v23 = *(_BYTE *)(a1 + 113);
  v24 = *(_BYTE *)(a1 + 114);
  v22 = *(_QWORD *)(a1 + 104);
  v12 = *(_OWORD *)(a1 + 64);
  v16 = v11;
  v17 = v12;
  objc_msgSend(v10, "runWithInspectableProperties:", v13);

}

- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v15;
  _BOOL8 v16;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  CGPoint v30;
  CGPoint v31;
  uint64_t *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  CGPoint *v37;
  CGPoint v38;
  CGPoint v39;
  PVCGPointQuad *result;
  _QWORD v41[11];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v42;
  int v43;
  int v44;
  BOOL v45;
  PVCGPointQuad v46;
  _OWORD v47[4];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  __n128 (*v51)(uint64_t, uint64_t);
  uint64_t (*v52)();
  void *v53;
  _OWORD v54[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v55;
  CGRect v56;

  height = a9.height;
  width = a9.width;
  y = a8.y;
  x = a8.x;
  v15 = a7;
  v16 = a6;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "outputSize");
  v23 = v22;
  v25 = v24;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "origin");

  v55 = *a4;
  -[PVMotionEffectTextComponent textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:](self, "textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:", &v55, v16, 1, v15, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x7012000000;
  v51 = __Block_byref_object_copy__59;
  v52 = __Block_byref_object_dispose__60;
  v53 = &unk_1B3948866;
  memset(v54, 0, sizeof(v54));
  objc_msgSend(v29, "CGRectValue");
  PVCGPointQuad_from_CGRect(v56, v54);
  v30 = (CGPoint)*((_OWORD *)v49 + 4);
  v46.a = (CGPoint)*((_OWORD *)v49 + 3);
  v46.b = v30;
  v31 = (CGPoint)*((_OWORD *)v49 + 6);
  v46.c = (CGPoint)*((_OWORD *)v49 + 5);
  v46.d = v31;
  v31.x = x;
  v30.x = y;
  PVCGPointQuad_scale(&v46, *(CGPoint *)((char *)&v30 - 8), v47);
  v32 = v49;
  v33 = v47[1];
  v35 = v47[2];
  v34 = v47[3];
  *((_OWORD *)v49 + 3) = v47[0];
  *((_OWORD *)v32 + 4) = v33;
  *((_OWORD *)v32 + 5) = v35;
  *((_OWORD *)v32 + 6) = v34;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke;
  v41[3] = &unk_1E64D4DB0;
  v45 = v16;
  v42 = *a4;
  v41[4] = self;
  v41[5] = &v48;
  v41[6] = a5;
  v41[7] = v23;
  v41[8] = v25;
  *(CGFloat *)&v41[9] = width;
  *(CGFloat *)&v41[10] = height;
  v43 = v27;
  v44 = a10;
  objc_msgSend(v36, "runEnsuringDocumentReadyAndLockingDocument:", v41);

  v37 = (CGPoint *)v49;
  v38 = (CGPoint)*((_OWORD *)v49 + 4);
  retstr->a = (CGPoint)*((_OWORD *)v49 + 3);
  retstr->b = v38;
  v39 = v37[6];
  retstr->c = v37[5];
  retstr->d = v39;
  _Block_object_dispose(&v48, 8);

  return result;
}

double __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __n128 *v14;
  __n128 v15;
  __n128 v16;
  _OWORD *v17;
  double result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __n128 v22[4];
  _OWORD v23[4];
  _QWORD v24[4];
  __int128 v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;

  v4 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_textObjectIDs_NoLock:", a2);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 >= (uint64_t)(v4[1] - *v4) >> 2)
    std::vector<unsigned int>::__throw_out_of_range[abi:ne180100]();
  v6 = *(_DWORD *)(*v4 + 4 * v5);
  if (*(_BYTE *)(a1 + 120))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "motionEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timelineComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isForceRenderAtPosterFrameEnabled");

  }
  v34 = 0uLL;
  v35 = 0;
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timelineComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v32 = *(_OWORD *)(a1 + 88);
  v33 = *(_QWORD *)(a1 + 104);
  if (v11)
  {
    objc_msgSend(v11, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v32, v7, a2);
  }
  else
  {
    v34 = 0uLL;
    v35 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2;
  v24[3] = &unk_1E64D4D88;
  v25 = *(_OWORD *)(a1 + 32);
  v27 = v6;
  v28 = v34;
  v29 = v35;
  v30 = *(_OWORD *)(a1 + 88);
  v31 = *(_QWORD *)(a1 + 104);
  v26 = a2;
  objc_msgSend(v13, "runWithInspectableProperties:", v24);

  v14 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v15 = v14[4];
  v22[0] = v14[3];
  v22[1] = v15;
  v16 = v14[6];
  v22[2] = v14[5];
  v22[3] = v16;
  pv_transform_PVCGPointQuad_between_coordinate_systems(v22, *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), v23, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v17 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)v23;
  v19 = v23[1];
  v21 = v23[2];
  v20 = v23[3];
  v17[3] = v23[0];
  v17[4] = v19;
  v17[5] = v21;
  v17[6] = v20;
  return result;
}

void __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v8 = v7[4];
  v18[0] = v7[3];
  v18[1] = v8;
  v9 = v7[6];
  v18[2] = v7[5];
  v18[3] = v9;
  v10 = *(unsigned int *)(a1 + 56);
  v16 = *(_OWORD *)(a1 + 60);
  v17 = *(_QWORD *)(a1 + 76);
  v15 = *(_QWORD *)(a1 + 100);
  v14 = *(_OWORD *)(a1 + 84);
  if (v5)
  {
    objc_msgSend(v5, "transformObjectCornersToImage_NoLock:objectID:timelineTime:componentTime:flatten:documentInfo:properties:", v18, v10, &v16, &v14, 0, *(_QWORD *)(a1 + 48), v3);
    v7 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
  }
  v11 = v20;
  v13 = v21;
  v12 = v22;
  v7[3] = v19;
  v7[4] = v11;
  v7[5] = v13;
  v7[6] = v12;

}

- (unint64_t)textObjectsCount_NoLock:(const void *)a3
{
  _QWORD *v3;

  v3 = -[PVMotionEffectTextComponent _textObjectIDs_NoLock:](self, "_textObjectIDs_NoLock:", a3);
  return (uint64_t)(v3[1] - *v3) >> 2;
}

- (id)textObjectIDs_NoLock:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = -[PVMotionEffectTextComponent _textObjectIDs_NoLock:](self, "_textObjectIDs_NoLock:", a3);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(v4[1] - *v4) >> 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4[1] - *v4;
    if (v6)
    {
      v7 = 0;
      v8 = v6 >> 2;
      if (v8 <= 1)
        v9 = 1;
      else
        v9 = v8;
      do
      {
        if (v7 >= (uint64_t)(v4[1] - *v4) >> 2)
          std::vector<unsigned int>::__throw_out_of_range[abi:ne180100]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*v4 + 4 * v7));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v7;
      }
      while (v9 != v7);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (void)_textObjectIDs_NoLock:(const void *)a3
{
  void *v4;
  void *v5;
  void *result;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  _QWORD *textObjectIDs;
  _DWORD *v22;
  unint64_t v23;
  _DWORD *v24;
  _DWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  int v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentStatusIsLoadedOrReady");

  result = self->_textObjectIDs;
  if (!result)
  {
    v7 = (_QWORD *)operator new();
    v7[1] = 0;
    v7[2] = 0;
    *v7 = 0;
    self->_textObjectIDs = v7;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "publishedParams_NoLock:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PVEffectParam_TypeKey"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(CFSTR("effect.param.attributedstring"), "isEqualToString:", v15);

          if (v16)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PVEffectParam_ObjectIDKey"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              v19 = objc_msgSend(v17, "unsignedIntValue");
              v20 = v19;
              textObjectIDs = self->_textObjectIDs;
              v22 = (_DWORD *)textObjectIDs[1];
              v23 = textObjectIDs[2];
              if ((unint64_t)v22 >= v23)
              {
                v25 = (_DWORD *)*textObjectIDs;
                v26 = ((uint64_t)v22 - *textObjectIDs) >> 2;
                v27 = v26 + 1;
                if ((unint64_t)(v26 + 1) >> 62)
                  std::vector<double>::__throw_length_error[abi:ne180100]();
                v28 = v23 - (_QWORD)v25;
                if (v28 >> 1 > v27)
                  v27 = v28 >> 1;
                if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
                  v29 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v29 = v27;
                if (v29)
                {
                  v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(textObjectIDs + 2), v29);
                  v25 = (_DWORD *)*textObjectIDs;
                  v22 = (_DWORD *)textObjectIDs[1];
                }
                else
                {
                  v30 = 0;
                }
                v31 = &v30[4 * v26];
                *(_DWORD *)v31 = v20;
                v24 = v31 + 4;
                while (v22 != v25)
                {
                  v32 = *--v22;
                  *((_DWORD *)v31 - 1) = v32;
                  v31 -= 4;
                }
                *textObjectIDs = v31;
                textObjectIDs[1] = v24;
                textObjectIDs[2] = &v30[4 * v29];
                if (v25)
                  operator delete(v25);
              }
              else
              {
                *v22 = v19;
                v24 = v22 + 1;
              }
              textObjectIDs[1] = v24;
            }

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v11);
    }

    return self->_textObjectIDs;
  }
  return result;
}

- (void)beginTextEditing
{
  -[PVMotionEffectTextComponent beginEditingTextAtIndex:](self, "beginEditingTextAtIndex:", 0);
}

- (void)beginEditingTextAtIndex:(unsigned int)a3
{
  void *v5;
  _QWORD v6[5];
  unsigned int v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PVMotionEffectTextComponent_beginEditingTextAtIndex___block_invoke;
  v6[3] = &unk_1E64D4DD8;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

}

void __55__PVMotionEffectTextComponent_beginEditingTextAtIndex___block_invoke(uint64_t a1, void **a2)
{
  PCString v3;

  objc_msgSend(*(id *)(a1 + 32), "disableRenderingTextObjectAtIndex_NoLock:documentInfo:", *(unsigned int *)(a1 + 40), a2);
  v3.var0 = 0;
  PCString::set(&v3, CFSTR("IsEditingText"));
  OZXSetPublishedCheckBox(*a2, &v3, 1);
  PCString::~PCString(&v3);
}

- (void)endTextEditing
{
  -[PVMotionEffectTextComponent endEditingTextAtIndex:](self, "endEditingTextAtIndex:", 0);
}

- (void)endEditingTextAtIndex:(unsigned int)a3
{
  void *v5;
  _QWORD v6[5];
  unsigned int v7;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PVMotionEffectTextComponent_endEditingTextAtIndex___block_invoke;
  v6[3] = &unk_1E64D4DD8;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

}

void __53__PVMotionEffectTextComponent_endEditingTextAtIndex___block_invoke(uint64_t a1, void **a2)
{
  PCString v4;

  objc_msgSend(*(id *)(a1 + 32), "enableRenderingTextObjectAtIndex_NoLock:documentInfo:", *(unsigned int *)(a1 + 40), a2);
  v4.var0 = 0;
  PCString::set(&v4, CFSTR("IsEditingText"));
  OZXSetPublishedCheckBox(*a2, &v4, 0);
  objc_msgSend(*(id *)(a1 + 32), "resetDefaultStrings:", a2);
  objc_msgSend(*(id *)(a1 + 32), "storeDefaultStrings:", a2);
  PCString::~PCString(&v4);
}

- (void)enableRenderingTextObjectAtIndex_NoLock:(unsigned int)a3 documentInfo:(const void *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentStatusIsLoadedOrReady");

  v7 = -[PVMotionEffectTextComponent _textObjectIDs_NoLock:](self, "_textObjectIDs_NoLock:", a4);
  v8 = v7;
  if (a3 < (unint64_t)((uint64_t)(v7[1] - *v7) >> 2))
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v7 + 4 * a3), 0);
  if (-[PVMotionEffectTextComponent hasEmojiRenderingWorkaround](self, "hasEmojiRenderingWorkaround")
    && v8[1] - *v8 == 8)
  {
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v8 + 4), 0);
  }
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInspectableProperty:forKey:", 0, CFSTR("kPVTextRenderingDisabled"));

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kPVTextRenderingDisabled"));

}

- (void)disableRenderingTextObjectAtIndex_NoLock:(unsigned int)a3 documentInfo:(const void *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentStatusIsLoadedOrReady");

  v7 = -[PVMotionEffectTextComponent _textObjectIDs_NoLock:](self, "_textObjectIDs_NoLock:", a4);
  v8 = v7;
  if (a3 < (unint64_t)((uint64_t)(v7[1] - *v7) >> 2))
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v7 + 4 * a3), 1);
  if (-[PVMotionEffectTextComponent hasEmojiRenderingWorkaround](self, "hasEmojiRenderingWorkaround")
    && v8[1] - *v8 == 8)
  {
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v8 + 4), 1);
  }
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInspectableProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kPVTextRenderingDisabled"));

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kPVTextRenderingDisabled"));

}

- (void)setupTitleParameters:(id)a3 allProperties:(id)a4 documentInfo:(const void *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  BOOL v18;
  __CFString *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  unsigned int v41;
  __CFString *v42;
  void *v43;
  BOOL v44;
  NSString *v45;
  __CFString *v46;
  void *v47;
  BOOL v48;
  NSString *v49;
  __CFString *v50;
  void *v51;
  BOOL v52;
  NSString *v53;
  __CFString *v54;
  void *v55;
  BOOL v56;
  void *v57;
  float v58;
  float v59;
  __CFString *v60;
  void *v61;
  BOOL v62;
  void *v63;
  float v64;
  float v65;
  __CFString *v66;
  void *v67;
  BOOL v68;
  void *v69;
  float v70;
  float v71;
  __CFString *v72;
  void *v73;
  BOOL v74;
  void *v75;
  float v76;
  float v77;
  __CFString *v78;
  void *v79;
  BOOL v80;
  void *v81;
  float v82;
  float v83;
  __CFString *v84;
  void *v85;
  BOOL v86;
  void *v87;
  float v88;
  float v89;
  __CFString *v90;
  void *v91;
  BOOL v92;
  __CFString *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  BOOL v98;
  __CFString *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  BOOL v103;
  NSString *v104;
  __CFString *v105;
  __CFString *v106;
  __CFString *v107;
  void *v108;
  BOOL v109;
  __CFString *v110;
  void *v111;
  BOOL v112;
  __CFString *v113;
  void *v114;
  void *v115;
  void *v116;
  BOOL v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  BOOL v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  BOOL v127;
  void *v128;
  void *v129;
  void *v130;
  BOOL v131;
  void *v132;
  void *v133;
  void *v134;
  BOOL v135;
  void *v136;
  uint64_t v137;
  id v138;
  double v139;
  PCString v140;
  PCString v141;
  PCString v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  const __CFString *v147;
  void *v148;
  _QWORD v149[3];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v138 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertDocumentStatusIsLoadedOrReady");

  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v149[0] = CFSTR("BackgroundColor");
  v149[1] = CFSTR("PrimaryColor");
  v149[2] = CFSTR("SecondaryColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v143, v150, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v144;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v144 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v142.var0 = 0;
          PCString::set(&v142, v19);

          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v140.var0 = 0;
          v141.var0 = 0;
          v139 = 0.0;
          objc_msgSend(v20, "getRed:green:blue:alpha:", &v141, &v140, &v139, 0);
          OZXSetPublishedRGBColor(*(void **)a5, &v142, *(double *)&v141.var0, *(double *)&v140.var0, v139);

          PCString::~PCString(&v142);
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v143, v150, 16);
    }
    while (v13);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleStyle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (!v22)
  {
    v142.var0 = 0;
    PCString::set(&v142, CFSTR("TitleStyle"));
    v23 = *(void **)a5;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleStyle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    OZXSetPublishedPopup(v23, &v142, objc_msgSend(v24, "intValue"));

    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVFlipTextKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVFlipTextKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kPVFlipTextKey"));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v29);

    OZXSetPublishedCheckBox(*(void **)a5, &v142, v28);
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVFlipTextKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "didSetCacheInvalidatingParameter_NoLock:forKey:", v31, CFSTR("kPVFlipTextKey"));

    if (v32)
    {
      +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "wantsSameAlignmentForAllLinesOfText");

      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("TitleString"), v8, v138);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          -[PVMotionEffectComponent motionEffect](self, "motionEffect");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = CFSTR("TitleString");
          v148 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setupPublishedParameters:", v37);

        }
      }
    }
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVOrientationKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (!v39)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVOrientationKey"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "intValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kPVOrientationKey"));
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v42);

    OZXSetPublishedPopup(*(void **)a5, &v142, v41);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MainTitleFontName"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == 0;

  if (!v44)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MainTitleFontName"));
    v45 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v46);

    OZXSetPublishedTextFont(*(void **)a5, &v142, v45);
    if (-[PVMotionEffectTextComponent hasEmojiRenderingWorkaround](self, "hasEmojiRenderingWorkaround"))
    {
      PCString::PCString(&v141, "MainTitleCopy");
      OZXSetPublishedTextFont(*(void **)a5, &v141, v45);
      PCString::~PCString(&v141);
    }
    PCString::~PCString(&v142);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubTitleFontName"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47 == 0;

  if (!v48)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubTitleFontName"));
    v49 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SubtitleString"));
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v50);

    OZXSetPublishedTextFont(*(void **)a5, &v142, v49);
    PCString::~PCString(&v142);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SecondaryTitleFontName"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 == 0;

  if (!v52)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SecondaryTitleFontName"));
    v53 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SecondaryString"));
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v54);

    OZXSetPublishedTextFont(*(void **)a5, &v142, v53);
    PCString::~PCString(&v142);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MainTitleFontScale"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 == 0;

  if (!v56)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MainTitleFontScale"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "floatValue");
    v59 = v58;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v60);

    OZXSetPublishedTextScale(*(void **)a5, &v142, v59);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubTitleFontScale"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61 == 0;

  if (!v62)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubTitleFontScale"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "floatValue");
    v65 = v64;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SubtitleString"));
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v66);

    OZXSetPublishedTextScale(*(void **)a5, &v142, v65);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SecondaryTitleFontScale"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67 == 0;

  if (!v68)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SecondaryTitleFontScale"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "floatValue");
    v71 = v70;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SecondaryString"));
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v72);

    OZXSetPublishedTextScale(*(void **)a5, &v142, v71);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MainTitleFontSize"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73 == 0;

  if (!v74)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MainTitleFontSize"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "floatValue");
    v77 = v76;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v78);

    OZXSetPublishedTextSize(*(void **)a5, &v142, v77);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubTitleFontSize"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79 == 0;

  if (!v80)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubTitleFontSize"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "floatValue");
    v83 = v82;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SubtitleString"));
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v84);

    OZXSetPublishedTextSize(*(void **)a5, &v142, v83);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SecondaryTitleFontSize"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85 == 0;

  if (!v86)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SecondaryTitleFontSize"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "floatValue");
    v89 = v88;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SecondaryString"));
    v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v90);

    OZXSetPublishedTextSize(*(void **)a5, &v142, v89);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVTextOneLineScaleThreshold_MainTitle"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91 == 0;

  if (!v92)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v93);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVTextOneLineScaleThreshold_MainTitle"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "doubleValue");
    v96 = v95;

    OZXSetTextOneLineScaleThreshold(*(void **)a5, &v142, v96);
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVEnableTextDynamicLineSpacing_MainTitle"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97 == 0;

  if (!v98)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v99);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVEnableTextDynamicLineSpacing_MainTitle"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "BOOLValue");

    OZXEnableTextDynamicLineSpacing(*(void **)a5, &v142, v101);
    if (-[PVMotionEffectTextComponent hasEmojiRenderingWorkaround](self, "hasEmojiRenderingWorkaround"))
    {
      PCString::PCString(&v141, "MainTitleCopy");
      OZXEnableTextDynamicLineSpacing(*(void **)a5, &v141, v101);
      PCString::~PCString(&v141);
    }
    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleLocale"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102 == 0;

  if (!v103)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleLocale"));
    v104 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v105);

    OZXSetPublishedTextLocale(*(void **)a5, &v142, v104);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SubtitleString"));
    v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v141.var0 = 0;
    PCString::set(&v141, v106);

    OZXSetPublishedTextLocale(*(void **)a5, &v141, v104);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SecondaryString"));
    v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v140.var0 = 0;
    PCString::set(&v140, v107);

    OZXSetPublishedTextLocale(*(void **)a5, &v140, v104);
    -[PVMotionEffectTextComponent setIsRightToLeft_NoLock:documentInfo:](self, "setIsRightToLeft_NoLock:documentInfo:", objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v104) == 2, a5);
    PCString::~PCString(&v140);
    PCString::~PCString(&v141);
    PCString::~PCString(&v142);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageSequencePathKey"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v108 == 0;

  if (!v109)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageSequencePathKey"));
    v110 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v142.var0 = 0;
    PCString::set(&v142, v110);
    OZXSetImageSequencePath(*(_QWORD *)a5, &v142);
    PCString::~PCString(&v142);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StickerPathKey"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111 == 0;

  if (!v112)
  {
    v142.var0 = 0;
    PCString::set(&v142, CFSTR("AnimatedLayerOpacity"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StickerPathKey"));
    v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v141.var0 = 0;
    PCString::set(&v141, v113);
    if (!OZXSetStickerPathWithPublishedParam(*(void **)a5, &v142, &v141))
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "timelineComponent");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "setNeedsToUpdateSceneDuration_NoLock");

    }
    PCString::~PCString(&v141);

    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DisableAnimatedLayer"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v116 == 0;

  if (!v117)
  {
    v142.var0 = 0;
    PCString::set(&v142, CFSTR("AnimatedLayerOpacity"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DisableAnimatedLayer"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v118, "BOOLValue");

    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "disableElementWithPublishedParam:disable:", &v142, v119);

    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DisablePosterLayer"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v121 == 0;

  if (!v122)
  {
    v142.var0 = 0;
    PCString::set(&v142, CFSTR("PosterImageOpacity"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DisablePosterLayer"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "BOOLValue");

    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "disableElementWithPublishedParam:disable:", &v142, v124);

    PCString::~PCString(&v142);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleString"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v126 == 0;

  if (!v127)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TitleString"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "didSetCacheInvalidatingParameter_NoLock:forKey:", v128, CFSTR("TitleString"));

    -[PVMotionEffectTextComponent setIsRightToLeft_NoLock:documentInfo:](self, "setIsRightToLeft_NoLock:documentInfo:", objc_msgSend(v128, "pv_isRightToLeft"), a5);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVTextRenderingDisabled"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v130 == 0;

  if (!v131)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPVTextRenderingDisabled"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "didSetCacheInvalidatingParameter_NoLock:forKey:", v133, CFSTR("kPVTextRenderingDisabled"));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UseMinimumLineSpacing"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v134 == 0;

  if (!v135)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UseMinimumLineSpacing"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v136, "BOOLValue");

    v142.var0 = 0;
    PCString::set(&v142, CFSTR("UseMinimumLineSpacing"));
    OZXSetPublishedCheckBox(*(void **)a5, &v142, v137);
    PCString::~PCString(&v142);
  }

}

- (BOOL)hasEmojiRenderingWorkaround
{
  NSNumber *hasEmojiRenderingWorkaround;
  void *v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;

  hasEmojiRenderingWorkaround = self->_hasEmojiRenderingWorkaround;
  if (!hasEmojiRenderingWorkaround)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentRegistryPropertyForKey:", CFSTR("requireEmojiRenderingWorkaround"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      v7 = self->_hasEmojiRenderingWorkaround;
      self->_hasEmojiRenderingWorkaround = v6;
    }
    else
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("4812B57C-ACB7-477C-BE5F-A8AB078788C6")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("A1B49D52-F66A-4864-B3DC-D516010655DF")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("279AFED2-5BC5-4038-B194-CCC10C505B14")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("459DF362-0E9D-49D1-BE0A-3ADE6FB7A8FD")) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("504EC51C-D61E-40D8-B622-DBDFD8F3B553"));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_hasEmojiRenderingWorkaround;
      self->_hasEmojiRenderingWorkaround = v10;

    }
    hasEmojiRenderingWorkaround = self->_hasEmojiRenderingWorkaround;
  }
  return -[NSNumber BOOLValue](hasEmojiRenderingWorkaround, "BOOLValue");
}

- (BOOL)supportsFlippingText
{
  void *v2;
  char v3;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsParam:", CFSTR("FlipText"));

  return v3;
}

- (BOOL)supportsOrientation
{
  void *v2;
  char v3;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsParam:", CFSTR("Orientation"));

  return v3;
}

- (BOOL)isTextFlipped
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke;
  v5[3] = &unk_1E64D4E28;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LOBYTE(v3) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

void __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishedParams_NoLock:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke_2;
  v6[3] = &unk_1E64D4E00;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PVEffectParam_NameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(CFSTR("FlipText"), "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PVEffectParam_ValueKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "BOOLValue");
    *a4 = 1;

  }
}

- (BOOL)isTitleCard
{
  NSNumber *isTitleCard;
  void *v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;

  isTitleCard = self->_isTitleCard;
  if (!isTitleCard)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentRegistryPropertyForKey:", CFSTR("effectType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isEqualToString:", CFSTR("TitleCard")));
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v7 = self->_isTitleCard;
      self->_isTitleCard = v6;
    }
    else
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("7246D03C-508A-4B71-AE0F-5526207AF4A4")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("271A5AB5-DC8D-4362-A0B3-0BD771DFDF81")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("B4508C18-9B92-45C4-AC68-23C4B473648C")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("99A5B4EB-6200-4785-9020-151A86F044F9")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("254E82A1-5A1E-4DE3-AF74-5AD853EF8FE1")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("DE85B884-F04F-4474-952C-50F14AACABB4")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("C2924EA0-DDAB-470F-B5A9-5E8A5BD58C3E")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("3DBFF351-E2F1-4E8F-88D1-8A412C3351A6")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("4812B57C-ACB7-477C-BE5F-A8AB078788C6")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1392D357-224C-4D93-A0CE-9DAAF74CF2B0")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("EA557219-697D-4079-8F57-FBC08826275F")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("A1B49D52-F66A-4864-B3DC-D516010655DF")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("E3E384F3-992E-4F31-BA6E-77DA8AFA9F7A")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("EAD64524-5447-4179-A9C5-6D4C43197DD1")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("709F905F-478C-4C74-8563-40BC1F1E4CA4")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("EBDD7776-9473-4AC0-A8DD-6D85EA813A47")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("4F246C30-ECDF-41B0-BC48-52B2FD46CDFE")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("9BC549DA-AF63-4462-B607-721FA91BC04B")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("7DACC129-7A01-4850-A0D6-384529E49E62")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("2D2CA707-0CA2-45FA-82F5-33BE55AA45E3")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1058897B-324A-491F-B712-36418CC48435")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("50B6BB27-38F9-48B7-AE5C-CFE23C1C2FC3")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("F00F45D2-4750-4E32-8086-EE791D0EBA02")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("49993B68-E73C-4BC7-B5E2-C98BC6DDFFD0")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("44D6408C-1870-4E24-BC39-A2A22138E84C")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1BE94FDB-1DA1-4CDD-B936-891D15D82AA2")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("9455BB82-099D-471A-8DB0-EC7716C4635D")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("3F8EFC0A-43D8-43F9-AECE-5B501705DCBC")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("ECE34BCE-E3CD-4AFB-B1A2-88D110B26355")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1A1FE60F-F11A-45E6-86F9-0FB7E019EA2F")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("EA8EEFBD-9927-4408-ADBF-9AAF5BC4C5DD")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("6D70E926-E76E-4D79-9BAB-0E9993A0CB00")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("F233206A-EACA-49EF-82E2-EC00B5BA47C7")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("3BD15E1F-1038-4574-8364-969806396CA7")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("B42641D8-196D-4C9F-952E-30572B1D39C7")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("B5CD8914-97CB-4C88-BAFE-E25495D956B9")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("AA515142-046C-4184-9FA2-02692A0621A5")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("3FAC5760-CD6E-4342-8892-75CBA062A1E7")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("DFE54E4F-314B-4BD0-9FB0-2D5CE51CB393")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("55DA00BC-CF8F-4502-B002-FF0DAA3706A8")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("E94F8545-F15D-49A1-82CC-E723C33E2DA9")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("26BA43BE-C91B-4788-A117-7825B65AF384")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("9E9F5A0E-4121-4314-8CCC-7A7AF3F53CC1")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("0164A73D-B58B-432F-8C92-BFE5BAD0F68F")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("56CD5EB8-CA98-4577-B335-7808A8EC95E0")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("83DA2F6E-6F9C-4B03-A72A-8EA2A8C00B7D")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("641AED77-1D8F-4F3D-B7D2-062DE10FF322")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("04E9BBDA-A24F-40B3-AD78-DB2EF3EF51C9")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("7C3A7585-981D-4156-8D6C-0D15E81ECBDA")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("02C3D18A-FB4F-4FC4-A9EB-AB550BB20695")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1CFC5B4B-A907-4C4C-8982-87EE7C3C0C99")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("87560453-78EA-4306-911B-9C16A5874240")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("5D25D471-2949-4E48-A878-58598969A059")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("0BAD4C9D-E175-4387-812E-746F63C1EE82")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("D03483F6-3B8D-406E-916E-DC0508EF2CF4")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("40C0065E-E0B8-4AE3-A34D-2D0146D63A0C")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("8B16DA42-A6C8-4010-9994-749CA429CD2D")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("BDB422F3-8488-4D47-BBF7-2FF167B3DD9C")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("4305C5A2-F115-40A1-A8AB-E497BA1DEE39")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("C218EAE5-39AE-4D86-A3AF-B5FCB873E0A0")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("CF85F12C-A9C7-4185-9A81-6560C3EA4EB2")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("279AFED2-5BC5-4038-B194-CCC10C505B14")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("E744F8F4-38A4-4D93-834B-10D46D8D7AE7")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("13E0CC97-2290-4865-849A-E3A37164105B")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("459DF362-0E9D-49D1-BE0A-3ADE6FB7A8FD")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("906A2568-96A4-43B1-AD4E-BBBD383D4646")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("CE6C6C3F-AE69-4516-B2C3-1F4191B27318")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("20ACE5A4-BE22-4541-BCD9-FC6A8D1E266D")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("32FBEABC-4881-4154-B9A7-79FD6ECE5ECD")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("A5A681D7-8C51-402C-9A15-4B996AE38E45")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("82EDB011-4CAF-4A22-B24B-D99814B0D059")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("01A2D980-5125-43CB-826E-A45E1CDF83C5")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("287BC0EB-7624-40DB-87C0-9891C8A752A2")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("8440623A-D290-4762-9893-EB73D0CAE529")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("75D7C5F6-2AE1-408F-827D-B3A9A87CDB98")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("86133246-DF67-47C1-A0B0-055E581B662D")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("6ED63A65-3A1C-44EE-ABC2-D8B4ED9B86D1")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("A63DE1CB-B1D9-436F-B416-7AB9E2D2AB30")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1A58D239-4B27-40F9-9950-91EC95D51FE5")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("7124BE8D-8171-4151-B481-BDE7EB5F300F")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("70514DD2-9BE8-4393-944B-789C75C90D05")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("082A9F1A-894D-43E2-9A0B-A7FACFC7E244")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("E633E06F-3407-4995-B4EF-2C5A98CA87AC")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("1AC46DD5-7F6E-4289-9AC7-0E2D542B118D")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("D2381DA0-0FFA-4058-9160-386F6C03A7AE")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("ECB457A2-D69C-4208-AA7E-C6413F9637C6")) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("EDFCC454-8DB8-4DBC-A6C9-0667BD020A7F"));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_isTitleCard;
      self->_isTitleCard = v10;

    }
    isTitleCard = self->_isTitleCard;
  }
  return -[NSNumber BOOLValue](isTitleCard, "BOOLValue");
}

- (int)orientation
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PVMotionEffectTextComponent_orientation__block_invoke;
  v5[3] = &unk_1E64D4E28;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", v5);

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

void __42__PVMotionEffectTextComponent_orientation__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishedParams_NoLock:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PVMotionEffectTextComponent_orientation__block_invoke_2;
  v6[3] = &unk_1E64D4E00;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __42__PVMotionEffectTextComponent_orientation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PVEffectParam_NameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(CFSTR("Orientation"), "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PVEffectParam_ValueKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "intValue");
    *a4 = 1;

  }
}

- (BOOL)isRightToLeftWithCurrentLocale
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v3) == 2;

  return v4;
}

- (void)setIsRightToLeft_NoLock:(BOOL)a3 documentInfo:(const void *)a4
{
  _BOOL8 v5;
  PCString v6;

  v5 = a3;
  v6.var0 = 0;
  PCString::set(&v6, CFSTR("IsRightToLeft"));
  OZXSetPublishedCheckBox(*(void **)a4, &v6, v5);
  PCString::~PCString(&v6);
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTextComponent;
  -[PVMotionEffectComponent effect:updateProperties:allProperties:](&v17, sel_effect_updateProperties_allProperties_, v8, v9, v10);
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PVMotionEffectTextComponent_effect_updateProperties_allProperties___block_invoke;
  v14[3] = &unk_1E64D4E50;
  v14[4] = self;
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "runWithDocument_NoLock:", v14);

}

uint64_t __69__PVMotionEffectTextComponent_effect_updateProperties_allProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupTitleParameters:allProperties:documentInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (void)motionEffect:(id)a3 willOpenMedia:(const void *)a4 properties:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTextComponent;
  -[PVMotionEffectComponent motionEffect:willOpenMedia:properties:](&v10, sel_motionEffect_willOpenMedia_properties_, v8, a4, v9);
  -[PVMotionEffectTextComponent setupTitleParameters:allProperties:documentInfo:](self, "setupTitleParameters:allProperties:documentInfo:", v9, v9, a4);

}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTextComponent;
  -[PVMotionEffectComponent motionEffect:didBecomeReady:properties:](&v10, sel_motionEffect_didBecomeReady_properties_, v8, a4, v9);
  -[PVMotionEffectTextComponent storeDefaultStrings:](self, "storeDefaultStrings:", a4);
  -[PVMotionEffectTextComponent setIsRightToLeft_NoLock:documentInfo:](self, "setIsRightToLeft_NoLock:documentInfo:", -[PVMotionEffectTextComponent isRightToLeftWithCurrentLocale](self, "isRightToLeftWithCurrentLocale"), a4);

}

- (void)motionEffectDidUnload:(id)a3
{
  void **textObjectIDs;
  void *v5;
  NSArray *defaultAttributedStrings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffectTextComponent;
  -[PVMotionEffectComponent motionEffectDidUnload:](&v7, sel_motionEffectDidUnload_, a3);
  textObjectIDs = (void **)self->_textObjectIDs;
  if (textObjectIDs)
  {
    v5 = *textObjectIDs;
    if (*textObjectIDs)
    {
      textObjectIDs[1] = v5;
      operator delete(v5);
    }
    MEMORY[0x1B5E29170](textObjectIDs, 0x10C402FEFCB83);
    self->_textObjectIDs = 0;
  }
  defaultAttributedStrings = self->_defaultAttributedStrings;
  self->_defaultAttributedStrings = 0;

}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;
  _QWORD v8[13];
  _QWORD v9[14];

  v9[13] = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PVMotionEffectTextComponent;
  objc_msgSendSuper2(&v7, sel_motionEffectPropertyKeyToPublishedParameterNameMap);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v8[0] = CFSTR("TitleString");
  v8[1] = CFSTR("SubtitleString");
  v9[0] = CFSTR("MainTitle");
  v9[1] = CFSTR("Subtitle");
  v8[2] = CFSTR("SecondaryString");
  v8[3] = CFSTR("MainTitleFontName");
  v9[2] = CFSTR("SecondaryTitle");
  v9[3] = CFSTR("MainFont");
  v8[4] = CFSTR("SubTitleFontName");
  v8[5] = CFSTR("SecondaryTitleFontName");
  v9[4] = CFSTR("SubtitleFont");
  v9[5] = CFSTR("SecondaryFont");
  v8[6] = CFSTR("BackgroundColor");
  v8[7] = CFSTR("PrimaryColor");
  v9[6] = CFSTR("BackgroundColor");
  v9[7] = CFSTR("PrimaryColor");
  v8[8] = CFSTR("SecondaryColor");
  v8[9] = CFSTR("TitleStyle");
  v9[8] = CFSTR("SecondaryColor");
  v9[9] = CFSTR("TitleStyle");
  v8[10] = CFSTR("ForceDisableBackgroundShape");
  v8[11] = CFSTR("kPVFlipTextKey");
  v9[10] = CFSTR("DisableBackgroundShape");
  v9[11] = CFSTR("FlipText");
  v8[12] = CFSTR("kPVOrientationKey");
  v9[12] = CFSTR("Orientation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    v5 = v3;

    v4 = v5;
  }

  return v4;
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  char v11;
  void *v12;
  objc_super v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v6 = a6;
  v10 = a4;
  v15 = *a5;
  v14.receiver = self;
  v14.super_class = (Class)PVMotionEffectTextComponent;
  if (-[PVMotionEffectComponent motionEffect:propertiesDisableCache:time:forcePosterFrame:](&v14, sel_motionEffect_propertiesDisableCache_time_forcePosterFrame_, a3, v10, &v15, v6))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kPVTextRenderingDisabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "BOOLValue");

  }
  return v11;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTextComponent;
  -[PVMotionEffectComponent motionEffectPropertyKeysThatInvalidateCachedRender:](&v10, sel_motionEffectPropertyKeysThatInvalidateCachedRender_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E20];
  v11[0] = CFSTR("TitleString");
  v11[1] = CFSTR("kPVFlipTextKey");
  v11[2] = CFSTR("kPVTextRenderingDisabled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v7 == 0;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  return v6;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTextComponent;
  if (-[PVMotionEffectComponent motionEffect:shouldInvalidateCachedRenderForProperty:oldValue:newValue:](&v17, sel_motionEffect_shouldInvalidateCachedRenderForProperty_oldValue_newValue_, v10, v11, v12, v13))
  {
    v14 = 1;
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("TitleString")))
    {
      v15 = objc_msgSend(v12, "isEqualToString:", v13);
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("kPVTextRenderingDisabled"))
        && !objc_msgSend(v11, "isEqualToString:", CFSTR("kPVFlipTextKey")))
      {
        v14 = 0;
        goto LABEL_9;
      }
      v15 = PVNumbersAreEqualAsBooleans(v12, v13);
    }
    v14 = v15 ^ 1;
  }
LABEL_9:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isTitleCard, 0);
  objc_storeStrong((id *)&self->_hasEmojiRenderingWorkaround, 0);
  objc_storeStrong((id *)&self->_defaultAttributedStrings, 0);
}

@end
