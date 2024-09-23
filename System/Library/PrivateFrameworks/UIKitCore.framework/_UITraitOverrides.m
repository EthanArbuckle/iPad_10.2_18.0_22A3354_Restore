@implementation _UITraitOverrides

- (void)_traitCollectionByApplyingOverridesToTraitCollection:(void *)a1
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__traitCollectionByApplyingOverridesToTraitCollection_, a1, CFSTR("_UITraitOverrides.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseTraitCollection != nil"));

    }
    -[_UITraitOverrides _traitCollectionByApplyingAllOverridesToTraitCollection:withOverrides:defaultValueOverrides:]((uint64_t)a1, v4, a1[1], a1[2]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)_traitCollectionByApplyingAllOverridesToTraitCollection:(void *)a3 withOverrides:(void *)a4 defaultValueOverrides:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v11, v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v12;
    }
    -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v10, (uint64_t)v8, (uint64_t)v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v14, v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_QWORD)_overridesAppliedBefore
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      v3 = -[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], a1);
      v4 = (void *)v1[5];
      v1[5] = v3;

      v2 = (void *)v1[5];
    }
    a1 = v2;
  }
  return a1;
}

- (void)_removeTraitToken:(id)a3
{
  const __CFNumber *v4;
  _UITraitTokenSet *defaultValueOverrides;
  unint64_t v6;
  uint64_t v7;
  _UITraitTokenSet *v8;
  UITraitCollection *overrides;
  _BOOL4 v10;
  const __CFNumber *v11;
  void *v12;
  const __CFNumber *v13;

  v4 = (const __CFNumber *)a3;
  defaultValueOverrides = self->_defaultValueOverrides;
  v13 = v4;
  if (defaultValueOverrides)
  {
    v6 = _UIGetTraitTokenValue(v4);
    if (_UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v6))
    {
      -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v13);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (_UITraitTokenSet *)v7;
      overrides = self->_overrides;
LABEL_6:
      v12 = (void *)v7;
      -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, overrides, v8);

      v11 = v13;
      goto LABEL_7;
    }
  }
  v10 = -[UITraitCollection _isTraitTokenSpecified:](self->_overrides, "_isTraitTokenSpecified:", v13);
  v11 = v13;
  if (v10)
  {
    -[UITraitCollection _traitCollectionByRemovingTraitToken:](self->_overrides, "_traitCollectionByRemovingTraitToken:", v13);
    v7 = objc_claimAutoreleasedReturnValue();
    overrides = (UITraitCollection *)v7;
    v8 = self->_defaultValueOverrides;
    goto LABEL_6;
  }
LABEL_7:

}

- (_QWORD)initWithDelegate:(_QWORD *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_UITraitOverrides;
    v4 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v4;
    if (v4)
    {
      -[_UITraitOverrides _setDelegate:]((uint64_t)v4, v3);
      +[UITraitCollection _emptyTraitCollection]();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[1];
      a1[1] = v5;

      +[_UITraitTokenSet emptySet]();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)a1[2];
      a1[2] = v7;

    }
  }

  return a1;
}

- (void)_setDelegate:(uint64_t)a1
{
  id WeakRetained;
  id obj;

  obj = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 32), obj);
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a1 + 24) & 0xFE | objc_opt_respondsToSelector() & 1;
    }
  }

}

- (void)_setNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  UITraitCollection *v6;
  _UITraitTokenSet *v7;
  _UITraitTokenSet *defaultValueOverrides;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _UITraitTokenSet *v14;
  uint64_t v15;
  const __CFNumber *v16;

  v16 = (const __CFNumber *)a4;
  v6 = self->_overrides;
  v7 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    v9 = _UIGetTraitTokenValue(v16);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v9);
  }
  +[UITraitCollection _emptyTraitCollection]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_valueForNSIntegerTraitToken:", v16);

  if ((_DWORD)defaultValueOverrides && v11 != a3)
  {
    -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v16);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (_UITraitTokenSet *)v12;

    v7 = v14;
    goto LABEL_12;
  }
  if (v11 == a3)
    v13 = (char)defaultValueOverrides;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
  {
    -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  if (-[UITraitCollection _valueForNSIntegerTraitToken:](self->_overrides, "_valueForNSIntegerTraitToken:", v16) != a3)
  {
    -[UITraitCollection _traitCollectionByReplacingNSIntegerValue:forTraitToken:](self->_overrides, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", a3, v16);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (UITraitCollection *)v15;
  }
  if (v6 != self->_overrides || v7 != self->_defaultValueOverrides)
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6, v7);

}

- (void)_setOverrideTraitCollection:(void *)a3 defaultValueOverrides:
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __71___UITraitOverrides__setOverrideTraitCollection_defaultValueOverrides___block_invoke;
      v9[3] = &unk_1E16E0950;
      v9[4] = a1;
      v10 = v6;
      v11 = v7;
      objc_msgSend(WeakRetained, "_traitOverridesWillChange:withApplicator:", a1, v9);

    }
    objc_storeStrong((id *)(a1 + 8), a2);
    objc_storeStrong((id *)(a1 + 16), a3);
    objc_msgSend(WeakRetained, "_traitOverridesDidChange:", a1);

  }
}

- (void)_traitOverridesWillChange:(id)a3 withApplicator:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  _UITraitOverrides *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62___UITraitOverrides__traitOverridesWillChange_withApplicator___block_invoke;
    v9[3] = &unk_1E16E0928;
    v10 = v6;
    v11 = self;
    v12 = v7;
    objc_msgSend(WeakRetained, "_traitOverridesWillChange:withApplicator:", self, v9);

  }
}

- (void)_setCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  UITraitCollection *v6;
  _UITraitTokenSet *v7;
  _UITraitTokenSet *defaultValueOverrides;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  char v14;
  _UITraitTokenSet *v15;
  double v16;
  uint64_t v17;
  const __CFNumber *v18;

  v18 = (const __CFNumber *)a4;
  v6 = self->_overrides;
  v7 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    v9 = _UIGetTraitTokenValue(v18);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v9);
  }
  +[UITraitCollection _emptyTraitCollection]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_valueForCGFloatTraitToken:", v18);
  v12 = v11;

  if ((_DWORD)defaultValueOverrides && v12 != a3)
  {
    -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v18);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = (_UITraitTokenSet *)v13;

    v7 = v15;
    goto LABEL_12;
  }
  if (v12 == a3)
    v14 = (char)defaultValueOverrides;
  else
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v18);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  -[UITraitCollection _valueForCGFloatTraitToken:](self->_overrides, "_valueForCGFloatTraitToken:", v18);
  if (v16 != a3)
  {
    -[UITraitCollection _traitCollectionByReplacingCGFloatValue:forTraitToken:](self->_overrides, "_traitCollectionByReplacingCGFloatValue:forTraitToken:", v18, a3);
    v17 = objc_claimAutoreleasedReturnValue();

    v6 = (UITraitCollection *)v17;
  }
  if (v6 != self->_overrides || v7 != self->_defaultValueOverrides)
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6, v7);

}

- (id)_swiftImplCopy
{
  id *v3;
  id *v4;

  v3 = (id *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], 0);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 1, self->_overrides);
    objc_storeStrong(v4 + 2, self->_defaultValueOverrides);
  }
  return v4;
}

- (_QWORD)_overridesAppliedAfter
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[6];
    if (!v2)
    {
      v3 = -[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], a1);
      v4 = (void *)v1[6];
      v1[6] = v3;

      v2 = (void *)v1[6];
    }
    a1 = v2;
  }
  return a1;
}

- (void)_traitOverridesDidChange:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_traitOverridesDidChange:", self);

}

- (void)setNSIntegerValue:(int64_t)a3 forTrait:(Class)a4
{
  id v6;

  +[UITraitCollection _traitTokenForNSIntegerTrait:]((uint64_t)UITraitCollection, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, v6);

}

- (void)setImageDynamicRange:(int64_t)a3
{
  -[_UITraitOverrides setNSIntegerValue:forTrait:](self, "setNSIntegerValue:forTrait:", a3, objc_opt_class());
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A994B0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridesAppliedAfter, 0);
  objc_storeStrong((id *)&self->_overridesAppliedBefore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultValueOverrides, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (uint64_t)_isEmpty
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  if (!a1 || a1[5] && !-[_UITraitOverrides _isEmpty]())
    return 0;
  if (a1[6] && !-[_UITraitOverrides _isEmpty]())
    return 0;
  v2 = a1[2];
  if (v2)
  {
    if (_UITraitTokenSetCount(v2 + 16))
      return 0;
  }
  v5 = (void *)a1[1];
  +[UITraitCollection _emptyTraitCollection]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {
    v3 = 1;
  }
  else
  {
    v3 = 0;
    if (v7 && v8)
      v3 = objc_msgSend(v7, "isEqual:", v8);
  }

  return v3;
}

- (BOOL)containsTrait:(Class)a3
{
  void *v4;
  BOOL v5;

  +[UITraitCollection _traitTokenOrPlaceholderForTrait:]((uint64_t)UITraitCollection, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !+[UITraitCollection _isPlaceholderTraitToken:](UITraitCollection, "_isPlaceholderTraitToken:", v4)
    && -[_UITraitOverrides _containsTraitToken:](self, "_containsTraitToken:", v4);

  return v5;
}

- (void)removeTrait:(Class)a3
{
  id v4;

  +[UITraitCollection _traitTokenOrPlaceholderForTrait:]((uint64_t)UITraitCollection, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!+[UITraitCollection _isPlaceholderTraitToken:](UITraitCollection, "_isPlaceholderTraitToken:"))
    -[_UITraitOverrides _removeTraitToken:](self, "_removeTraitToken:", v4);

}

- (int64_t)_valueForNSIntegerTraitToken:(id)a3
{
  const __CFNumber *v5;
  int64_t v6;
  void *v8;
  void *v9;

  v5 = (const __CFNumber *)a3;
  if (!-[_UITraitOverrides _containsTraitToken:](self, "_containsTraitToken:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 270, CFSTR("Can't return value for trait %@ that has no override"), v9);

  }
  v6 = -[UITraitCollection _valueForNSIntegerTraitToken:](self->_overrides, "_valueForNSIntegerTraitToken:", v5);

  return v6;
}

- (BOOL)_containsTraitToken:(id)a3
{
  const __CFNumber *v4;
  const __CFNumber *v5;
  _UITraitTokenSet *defaultValueOverrides;
  unint64_t v7;
  BOOL v8;

  v4 = (const __CFNumber *)a3;
  v5 = v4;
  defaultValueOverrides = self->_defaultValueOverrides;
  v8 = defaultValueOverrides
    && (v7 = _UIGetTraitTokenValue(v4),
        (_UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v7) & 1) != 0)
    || -[UITraitCollection _isTraitTokenSpecified:](self->_overrides, "_isTraitTokenSpecified:", v5);

  return v8;
}

- (int64_t)userInterfaceStyle
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A994B0);
}

- (void)_replaceOverrideTraitCollection:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_8;
  if (!v3)
  {
    +[UITraitCollection _emptyTraitCollection]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 && _UITraitTokenSetCount(v5 + 16))
    goto LABEL_6;
  v7 = *(id *)(a1 + 8);
  v8 = v4;
  if (v7 != v8)
  {
    if (v8 && v7)
    {
      v11 = v8;
      v9 = objc_msgSend(v7, "isEqual:", v8);

      v6 = v11;
      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
LABEL_6:
    +[_UITraitTokenSet emptySet]();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:](a1, v4, v10);

    goto LABEL_8;
  }
  v12 = v8;

LABEL_8:
  v6 = v4;
LABEL_9:

}

- (void)_replaceWithOverrides:(id)a3
{
  _UITraitOverrides *v5;
  void **v6;
  void *v7;
  UITraitCollection *v8;
  UITraitCollection *v9;
  UITraitCollection *v10;
  _BOOL4 v11;
  void *v12;
  UITraitCollection *v13;
  BOOL v14;
  void *v15;
  _UITraitOverrides *v16;

  v5 = (_UITraitOverrides *)a3;
  if (self != v5)
  {
    v16 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 153, CFSTR("Unexpected overrides class: %@"), v16);

    }
    v6 = v16;
    v7 = v6[1];
    v8 = self->_overrides;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v8 || !v9)
      {
LABEL_15:

LABEL_16:
        -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6[1], v6[2]);
LABEL_18:

        v5 = v16;
        goto LABEL_19;
      }
      v11 = -[UITraitCollection isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_16;
    }
    v12 = v6[2];
    v8 = self->_defaultValueOverrides;
    v13 = v12;
    if (v8 == v13)
    {

      goto LABEL_18;
    }
    v10 = v13;
    if (v8 && v13)
    {
      v14 = -[UITraitCollection isEqual:](v8, "isEqual:", v13);

      if (v14)
        goto LABEL_18;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_19:

}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A99588);
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A994F8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UITraitOverrides)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UITraitOverrides;
  v5 = -[_UITraitOverrides init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrides"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    if (!*((_QWORD *)v5 + 1))
    {
      +[UITraitCollection _emptyTraitCollection]();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v8;

    }
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("defaultValueOverrides"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[_UITraitTokenSet initWithNSSetRepresentation:]([_UITraitTokenSet alloc], v13);
    }
    else
    {
      +[_UITraitTokenSet emptySet]();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overridesAppliedBefore"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v16;

    -[_UITraitOverrides _setDelegate:](*((_QWORD *)v5 + 5), v5);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overridesAppliedAfter"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v18;

    -[_UITraitOverrides _setDelegate:](*((_QWORD *)v5 + 6), v5);
  }

  return (_UITraitOverrides *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  UITraitCollection *overrides;
  void *v5;
  UITraitCollection *v6;
  UITraitCollection *v7;
  UITraitCollection *v8;
  BOOL v9;
  BOOL v10;
  _UITraitTokenSet *defaultValueOverrides;
  void *v12;
  _UITraitOverrides *overridesAppliedBefore;
  _UITraitOverrides *overridesAppliedAfter;
  void *v15;
  id v16;

  v16 = a3;
  overrides = self->_overrides;
  +[UITraitCollection _emptyTraitCollection]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = overrides;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

LABEL_10:
      objc_msgSend(v16, "encodeObject:forKey:", self->_overrides, CFSTR("overrides"));
      goto LABEL_11;
    }
    v10 = -[UITraitCollection isEqual:](v6, "isEqual:", v7);

    if (!v10)
      goto LABEL_10;
  }
LABEL_11:
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides && _UITraitTokenSetCount((uint64_t)&defaultValueOverrides->_storage))
  {
    -[_UITraitTokenSet NSSetRepresentation]((uint64_t)self->_defaultValueOverrides);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("defaultValueOverrides"));

  }
  overridesAppliedBefore = self->_overridesAppliedBefore;
  if (overridesAppliedBefore)
    objc_msgSend(v16, "encodeObject:forKey:", overridesAppliedBefore, CFSTR("overridesAppliedBefore"));
  overridesAppliedAfter = self->_overridesAppliedAfter;
  v15 = v16;
  if (overridesAppliedAfter)
  {
    objc_msgSend(v16, "encodeObject:forKey:", overridesAppliedAfter, CFSTR("overridesAppliedAfter"));
    v15 = v16;
  }

}

- (double)valueForCGFloatTrait:(Class)a3
{
  void *v4;
  double v5;
  double v6;

  +[UITraitCollection _traitTokenForCGFloatTrait:]((uint64_t)UITraitCollection, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _valueForCGFloatTraitToken:](self, "_valueForCGFloatTraitToken:", v4);
  v6 = v5;

  return v6;
}

- (double)_valueForCGFloatTraitToken:(id)a3
{
  const __CFNumber *v5;
  double v6;
  double v7;
  void *v9;
  void *v10;

  v5 = (const __CFNumber *)a3;
  if (!-[_UITraitOverrides _containsTraitToken:](self, "_containsTraitToken:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 236, CFSTR("Can't return value for trait %@ that has no override"), v10);

  }
  -[UITraitCollection _valueForCGFloatTraitToken:](self->_overrides, "_valueForCGFloatTraitToken:", v5);
  v7 = v6;

  return v7;
}

- (void)setCGFloatValue:(double)a3 forTrait:(Class)a4
{
  id v6;

  +[UITraitCollection _traitTokenForCGFloatTrait:]((uint64_t)UITraitCollection, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _setCGFloatValue:forTraitToken:](self, "_setCGFloatValue:forTraitToken:", v6, a3);

}

- (int64_t)valueForNSIntegerTrait:(Class)a3
{
  void *v4;
  int64_t v5;

  +[UITraitCollection _traitTokenForNSIntegerTrait:]((uint64_t)UITraitCollection, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", v4);

  return v5;
}

- (unint64_t)valueForNSUIntegerTrait:(Class)a3
{
  void *v4;
  unint64_t v5;

  +[UITraitCollection _traitTokenForNSUIntegerTrait:]((uint64_t)UITraitCollection, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UITraitOverrides _valueForNSUIntegerTraitToken:](self, "_valueForNSUIntegerTraitToken:", v4);

  return v5;
}

- (unint64_t)_valueForNSUIntegerTraitToken:(id)a3
{
  const __CFNumber *v5;
  unint64_t v6;
  void *v8;
  void *v9;

  v5 = (const __CFNumber *)a3;
  if (!-[_UITraitOverrides _containsTraitToken:](self, "_containsTraitToken:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 306, CFSTR("Can't return value for trait %@ that has no override"), v9);

  }
  v6 = -[UITraitCollection _valueForNSUIntegerTraitToken:](self->_overrides, "_valueForNSUIntegerTraitToken:", v5);

  return v6;
}

- (void)setNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  id v6;

  +[UITraitCollection _traitTokenForNSUIntegerTrait:]((uint64_t)UITraitCollection, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _setNSUIntegerValue:forTraitToken:](self, "_setNSUIntegerValue:forTraitToken:", a3, v6);

}

- (void)_setNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  UITraitCollection *v6;
  _UITraitTokenSet *v7;
  _UITraitTokenSet *defaultValueOverrides;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _UITraitTokenSet *v14;
  uint64_t v15;
  const __CFNumber *v16;

  v16 = (const __CFNumber *)a4;
  v6 = self->_overrides;
  v7 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    v9 = _UIGetTraitTokenValue(v16);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v9);
  }
  +[UITraitCollection _emptyTraitCollection]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_valueForNSUIntegerTraitToken:", v16);

  if ((_DWORD)defaultValueOverrides && v11 != a3)
  {
    -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v16);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (_UITraitTokenSet *)v12;

    v7 = v14;
    goto LABEL_12;
  }
  if (v11 == a3)
    v13 = (char)defaultValueOverrides;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
  {
    -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  if (-[UITraitCollection _valueForNSUIntegerTraitToken:](self->_overrides, "_valueForNSUIntegerTraitToken:", v16) != a3)
  {
    -[UITraitCollection _traitCollectionByReplacingNSUIntegerValue:forTraitToken:](self->_overrides, "_traitCollectionByReplacingNSUIntegerValue:forTraitToken:", a3, v16);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (UITraitCollection *)v15;
  }
  if (v6 != self->_overrides || v7 != self->_defaultValueOverrides)
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6, v7);

}

- (id)objectForTrait:(Class)a3
{
  void *v4;
  void *v5;

  +[UITraitCollection _traitTokenForObjectTrait:]((uint64_t)UITraitCollection, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _objectForTraitToken:](self, "_objectForTraitToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_objectForTraitToken:(id)a3
{
  const __CFNumber *v5;
  void *v6;
  void *v8;
  void *v9;

  v5 = (const __CFNumber *)a3;
  if (!-[_UITraitOverrides _containsTraitToken:](self, "_containsTraitToken:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 342, CFSTR("Can't return value for trait %@ that has no override"), v9);

  }
  -[UITraitCollection _objectForTraitToken:](self->_overrides, "_objectForTraitToken:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forTrait:(Class)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[UITraitCollection _traitTokenForObjectTrait:]((uint64_t)UITraitCollection, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _setObject:forTraitToken:](self, "_setObject:forTraitToken:", v6, v7);

}

- (void)_setObject:(id)a3 forTraitToken:(id)a4
{
  id v6;
  const __CFNumber *v7;
  UITraitCollection *v8;
  _UITraitTokenSet *v9;
  _UITraitTokenSet *defaultValueOverrides;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  _UITraitTokenSet *v18;
  UITraitCollection *v19;
  UITraitCollection *v20;
  BOOL v21;
  UITraitCollection *v22;
  uint64_t v23;
  UITraitCollection *v24;

  v6 = a3;
  v7 = (const __CFNumber *)a4;
  v8 = self->_overrides;
  v9 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    v11 = _UIGetTraitTokenValue(v7);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v11);
  }
  +[UITraitCollection _emptyTraitCollection]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_objectForTraitToken:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = v14;
  if (v13 == v14)
  {
    v16 = 1;
  }
  else
  {
    v16 = 0;
    if (v14 && v13)
      v16 = objc_msgSend(v13, "isEqual:", v14);
  }

  if (!(_DWORD)defaultValueOverrides || (v16 & 1) != 0)
  {
    if (((defaultValueOverrides | v16 ^ 1) & 1) != 0)
      goto LABEL_14;
    -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v7);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v7);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (_UITraitTokenSet *)v17;

  v9 = v18;
LABEL_14:
  -[UITraitCollection _objectForTraitToken:](self->_overrides, "_objectForTraitToken:", v7);
  v19 = (UITraitCollection *)(id)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  v24 = v20;
  if (v19 == v20)
  {

    v22 = v24;
  }
  else
  {
    if (v20 && v19)
    {
      v21 = -[UITraitCollection isEqual:](v19, "isEqual:", v20);

      if (v21)
        goto LABEL_23;
    }
    else
    {

    }
    -[UITraitCollection _traitCollectionByReplacingObject:forTraitToken:](self->_overrides, "_traitCollectionByReplacingObject:forTraitToken:", v24, v7);
    v23 = objc_claimAutoreleasedReturnValue();
    v22 = v8;
    v8 = (UITraitCollection *)v23;
  }

LABEL_23:
  if (v8 != self->_overrides || v9 != self->_defaultValueOverrides)
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v8, v9);

}

- (NSObject)_environmentWrapper
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 372, CFSTR("%@ does not support -%@"), v6, v7);

  return 0;
}

- (void)_setEnvironmentWrapper:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 377, CFSTR("%@ does not support -%@"), v6, v7);

}

- (UIColor)_tintColor
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 381, CFSTR("%@ does not support -%@"), v6, v7);

  return 0;
}

- (void)_setTintColor:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitOverrides.m"), 386, CFSTR("%@ does not support -%@"), v6, v7);

}

- (int64_t)userInterfaceIdiom
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A99498);
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A99498);
}

- (int64_t)layoutDirection
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A994C8);
}

- (void)setLayoutDirection:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A994C8);
}

- (double)displayScale
{
  double result;

  -[_UITraitOverrides _valueForCGFloatTraitToken:](self, "_valueForCGFloatTraitToken:", 0x1E1A994E0);
  return result;
}

- (void)setDisplayScale:(double)a3
{
  -[_UITraitOverrides _setCGFloatValue:forTraitToken:](self, "_setCGFloatValue:forTraitToken:", 0x1E1A994E0, a3);
}

- (int64_t)horizontalSizeClass
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A994F8);
}

- (int64_t)verticalSizeClass
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A99510);
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A99510);
}

- (int64_t)forceTouchCapability
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A99528);
}

- (void)setForceTouchCapability:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A99528);
}

- (NSString)preferredContentSizeCategory
{
  return (NSString *)-[_UITraitOverrides _objectForTraitToken:](self, "_objectForTraitToken:", 0x1E1A99540);
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  -[_UITraitOverrides _setObject:forTraitToken:](self, "_setObject:forTraitToken:", a3, 0x1E1A99540);
}

- (int64_t)displayGamut
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A99558);
}

- (void)setDisplayGamut:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A99558);
}

- (int64_t)accessibilityContrast
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A99570);
}

- (void)setAccessibilityContrast:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A99570);
}

- (int64_t)userInterfaceLevel
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A99588);
}

- (int64_t)legibilityWeight
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A995A0);
}

- (void)setLegibilityWeight:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A995A0);
}

- (int64_t)activeAppearance
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A995B8);
}

- (void)setActiveAppearance:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A995B8);
}

- (int64_t)toolbarItemPresentationSize
{
  return -[_UITraitOverrides _valueForNSIntegerTraitToken:](self, "_valueForNSIntegerTraitToken:", 0x1E1A995D0);
}

- (void)setToolbarItemPresentationSize:(int64_t)a3
{
  -[_UITraitOverrides _setNSIntegerValue:forTraitToken:](self, "_setNSIntegerValue:forTraitToken:", a3, 0x1E1A995D0);
}

- (NSString)typesettingLanguage
{
  void *v3;
  void *v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides objectForTrait:](self, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setTypesettingLanguage:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides setObject:forTrait:](self, "setObject:forTrait:", v5, v4);

}

- (int64_t)imageDynamicRange
{
  return -[_UITraitOverrides valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_class());
}

- (int64_t)sceneCaptureState
{
  return -[_UITraitOverrides valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_class());
}

- (void)setSceneCaptureState:(int64_t)a3
{
  -[_UITraitOverrides setNSIntegerValue:forTrait:](self, "setNSIntegerValue:forTrait:", a3, objc_opt_class());
}

- (int64_t)listEnvironment
{
  return -[_UITraitOverrides valueForNSIntegerTrait:](self, "valueForNSIntegerTrait:", objc_opt_class());
}

- (void)setListEnvironment:(int64_t)a3
{
  -[_UITraitOverrides setNSIntegerValue:forTrait:](self, "setNSIntegerValue:forTrait:", a3, objc_opt_class());
}

- (double)_typesettingLanguageAwareLineHeightRatio
{
  void *v3;
  double v4;
  double v5;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides valueForCGFloatTrait:](self, "valueForCGFloatTrait:", v3);
  v5 = v4;

  return v5;
}

- (void)_setTypesettingLanguageAwareLineHeightRatio:(double)a3
{
  id v5;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides setCGFloatValue:forTrait:](self, "setCGFloatValue:forTrait:", v5, a3);

}

- (BOOL)isEqual:(id)a3
{
  _UITraitOverrides *v4;
  _UITraitOverrides *v5;
  _UITraitOverrides *v6;
  _UITraitOverrides *overridesAppliedBefore;
  _UITraitOverrides *v8;
  _UITraitOverrides *v9;
  _UITraitOverrides *v10;
  int v11;
  int v12;
  char v13;
  BOOL v14;
  _UITraitOverrides *overridesAppliedAfter;
  _UITraitOverrides *v16;
  _UITraitOverrides *v17;
  int v18;
  int v19;
  _UITraitOverrides *v20;
  _UITraitOverrides *v21;
  _BOOL4 v22;

  v4 = (_UITraitOverrides *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!-[UITraitCollection isEqual:](self->_overrides, "isEqual:", v6->_overrides)
          || !-[_UITraitTokenSet isEqual:](self->_defaultValueOverrides, "isEqual:", v6->_defaultValueOverrides))
        {
          goto LABEL_29;
        }
        overridesAppliedBefore = v6->_overridesAppliedBefore;
        v8 = self->_overridesAppliedBefore;
        v9 = overridesAppliedBefore;
        v10 = v9;
        if (v8)
        {
          v11 = -[_UITraitOverrides _isEmpty](v8) ^ 1;
          if (v10)
          {
LABEL_8:
            v12 = -[_UITraitOverrides _isEmpty](v10) ^ 1;
            goto LABEL_13;
          }
        }
        else
        {
          v11 = 0;
          if (v9)
            goto LABEL_8;
        }
        v12 = 0;
LABEL_13:
        if (((v11 | v12) & 1) != 0)
        {
          if (v8)
          {
            v14 = -[_UITraitOverrides isEqual:](v8, "isEqual:", v10);

            if (!v14)
              goto LABEL_29;
          }
          else
          {
            v22 = -[_UITraitOverrides isEqual:](v10, "isEqual:", 0);

            if (!v22)
            {
LABEL_29:
              v13 = 0;
LABEL_30:

              goto LABEL_31;
            }
          }
        }
        else
        {

        }
        overridesAppliedAfter = v6->_overridesAppliedAfter;
        v16 = self->_overridesAppliedAfter;
        v17 = overridesAppliedAfter;
        if (v16)
          v18 = -[_UITraitOverrides _isEmpty](v16) ^ 1;
        else
          v18 = 0;
        if (v17)
          v19 = -[_UITraitOverrides _isEmpty](v17) ^ 1;
        else
          v19 = 0;
        if ((v18 | v19) == 1)
        {
          if (v16)
          {
            v20 = v16;
            v21 = v17;
          }
          else
          {
            v20 = v17;
            v21 = 0;
          }
          v13 = -[_UITraitOverrides isEqual:](v20, "isEqual:", v21);
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_30;
      }
    }
    v13 = 0;
  }
LABEL_31:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UITraitCollection hash](self->_overrides, "hash");
  return -[_UITraitTokenSet hash](self->_defaultValueOverrides, "hash") ^ v3;
}

- (id)_overridesDescriptionMatching:(int)a3 includingInternalOverrides:(char)a4 isNested:
{
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  int8x16_t *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  const __CFNumber *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v40;
  int v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a1)
  {
    v8 = 0;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v9 = *(_QWORD **)(a1 + 40);
    if (v9)
    {
      if ((-[_UITraitOverrides _isEmpty](v9) & 1) == 0)
      {
        -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:](*(_QWORD *)(a1 + 40), v7, 1, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length") || objc_msgSend(v10, "length"))
          objc_msgSend(v8, "appendFormat:", CFSTR("overridesAppliedBefore = %@"), v10);

      }
    }
  }
  v44 = v7;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 8);
  +[UITraitCollection _emptyTraitCollection]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v13;
  if (v14 == v15)
  {

LABEL_19:
    goto LABEL_20;
  }
  v16 = v15;
  if (!v14 || !v15)
  {

    goto LABEL_16;
  }
  v17 = objc_msgSend(v14, "isEqual:", v15);

  if ((v17 & 1) == 0)
  {
LABEL_16:
    objc_msgSend(*(id *)(a1 + 8), "_traitsDescriptionMatching:", v44);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "length") || objc_msgSend(v14, "length"))
      objc_msgSend(v11, "appendString:", v14);
    goto LABEL_19;
  }
LABEL_20:
  v18 = *(_QWORD *)(a1 + 16);
  v19 = v44;
  v20 = v44;
  if (v18)
  {
    v20 = v44;
    if (_UITraitTokenSetCount(v18 + 16))
    {
      v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v22 = *(_QWORD *)(a1 + 16);
      v42 = v8;
      v43 = v7;
      v41 = a3;
      v40 = v11;
      if (v22)
        v23 = _UITraitTokenSetCount(v22 + 16);
      else
        v23 = 0;
      v24 = (void *)objc_msgSend(v21, "initWithCapacity:", v23);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v25 = *(id *)(a1 + 16);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v46 != v28)
              objc_enumerationMutation(v25);
            v30 = *(const __CFNumber **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_self();
            v52 = 0;
            v50 = 0u;
            v51 = 0u;
            v49 = 0u;
            _UIGetTraitMetadata(v30, 0, (uint64_t)&v49);
            v31 = (id)v50;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = (defaultValue)"), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v32);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v27);
      }

      v19 = v44;
      v20 = v44;
      a3 = v41;
      if (objc_msgSend(v44, "length"))
      {
        objc_msgSend(v44, "lowercaseString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)MEMORY[0x1E0CB3880];
        *(_QWORD *)&v49 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v49 + 1) = 3221225472;
        *(_QWORD *)&v50 = __54___UITraitOverrides__rawOverridesDescriptionMatching___block_invoke;
        *((_QWORD *)&v50 + 1) = &unk_1E16CD0E8;
        v20 = v33;
        *(_QWORD *)&v51 = v20;
        objc_msgSend(v34, "predicateWithBlock:", &v49);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "filterUsingPredicate:", v35);

      }
      v8 = v42;
      v7 = v43;
      v11 = v40;
      if (objc_msgSend(v24, "count"))
      {
        if (objc_msgSend(v40, "length"))
          objc_msgSend(v40, "appendString:", CFSTR(", "));
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "appendString:", v36);

      }
    }
  }

  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v8, "appendString:", CFSTR("; "));
    if ((a4 & 1) == 0)
      objc_msgSend(v8, "appendString:", CFSTR("overrides = "));
    objc_msgSend(v8, "appendFormat:", CFSTR("{ %@ }"), v11);
  }
  if (a3)
  {
    v37 = *(_QWORD **)(a1 + 48);
    if (v37)
    {
      if ((-[_UITraitOverrides _isEmpty](v37) & 1) == 0)
      {
        -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:](*(_QWORD *)(a1 + 48), v19, 1, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "length") || objc_msgSend(v38, "length"))
        {
          if (objc_msgSend(v8, "length"))
            objc_msgSend(v8, "appendString:", CFSTR("; "));
          objc_msgSend(v8, "appendFormat:", CFSTR("overridesAppliedAfter = %@"), v38);
        }

      }
    }
  }

LABEL_54:
  return v8;
}

- (id)_traitOverridesDescriptionMatching:(id)a1
{
  id v2;
  id v3;
  int has_internal_diagnostics;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:]((uint64_t)v2, v3, has_internal_diagnostics, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_description
{
  __CFString *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:]((uint64_t)self, 0, 1, 0);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("no overrides");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v6, self, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  int has_internal_diagnostics;
  __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:]((uint64_t)self, 0, has_internal_diagnostics, 0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("no overrides");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

@end
