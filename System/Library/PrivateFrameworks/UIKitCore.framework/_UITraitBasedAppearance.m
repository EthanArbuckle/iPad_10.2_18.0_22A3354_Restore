@implementation _UITraitBasedAppearance

+ (BOOL)_hasAnyCustomizations
{
  return _didCreateTraitBasedAppearanceNode;
}

+ (void)_setHasAnyCustomizations
{
  _didCreateTraitBasedAppearanceNode = 1;
}

+ (BOOL)_hasCustomizationsForTraitCollection:(id)a3 class:(Class)a4 guideClass:(Class)a5
{
  int v8;
  void *v9;
  void *v10;

  v8 = objc_msgSend(a1, "_hasAnyCustomizations");
  if (v8)
  {
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "_rootAppearancesNode");
    v10 = (void *)existingAppearancesNodeInNodeForClass(v9, +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", a4, a5));
    LOBYTE(v8) = _recursiveExamineAppearancesForTraitCollections(v10, (uint64_t)a3);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITraitBasedAppearance;
  -[_UIAppearance dealloc](&v3, sel_dealloc);
}

+ (id)_appearanceForTraitCollection:(id)a3 forClass:(Class)a4 withContainerList:(id)a5
{
  void (*v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  void *v12;
  _QWORD *v13;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return +[_UIAppearance _appearanceForClass:withContainerList:](_UIAppearance, "_appearanceForClass:withContainerList:", a4, a5);
  v10 = -[UITraitCollection _traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified]((uint64_t)a3);
  if (v10)
  {
    v15 = v10;
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIAppearance.m"), 1937, CFSTR("Invalid trait collection for appearance customization, as it contains non-default values for the following traits that cannot represent unspecified values: %@"), objc_msgSend(v15, "_traitsDescription"));
    }
    else if (os_variant_has_internal_diagnostics())
    {
      v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = objc_msgSend(v15, "_traitsDescription");
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Invalid trait collection for appearance customization, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
      }
    }
    else
    {
      v16 = _appearanceForTraitCollection_forClass_withContainerList____s_category;
      if (!_appearanceForTraitCollection_forClass_withContainerList____s_category)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&_appearanceForTraitCollection_forClass_withContainerList____s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = objc_msgSend(v15, "_traitsDescription");
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Invalid trait collection for appearance customization, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
      }
    }
  }
  v11 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", a4, 0);
  v12 = (void *)objc_msgSend(a1, "_appearanceNodeForClassInfo:containerList:", v11, a5);
  v13 = (_QWORD *)objc_msgSend(v12, "objectForKey:", a3);
  if (!v13)
  {
    v13 = (_QWORD *)objc_msgSend(a1, "_newAppearanceWithClassInfo:containerList:", v11, a5);
    v13[5] = a3;
    objc_msgSend(v12, "setObject:forKey:", v13, a3);
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_UIAppearanceHasExtendedAppearancesKey"));
    objc_msgSend(a1, "_setHasAnyCustomizations");
  }
  return v13;
}

- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:](objc_msgSend(a3, "_appearanceTraitCollection"), (uint64_t)self->_traitCollection);
}

- (void)_invalidateAppearanceInWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITraitBasedAppearance;
  -[_UIAppearance _invalidateAppearanceInWindow:](&v5, sel__invalidateAppearanceInWindow_);
  objc_msgSend(a3, "_invalidateAppearanceForTraitCollection:", -[_UITraitBasedAppearance _traitCollection](self, "_traitCollection"));
}

- (id)_traitCollection
{
  return self->_traitCollection;
}

@end
