@implementation PXGDiagnosticsSpriteProbe

- (PXGDiagnosticsSpriteProbe)init
{
  PXGDiagnosticsSpriteProbe *v2;
  PXGDiagnosticsSpriteProbe *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGDiagnosticsSpriteProbe;
  v2 = -[PXGDiagnosticsSpriteProbe init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXGDiagnosticsSpriteProbe setPredicate:](v2, "setPredicate:", &__block_literal_global_21_299023);
    -[PXGDiagnosticsSpriteProbe setTagDescriptor:](v3, "setTagDescriptor:", &__block_literal_global_23_299024);
    -[PXGDiagnosticsSpriteProbe setEventHandler:](v3, "setEventHandler:", &__block_literal_global_28_299025);
  }
  return v3;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_active != a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "activeSpriteProbes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_active)
    {
      objc_msgSend(v5, "removeObject:", self);
      v5 = v6;
    }
    self->_active = v3;
    if (v3)
    {
      objc_msgSend(v6, "addObject:", self);
      v5 = v6;
    }

  }
}

- (void)_recordEventWithType:(int64_t)a3 oldState:(id *)a4 newState:(id *)a5 userInfo:(id)a6
{
  id v10;
  void (**v11)(id, PXGDiagnosticsSpriteProbe *, int64_t, const $B980CBA6C71237C62FFCE18A37759231 *, const $B980CBA6C71237C62FFCE18A37759231 *, id);

  v10 = a6;
  -[PXGDiagnosticsSpriteProbe eventHandler](self, "eventHandler");
  v11 = (void (**)(id, PXGDiagnosticsSpriteProbe *, int64_t, const $B980CBA6C71237C62FFCE18A37759231 *, const $B980CBA6C71237C62FFCE18A37759231 *, id))objc_claimAutoreleasedReturnValue();
  v11[2](v11, self, a3, a4, a5, v10);

}

- (id)descriptionForSpriteState:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double var1;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  __CFString *v17;

  if (a3)
  {
    PXRectWithCenterAndSize();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0CB3940];
    var1 = a3->var1.var1.var0.var0.var1;
    -[PXGDiagnosticsSpriteProbe tagDescriptor](self, "tagDescriptor");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[2](v15, *(_QWORD *)&a3[2].var1.var0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("r:{%0.2f,%0.2f,%0.2f,%0.2f},a:%0.2f,tag:%@"), v6, v8, v10, v12, *(_QWORD *)&var1, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = &stru_1E5149688;
  }
  return v17;
}

- (void)_recordEventIfNeededWithType:(int64_t)a3 layout:(id)a4 oldState:(id *)a5 newState:(id *)a6 userInfo:(id)a7
{
  id v12;
  uint64_t v13;
  unsigned int (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a4;
  v12 = a7;
  -[PXGDiagnosticsSpriteProbe predicate](self, "predicate");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))v13;
  if ((!a5
     || (*(unsigned int (**)(uint64_t, const $B980CBA6C71237C62FFCE18A37759231 *, id))(v13 + 16))(v13, a5, v15))&& (!a6|| ((unsigned int (**)(_QWORD, const $B980CBA6C71237C62FFCE18A37759231 *, id))v14)[2](v14, a6, v15)))
  {
    -[PXGDiagnosticsSpriteProbe _recordEventWithType:oldState:newState:userInfo:](self, "_recordEventWithType:oldState:newState:userInfo:", a3, a5, a6, v12);
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)tagDescriptor
{
  return self->_tagDescriptor;
}

- (void)setTagDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_tagDescriptor, 0);
  objc_storeStrong(&self->_predicate, 0);
}

void __33__PXGDiagnosticsSpriteProbe_init__block_invoke_3(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a6;
  PXGTungstenGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (a3 > 7)
      v13 = CFSTR("??");
    else
      v13 = off_1E51484E0[a3];
    objc_msgSend(v10, "descriptionForSpriteState:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptionForSpriteState:", a5);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v18 = 138413058;
    v17 = &stru_1E5149688;
    v19 = v13;
    if (v11)
      v17 = v11;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "[Sprite] %@ {%@}->{%@} %@", (uint8_t *)&v18, 0x2Au);

  }
}

uint64_t __33__PXGDiagnosticsSpriteProbe_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llx"), a2);
}

uint64_t __33__PXGDiagnosticsSpriteProbe_init__block_invoke()
{
  return 0;
}

+ (NSMutableArray)activeSpriteProbes
{
  if (activeSpriteProbes_onceToken != -1)
    dispatch_once(&activeSpriteProbes_onceToken, &__block_literal_global_299079);
  return (NSMutableArray *)(id)activeSpriteProbes_activeSpriteProbes;
}

+ (PXGSpriteDataStore)spriteDataStore
{
  if (spriteDataStore_onceToken != -1)
    dispatch_once(&spriteDataStore_onceToken, &__block_literal_global_18_299077);
  return (PXGSpriteDataStore *)(id)spriteDataStore_spriteDataStore;
}

+ (void)layout:(id)a3 willRemoveSprites:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a4->var0)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
      var3 = a4->var3;
      var4 = a4->var4;
      v13 = (__int128 *)((char *)a4->var2 + v7);
      v14 = v13[1];
      v24 = *v13;
      v25 = v14;
      v15 = *(_OWORD *)((char *)var3 + v8 + 96);
      v16 = *(_OWORD *)((char *)var3 + v8 + 112);
      v17 = *(_OWORD *)((char *)var3 + v8 + 144);
      v34 = *(_OWORD *)((char *)var3 + v8 + 128);
      v35 = v17;
      v33 = v16;
      v18 = *(_OWORD *)((char *)var3 + v8 + 16);
      v26 = *(_OWORD *)((char *)var3 + v8);
      v27 = v18;
      v19 = *(_OWORD *)((char *)var3 + v8 + 80);
      v21 = *(_OWORD *)((char *)var3 + v8 + 32);
      v20 = *(_OWORD *)((char *)var3 + v8 + 48);
      v30 = *(_OWORD *)((char *)var3 + v8 + 64);
      v31 = v19;
      v28 = v21;
      v29 = v20;
      v32 = v15;
      v23 = *(_OWORD *)((char *)var4 + v9);
      v22 = *(_OWORD *)((char *)var4 + v9 + 16);
      *(_QWORD *)&v38 = *(_QWORD *)((char *)var4 + v9 + 32);
      v36 = v23;
      v37 = v22;
      objc_msgSend(a1, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", 1, a3, &v24, 0, 0);
      ++v10;
      v9 += 40;
      v8 += 160;
      v7 += 32;
    }
    while (v10 < a4->var0);
  }
}

+ (void)layout:(id)a3 didInsertSprites:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a4->var0)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
      var3 = a4->var3;
      var4 = a4->var4;
      v13 = (__int128 *)((char *)a4->var2 + v7);
      v14 = v13[1];
      v24 = *v13;
      v25 = v14;
      v15 = *(_OWORD *)((char *)var3 + v8 + 96);
      v16 = *(_OWORD *)((char *)var3 + v8 + 112);
      v17 = *(_OWORD *)((char *)var3 + v8 + 144);
      v34 = *(_OWORD *)((char *)var3 + v8 + 128);
      v35 = v17;
      v33 = v16;
      v18 = *(_OWORD *)((char *)var3 + v8 + 16);
      v26 = *(_OWORD *)((char *)var3 + v8);
      v27 = v18;
      v19 = *(_OWORD *)((char *)var3 + v8 + 80);
      v21 = *(_OWORD *)((char *)var3 + v8 + 32);
      v20 = *(_OWORD *)((char *)var3 + v8 + 48);
      v30 = *(_OWORD *)((char *)var3 + v8 + 64);
      v31 = v19;
      v28 = v21;
      v29 = v20;
      v32 = v15;
      v23 = *(_OWORD *)((char *)var4 + v9);
      v22 = *(_OWORD *)((char *)var4 + v9 + 16);
      *(_QWORD *)&v38 = *(_QWORD *)((char *)var4 + v9 + 32);
      v36 = v23;
      v37 = v22;
      objc_msgSend(a1, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", 1, a3, 0, &v24, 0);
      ++v10;
      v9 += 40;
      v8 += 160;
      v7 += 32;
    }
    while (v10 < a4->var0);
  }
}

+ (void)layout:(id)a3 willChangeSprites:(id *)a4
{
  void *v4;
  __int128 v5;

  objc_msgSend(a1, "spriteDataStore", a3, *(_QWORD *)&a4->var0, a4->var1, a4->var2, a4->var3, a4->var4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSprites:", &v5);

}

+ (void)layout:(id)a3 didChangeSprites:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  unint64_t v11;
  int v12;
  float32x2_t v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  __int128 *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint16x4_t v38;
  __int128 *v39;
  uint64_t v40;
  unint64_t var0;
  void *v42;
  uint64_t v43;
  int v44;
  int v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[64];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[64];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v48 = 0u;
  objc_msgSend(a1, "spriteDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "sprites");
  else
    v48 = 0u;

  if (a4->var0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGDiagnosticsSpriteProbe.m"), 180, CFSTR("sprite count mismatch"));

    var0 = a4->var0;
    if (a4->var0)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = *(unsigned __int8 *)off_1E50B8398;
      v44 = *((unsigned __int16 *)off_1E50B8398 + 16);
      v45 = *((unsigned __int8 *)off_1E50B8398 + 1);
      v13 = *(float32x2_t *)((char *)off_1E50B8398 + 8);
      v14 = *((float *)off_1E50B8398 + 4);
      v43 = *((_QWORD *)off_1E50B8398 + 3);
      while (1)
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        *(_OWORD *)&v63[48] = 0u;
        v64 = 0u;
        memset(&v63[16], 0, 32);
        v62 = 0u;
        *(_OWORD *)v63 = 0u;
        v61 = 0u;
        v15 = *(_OWORD *)(v48 + v8 + 16);
        v61 = *(_OWORD *)(v48 + v8);
        v62 = v15;
        v16 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 96);
        v17 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 112);
        v18 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 144);
        v68 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 128);
        v69 = v18;
        v67 = v17;
        v19 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 16);
        *(_OWORD *)v63 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9);
        *(_OWORD *)&v63[16] = v19;
        v20 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 80);
        v22 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 32);
        v21 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 48);
        v64 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v9 + 64);
        v65 = v20;
        *(_OWORD *)&v63[32] = v22;
        *(_OWORD *)&v63[48] = v21;
        v66 = v16;
        v24 = *v10;
        v23 = v10[1];
        *(_QWORD *)&v72 = *((_QWORD *)v10 + 4);
        v70 = v24;
        v71 = v23;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        *(_OWORD *)&v51[48] = 0u;
        v52 = 0u;
        memset(&v51[16], 0, 32);
        v50 = 0u;
        *(_OWORD *)v51 = 0u;
        v49 = 0u;
        var3 = a4->var3;
        var4 = a4->var4;
        v27 = (__int128 *)((char *)a4->var2 + v8);
        v28 = v27[1];
        v49 = *v27;
        v50 = v28;
        v29 = *(_OWORD *)((char *)var3 + v9 + 96);
        v30 = *(_OWORD *)((char *)var3 + v9 + 112);
        v31 = *(_OWORD *)((char *)var3 + v9 + 144);
        v56 = *(_OWORD *)((char *)var3 + v9 + 128);
        v57 = v31;
        v55 = v30;
        v32 = *(_OWORD *)((char *)var3 + v9 + 16);
        *(_OWORD *)v51 = *(_OWORD *)((char *)var3 + v9);
        *(_OWORD *)&v51[16] = v32;
        v33 = *(_OWORD *)((char *)var3 + v9 + 80);
        v35 = *(_OWORD *)((char *)var3 + v9 + 32);
        v34 = *(_OWORD *)((char *)var3 + v9 + 48);
        v52 = *(_OWORD *)((char *)var3 + v9 + 64);
        v53 = v33;
        *(_OWORD *)&v51[32] = v35;
        *(_OWORD *)&v51[48] = v34;
        v54 = v29;
        v36 = *(_QWORD *)((char *)v10 + (_QWORD)var4 + 32);
        v37 = *(__int128 *)((char *)v10 + (_QWORD)var4 + 16);
        v58 = *(__int128 *)((char *)v10 + (_QWORD)var4);
        v59 = v37;
        *(_QWORD *)&v60 = v36;
        v38 = (uint16x4_t)v61;
        if (*(double *)&v61 == *(double *)&v49)
        {
          v38 = *(uint16x4_t *)((char *)&v61 + 8);
          if (*((double *)&v61 + 1) == *((double *)&v49 + 1))
          {
            v38 = (uint16x4_t)v62;
            if (*(double *)&v62 == *(double *)&v50)
            {
              v38 = (uint16x4_t)vceq_f32(*(float32x2_t *)((char *)&v62 + 8), *(float32x2_t *)((char *)&v50 + 8));
              if ((v38.i32[0] & v38.i32[1] & 1) != 0)
              {
                v38.i32[0] = *(_DWORD *)v63;
                if (*(float *)v63 == *(float *)v51)
                {
                  v38 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)&v63[4], *(float32x4_t *)&v51[4])), 0xFuLL));
                  v38.i16[0] = vminv_u16(v38);
                  if ((v38.i8[0] & 1) != 0)
                  {
                    v38 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)&v63[20], *(float32x4_t *)&v51[20])), 0xFuLL));
                    v38.i16[0] = vminv_u16(v38);
                    if ((v38.i8[0] & 1) != 0)
                    {
                      v38 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)&v63[36], *(float32x4_t *)&v51[36])), 0xFuLL));
                      v38.i16[0] = vminv_u16(v38);
                      if ((v38.i8[0] & 1) != 0)
                      {
                        v38.i32[0] = *(_DWORD *)&v63[52];
                        if (*(float *)&v63[52] == *(float *)&v51[52]
                          && WORD2(v64) == WORD2(v52)
                          && v70 == v58
                          && BYTE1(v70) == BYTE1(v58)
                          && (unsigned __int16)v72 == (unsigned __int16)v60)
                        {
                          v38 = (uint16x4_t)vceq_f32(*(float32x2_t *)((char *)&v70 + 8), *(float32x2_t *)((char *)&v58 + 8));
                          if ((v38.i32[0] & v38.i32[1] & 1) != 0)
                          {
                            v38.i32[0] = v71;
                            if (*(float *)&v71 == *(float *)&v59 && *((_QWORD *)&v71 + 1) == *((_QWORD *)&v59 + 1))
                              goto LABEL_29;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        v39 = &v61;
        if (v70 != v12 || BYTE1(v70) != v45)
          goto LABEL_27;
        v40 = 3;
        if ((unsigned __int16)v72 == v44)
          break;
LABEL_28:
        objc_msgSend(a1, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", v40, v47, v39, &v49, 0, *(double *)&v38, v43);
        var0 = a4->var0;
LABEL_29:
        ++v11;
        v10 = (__int128 *)((char *)v10 + 40);
        v9 += 160;
        v8 += 32;
        if (v11 >= var0)
          goto LABEL_41;
      }
      v38 = (uint16x4_t)vceq_f32(*(float32x2_t *)((char *)&v70 + 8), v13);
      v39 = &v61;
      if ((v38.i8[0] & 1) != 0 && (v38.i8[4] & 1) != 0)
      {
        v38.i32[0] = v71;
        v40 = 3;
        if (*(float *)&v71 == v14)
        {
          if (*((_QWORD *)&v71 + 1) == v43)
            v40 = 2;
          else
            v40 = 3;
          if (*((_QWORD *)&v71 + 1) == v43)
            v39 = 0;
          else
            v39 = &v61;
        }
        goto LABEL_28;
      }
LABEL_27:
      v40 = 3;
      goto LABEL_28;
    }
  }
LABEL_41:

}

+ (void)willRequestTextureForSpriteWithGeometry:(id *)a3 style:(id *)a4 info:(id *)a5 inLayout:(id)a6 textureInfo:(id)a7
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  $6FCFBD36564ECBB6D9D1614A84D6F83D var1;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[14];
  int64_t var3;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&a3->var0.var2;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v7;
  v8 = *(_OWORD *)&a4[2].var3;
  v14[8] = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&a4[2].var1 + 4);
  v14[9] = v8;
  v9 = *(__int128 *)((char *)&a4[3].var1 + 8);
  v14[10] = *(_OWORD *)&a4[2].var8;
  v14[11] = v9;
  var1 = a4[1].var1;
  v14[4] = *(_OWORD *)&a4->var5;
  v14[5] = var1;
  v11 = *(_OWORD *)&a4[1].var6;
  v14[6] = *(_OWORD *)&a4[1].var2;
  v14[7] = v11;
  v12 = *(__int128 *)((char *)&a4->var1 + 12);
  v14[2] = *(_OWORD *)&a4->var0;
  v14[3] = v12;
  v13 = *(_OWORD *)&a5->var4;
  v14[12] = *(_OWORD *)&a5->var0;
  v14[13] = v13;
  var3 = a5[1].var3;
  v16 = 0;
  objc_msgSend(a1, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", 4, a6, 0, v14, a7);
}

+ (void)willAdjustSprites:(id *)a3 forAnimation:(id)a4 appearing:(BOOL)a5
{
  void *v5;
  __int128 v6;

  objc_msgSend(a1, "spriteDataStore", *(_QWORD *)&a3->var0, a3->var1, a3->var2, a3->var3, a3->var4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSprites:", &v6);

}

+ (void)didAdjustSprites:(id *)a3 forAnimation:(id)a4 appearing:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  __int128 *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 *v40;
  __int128 *v41;
  id v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  const __CFString *v79;
  _QWORD v80[3];

  v45 = a5;
  v80[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "layout");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = CFSTR("duration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "duration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  objc_msgSend(a1, "spriteDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "sprites");
  else
    v48 = 0u;

  if (a3->var0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGDiagnosticsSpriteProbe.m"), 214, CFSTR("sprite count mismatch"));

    if (a3->var0)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      do
      {
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v64 = 0u;
        v17 = *(_OWORD *)(v48 + v13 + 16);
        v64 = *(_OWORD *)(v48 + v13);
        v65 = v17;
        v18 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 96);
        v19 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 112);
        v20 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 144);
        v74 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 128);
        v75 = v20;
        v73 = v19;
        v21 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 16);
        v66 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14);
        v67 = v21;
        v22 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 80);
        v24 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 32);
        v23 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 48);
        v70 = *(_OWORD *)(*((_QWORD *)&v48 + 1) + v14 + 64);
        v71 = v22;
        v68 = v24;
        v69 = v23;
        v72 = v18;
        v26 = *v15;
        v25 = v15[1];
        *(_QWORD *)&v78 = *((_QWORD *)v15 + 4);
        v76 = v26;
        v77 = v25;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v49 = 0u;
        var3 = a3->var3;
        var4 = a3->var4;
        v29 = (__int128 *)((char *)a3->var2 + v13);
        v30 = v29[1];
        v49 = *v29;
        v50 = v30;
        v31 = *(_OWORD *)((char *)var3 + v14 + 96);
        v32 = *(_OWORD *)((char *)var3 + v14 + 112);
        v33 = *(_OWORD *)((char *)var3 + v14 + 144);
        v59 = *(_OWORD *)((char *)var3 + v14 + 128);
        v60 = v33;
        v58 = v32;
        v34 = *(_OWORD *)((char *)var3 + v14 + 16);
        v51 = *(_OWORD *)((char *)var3 + v14);
        v52 = v34;
        v35 = *(_OWORD *)((char *)var3 + v14 + 80);
        v37 = *(_OWORD *)((char *)var3 + v14 + 32);
        v36 = *(_OWORD *)((char *)var3 + v14 + 48);
        v55 = *(_OWORD *)((char *)var3 + v14 + 64);
        v56 = v35;
        v53 = v37;
        v54 = v36;
        v57 = v31;
        v39 = *(__int128 *)((char *)v15 + (_QWORD)var4);
        v38 = *(__int128 *)((char *)v15 + (_QWORD)var4 + 16);
        *(_QWORD *)&v63 = *(_QWORD *)((char *)v15 + (_QWORD)var4 + 32);
        v61 = v39;
        v62 = v38;
        if (v45)
        {
          v40 = &v49;
          v41 = &v64;
          v42 = a1;
          v43 = 5;
        }
        else
        {
          v40 = &v64;
          v41 = &v49;
          v42 = a1;
          v43 = 6;
        }
        objc_msgSend(v42, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", v43, v47, v40, v41, v46);
        ++v16;
        v15 = (__int128 *)((char *)v15 + 40);
        v14 += 160;
        v13 += 32;
      }
      while (v16 < a3->var0);
    }
  }

}

+ (void)shouldUseDoubleSidedAnimationForSprites:(id *)a3 indexes:(id)a4 animation:(id)a5
{
  id v8;
  void *v9;
  __int128 v10;
  id v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  id v17;

  v8 = a4;
  objc_msgSend(a5, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = 3221225472;
  v10 = *(_OWORD *)&a3->var2;
  v14 = *(_OWORD *)&a3->var0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __87__PXGDiagnosticsSpriteProbe_shouldUseDoubleSidedAnimationForSprites_indexes_animation___block_invoke;
  v12[3] = &unk_1E51484C0;
  v15 = v10;
  var4 = a3->var4;
  v17 = a1;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);

}

+ (void)_recordEventIfNeededWithType:(int64_t)a3 layout:(id)a4 oldState:(id *)a5 newState:(id *)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "activeSpriteProbes", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", a3, v12, a5, a6, v13);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

uint64_t __87__PXGDiagnosticsSpriteProbe_shouldUseDoubleSidedAnimationForSprites_indexes_animation___block_invoke(_QWORD *a1, unsigned int a2)
{
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _OWORD v18[14];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = 0;
  v2 = a1[8];
  v3 = (_OWORD *)(a1[7] + 32 * a2);
  v4 = v3[1];
  v18[0] = *v3;
  v18[1] = v4;
  v5 = (_OWORD *)(v2 + 160 * a2);
  v6 = v5[1];
  v18[2] = *v5;
  v18[3] = v6;
  v7 = v5[5];
  v9 = v5[2];
  v8 = v5[3];
  v18[6] = v5[4];
  v18[7] = v7;
  v18[4] = v9;
  v18[5] = v8;
  v10 = v5[9];
  v12 = v5[6];
  v11 = v5[7];
  v18[10] = v5[8];
  v18[11] = v10;
  v18[8] = v12;
  v18[9] = v11;
  v13 = (void *)a1[10];
  v14 = a1[9] + 40 * a2;
  v15 = *(_QWORD *)(v14 + 32);
  v16 = *(_OWORD *)(v14 + 16);
  v18[12] = *(_OWORD *)v14;
  v18[13] = v16;
  v19 = v15;
  return objc_msgSend(v13, "_recordEventIfNeededWithType:layout:oldState:newState:userInfo:", 7, a1[4], v18, 0, 0);
}

void __44__PXGDiagnosticsSpriteProbe_spriteDataStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
  v1 = (void *)spriteDataStore_spriteDataStore;
  spriteDataStore_spriteDataStore = v0;

}

void __47__PXGDiagnosticsSpriteProbe_activeSpriteProbes__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)activeSpriteProbes_activeSpriteProbes;
  activeSpriteProbes_activeSpriteProbes = (uint64_t)v0;

}

@end
