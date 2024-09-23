@implementation _UIBarCustomizationItem

- (_UIBarCustomizationItem)init
{
  _UIBarCustomizationItem *v2;
  _UIBarCustomizationItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBarCustomizationItem;
  v2 = -[_UIBarCustomizationItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIBarCustomizationItem setCollapsible:](v2, "setCollapsible:", 1);
    -[_UIBarCustomizationItem setRemovable:](v3, "setRemovable:", 1);
  }
  return v3;
}

+ (_UIBarCustomizationItem)itemWithIdentifier:(id)a3 icon:(id)a4 name:(id)a5 view:(id)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  void *v14;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = (unint64_t)a6;
  v11 = (unint64_t)a5;
  v12 = (unint64_t)a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!(v12 | v11 | v10))
    {
      __UIFaultDebugAssertLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Creating a _UIBarCustomizationItem with no visible content!", buf, 2u);
      }

    }
  }
  else if (!(v12 | v11 | v10))
  {
    v17 = itemWithIdentifier_icon_name_view____s_category;
    if (!itemWithIdentifier_icon_name_view____s_category)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&itemWithIdentifier_icon_name_view____s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Creating a _UIBarCustomizationItem with no visible content!", v19, 2u);
    }
  }
  v13 = (_QWORD *)objc_opt_new();
  v14 = (void *)v13[2];
  v13[2] = v9;

  objc_msgSend(v13, "setEnabled:", 1);
  objc_msgSend(v13, "setIcon:", v12);

  objc_msgSend(v13, "setName:", v11);
  objc_msgSend(v13, "setView:", v10);

  return (_UIBarCustomizationItem *)v13;
}

+ (id)groupWithWithIdentifier:(id)a3 icon:(id)a4 name:(id)a5 items:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int has_internal_diagnostics;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  void *v29;
  _BOOL8 v30;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[16];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v14 = objc_msgSend(v12, "count");
  if (has_internal_diagnostics)
  {
    if (!v14)
    {
      __UIFaultDebugAssertLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v32, OS_LOG_TYPE_FAULT, "Creating a group _UIBarCustomizationItem with no items!", buf, 2u);
      }

    }
  }
  else if (!v14)
  {
    v33 = groupWithWithIdentifier_icon_name_items____s_category;
    if (!groupWithWithIdentifier_icon_name_items____s_category)
    {
      v33 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v33, (unint64_t *)&groupWithWithIdentifier_icon_name_items____s_category);
    }
    v34 = *(NSObject **)(v33 + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Creating a group _UIBarCustomizationItem with no items!", buf, 2u);
    }
  }
  v15 = v11;
  v16 = v15;
  if (!objc_msgSend(v15, "length"))
  {
    v36 = v9;
    v37 = v10;
    v16 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v35 = v12;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");

          if (v24)
          {
            if (objc_msgSend(v16, "length"))
              objc_msgSend(v16, "appendString:", CFSTR(", "));
            objc_msgSend(v22, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendString:", v25);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v19);
    }

    v9 = v36;
    v10 = v37;
    v12 = v35;
  }
  v26 = (_QWORD *)objc_opt_new();
  v27 = (void *)v26[2];
  v26[2] = v9;
  v28 = v9;

  v29 = (void *)v26[8];
  v26[8] = v12;

  if (v10)
    v30 = 1;
  else
    v30 = objc_msgSend(v15, "length") != 0;
  objc_msgSend(v26, "setCollapsible:", v30);
  objc_msgSend(v26, "setEnabled:", 1);
  objc_msgSend(v26, "setIcon:", v10);
  objc_msgSend(v26, "setName:", v16);

  return v26;
}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[_UIBarCustomizationItem collapsible](self, "collapsible"))
  {
    if (self->_collapsed != v3)
      self->_collapsed = v3;
  }
}

- (CGRect)_sourceFrameInContainer:(id)a3
{
  id v4;
  __int128 v5;
  id v6;
  void (**v7)(void *, _UIBarCustomizationItem *);
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  CGRect result;

  v4 = a3;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x4010000000;
  v27 = &unk_18685B0AF;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v28 = *MEMORY[0x1E0C9D628];
  v29 = v5;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __51___UIBarCustomizationItem__sourceFrameInContainer___block_invoke;
  v21 = &unk_1E16D56E0;
  v6 = v4;
  v22 = v6;
  v23 = &v24;
  v7 = (void (**)(void *, _UIBarCustomizationItem *))_Block_copy(&v18);
  if (-[_UIBarCustomizationItem collapsed](self, "collapsed", v18, v19, v20, v21)
    || (-[_UIBarCustomizationItem subitems](self, "subitems"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        !v9))
  {
    v7[2](v7, self);
  }
  else
  {
    -[_UIBarCustomizationItem _enumerateSubitemsWithBlock:](self, "_enumerateSubitemsWithBlock:", v7);
  }
  v10 = v25[4];
  v11 = v25[5];
  v12 = v25[6];
  v13 = v25[7];

  _Block_object_dispose(&v24, 8);
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_enumerateSubitemsWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[_UIBarCustomizationItem reverseItemsForRTL](self, "reverseItemsForRTL"))
    v5 = 2;
  else
    v5 = 0;
  -[_UIBarCustomizationItem subitems](self, "subitems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55___UIBarCustomizationItem__enumerateSubitemsWithBlock___block_invoke;
  v8[3] = &unk_1E16D5708;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", v5, v8);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[_UIBarCustomizationItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIBarCustomizationItem icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("; icon = <%@: %p"), objc_opt_class(), v7);
    if (objc_msgSend(v7, "isSymbolImage"))
    {
      _UIImageName(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("; symbol = (%@)"), v8);

    }
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  }
  -[_UIBarCustomizationItem name](self, "name");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    objc_msgSend(v6, "appendFormat:", CFSTR("; name = %@"), v9);
  -[_UIBarCustomizationItem view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "appendFormat:", CFSTR("; view = <%@: %p>"), objc_opt_class(), v11);
  -[_UIBarCustomizationItem subitems](self, "subitems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; subitems = <%@: %p>"), objc_opt_class(), v12);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)sourceViewProvider
{
  return self->_sourceViewProvider;
}

- (void)setSourceViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (BOOL)removable
{
  return self->_removable;
}

- (void)setRemovable:(BOOL)a3
{
  self->_removable = a3;
}

- (BOOL)collapsible
{
  return self->_collapsible;
}

- (void)setCollapsible:(BOOL)a3
{
  self->_collapsible = a3;
}

- (_UIBarCustomizationChiclet)_chiclet
{
  return self->__chiclet;
}

- (void)set_chiclet:(id)a3
{
  objc_storeStrong((id *)&self->__chiclet, a3);
}

- (BOOL)reverseItemsForRTL
{
  return self->_reverseItemsForRTL;
}

- (void)setReverseItemsForRTL:(BOOL)a3
{
  self->_reverseItemsForRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__chiclet, 0);
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong(&self->_sourceViewProvider, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
