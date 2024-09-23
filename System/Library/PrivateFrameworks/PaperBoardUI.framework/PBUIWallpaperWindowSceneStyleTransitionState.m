@implementation PBUIWallpaperWindowSceneStyleTransitionState

- (PBUIWallpaperWindowSceneStyleTransitionState)init
{
  PBUIWallpaperWindowSceneStyleTransitionState *result;
  uint64_t i;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperWindowSceneStyleTransitionState;
  result = -[PBUIWallpaperWindowSceneStyleTransitionState init](&v4, sel_init);
  if (result)
  {
    for (i = 8; i != 168; i += 32)
      *((_BYTE *)&result->super.isa + i) = 0;
  }
  return result;
}

- (void)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4
{
  char *v4;
  __int128 v5;

  if ((unint64_t)a4 <= 4)
  {
    v4 = (char *)self + 32 * a4;
    v4[8] = 1;
    v5 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v4 + 4) = *(_QWORD *)&a3->var2;
    *((_OWORD *)v4 + 1) = v5;
  }
}

- (void)removeWallpaperStyleTransitionStateForPriority:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
    self->_stateTable[a3].valid = 0;
}

- (void)diffFromWallpaperWindowSceneStyleTransitionState:(id)a3 updateHandler:(id)a4 removeHandler:(id)a5
{
  _BYTE *v8;
  _QWORD *v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  int64_t endStyle;
  int64_t startStyle;
  double transitionFraction;
  BOOL v16;
  void (*v17)(_QWORD *, uint64_t, _QWORD *);
  _QWORD v18[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = 0;
  v12 = 0;
  do
  {
    startStyle = self->_stateTable[v11].state.startStyle;
    endStyle = self->_stateTable[v11].state.endStyle;
    transitionFraction = self->_stateTable[v11].state.transitionFraction;
    if (self->_stateTable[v11].valid || (v8[v11 * 32 + 8] & 1) == 0)
    {
      if (self->_stateTable[v11].valid)
      {
        if ((v8[v11 * 32 + 8] & 1) == 0
          || (startStyle == *(_QWORD *)&v8[v11 * 32 + 16]
            ? (v16 = endStyle == *(_QWORD *)&v8[v11 * 32 + 24])
            : (v16 = 0),
              !v16 || (BSFloatEqualToFloat() & 1) == 0))
        {
          v17 = (void (*)(_QWORD *, uint64_t, _QWORD *))v9[2];
          v18[0] = startStyle;
          v18[1] = endStyle;
          *(double *)&v18[2] = transitionFraction;
          v17(v9, v12, v18);
        }
      }
    }
    else
    {
      v10[2](v10, v12);
    }
    ++v12;
    ++v11;
  }
  while (v11 != 5);

}

- ($1D129F7B4C980C50E70029647222EF17)highestPriorityStyleTransitionState
{
  uint64_t v3;

  v3 = 0;
  while (!*((_BYTE *)&self[5].var2 + v3))
  {
    v3 -= 32;
    if (v3 == -160)
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0.0;
      return self;
    }
  }
  *retstr = *($1D129F7B4C980C50E70029647222EF17 *)((char *)self + v3 + 144);
  return self;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double *p_transitionFraction;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  p_transitionFraction = &self->_stateTable[0].state.transitionFraction;
  do
  {
    if ((*(_BYTE *)(p_transitionFraction - 3) & 1) != 0)
    {
      v6 = *p_transitionFraction;
      v8 = *((_QWORD *)p_transitionFraction - 2);
      v7 = *((_QWORD *)p_transitionFraction - 1);
      v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", v4);
      v10 = (id)objc_msgSend(v3, "appendInteger:", v8);
      v11 = (id)objc_msgSend(v3, "appendInteger:", v7);
      v12 = (id)objc_msgSend(v3, "appendCGFloat:", v6);
    }
    ++v4;
    p_transitionFraction += 4;
  }
  while (v4 != 5);
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  int valid;
  unint64_t v8;
  BOOL v9;
  char *v10;
  double *p_transitionFraction;
  BOOL v12;
  int v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (char *)v4;
    v6 = v5;
    valid = self->_stateTable[0].valid;
    if (valid == (v5[8] & 1))
    {
      v8 = 0;
      v9 = 0;
      v10 = v5 + 32;
      p_transitionFraction = &self->_stateTable[0].state.transitionFraction;
      do
      {
        if (valid)
        {
          v12 = *((_QWORD *)p_transitionFraction - 2) == *((_QWORD *)v10 - 2)
             && *((_QWORD *)p_transitionFraction - 1) == *((_QWORD *)v10 - 1);
          if (!v12 || !BSFloatEqualToFloat())
            break;
        }
        v9 = v8 > 3;
        if (v8 == 4)
          break;
        valid = (_BYTE)p_transitionFraction[1] & 1;
        v13 = v10[8] & 1;
        v10 += 32;
        p_transitionFraction += 4;
        ++v8;
      }
      while (valid == v13);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperWindowSceneStyleTransitionState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  result = objc_alloc_init((Class)objc_opt_class());
  v5 = *(_OWORD *)&self->_stateTable[0].state.endStyle;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_stateTable[0].valid;
  *(_OWORD *)((char *)result + 24) = v5;
  v6 = *(_OWORD *)&self->_stateTable[1].state.endStyle;
  v7 = *(_OWORD *)&self->_stateTable[2].valid;
  v8 = *(_OWORD *)&self->_stateTable[2].state.endStyle;
  *(_OWORD *)((char *)result + 40) = *(_OWORD *)&self->_stateTable[1].valid;
  *(_OWORD *)((char *)result + 88) = v8;
  *(_OWORD *)((char *)result + 72) = v7;
  *(_OWORD *)((char *)result + 56) = v6;
  v9 = *(_OWORD *)&self->_stateTable[3].state.endStyle;
  v10 = *(_OWORD *)&self->_stateTable[4].valid;
  v11 = *(_OWORD *)&self->_stateTable[4].state.endStyle;
  *(_OWORD *)((char *)result + 104) = *(_OWORD *)&self->_stateTable[3].valid;
  *(_OWORD *)((char *)result + 152) = v11;
  *(_OWORD *)((char *)result + 136) = v10;
  *(_OWORD *)((char *)result + 120) = v9;
  return result;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)initWithXPCDictionary:(id)a3
{
  id v4;
  PBUIWallpaperWindowSceneStyleTransitionState *v5;
  void *v6;
  void *v7;
  size_t count;
  size_t v9;
  size_t i;
  void *v11;
  void *v12;
  uint64_t uint64;
  int64_t int64;
  int64_t v15;
  double v16;
  id v18;
  _QWORD v19[3];

  v4 = a3;
  v5 = -[PBUIWallpaperWindowSceneStyleTransitionState init](self, "init");
  if (v5)
  {
    v18 = v4;
    xpc_dictionary_get_array(v4, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      count = xpc_array_get_count(v6);
      if (count)
      {
        v9 = count;
        for (i = 0; i != v9; ++i)
        {
          xpc_array_get_dictionary(v7, i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            uint64 = xpc_dictionary_get_uint64(v11, "priority");
            int64 = xpc_dictionary_get_int64(v12, "startStyle");
            v15 = xpc_dictionary_get_int64(v12, "endStyle");
            v16 = MEMORY[0x1BCCA4EB0](v12, "transitionFraction");
            v19[0] = int64;
            v19[1] = v15;
            *(double *)&v19[2] = v16;
            -[PBUIWallpaperWindowSceneStyleTransitionState setWallpaperStyleTransitionState:forPriority:](v5, "setWallpaperStyleTransitionState:forPriority:", v19, uint64);
          }

        }
      }
    }

    v4 = v18;
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t empty;
  uint64_t v5;
  double *p_transitionFraction;
  double v7;
  int64_t v8;
  int64_t v9;
  xpc_object_t v10;
  xpc_object_t xdict;

  xdict = a3;
  empty = xpc_array_create_empty();
  v5 = 0;
  p_transitionFraction = &self->_stateTable[0].state.transitionFraction;
  do
  {
    if ((*(_BYTE *)(p_transitionFraction - 3) & 1) != 0)
    {
      v7 = *p_transitionFraction;
      v9 = *((_QWORD *)p_transitionFraction - 2);
      v8 = *((_QWORD *)p_transitionFraction - 1);
      v10 = xpc_dictionary_create_empty();
      xpc_dictionary_set_uint64(v10, "priority", v5);
      xpc_dictionary_set_int64(v10, "startStyle", v9);
      xpc_dictionary_set_int64(v10, "endStyle", v8);
      MEMORY[0x1BCCA4F7C](v10, "transitionFraction", v7);
      xpc_array_append_value(empty, v10);

    }
    ++v5;
    p_transitionFraction += 4;
  }
  while (v5 != 5);
  xpc_dictionary_set_value(xdict, "table", empty);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowSceneStyleTransitionState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperWindowSceneStyleTransitionState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL *v7;
  uint64_t v8;
  char v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  char v14;
  _BYTE v15[31];
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBUIWallpaperWindowSceneStyleTransitionState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &self->_stateTable[0].valid + 1;
  v8 = MEMORY[0x1E0C809B0];
  do
  {
    v9 = *(v7 - 1);
    v16[0] = *(_OWORD *)v7;
    *(_OWORD *)((char *)v16 + 15) = *(_OWORD *)(v7 + 15);
    if ((v9 & 1) != 0)
    {
      PBUIStringForWallpaperStylePriority(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __86__PBUIWallpaperWindowSceneStyleTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke;
      v12[3] = &unk_1E6B949B8;
      v13 = v5;
      v14 = v9;
      *(_OWORD *)v15 = v16[0];
      *(_OWORD *)&v15[15] = *(_OWORD *)((char *)v16 + 15);
      objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", v10, v4, v12);

    }
    ++v6;
    v7 += 32;
  }
  while (v6 != 5);

  return v5;
}

id __86__PBUIWallpaperWindowSceneStyleTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  PBUIWallpaperStyleDescription(*(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("startStyle"));

  v4 = *(void **)(a1 + 32);
  PBUIWallpaperStyleDescription(*(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("endStyle"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("transitionFraction"), 6, *(double *)(a1 + 64));
}

@end
