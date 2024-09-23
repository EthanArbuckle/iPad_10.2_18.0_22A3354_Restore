@implementation SBMainDisplayLayoutState

void __76__SBMainDisplayLayoutState_SwitcherSupport__effectivelyRepresentsHomeScreen__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2 != 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)appLayout
{
  SBAppLayout *cachedAppLayoutIfAny;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  SBMainDisplayLayoutState *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SBAppLayout *v32;
  SBAppLayout *v33;
  uint64_t v35;
  void *v36;
  id v37;
  SBMainDisplayLayoutState *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  cachedAppLayoutIfAny = self->_cachedAppLayoutIfAny;
  if (!cachedAppLayoutIfAny)
  {
    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v38 = self;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[SBLayoutState elements](self, "elements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v5)
    {
      v6 = v5;
      v36 = 0;
      v7 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v44 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "layoutRole");
          if (SBLayoutRoleIsValid(v10) && v10 != 3)
          {
            +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v12, v13);

            if (v10 == 4)
            {
              v14 = v9;

              v36 = v14;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v6);
    }
    else
    {
      v36 = 0;
    }

    if (!objc_msgSend(v37, "count"))
    {
      v19 = v38;
LABEL_37:

      cachedAppLayoutIfAny = v19->_cachedAppLayoutIfAny;
      return cachedAppLayoutIfAny;
    }
    if (v36)
    {
      v15 = SBAppLayoutCenterConfigurationFromMainDisplayLayoutStateCenterConfiguration(-[SBMainDisplayLayoutState centerConfiguration](v38, "centerConfiguration"));
      if (v15)
      {
        v16 = v15;
        v17 = -[SBMainDisplayLayoutState isCenterEntityModal](v38, "isCenterEntityModal");
        v18 = 3;
        if (!v17)
          v18 = 1;
        goto LABEL_26;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeObjectForKey:", v20);

    }
    v16 = 0;
    v36 = 0;
    v18 = 1;
LABEL_26:
    v35 = v18;
    v21 = SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(-[SBMainDisplayLayoutState spaceConfiguration](v38, "spaceConfiguration"));
    if (v21 >= 2 && objc_msgSend(v37, "count") == 1)
      v21 = 1;
    v22 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = v37;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          -[SBLayoutState elementWithRole:](v38, "elementWithRole:", objc_msgSend(v28, "integerValue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMainDisplayLayoutState layoutAttributesForElement:](v38, "layoutAttributesForElement:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v31, v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v25);
    }

    v19 = v38;
    v32 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v23, v21, v22, v16, v35, 0, v38->_displayOrdinal);
    v33 = v38->_cachedAppLayoutIfAny;
    v38->_cachedAppLayoutIfAny = v32;

    goto LABEL_37;
  }
  return cachedAppLayoutIfAny;
}

- (int64_t)peekConfiguration
{
  return self->_peekConfiguration;
}

- (int64_t)spaceConfiguration
{
  return self->_spaceConfiguration;
}

- (BOOL)isFloatingSwitcherVisible
{
  return self->_floatingSwitcherVisible;
}

- (NSString)bundleIDShowingAppExpose
{
  return self->_bundleIDShowingAppExpose;
}

- (int64_t)floatingConfiguration
{
  return self->_floatingConfiguration;
}

- (id)floatingAppLayout
{
  SBAppLayout *cachedFloatingAppLayoutIfAny;
  void *v4;
  void *v5;
  void *v6;
  SBAppLayout *v7;
  void *v8;
  void *v9;
  SBAppLayout *v10;
  SBAppLayout *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  cachedFloatingAppLayoutIfAny = self->_cachedFloatingAppLayoutIfAny;
  if (!cachedFloatingAppLayoutIfAny)
  {
    -[SBLayoutState elementWithRole:](self, "elementWithRole:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainDisplayLayoutState layoutAttributesForElement:](self, "layoutAttributesForElement:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [SBAppLayout alloc];
      v16[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v5;
      v15 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = 0;
      v10 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v7, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v8, 0, 0, 1, v9, 0, 2, v13, self->_displayOrdinal);
      v11 = self->_cachedFloatingAppLayoutIfAny;
      self->_cachedFloatingAppLayoutIfAny = v10;

    }
    cachedFloatingAppLayoutIfAny = self->_cachedFloatingAppLayoutIfAny;
  }
  return cachedFloatingAppLayoutIfAny;
}

- (int64_t)windowPickerRole
{
  return self->_windowPickerRole;
}

- (void)invalidateFloatingAppLayout
{
  SBAppLayout *cachedFloatingAppLayoutIfAny;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutState;
  -[SBLayoutState invalidateFloatingAppLayout](&v4, sel_invalidateFloatingAppLayout);
  cachedFloatingAppLayoutIfAny = self->_cachedFloatingAppLayoutIfAny;
  self->_cachedFloatingAppLayoutIfAny = 0;

}

- (void)invalidateAppLayout
{
  SBAppLayout *cachedAppLayoutIfAny;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutState;
  -[SBLayoutState invalidateAppLayout](&v4, sel_invalidateAppLayout);
  cachedAppLayoutIfAny = self->_cachedAppLayoutIfAny;
  self->_cachedAppLayoutIfAny = 0;

}

- (id)_initWithLayoutElements:(id)a3 spaceConfiguration:(int64_t)a4 elementIdentifiersToLayoutAttributes:(id)a5 floatingConfiguration:(int64_t)a6 unlockedEnvironmentMode:(int64_t)a7 floatingSwitcherVisible:(BOOL)a8 centerConfiguration:(int64_t)a9 centerEntityModal:(BOOL)a10 peekConfiguration:(int64_t)a11 bundleIDShowingAppExpose:(id)a12 windowPickerRole:(int64_t)a13 displayOrdinal:(int64_t)a14 isDisplayExternal:(BOOL)a15
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  LOBYTE(v18) = a15;
  LOBYTE(v17) = a10;
  LOBYTE(v16) = a8;
  return -[SBMainDisplayLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](self, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", a3, 0, 0, a4, a5, a6, a7, v16, a9, v17, a11, a12, a13, a14, v18);
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5 spaceConfiguration:(int64_t)a6 elementIdentifiersToLayoutAttributes:(id)a7 floatingConfiguration:(int64_t)a8 unlockedEnvironmentMode:(int64_t)a9 floatingSwitcherVisible:(BOOL)a10 centerConfiguration:(int64_t)a11 centerEntityModal:(BOOL)a12 peekConfiguration:(int64_t)a13 bundleIDShowingAppExpose:(id)a14 windowPickerRole:(int64_t)a15 displayOrdinal:(int64_t)a16 isDisplayExternal:(BOOL)a17
{
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v32;

  v23 = a7;
  v24 = a14;
  v32.receiver = self;
  v32.super_class = (Class)SBMainDisplayLayoutState;
  v25 = -[SBLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:](&v32, sel__initWithLayoutElements_interfaceOrientation_interfaceOrientationByLayoutElement_, a3, a4, a5);
  v26 = v25;
  if (v25)
  {
    v25[8] = a6;
    v27 = objc_msgSend(v23, "copy");
    v28 = (void *)v26[6];
    v26[6] = v27;

    v26[9] = a8;
    v26[12] = a9;
    *((_BYTE *)v26 + 56) = a10;
    v26[10] = a11;
    *((_BYTE *)v26 + 57) = a12;
    v26[11] = a13;
    v29 = objc_msgSend(v24, "copy");
    v30 = (void *)v26[13];
    v26[13] = v29;

    v26[14] = a15;
    v26[15] = a16;
    *((_BYTE *)v26 + 58) = a17;
  }

  return v26;
}

- (int64_t)unlockedEnvironmentMode
{
  return self->_unlockedEnvironmentMode;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int v10;
  int64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  char v18;
  objc_super v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v20.receiver = self;
    v20.super_class = (Class)SBMainDisplayLayoutState;
    if (-[SBLayoutState isEqual:](&v20, sel_isEqual_, v5)
      && (v6 = -[SBMainDisplayLayoutState spaceConfiguration](self, "spaceConfiguration"),
          v6 == objc_msgSend(v5, "spaceConfiguration"))
      && (v7 = -[SBMainDisplayLayoutState floatingConfiguration](self, "floatingConfiguration"),
          v7 == objc_msgSend(v5, "floatingConfiguration"))
      && (v8 = -[SBMainDisplayLayoutState unlockedEnvironmentMode](self, "unlockedEnvironmentMode"),
          v8 == objc_msgSend(v5, "unlockedEnvironmentMode"))
      && (v9 = -[SBMainDisplayLayoutState centerConfiguration](self, "centerConfiguration"),
          v9 == objc_msgSend(v5, "centerConfiguration"))
      && (v10 = -[SBMainDisplayLayoutState isCenterEntityModal](self, "isCenterEntityModal"),
          v10 == objc_msgSend(v5, "isCenterEntityModal"))
      && (v11 = -[SBMainDisplayLayoutState peekConfiguration](self, "peekConfiguration"),
          v11 == objc_msgSend(v5, "peekConfiguration")))
    {
      -[SBMainDisplayLayoutState bundleIDShowingAppExpose](self, "bundleIDShowingAppExpose");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIDShowingAppExpose");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects()
        && (v14 = -[SBMainDisplayLayoutState windowPickerRole](self, "windowPickerRole"),
            v14 == objc_msgSend(v5, "windowPickerRole"))
        && (v15 = -[SBMainDisplayLayoutState displayOrdinal](self, "displayOrdinal"),
            v15 == objc_msgSend(v5, "displayOrdinal"))
        && self->_isDisplayExternal == v5[58])
      {
        -[SBLayoutState interfaceOrientationByLayoutElementIdentifier](self, "interfaceOrientationByLayoutElementIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "interfaceOrientationByLayoutElementIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = BSEqualObjects();

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)displayOrdinal
{
  return self->_displayOrdinal;
}

- (int64_t)centerConfiguration
{
  return self->_centerConfiguration;
}

- (BOOL)isCenterEntityModal
{
  return self->_centerEntityModal;
}

- (NSDictionary)elementIdentifiersToLayoutAttributes
{
  return self->_elementIdentifiersToLayoutAttributes;
}

- (BOOL)isFullScreen
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBLayoutState elementWithRole:](self, "elementWithRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBLayoutState elementWithRole:](self, "elementWithRole:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setInterfaceOrientationByLayoutElementIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutState;
  -[SBLayoutState setInterfaceOrientationByLayoutElementIdentifier:](&v4, sel_setInterfaceOrientationByLayoutElementIdentifier_, a3);
  -[SBMainDisplayLayoutState _applyElementInterfaceOrientationsToLayoutAttributes](self, "_applyElementInterfaceOrientationsToLayoutAttributes");
  -[SBMainDisplayLayoutState invalidateAppLayout](self, "invalidateAppLayout");
  -[SBMainDisplayLayoutState invalidateFloatingAppLayout](self, "invalidateFloatingAppLayout");
}

- (void)_applyElementInterfaceOrientationsToLayoutAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *elementIdentifiersToLayoutAttributes;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_elementIdentifiersToLayoutAttributes)
  {
    v3 = (void *)MEMORY[0x1E0C99E08];
    -[SBLayoutState elements](self, "elements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SBLayoutState elements](self, "elements", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMainDisplayLayoutState _layoutAttributesForElementWithIdentifier:](self, "_layoutAttributesForElementWithIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "attributesByModifyingContentOrientation:", -[SBLayoutState interfaceOrientationForElementIdentifier:](self, "interfaceOrientationForElementIdentifier:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "setValue:forKey:", v13, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = (NSDictionary *)objc_msgSend(v5, "copy");
    elementIdentifiersToLayoutAttributes = self->_elementIdentifiersToLayoutAttributes;
    self->_elementIdentifiersToLayoutAttributes = v14;

  }
}

- (id)layoutAttributesForElement:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplayLayoutState _layoutAttributesForElementWithIdentifier:](self, "_layoutAttributesForElementWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_layoutAttributesForElementWithIdentifier:(id)a3
{
  SBDisplayItemLayoutAttributes *v3;

  -[NSDictionary objectForKey:](self->_elementIdentifiersToLayoutAttributes, "objectForKey:", a3);
  v3 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(SBDisplayItemLayoutAttributes);
  return v3;
}

- (int64_t)_defaultInterfaceOrientation
{
  if (-[SBMainDisplayLayoutState isDisplayExternal](self, "isDisplayExternal"))
    return 1;
  else
    return objc_msgSend((id)SBApp, "activeInterfaceOrientation");
}

- (BOOL)isDisplayExternal
{
  return self->_isDisplayExternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousExposeIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIDShowingAppExpose, 0);
  objc_storeStrong((id *)&self->_elementIdentifiersToLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_cachedFloatingAppLayoutIfAny, 0);
  objc_storeStrong((id *)&self->_cachedAppLayoutIfAny, 0);
}

- (BOOL)effectivelyRepresentsHomeScreen
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBMainDisplayLayoutState_SwitcherSupport__effectivelyRepresentsHomeScreen__block_invoke;
  v5[3] = &unk_1E8EA6CA0;
  v5[4] = self;
  v5[5] = &v6;
  SBLayoutRoleEnumerateAppLayoutRoles(v5);
  if (*((_BYTE *)v7 + 24))
    v3 = 0;
  else
    v3 = -[SBMainDisplayLayoutState unlockedEnvironmentMode](self, "unlockedEnvironmentMode") != 2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __67__SBMainDisplayLayoutState__updateSizingPoliciesForLayoutElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = objc_msgSend(a3, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "_layoutAttributesForElementWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributesByModifyingSizingPolicy:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v8, v5);
}

- (void)_updateSizingPoliciesForLayoutElements:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *elementIdentifiersToLayoutAttributes;
  id v10;
  _QWORD v11[5];
  id v12;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v5 = a3;
    -[SBLayoutState elements](self, "elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__SBMainDisplayLayoutState__updateSizingPoliciesForLayoutElements___block_invoke;
    v11[3] = &unk_1E8EB28C0;
    v11[4] = self;
    v12 = v7;
    v10 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

    v8 = (NSDictionary *)objc_msgSend(v10, "copy");
    elementIdentifiersToLayoutAttributes = self->_elementIdentifiersToLayoutAttributes;
    self->_elementIdentifiersToLayoutAttributes = v8;

    -[SBMainDisplayLayoutState invalidateAppLayout](self, "invalidateAppLayout");
    -[SBMainDisplayLayoutState invalidateFloatingAppLayout](self, "invalidateFloatingAppLayout");

  }
}

- (id)_initWithLayoutElements:(id)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 unlockedEnvironmentMode:(int64_t)a6 floatingSwitcherVisible:(BOOL)a7 centerConfiguration:(int64_t)a8 centerEntityModal:(BOOL)a9 peekConfiguration:(int64_t)a10 bundleIDShowingAppExpose:(id)a11 windowPickerRole:(int64_t)a12 displayOrdinal:(int64_t)a13 isDisplayExternal:(BOOL)a14
{
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17 = a11;
  v18 = a3;
  objc_msgSend((id)objc_opt_class(), "_elementIdentifiersToLayoutAttributesForElements:spaceConfiguration:", v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a14;
  LOBYTE(v23) = a9;
  LOBYTE(v22) = a7;
  v20 = -[SBMainDisplayLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](self, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", v18, 0, 0, a4, v19, a5, a6, v22, a8, v23, a10, v17, a12, a13, v24);

  return v20;
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5 spaceConfiguration:(int64_t)a6 floatingConfiguration:(int64_t)a7 unlockedEnvironmentMode:(int64_t)a8 floatingSwitcherVisible:(BOOL)a9 centerConfiguration:(int64_t)a10 centerEntityModal:(BOOL)a11 peekConfiguration:(int64_t)a12 bundleIDShowingAppExpose:(id)a13 windowPickerRole:(int64_t)a14 displayOrdinal:(int64_t)a15 isDisplayExternal:(BOOL)a16
{
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v20 = a13;
  v21 = a5;
  v22 = a3;
  objc_msgSend((id)objc_opt_class(), "_elementIdentifiersToLayoutAttributesForElements:spaceConfiguration:", v22, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = a16;
  LOBYTE(v27) = a11;
  LOBYTE(v26) = a9;
  v24 = -[SBMainDisplayLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](self, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", v22, a4, v21, a6, v23, a7, a8, v26, a10, v27, a12, v20, a14, a15, v28);

  return v24;
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5
{
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  LOBYTE(v10) = 0;
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  v5 = -[SBMainDisplayLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](self, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", a3, a4, a5, 0, MEMORY[0x1E0C9AA70], 0, 1, v8, 0, v9, 0, 0, 0, 0, v10);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_applyElementInterfaceOrientationsToLayoutAttributes");
  return v6;
}

- (id)_initWithLayoutState:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "elements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "interfaceOrientation");
  objc_msgSend(v3, "interfaceOrientationByLayoutElementIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v25, "copy");
  v20 = objc_msgSend(v3, "spaceConfiguration");
  objc_msgSend(v3, "elementIdentifiersToLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "floatingConfiguration");
  v18 = objc_msgSend(v3, "unlockedEnvironmentMode");
  v5 = objc_msgSend(v3, "isFloatingSwitcherVisible");
  v6 = objc_msgSend(v3, "centerConfiguration");
  v7 = objc_msgSend(v3, "isCenterEntityModal");
  v8 = objc_msgSend(v3, "peekConfiguration");
  objc_msgSend(v3, "bundleIDShowingAppExpose");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "windowPickerRole");
  v11 = objc_msgSend(v3, "displayOrdinal");
  v12 = objc_msgSend(v3, "isDisplayExternal");

  LOBYTE(v17) = v12;
  LOBYTE(v16) = v7;
  LOBYTE(v15) = v5;
  v13 = -[SBMainDisplayLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](self, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", v23, v22, v21, v20, v4, v19, v18, v15, v6, v16, v8, v9, v10, v11, v17);

  if (v13)
    objc_msgSend(v13, "_applyElementInterfaceOrientationsToLayoutAttributes");
  return v13;
}

+ (id)_elementIdentifiersToLayoutAttributesForElements:(id)a3 spaceConfiguration:(int64_t)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  SBDisplayItemLayoutAttributes *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v12, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)description
{
  return -[SBLayoutState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  SBMainDisplayLayoutState *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[SBLayoutState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SBLayoutState interfaceOrientationByLayoutElementIdentifier](self, "interfaceOrientationByLayoutElementIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v19[3] = &unk_1E8EAF960;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v7, "bs_each:", v19);

  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v15[3] = &unk_1E8E9E270;
  v10 = v5;
  v16 = v10;
  v17 = self;
  v18 = v9;
  v11 = v9;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v15);

  v12 = v18;
  v13 = v10;

  return v13;
}

void __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "integerValue");
  SBFStringForBSInterfaceOrientation();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  id v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  id v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  id v23;
  void *v24;
  unint64_t v25;
  __CFString *v26;
  id v27;
  void *v28;
  unint64_t v29;
  __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_210);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("elements"), 1);

  v6 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation") == 1)
  {
    v7 = CFSTR("UIInterfaceOrientationPortrait");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation") == 4)
  {
    v7 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation") == 3)
  {
    v7 = CFSTR("UIInterfaceOrientationLandscapeRight");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation") == 2)
  {
    v7 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  }
  else
  {
    v7 = 0;
  }
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("interfaceOrientation"));
  v9 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientationForLayoutRole:", 1) == 1)
  {
    v10 = CFSTR("UIInterfaceOrientationPortrait");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientationForLayoutRole:", 1) == 4)
  {
    v10 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientationForLayoutRole:", 1) == 3)
  {
    v10 = CFSTR("UIInterfaceOrientationLandscapeRight");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientationForLayoutRole:", 1) == 2)
  {
    v10 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  }
  else
  {
    v10 = 0;
  }
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("primaryElementInterfaceOrientation"));
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(a1 + 48), CFSTR("interfaceOrientationByLayoutElement"), 0);
  v12 = *(void **)(a1 + 32);
  v13 = objc_msgSend(*(id *)(a1 + 40), "spaceConfiguration");
  if (v13 > 4)
    v14 = 0;
  else
    v14 = off_1E8EB28E0[v13];
  v15 = (id)objc_msgSend(v12, "appendObject:withName:", v14, CFSTR("spaceConfiguration"));
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("layoutAttributes"), 1);
  v16 = *(void **)(a1 + 32);
  v17 = objc_msgSend(*(id *)(a1 + 40), "floatingConfiguration");
  if (v17 > 4)
    v18 = 0;
  else
    v18 = off_1E8EB2908[v17];
  v19 = (id)objc_msgSend(v16, "appendObject:withName:", v18, CFSTR("floatingConfiguration"));
  v20 = *(void **)(a1 + 32);
  v21 = objc_msgSend(*(id *)(a1 + 40), "centerConfiguration");
  if (v21 > 2)
    v22 = 0;
  else
    v22 = off_1E8EB2930[v21];
  v23 = (id)objc_msgSend(v20, "appendObject:withName:", v22, CFSTR("centerConfiguration"));
  v24 = *(void **)(a1 + 32);
  v25 = objc_msgSend(*(id *)(a1 + 40), "peekConfiguration");
  if (v25 > 3)
    v26 = 0;
  else
    v26 = off_1E8EB2948[v25];
  v27 = (id)objc_msgSend(v24, "appendObject:withName:", v26, CFSTR("peekConfiguration"));
  v28 = *(void **)(a1 + 32);
  v29 = objc_msgSend(*(id *)(a1 + 40), "unlockedEnvironmentMode");
  if (v29 > 3)
    v30 = 0;
  else
    v30 = off_1E8EB2968[v29];
  v31 = (id)objc_msgSend(v28, "appendObject:withName:", v30, CFSTR("unlockedEnvironmentMode"));
  v32 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIDShowingAppExpose");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "appendString:withName:", v33, CFSTR("bundleIDShowingAppExpose"));

  v34 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "isFloatingSwitcherVisible");
  BSSettingFlagDescription();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v34, "appendObject:withName:", v35, CFSTR("floatingSwitcherVisible"));

  v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isCenterEntityModal"), CFSTR("centerEntityModal"), 1);
  v38 = *(void **)(a1 + 32);
  SBLayoutRoleDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v38, "appendObject:withName:", v39, CFSTR("windowPickerRole"));

  v41 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "displayOrdinal"), CFSTR("displayOrdinal"));
  v42 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDisplayExternal"), CFSTR("isDisplayExternal"));
  v43 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "appLayout");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "continuousExposeIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "appendString:withName:skipIfEmpty:", v44, CFSTR("continuousExposeIdentifier"), 1);

}

uint64_t __66__SBMainDisplayLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "succinctDescription");
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v30.receiver = self;
  v30.super_class = (Class)SBMainDisplayLayoutState;
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutState hash](&v30, sel_hash));
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState spaceConfiguration](self, "spaceConfiguration"));
  v6 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState floatingConfiguration](self, "floatingConfiguration"));
  v7 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState centerConfiguration](self, "centerConfiguration"));
  v8 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState peekConfiguration](self, "peekConfiguration"));
  v9 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState unlockedEnvironmentMode](self, "unlockedEnvironmentMode"));
  -[SBMainDisplayLayoutState bundleIDShowingAppExpose](self, "bundleIDShowingAppExpose");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendString:", v10);

  v12 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState windowPickerRole](self, "windowPickerRole"));
  v13 = (id)objc_msgSend(v3, "appendInteger:", -[SBMainDisplayLayoutState displayOrdinal](self, "displayOrdinal"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[SBMainDisplayLayoutState isDisplayExternal](self, "isDisplayExternal"));
  -[SBLayoutState interfaceOrientationByLayoutElementIdentifier](self, "interfaceOrientationByLayoutElementIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v21 = (id)objc_msgSend(v3, "appendString:", v20);
        objc_msgSend(v15, "objectForKey:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v3, "appendUnsignedInteger:", objc_msgSend(v22, "unsignedIntegerValue"));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v17);
  }
  v24 = objc_msgSend(v3, "hash");

  return v24;
}

- (BOOL)isSplitView
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBLayoutState elementWithRole:](self, "elementWithRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBLayoutState elementWithRole:](self, "elementWithRole:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setLayoutAttributes:(id)a3 forLayoutElement:(id)a4
{
  id v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  void *v10;
  NSDictionary *elementIdentifiersToLayoutAttributes;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_elementIdentifiersToLayoutAttributes)
  {
    objc_msgSend(a4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (NSDictionary *)-[NSDictionary mutableCopy](self->_elementIdentifiersToLayoutAttributes, "mutableCopy");
      v9 = v8;
      if (v6)
      {
        v12 = v7;
        v13[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v10);

      }
      else
      {
        -[NSDictionary removeObjectForKey:](v8, "removeObjectForKey:", v7);
      }
      elementIdentifiersToLayoutAttributes = self->_elementIdentifiersToLayoutAttributes;
      self->_elementIdentifiersToLayoutAttributes = v9;

      -[SBMainDisplayLayoutState invalidateAppLayout](self, "invalidateAppLayout");
      -[SBMainDisplayLayoutState invalidateFloatingAppLayout](self, "invalidateFloatingAppLayout");
    }

  }
}

- (NSString)continuousExposeIdentifier
{
  return self->_continuousExposeIdentifier;
}

- (NSDictionary)displayItemLayoutAttributesMap
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBLayoutState elements](self, "elements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "layoutRole");
        if (SBLayoutRoleIsValid(v10) && v10 != 3)
        {
          +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBMainDisplayLayoutState layoutAttributesForElement:](self, "layoutAttributesForElement:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v13, v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

@end
