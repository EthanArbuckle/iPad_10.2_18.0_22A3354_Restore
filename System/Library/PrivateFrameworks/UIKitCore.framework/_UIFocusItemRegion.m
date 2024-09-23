@implementation _UIFocusItemRegion

- (_UIFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_UIFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](self, "initWithFrame:coordinateSpace:item:focusSystem:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 item:(id)a5 focusSystem:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _UIFocusItemRegion *v15;
  _UIFocusItemRegion *v16;
  _UIFocusItemRegion *v17;
  id v18;
  id v19;
  char IsEligibleForFocusOcclusion;
  int v21;
  int *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  char v31;
  char v32;
  __CFString *v34;
  void *v35;
  id v36;
  objc_class *v37;
  void *v38;
  objc_super v39;
  unsigned __int8 v40;
  uint8_t buf[4];
  __CFString *v42;
  uint64_t v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v39.receiver = self;
  v39.super_class = (Class)_UIFocusItemRegion;
  v15 = -[_UIFocusRegion initWithFrame:coordinateSpace:](&v39, sel_initWithFrame_coordinateSpace_, a4, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    v17 = v15;
    v18 = v13;
    v19 = v14;
    objc_storeWeak((id *)&v17->_item, v18);
    v40 = 0;
    if (v18)
    {
      IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v18, &v40);
      v21 = v40;
    }
    else
    {
      v21 = 0;
      IsEligibleForFocusOcclusion = 0;
    }
    v22 = &OBJC_IVAR___UIFieldBehavior__fieldFlags;
    *(_BYTE *)&v17->_flags = *(_BYTE *)&v17->_flags & 0xFE | IsEligibleForFocusOcclusion;
    if (!v19 && v21)
    {
      +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          if (v19)
          {
            v35 = (void *)MEMORY[0x1E0CB3940];
            v36 = v19;
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("<%@: %p>"), v38, v36);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v34 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 138412290;
          v42 = v34;
          _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "_UIFocusItemRegion got called with a nil focus system. Inferring focus system found %@", buf, 0xCu);

          v22 = &OBJC_IVAR___UIFieldBehavior__fieldFlags;
        }
      }
      else
      {
        v23 = _CommonInit___s_category;
        if (!_CommonInit___s_category)
        {
          v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v23, (unint64_t *)&_CommonInit___s_category);
        }
        v24 = *(id *)(v23 + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          if (v19)
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            v26 = v19;
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v26);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v22 = &OBJC_IVAR___UIFieldBehavior__fieldFlags;
          }
          else
          {
            v29 = CFSTR("(nil)");
          }
          *(_DWORD *)buf = 138412290;
          v42 = v29;
          _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "_UIFocusItemRegion got called with a nil focus system. Inferring focus system found %@", buf, 0xCu);

        }
      }

      v21 = v40;
    }
    if (v21)
    {
      if (_UIFocusItemCanBecomeFocused(v18, v19))
        LOBYTE(v21) = 2;
      else
        LOBYTE(v21) = 0;
    }
    *((_BYTE *)&v17->super.super.isa + v22[288]) = *((_BYTE *)&v17->super.super.isa + v22[288]) & 0xFD | v21;
    v30 = v22[288];
    v31 = *((_BYTE *)&v17->super.super.isa + v30);
    if ((v31 & 2) != 0)
    {
      v32 = 0;
    }
    else
    {
      if (_UIFocusItemIsTransparentFocusItem(v18))
        v32 = 4;
      else
        v32 = 0;
      v30 = v22[288];
      v31 = *((_BYTE *)&v17->super.super.isa + v30);
    }
    *((_BYTE *)&v17->super.super.isa + v30) = v31 & 0xFB | v32;

  }
  return v16;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  uint64_t v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusItemRegion;
  -[_UIFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_storeWeak((id *)(v5 + 56), WeakRetained);

  *($4C59EE55ECBB4E4B9AB7F9871DE0ED47 *)(v5 + 48) = self->_flags;
  return (id)v5;
}

- (id)_descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFocusItemRegion;
  -[_UIFocusRegion _descriptionBuilder](&v9, sel__descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusItemRegion item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", CFSTR("item"), v4, 1);

  v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("focusable"), (*(_BYTE *)&self->_flags >> 1) & 1);
  v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("transparent"), (*(_BYTE *)&self->_flags >> 2) & 1);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusItemRegion;
  if (-[_UIFocusRegion isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    v7 = objc_loadWeakRetained(v5 + 7);
    v8 = WeakRetained;
    v9 = v7;
    v10 = v9;
    if (v8 != v9)
    {
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

      }
      else
      {
        v13 = objc_msgSend(v8, "isEqual:", v9);

        if (v13)
          goto LABEL_12;
      }
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }

LABEL_12:
    v12 = ((*((_BYTE *)v5 + 48) ^ *(_BYTE *)&self->_flags) & 3) == 0
       && ((*((_BYTE *)v5 + 48) ^ *(_BYTE *)&self->_flags) & 4) == 0;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_canOccludeRegionsBelow
{
  return (*(_BYTE *)&self->_flags & 5) == 1;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  BOOL v2;
  void *v3;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return 0;
  -[_UIFocusItemRegion item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (id)_defaultFocusItem
{
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return 0;
  -[_UIFocusItemRegion item](self, "item");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_focusableBoundaries
{
  void *v2;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return 0;
  -[_UIFocusItemRegion item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  if (dyld_program_sdk_at_least())
    return 32;
  return 16;
}

- (int64_t)_preferredDistanceComparisonType
{
  objc_super v4;

  if (!dyld_program_sdk_at_least())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusItemRegion;
  return -[_UIFocusRegion _preferredDistanceComparisonType](&v4, sel__preferredDistanceComparisonType);
}

- (id)_debugAssociatedObject
{
  return objc_loadWeakRetained((id *)&self->_item);
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  void *v4;

  v4 = -[_UIFocusItemRegion _focusableBoundaries](self, "_focusableBoundaries", a3);
  if (v4)
  {
    +[_UIFocusRegionDebugDrawingConfiguration itemConfigurationForRegion:](_UIFocusRegionDebugDrawingConfiguration, "itemConfigurationForRegion:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (UIFocusItem)item
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
}

@end
