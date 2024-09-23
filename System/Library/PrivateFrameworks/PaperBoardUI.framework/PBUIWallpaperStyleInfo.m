@implementation PBUIWallpaperStyleInfo

- (PBUIWallpaperStyleInfo)init
{
  PBUIWallpaperStyleInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperStyleInfo;
  result = -[PBUIWallpaperStyleInfo init](&v3, sel_init);
  if (result)
  {
    result->_styleTransitionState.startStyle = 0;
    result->_styleTransitionState.endStyle = 0;
    result->_styleTransitionState.transitionFraction = 0.0;
  }
  return result;
}

- ($B02D014F61B172915FAB8AA02880CAEC)priorityInfoForPriority:(SEL)a3
{
  $B02D014F61B172915FAB8AA02880CAEC *v4;
  __int128 v5;
  id v6;

  if (a4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Bad index to priorityInfoAtIndex:"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v4 = &self[a4];
  v5 = *(_OWORD *)&v4->var1.var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v4->var1.var0;
  *(_OWORD *)&retstr->var1.var1 = v5;
  return self;
}

- (void)setPriorityInfo:(id *)a3 forPriority:(int64_t)a4
{
  __int128 v4;
  char *v5;
  id v6;

  if (a4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Bad index to setPriorityInfo:atIndex:"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v4 = *(_OWORD *)&a3->var0;
  v5 = (char *)self + 32 * a4;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v5 + 8) = v4;
}

- (void)removePriorityInfoForPriority:(int64_t)a3
{
  id v3;

  if (a3 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Bad index to removePriorityInfoForPriority:"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  self->_priorityInfo[a3].valid = 0;
}

- (void)enumerateValidPrioritiesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *);
  $1A4C2DBCB9CA1B694436E79E4AA4524F *v5;
  uint64_t i;
  _BOOL4 valid;
  BOOL v8;
  char v9;

  v4 = (void (**)(id, uint64_t, _BYTE *))a3;
  v5 = &self->_priorityInfo[4];
  for (i = 4; ; --i)
  {
    valid = v5->valid;
    --v5;
    if (valid)
      break;
    if (i < 1)
      goto LABEL_11;
LABEL_10:
    ;
  }
  v9 = 0;
  v4[2](v4, i, &v9);
  if (v9)
    v8 = 1;
  else
    v8 = i <= 0;
  if (!v8)
    goto LABEL_10;
LABEL_11:

}

- (int64_t)highestValidPriority
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PBUIWallpaperStyleInfo_highestValidPriority__block_invoke;
  v4[3] = &unk_1E6B94BF0;
  v4[4] = &v5;
  -[PBUIWallpaperStyleInfo enumerateValidPrioritiesUsingBlock:](self, "enumerateValidPrioritiesUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__PBUIWallpaperStyleInfo_highestValidPriority__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperStyleInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperStyleInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  $908C602B16FFD440FE7BF19AD013F0CC styleTransitionState;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  styleTransitionState = self->_styleTransitionState;
  PBUIStringForStyleTransitionState((unint64_t *)&styleTransitionState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("styleTransitionState"));

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E6B94BC8;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("priorityInfo"), v5, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v5[3] = &unk_1E6B94C18;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateValidPrioritiesUsingBlock:", v5);

}

void __64__PBUIWallpaperStyleInfo_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, unint64_t a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40) + 32 * a2;
  v5 = *(_OWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 32);
  v9 = v5;
  PBUIStringForStyleTransitionState((unint64_t *)&v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForWallpaperStylePriority(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v6, v7);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperStyleInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (PBUIWallpaperEffectViewBase)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
}

- ($1D129F7B4C980C50E70029647222EF17)styleTransitionState
{
  *($908C602B16FFD440FE7BF19AD013F0CC *)retstr = *($908C602B16FFD440FE7BF19AD013F0CC *)((char *)self + 176);
  return self;
}

- (void)setStyleTransitionState:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_styleTransitionState.transitionFraction = a3->var2;
  *(_OWORD *)&self->_styleTransitionState.startStyle = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
}

@end
