@implementation PGCABackdropLayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)materialFilters
{
  if (materialFilters_onceToken != -1)
    dispatch_once(&materialFilters_onceToken, &__block_literal_global_6);
  return (id)materialFilters_materialFilters;
}

void __40__PGCABackdropLayerView_materialFilters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _OWORD v5[30];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setValue:forKey:", &unk_1E62429E8, CFSTR("inputRadius"));
  objc_msgSend(v0, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
  objc_msgSend(v0, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(v0, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CAColorMatrixMakeSaturation();
  CAColorMatrixMakeColorSourceOver();
  CAColorMatrixMakeColorSourceOver();
  memset(&v5[10], 0, 320);
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  memset(v5, 0, 80);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValue:forKey:", v2, CFSTR("inputColorMatrix"));

  v6[0] = v0;
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)materialFilters_materialFilters;
  materialFilters_materialFilters = v3;

}

+ (id)reducedTransparencyColor
{
  if (reducedTransparencyColor_onceToken != -1)
    dispatch_once(&reducedTransparencyColor_onceToken, &__block_literal_global_15);
  return (id)reducedTransparencyColor_reducedTransparencyColor;
}

void __49__PGCABackdropLayerView_reducedTransparencyColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.168627451, 0.180392157, 0.188235294, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reducedTransparencyColor_reducedTransparencyColor;
  reducedTransparencyColor_reducedTransparencyColor = v0;

}

- (PGCABackdropLayerView)initWithCoder:(id)a3
{
  return -[PGCABackdropLayerView initWithFrame:captureOnly:](self, "initWithFrame:captureOnly:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PGCABackdropLayerView)initWithFrame:(CGRect)a3
{
  return -[PGCABackdropLayerView initWithFrame:captureOnly:](self, "initWithFrame:captureOnly:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PGCABackdropLayerView)initWithFrame:(CGRect)a3 captureOnly:(BOOL)a4
{
  _BOOL4 v4;
  PGCABackdropLayerView *v5;
  PGCABackdropLayerView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGCABackdropLayerView;
  v5 = -[PGCABackdropLayerView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[PGCABackdropLayerView layer](v5, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCaptureOnly:", 1);

      -[PGCABackdropLayerView layer](v6, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGroupName:", v10);

    }
    -[PGCABackdropLayerView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_updateEffects, *MEMORY[0x1E0CEB098], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);

  v4.receiver = self;
  v4.super_class = (Class)PGCABackdropLayerView;
  -[PGCABackdropLayerView dealloc](&v4, sel_dealloc);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGCABackdropLayerView;
  -[PGCABackdropLayerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PGCABackdropLayerView updateEffects](self, "updateEffects");
}

- (void)setCustomBackgroundColor:(id)a3
{
  char v4;
  UIColor *v5;
  UIColor *v6;
  UIColor *customBackgroundColor;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v4 = -[UIColor isEqual:](self->_customBackgroundColor, "isEqual:", v8);
  v5 = v8;
  if ((v4 & 1) == 0 && self->_customBackgroundColor != v8)
  {
    v6 = (UIColor *)-[UIColor copy](v8, "copy");
    customBackgroundColor = self->_customBackgroundColor;
    self->_customBackgroundColor = v6;

    -[PGCABackdropLayerView updateEffects](self, "updateEffects");
    v5 = v8;
  }

}

- (void)updateEffects
{
  int64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v3 = -[PGCABackdropLayerView _preferredEffect](self, "_preferredEffect");
  -[PGCABackdropLayerView _preferredBackgroundColor](self, "_preferredBackgroundColor");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3 == 1)
    v5 = 0.25;
  else
    v5 = 0.0;
  v27 = (id)v4;
  if (v3 == 1)
  {
    +[PGCABackdropLayerView materialFilters](PGCABackdropLayerView, "materialFilters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (-[PGCABackdropLayerView _isCaptureOnly](self, "_isCaptureOnly"))
  {
    -[PGCABackdropLayerView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCABackdropLayerView setHidden:](self, "setHidden:", objc_msgSend(v7, "isEnabled") ^ 1);
  }
  else
  {
    -[UIView PG_backdropGroupLeader](self, "PG_backdropGroupLeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCABackdropLayerView setGroupLeader:](self, "setGroupLeader:", v8);

    if (v3 == 1)
    {
      -[PGCABackdropLayerView groupLeader](self, "groupLeader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[PGCABackdropLayerView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groupName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v12 && (objc_msgSend(v7, "isEqualToString:", v12) & 1) == 0)
    {
      -[PGCABackdropLayerView layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setGroupName:", v7);

    }
  }

  -[PGCABackdropLayerView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  if (v16 != v5)
  {
    -[PGCABackdropLayerView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setScale:", v5);

  }
  -[PGCABackdropLayerView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToArray:", v6);

  if ((v20 & 1) == 0)
  {
    -[PGCABackdropLayerView layer](self, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFilters:", v6);

  }
  -[PGCABackdropLayerView layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEnabled");

  if ((v3 == 1) != v23)
  {
    -[PGCABackdropLayerView layer](self, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setEnabled:", v3 == 1);

  }
  -[PGCABackdropLayerView backgroundColor](self, "backgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqual:", v25))
  {

  }
  else
  {
    -[PGCABackdropLayerView backgroundColor](self, "backgroundColor");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (v27 != v26)
      -[PGCABackdropLayerView setBackgroundColor:](self, "setBackgroundColor:", v27);
  }

}

- (int64_t)_preferredEffect
{
  void *v4;

  if (-[PGCABackdropLayerView _isCaptureOnly](self, "_isCaptureOnly"))
    return -[PGCABackdropLayerView _hasAnyDependentsThatWantsCapturedBlur](self, "_hasAnyDependentsThatWantsCapturedBlur");
  -[PGCABackdropLayerView customBackgroundColor](self, "customBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  if (UIAccessibilityIsReduceTransparencyEnabled())
    return 2;
  return 1;
}

- (id)_preferredBackgroundColor
{
  int64_t v3;
  void *v4;

  if (-[PGCABackdropLayerView _isCaptureOnly](self, "_isCaptureOnly"))
    goto LABEL_5;
  v3 = -[PGCABackdropLayerView _preferredEffect](self, "_preferredEffect");
  if (v3 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "reducedTransparencyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (v3)
  {
LABEL_5:
    v4 = 0;
  }
  else
  {
    -[PGCABackdropLayerView customBackgroundColor](self, "customBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_wantsCapturedBlur
{
  return -[PGCABackdropLayerView _preferredEffect](self, "_preferredEffect") == 1
      && -[UIView PG_preferredVisibilityForView:](self, "PG_preferredVisibilityForView:", self);
}

- (BOOL)_isCaptureOnly
{
  void *v2;
  char v3;

  -[PGCABackdropLayerView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "captureOnly");

  return v3;
}

- (void)setGroupLeader:(id)a3
{
  BOOL v5;
  PGCABackdropLayerView *v6;
  PGCABackdropLayerView *WeakRetained;
  PGCABackdropLayerView *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PGCABackdropLayerView *obj;

  obj = (PGCABackdropLayerView *)a3;
  v5 = -[PGCABackdropLayerView _isCaptureOnly](obj, "_isCaptureOnly");
  v6 = obj;
  if (obj && !v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGCABackdropLayerView.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[groupLeader _isCaptureOnly] || groupLeader == nil"));

    v6 = obj;
  }
  if (v6 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("PGCABackdropLayerView.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupLeader != self"));

  }
  WeakRetained = (PGCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);

  v8 = obj;
  if (WeakRetained != obj)
  {
    v9 = objc_loadWeakRetained((id *)&self->_groupLeader);
    objc_msgSend(v9, "_removeDependent:", self);

    v10 = objc_storeWeak((id *)&self->_groupLeader, obj);
    -[PGCABackdropLayerView _addDependent:](obj, "_addDependent:", self);

    v8 = obj;
  }

}

- (BOOL)_hasAnyDependentsThatWantsCapturedBlur
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PGCABackdropLayerView__hasAnyDependentsThatWantsCapturedBlur__block_invoke;
  v4[3] = &unk_1E622FD68;
  v4[4] = &v5;
  -[PGCABackdropLayerView _enumerateDependents:](self, "_enumerateDependents:", v4);
  v2 = v6[3] > 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __63__PGCABackdropLayerView__hasAnyDependentsThatWantsCapturedBlur__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_wantsCapturedBlur");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_addDependent:(id)a3
{
  id v4;

  v4 = a3;
  -[PGCABackdropLayerView _ensureDependents](self, "_ensureDependents");
  -[NSHashTable addObject:](self->_dependents, "addObject:", v4);

}

- (void)_removeDependent:(id)a3
{
  -[NSHashTable removeObject:](self->_dependents, "removeObject:", a3);
  -[PGCABackdropLayerView updateEffects](self, "updateEffects");
}

- (void)_ensureDependents
{
  NSHashTable *v3;
  NSHashTable *dependents;

  if (!self->_dependents)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    dependents = self->_dependents;
    self->_dependents = v3;

  }
}

- (void)_enumerateDependents:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSHashTable copy](self->_dependents, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)_isTransparentOrHasTransparentAncestor
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  -[PGCABackdropLayerView alpha](self, "alpha");
  v4 = v3;
  -[PGCABackdropLayerView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (v5)
  {
    if (v4 <= 0.0)
      break;
    v6 = v5;
    objc_msgSend(v5, "alpha");
    if (v4 >= v7)
      v4 = v7;
    objc_msgSend(v5, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4 == 0.0;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (PGCABackdropLayerView)groupLeader
{
  return (PGCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);
}

- (NSHashTable)dependents
{
  return self->_dependents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_destroyWeak((id *)&self->_groupLeader);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
}

@end
