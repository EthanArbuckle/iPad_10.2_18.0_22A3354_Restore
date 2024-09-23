@implementation PXGReusableAXInfo

+ (PXReusableObjectPool)sharedPool
{
  if (sharedPool_onceToken != -1)
    dispatch_once(&sharedPool_onceToken, &__block_literal_global_195822);
  return (PXReusableObjectPool *)(id)sharedPool_pool;
}

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (void)setSpriteStyleCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_spriteStyleCornerRadius.var0.var0.topLeft = v3;
  self->_spriteStyleCornerRadius.var0.var0.topRight = v4;
  self->_spriteStyleCornerRadius.var0.var0.bottomLeft = v5;
  self->_spriteStyleCornerRadius.var0.var0.bottomRight = v6;
}

- (void)setSpriteStyle:(id *)a3
{
  __int128 v3;
  __int128 v4;
  $6FCFBD36564ECBB6D9D1614A84D6F83D var1;
  $1A92715FA36BAB2AB993A583878CDF5D v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = *(__int128 *)((char *)&a3->var1 + 12);
  *(_OWORD *)&self->_spriteStyle.alpha = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self[1]._axAccessibleWhenTransparent = v3;
  v4 = *(_OWORD *)&a3->var5;
  var1 = a3[1].var1;
  v6 = *($1A92715FA36BAB2AB993A583878CDF5D *)&a3[1].var6;
  *(_OWORD *)&self[1]._axDecorations = *(_OWORD *)&a3[1].var2;
  *($1A92715FA36BAB2AB993A583878CDF5D *)((char *)&self[1]._spriteStyleCornerRadius + 8) = v6;
  *(_OWORD *)&self[1]._focusRingType = v4;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[1]._axContentKind = var1;
  v7 = *(__int128 *)((char *)&a3[2].var1 + 4);
  v8 = *(_OWORD *)&a3[2].var3;
  v9 = *(__int128 *)((char *)&a3[3].var1 + 8);
  *(_OWORD *)&self[2].super.isa = *(_OWORD *)&a3[2].var8;
  *(_OWORD *)&self[2]._axContainingGroup = v9;
  *(_OWORD *)&self[1]._spriteGeometry.center.y = v7;
  *(_OWORD *)self[1]._anon_68 = v8;
}

- (void)setSpriteGeometry:(id)a3
{
  _OWORD *v3;
  __int128 v4;

  v4 = v3[1];
  *(_OWORD *)&self->_spriteGeometry.center.x = *v3;
  *(_OWORD *)&self->_spriteGeometry.center.z = v4;
}

- (void)setFocusRingType:(int64_t)a3
{
  self->_focusRingType = a3;
}

- (void)setAxAccessibleWhenTransparent:(BOOL)a3
{
  self->_axAccessibleWhenTransparent = a3;
}

- (BOOL)fillContentForContentKind:(int64_t)a3 inLayout:(id)a4 atIndex:(unsigned int)a5
{
  _BOOL4 v7;
  int64_t v8;

  v7 = -[PXGReusableAXInfo _fillForKind:withLayout:spriteIndex:](self, "_fillForKind:withLayout:spriteIndex:", a3, a4, *(_QWORD *)&a5);
  if (v7)
    v8 = a3;
  else
    v8 = 0;
  -[PXGReusableAXInfo setAxContentKind:](self, "setAxContentKind:", v8);
  return v7;
}

- (void)setAxContentKind:(int64_t)a3
{
  self->_axContentKind = a3;
}

- (BOOL)_fillForKind:(int64_t)a3 withLayout:(id)a4 spriteIndex:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id content;
  id v13;
  void *v14;
  id v15;
  BOOL v16;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  switch(a3)
  {
    case 1:
      objc_msgSend((id)objc_opt_class(), "_titleSubtitleInLayout:atSpriteIndex:", v8, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      content = self->_content;
      self->_content = v11;
      v13 = v11;

      objc_msgSend(v13, "first");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v14 != 0;
      break;
    case 2:
    case 3:
      objc_msgSend((id)objc_opt_class(), "_textInLayout:atSpriteIndex:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      objc_msgSend((id)objc_opt_class(), "_imageAXLabelInLayout:atSpriteIndex:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v15 = self->_content;
      self->_content = v9;

      v16 = self->_content == 0;
      goto LABEL_9;
    case 5:
      v16 = objc_msgSend((id)objc_opt_class(), "_viewClassInLayout:atSpriteIndex:", v8, v5) == 0;
LABEL_9:
      v10 = !v16;
      break;
    case 6:
      v10 = objc_msgSend((id)objc_opt_class(), "_assetHasContentSourceInLayout:atSpriteIndex:", v8, v5);
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (void)applyToInfo:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  *((_DWORD *)a3 + 3) = self->_spriteIndex;
  v3 = *(_OWORD *)&self->_spriteGeometry.center.z;
  *((_OWORD *)a3 + 5) = *(_OWORD *)&self->_spriteGeometry.center.x;
  *((_OWORD *)a3 + 6) = v3;
  v4 = *(__int128 *)((char *)&self[1]._spriteStyleCornerRadius + 8);
  v6 = *(_OWORD *)&self[1]._focusRingType;
  v5 = *(_OWORD *)&self[1]._axContentKind;
  *((_OWORD *)a3 + 11) = *(_OWORD *)&self[1]._axDecorations;
  *((_OWORD *)a3 + 12) = v4;
  *((_OWORD *)a3 + 9) = v6;
  *((_OWORD *)a3 + 10) = v5;
  v7 = *(_OWORD *)&self[2]._axContainingGroup;
  v9 = *(_OWORD *)&self[1]._spriteGeometry.center.y;
  v8 = *(_OWORD *)self[1]._anon_68;
  *((_OWORD *)a3 + 15) = *(_OWORD *)&self[2].super.isa;
  *((_OWORD *)a3 + 16) = v7;
  *((_OWORD *)a3 + 13) = v9;
  *((_OWORD *)a3 + 14) = v8;
  v10 = *(_OWORD *)&self[1]._axAccessibleWhenTransparent;
  *((_OWORD *)a3 + 7) = *(_OWORD *)&self->_spriteStyle.alpha;
  *((_OWORD *)a3 + 8) = v10;
  *((_OWORD *)a3 + 4) = self->_spriteStyleCornerRadius;
  *((_QWORD *)a3 + 3) = self->_focusRingType;
  *((_QWORD *)a3 + 5) = self->_axContentKind;
  *((_BYTE *)a3 + 8) = self->_axAccessibleWhenTransparent;
  objc_storeStrong((id *)a3 + 6, self->_content);
}

- (void)prepareForReuse
{
  id content;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $1A92715FA36BAB2AB993A583878CDF5D v8;
  __int128 v9;
  NSArray *axDecorations;

  content = self->_content;
  self->_axContentKind = 0;
  self->_content = 0;

  self->_spriteIndex = -1;
  objc_storeWeak((id *)&self->_axContainingGroup, 0);
  v4 = *((_OWORD *)off_1E50B8358 + 1);
  *(_OWORD *)&self->_spriteGeometry.center.x = *(_OWORD *)off_1E50B8358;
  *(_OWORD *)&self->_spriteGeometry.center.z = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 7);
  *(_OWORD *)&self[1]._spriteGeometry.center.y = *((_OWORD *)off_1E50B83A0 + 6);
  *(_OWORD *)self[1]._anon_68 = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 9);
  *(_OWORD *)&self[2].super.isa = *((_OWORD *)off_1E50B83A0 + 8);
  *(_OWORD *)&self[2]._axContainingGroup = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 3);
  *(_OWORD *)&self[1]._focusRingType = *((_OWORD *)off_1E50B83A0 + 2);
  *(_OWORD *)&self[1]._axContentKind = v7;
  v8 = ($1A92715FA36BAB2AB993A583878CDF5D)*((_OWORD *)off_1E50B83A0 + 5);
  *(_OWORD *)&self[1]._axDecorations = *((_OWORD *)off_1E50B83A0 + 4);
  *($1A92715FA36BAB2AB993A583878CDF5D *)((char *)&self[1]._spriteStyleCornerRadius + 8) = v8;
  v9 = *((_OWORD *)off_1E50B83A0 + 1);
  *(_OWORD *)&self->_spriteStyle.alpha = *(_OWORD *)off_1E50B83A0;
  *(_OWORD *)&self[1]._axAccessibleWhenTransparent = v9;
  self->_alternateUIVisibility = 0;
  axDecorations = self->_axDecorations;
  self->_axDecorations = 0;

}

PXGReusableAXInfo *__31__PXGReusableAXInfo_sharedPool__block_invoke_2()
{
  return objc_alloc_init(PXGReusableAXInfo);
}

- (PXGReusableAXInfo)init
{
  PXGReusableAXInfo *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGReusableAXInfo;
  result = -[PXGReusableAXInfo init](&v4, sel_init);
  if (result)
  {
    result->_spriteIndex = -1;
    v3 = *((_OWORD *)off_1E50B8358 + 1);
    *(_OWORD *)&result->_spriteGeometry.center.x = *(_OWORD *)off_1E50B8358;
    *(_OWORD *)&result->_spriteGeometry.center.z = v3;
    *(_QWORD *)&result->_spriteStyleCornerRadius.var0.var0.topLeft = 0;
    *(_QWORD *)&result->_spriteStyleCornerRadius.var0.byIndex[2] = 0;
    result->_focusRingType = 1;
  }
  return result;
}

- (void)setAxContainingGroup:(id)a3
{
  objc_storeWeak((id *)&self->_axContainingGroup, a3);
}

- (void)setAlternateUIVisibility:(int64_t)a3
{
  self->_alternateUIVisibility = a3;
}

- (void)setAllowDecorations:(BOOL)a3
{
  self->_allowDecorations = a3;
}

+ (Class)_viewClassInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PXGReusableAXInfo__viewClassInLayout_atSpriteIndex___block_invoke;
  v8[3] = &unk_1E5134638;
  v8[4] = &v10;
  v9 = a4;
  objc_msgSend(v5, "enumerateSpritesInRange:usingBlock:", a4 | 0x100000000, v8);
  v6 = (id)v11[3];
  _Block_object_dispose(&v10, 8);

  return (Class)v6;
}

+ (BOOL)_assetHasContentSourceInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PXGReusableAXInfo__assetHasContentSourceInLayout_atSpriteIndex___block_invoke;
  v7[3] = &unk_1E51345E8;
  v7[4] = &v8;
  objc_msgSend(v5, "enumerateSpritesInRange:usingBlock:", a4 | 0x100000000, v7);
  LOBYTE(a4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return a4;
}

void __66__PXGReusableAXInfo__assetHasContentSourceInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, _BYTE *a9)
{
  void *v10;

  objc_msgSend(a7, "contentSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a9 = 1;

}

void __54__PXGReusableAXInfo__viewClassInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, _BYTE *a9)
{
  void *v10;
  void *v11;
  id v12;

  v12 = a7;
  objc_msgSend(v12, "contentSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v10, "viewClassForSpriteAtIndex:inLayout:", *(unsigned int *)(a1 + 40), v12);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a9 = 1;

}

+ (id)_titleSubtitleInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__195820;
  v20 = __Block_byref_object_dispose__195821;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__195820;
  v14 = __Block_byref_object_dispose__195821;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PXGReusableAXInfo__titleSubtitleInLayout_atSpriteIndex___block_invoke;
  v9[3] = &unk_1E5134610;
  v9[4] = &v16;
  v9[5] = &v10;
  objc_msgSend(v5, "enumerateSpritesInRange:usingBlock:", a4 | 0x100000000, v9);
  v6 = objc_alloc((Class)off_1E50B5CE0);
  v7 = (void *)objc_msgSend(v6, "initWithFirst:second:", v17[5], v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __58__PXGReusableAXInfo__titleSubtitleInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, _BYTE *a9)
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(a7, "contentSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v18 = v11;
    objc_msgSend(v11, "titleForSpriteAtIndex:", a8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(v18, "subtitleForSpriteAtIndex:", a8);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v11 = v18;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a9 = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axDecorations, 0);
  objc_storeStrong(&self->_content, 0);
  objc_destroyWeak((id *)&self->_axContainingGroup);
}

uint64_t __31__PXGReusableAXInfo_sharedPool__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)off_1E50B46A0);
  v1 = (void *)sharedPool_pool;
  sharedPool_pool = (uint64_t)v0;

  return objc_msgSend((id)sharedPool_pool, "registerReusableObjectForReuseIdentifier:creationHandler:", 1, &__block_literal_global_2_195824);
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") == 5)
  {
    -[PXGReusableAXInfo axView](self, "axView");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  return v7;
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  PXGReusableAXInfo *v6;
  PXGReusableAXInfo *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "nextFocusedItem");
  v6 = (PXGReusableAXInfo *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "previouslyFocusedItem");
  v7 = (PXGReusableAXInfo *)objc_claimAutoreleasedReturnValue();

  if (v6 == self || v7 == self)
  {
    -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 == self && !v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo+iOS.m"), 62, CFSTR("An info should not be getting focus if it has no containing group"));

    }
    v10 = -[PXGReusableAXInfo spriteIndex](self, "spriteIndex");
    v11 = v10;
    if (v6 == self && (_DWORD)v10 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo+iOS.m"), 65, CFSTR("An info should not be getting focus if it has no backing sprite"));

    }
    if (v6 == self)
      v12 = (id)objc_msgSend(v9, "loadLeafAtSpriteIndexIfNeeded:usingOptions:", v11, 1);
    objc_msgSend(v26, "previouslyFocusedItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v26, "nextFocusedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    objc_msgSend(v14, "axContainingGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "axContainingGroup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "axInfoSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "spriteIndex");
    if (v17 == v18)
    {
      v21 = objc_msgSend(v16, "spriteIndex");
      v22 = v19;
      v23 = v20;
    }
    else
    {
      objc_msgSend(v19, "axDidUpdateFocusFromSpriteAtIndex:toSpriteAtIndex:", v20, 0xFFFFFFFFLL);

      objc_msgSend(v18, "axInfoSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v16, "spriteIndex");
      v22 = v19;
      v23 = 0xFFFFFFFFLL;
    }
    objc_msgSend(v22, "axDidUpdateFocusFromSpriteAtIndex:toSpriteAtIndex:", v23, v21);

    if (v7 == self)
      objc_msgSend(v9, "unloadLeafAtSpriteIndex:usingOptions:", v11, 3);

  }
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  void *v10;

  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo+iOS.m"), 98, CFSTR("An info should not be getting focus if it has no containing group"));

  }
  objc_msgSend(v4, "axInfoSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PXGReusableAXInfo spriteIndex](self, "spriteIndex");
    if ((_DWORD)v6 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo+iOS.m"), 109, CFSTR("An info should not be getting focus if it has no backing sprite"));

    }
    v7 = objc_msgSend(v5, "axFocusabilityForSpriteAtIndex:", v6) != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canBecomeFocused
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;

  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axInfoSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PXGReusableAXInfo spriteIndex](self, "spriteIndex");
    if ((_DWORD)v6 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo+iOS.m"), 122, CFSTR("An info should not be getting focus if it has no backing sprite"));

    }
    v7 = objc_msgSend(v5, "axFocusabilityForSpriteAtIndex:", v6) == 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[PXGReusableAXInfo axFrame](self, "axFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axScrollParent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "axGroupSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "axConvertRect:fromDescendantGroup:", v11, v4, v6, v8, v10);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIFocusEffect)focusEffect
{
  return 0;
}

- (int64_t)focusGroupPriority
{
  if (-[PXGReusableAXInfo axIsSelected](self, "axIsSelected"))
    return 2000;
  else
    return 0;
}

- (void)didHintFocusMovement:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axInfoSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PXGReusableAXInfo spriteIndex](self, "spriteIndex");
    if ((_DWORD)v6 != -1)
      objc_msgSend(v5, "axDidReceiveFocusMovementHint:forSpriteAtIndex:", v7, v6);
  }

}

- (CGRect)axFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PXGReusableAXInfo spriteGeometry](self, "spriteGeometry");
  PXRectWithCenterAndSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)axIsSelected
{
  PXGReusableAXInfo *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axInfoSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "axSelectedSpriteIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "containsIndex:", -[PXGReusableAXInfo spriteIndex](v2, "spriteIndex"));

  return (char)v2;
}

- (NSString)axText
{
  id v4;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") != 2
    && -[PXGReusableAXInfo axContentKind](self, "axContentKind") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 95, CFSTR("Should not request text from element that is not text/button"));

  }
  v4 = self->_content;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 96, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_content"), v8);
LABEL_9:

    return (NSString *)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 96, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_content"), v8, v10);

    goto LABEL_9;
  }
  return (NSString *)v4;
}

- (NSString)axTitle
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 101, CFSTR("Should not request title from element that is not titlesubtitle"));

  }
  v4 = self->_content;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 102, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_content"), v10, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 102, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_content"), v10);
  }

LABEL_5:
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("titleSubtitle.first"), v15);
LABEL_13:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("titleSubtitle.first"), v15, v17);

    goto LABEL_13;
  }
LABEL_7:

  return (NSString *)v5;
}

- (NSString)axSubtitle
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;

  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 108, CFSTR("Should not request title from element that is not titlesubtitle"));

  }
  v4 = self->_content;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 109, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_content"), v10);
LABEL_11:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 109, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_content"), v10, v12);

    goto LABEL_11;
  }
LABEL_5:
  objc_msgSend(v4, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 110, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("titleSubtitle.second"), v15, v16);

    }
  }

  return (NSString *)v5;
}

- (NSString)axImageName
{
  id v4;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 115, CFSTR("Should not request imageName from element that is not namedImage"));

  }
  v4 = self->_content;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 116, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_content"), v9);
LABEL_8:

    return (NSString *)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 116, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_content"), v9, v11);

    goto LABEL_8;
  }
  return (NSString *)v4;
}

- (PXAccessibleDisplayAsset)axAsset
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 121, CFSTR("Should not request asset from element that is not asset"));

  }
  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayAssetFetchResultForSpritesInRange:inLayout:", self->_spriteIndex | 0x100000000, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", self->_spriteIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAccessibleDisplayAsset *)v8;
}

- (PXAnonymousView)axView
{
  void *v5;

  if (-[PXGReusableAXInfo axContentKind](self, "axContentKind") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 130, CFSTR("Should not request view from element that is not view"));

  }
  return (PXAnonymousView *)-[PXGReusableAXInfo _viewAtSpriteIndex:](self, "_viewAtSpriteIndex:", self->_spriteIndex);
}

- (void)setContent:(id)a3 ofContentKind:(int64_t)a4
{
  id v7;
  id content;
  void *v9;

  v7 = a3;
  if (!v7 && a4 != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXInfo.m"), 155, CFSTR("Content can only be nil when contentKind is View"));

  }
  -[PXGReusableAXInfo setAxContentKind:](self, "setAxContentKind:", a4);
  content = self->_content;
  self->_content = v7;

}

- (id)_viewAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  -[PXGReusableAXInfo axContainingGroup](self, "axContainingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axRootParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForSpriteIndex:", objc_msgSend(v7, "convertSpriteIndex:fromDescendantLayout:", v3, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t spriteIndex;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  CGRect v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  spriteIndex = self->_spriteIndex;
  v6 = -[PXGReusableAXInfo axContentKind](self, "axContentKind");
  if (v6 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_NSStringFromPXGAXInfoKind(PXGAXInfoKind)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGAXInfo.m"), 47, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v7 = off_1E5134658[v6];
  -[PXGReusableAXInfo axFrame](self, "axFrame");
  NSStringFromCGRect(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p index: %u, kind: %@, frame: %@>"), v4, self, spriteIndex, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (PXGBasicAXGroup)axContainingGroup
{
  return (PXGBasicAXGroup *)objc_loadWeakRetained((id *)&self->_axContainingGroup);
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteGeometry
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 result;

  v3 = *(_OWORD *)&self->_spriteGeometry.center.x;
  v4 = *(_OWORD *)&self->_spriteGeometry.center.z;
  *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- ($225AF24142A77900D29617A74D173C5F)spriteStyle
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D var1;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v4;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5;
  __int128 v6;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v7;

  var1 = self[5].var1;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[2].var1 + 4) = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[4].var5;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&retstr[2].var3 = var1;
  v4 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[5].var6;
  *(_OWORD *)&retstr[2].var8 = *(_OWORD *)&self[5].var2;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[3].var1 + 8) = v4;
  v5 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[3].var4;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&retstr->var5 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&self[3].var1 + 8);
  retstr[1].var1 = v5;
  v6 = *(__int128 *)((char *)&self[4].var1 + 12);
  *(_OWORD *)&retstr[1].var2 = *(_OWORD *)&self[4].var0;
  *(_OWORD *)&retstr[1].var6 = v6;
  v7 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[2].var8;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var3;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr->var1 + 12) = v7;
  return self;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)spriteStyleCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (int64_t)focusRingType
{
  return self->_focusRingType;
}

- (int64_t)alternateUIVisibility
{
  return self->_alternateUIVisibility;
}

- (int64_t)axContentKind
{
  return self->_axContentKind;
}

- (id)content
{
  return self->_content;
}

- (BOOL)axAccessibleWhenTransparent
{
  return self->_axAccessibleWhenTransparent;
}

- (BOOL)allowDecorations
{
  return self->_allowDecorations;
}

- (NSArray)axDecorations
{
  return self->_axDecorations;
}

- (void)setAxDecorations:(id)a3
{
  objc_storeStrong((id *)&self->_axDecorations, a3);
}

+ (id)_textInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__195820;
  v13 = __Block_byref_object_dispose__195821;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXGReusableAXInfo__textInLayout_atSpriteIndex___block_invoke;
  v8[3] = &unk_1E51345E8;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateSpritesInRange:usingBlock:", a4 | 0x100000000, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)_imageAXLabelInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__195820;
  v13 = __Block_byref_object_dispose__195821;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PXGReusableAXInfo__imageAXLabelInLayout_atSpriteIndex___block_invoke;
  v8[3] = &unk_1E51345E8;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateSpritesInRange:usingBlock:", a4 | 0x100000000, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __57__PXGReusableAXInfo__imageAXLabelInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, _BYTE *a9)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a7;
  objc_msgSend(v16, "contentSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "imageConfigurationAtIndex:inLayout:", a8, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(v13, "imageName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15);
    if (!v14)

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a9 = 1;

}

void __49__PXGReusableAXInfo__textInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, _BYTE *a9)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a7;
  objc_msgSend(v16, "contentSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "attributedStringForSpriteAtIndex:inLayout:", a8, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(v12, "stringAtIndex:inLayout:", a8, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v15);
    if (!v14)

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a9 = 1;

}

@end
