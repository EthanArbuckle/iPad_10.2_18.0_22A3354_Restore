@implementation PKPassEntitlementsComposerEntryNode

- (PKPassEntitlementsComposerEntryNode)init
{

  return 0;
}

- (PKPassEntitlementsComposerEntryNode)initWithIdentifier:(id)a3 parentEntitlementComposer:(id)a4
{
  id v7;
  id v8;
  PKPassEntitlementsComposerEntryNode *v9;
  PKPassEntitlementsComposerEntryNode *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *properties;
  NSMutableArray *v13;
  NSMutableArray *children;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPassEntitlementsComposerEntryNode;
  v9 = -[PKPassEntitlementsComposerEntryNode init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_parentEntitlementComposer, v8);
    v10->_editable = 1;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v10->_properties;
    v10->_properties = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    children = v10->_children;
    v10->_children = v13;

  }
  return v10;
}

- (unint64_t)possibleShareability
{
  return -[PKPassEntitlementsComposerEntryNode _leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:](self, "_leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_214, -1);
}

id __59__PKPassEntitlementsComposerEntryNode_possibleShareability__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "possibleShareability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)possibleVisibility
{
  return -[PKPassEntitlementsComposerEntryNode _leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:](self, "_leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_94, -1);
}

id __57__PKPassEntitlementsComposerEntryNode_possibleVisibility__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "possibleVisibility"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)possibleManageability
{
  return -[PKPassEntitlementsComposerEntryNode _leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:](self, "_leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_95_0, -1);
}

id __60__PKPassEntitlementsComposerEntryNode_possibleManageability__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "possibleManageability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)possibleIntraAccountSharing
{
  return -[PKPassEntitlementsComposerEntryNode _leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:](self, "_leastRestrictivePossibleCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_96, 1) == 1;
}

id __66__PKPassEntitlementsComposerEntryNode_possibleIntraAccountSharing__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "possibleIntraAccountSharing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)allPossibleShareability
{
  return (NSArray *)-[PKPassEntitlementsComposerEntryNode _allPossibleCapabilityForAccumulateBlock:](self, "_allPossibleCapabilityForAccumulateBlock:", &__block_literal_global_97_0);
}

uint64_t __62__PKPassEntitlementsComposerEntryNode_allPossibleShareability__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allPossibleShareability");
}

- (NSArray)allPossibleVisibility
{
  return (NSArray *)-[PKPassEntitlementsComposerEntryNode _allPossibleCapabilityForAccumulateBlock:](self, "_allPossibleCapabilityForAccumulateBlock:", &__block_literal_global_98_0);
}

uint64_t __60__PKPassEntitlementsComposerEntryNode_allPossibleVisibility__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allPossibleVisibility");
}

- (NSArray)allPossibleManageability
{
  return (NSArray *)-[PKPassEntitlementsComposerEntryNode _allPossibleCapabilityForAccumulateBlock:](self, "_allPossibleCapabilityForAccumulateBlock:", &__block_literal_global_99_0);
}

uint64_t __63__PKPassEntitlementsComposerEntryNode_allPossibleManageability__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allPossibleManageability");
}

- (NSArray)allPossibleCapabilitySets
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
  objc_msgSend(WeakRetained, "_allPossibleCapabilitySetsForView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (PKPassShareTimeConfiguration)possibleTimeConfiguration
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_children;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "possibleTimeConfiguration", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            objc_msgSend(v5, "intersect:", v8);
            v10 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v10;
          }
          else
          {
            v5 = v8;
          }
        }

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(v5, "support"))
    v11 = v5;
  else
    v11 = 0;

  return (PKPassShareTimeConfiguration *)v11;
}

- (unint64_t)shareability
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[PKPassEntitlementsComposerEntryNode _effectiveValueForProperty:ofType:](self, "_effectiveValueForProperty:ofType:", 1, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "shareability");
  else
    v5 = -[PKPassEntitlementsComposerEntryNode _mostRestrictiveCapabilityForAccumulateBlock:maxCapability:](self, "_mostRestrictiveCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_102, 999);
  v6 = v5;

  return v6;
}

uint64_t __51__PKPassEntitlementsComposerEntryNode_shareability__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shareability");
}

- (void)setShareability:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PKPassEntitlementsComposerEntryNode_setShareability___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v3[4] = a3;
  -[PKPassEntitlementsComposerEntryNode _mutateCapability:](self, "_mutateCapability:", v3);
}

uint64_t __55__PKPassEntitlementsComposerEntryNode_setShareability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShareability:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)visibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[PKPassEntitlementsComposerEntryNode _effectiveValueForProperty:ofType:](self, "_effectiveValueForProperty:ofType:", 1, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "visibility");
  else
    v5 = -[PKPassEntitlementsComposerEntryNode _mostRestrictiveCapabilityForAccumulateBlock:maxCapability:](self, "_mostRestrictiveCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_105, 2);
  v6 = v5;

  return v6;
}

uint64_t __49__PKPassEntitlementsComposerEntryNode_visibility__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "visibility");
}

- (void)setVisibility:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PKPassEntitlementsComposerEntryNode_setVisibility___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v3[4] = a3;
  -[PKPassEntitlementsComposerEntryNode _mutateCapability:](self, "_mutateCapability:", v3);
}

uint64_t __53__PKPassEntitlementsComposerEntryNode_setVisibility___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisibility:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)manageability
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[PKPassEntitlementsComposerEntryNode _effectiveValueForProperty:ofType:](self, "_effectiveValueForProperty:ofType:", 1, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "manageability");
  else
    v5 = -[PKPassEntitlementsComposerEntryNode _mostRestrictiveCapabilityForAccumulateBlock:maxCapability:](self, "_mostRestrictiveCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_106_1, -1);
  v6 = v5;

  return v6;
}

uint64_t __52__PKPassEntitlementsComposerEntryNode_manageability__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "manageability");
}

- (void)setManageability:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PKPassEntitlementsComposerEntryNode_setManageability___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v3[4] = a3;
  -[PKPassEntitlementsComposerEntryNode _mutateCapability:](self, "_mutateCapability:", v3);
}

uint64_t __56__PKPassEntitlementsComposerEntryNode_setManageability___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setManageability:", *(_QWORD *)(a1 + 32));
}

- (BOOL)intraAccountSharingEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[PKPassEntitlementsComposerEntryNode _effectiveValueForProperty:ofType:](self, "_effectiveValueForProperty:ofType:", 1, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intraAccountSharingEnabled");
  else
    v5 = -[PKPassEntitlementsComposerEntryNode _mostRestrictiveCapabilityForAccumulateBlock:maxCapability:](self, "_mostRestrictiveCapabilityForAccumulateBlock:maxCapability:", &__block_literal_global_107, 1) == 1;

  return v5;
}

uint64_t __65__PKPassEntitlementsComposerEntryNode_intraAccountSharingEnabled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intraAccountSharingEnabled");
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__PKPassEntitlementsComposerEntryNode_setIntraAccountSharingEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v4 = a3;
  -[PKPassEntitlementsComposerEntryNode _mutateCapability:](self, "_mutateCapability:", v3);
}

uint64_t __69__PKPassEntitlementsComposerEntryNode_setIntraAccountSharingEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIntraAccountSharingEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)updateCapabilitiesWithSet:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKPassEntitlementsComposerEntryNode_updateCapabilitiesWithSet___block_invoke;
  v6[3] = &unk_1E2ADBCA0;
  v7 = v4;
  v5 = v4;
  -[PKPassEntitlementsComposerEntryNode _mutateCapability:](self, "_mutateCapability:", v6);

}

void __65__PKPassEntitlementsComposerEntryNode_updateCapabilitiesWithSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setShareability:", objc_msgSend(v3, "shareability"));
  objc_msgSend(v4, "setVisibility:", objc_msgSend(*(id *)(a1 + 32), "visibility"));
  objc_msgSend(v4, "setManageability:", objc_msgSend(*(id *)(a1 + 32), "manageability"));
  objc_msgSend(v4, "setIntraAccountSharingEnabled:", objc_msgSend(*(id *)(a1 + 32), "intraAccountSharingEnabled"));

}

- (void)resetCapabilities
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__PKPassEntitlementsComposerEntryNode_resetCapabilities__block_invoke;
  v2[3] = &unk_1E2ADBCA0;
  v2[4] = self;
  -[PKPassEntitlementsComposerEntryNode _mutateCapability:](self, "_mutateCapability:", v2);
}

void __56__PKPassEntitlementsComposerEntryNode_resetCapabilities__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setShareability:", objc_msgSend(v3, "possibleShareability"));
  objc_msgSend(v4, "setVisibility:", objc_msgSend(*(id *)(a1 + 32), "possibleVisibility"));
  objc_msgSend(v4, "setManageability:", objc_msgSend(*(id *)(a1 + 32), "possibleManageability"));
  objc_msgSend(v4, "setIntraAccountSharingEnabled:", objc_msgSend(*(id *)(a1 + 32), "possibleIntraAccountSharing"));

}

- (PKPassShareTimeConfiguration)timeConfiguration
{
  return (PKPassShareTimeConfiguration *)-[PKPassEntitlementsComposerEntryNode _effectiveValueForProperty:ofType:](self, "_effectiveValueForProperty:ofType:", 2, objc_opt_class());
}

- (void)setTimeConfiguration:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[PKPassEntitlementsComposerEntryNode parentEntryNodeWillSetProperty:updatedParentNode:](self, "parentEntryNodeWillSetProperty:updatedParentNode:", 2, self);
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v6, &unk_1E2C3F7C0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v4, &unk_1E2C3F7C0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "childEntryNodeDidSetProperty:updatedChildNode:", 2, self);

}

- (BOOL)isManagingTimeConfiguration
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", &unk_1E2C3F7C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setIsManagingTimeConfiguration:(BOOL)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PKPassEntitlementsComposerEntryNode setTimeConfiguration:](self, "setTimeConfiguration:", 0);
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, &unk_1E2C3F7C0);
    -[PKPassEntitlementsComposerEntryNode possibleTimeConfiguration](self, "possibleTimeConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_children;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setTimeConfiguration:", v4, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)isManagingEntitlementConfiguration
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", &unk_1E2C3F7D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setIsManagingEntitlementConfiguration:(BOOL)a3
{
  PKPassEntitlementCapabilitySet *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PKPassEntitlementsComposerEntryNode resetCapabilities](self, "resetCapabilities");
  }
  else
  {
    v4 = -[PKPassEntitlementCapabilitySet initWithLocalizedName:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "initWithLocalizedName:shareability:manageability:visibility:", &stru_1E2ADF4C0, -[PKPassEntitlementsComposerEntryNode shareability](self, "shareability"), -[PKPassEntitlementsComposerEntryNode manageability](self, "manageability"), -[PKPassEntitlementsComposerEntryNode visibility](self, "visibility"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, &unk_1E2C3F7D8);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_children;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "updateCapabilitiesWithSet:", v4, (_QWORD)v10);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)enabled
{
  void *v2;
  char v3;

  -[PKPassEntitlementsComposerEntryNode _effectiveValueForProperty:ofType:](self, "_effectiveValueForProperty:ofType:", 0, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  -[PKPassEntitlementsComposerEntryNode setEnabled:notifyIfRoot:](self, "setEnabled:notifyIfRoot:", a3, 1);
}

- (void)setEnabled:(BOOL)a3 notifyIfRoot:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  id WeakRetained;
  id v9;

  v4 = a4;
  v5 = a3;
  -[PKPassEntitlementsComposerEntryNode parentEntryNodeWillSetProperty:updatedParentNode:](self, "parentEntryNodeWillSetProperty:updatedParentNode:", 0, self);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v7, &unk_1E2C3F7F0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(v9, "childEntryNodeDidSetProperty:updatedChildNode:", 0, self);
  }
  else
  {
    if (!v4)
      return;
    v9 = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
    objc_msgSend(v9, "_rootEntryNodeDidSetEnabled:", self);
  }

}

- (unint64_t)maxSelectionCount
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
  v3 = objc_msgSend(WeakRetained, "maxSelectionCount");

  return v3;
}

- (void)enumerateEntitlementEntries:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "enumerateEntitlementEntries:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)parentEntryNodeWillSetProperty:(unint64_t)a3 updatedParentNode:(id)a4
{
  PKPassEntitlementsComposerEntryNode *v6;
  PKPassEntitlementsComposerEntryNode *v7;
  NSMutableDictionary *properties;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (PKPassEntitlementsComposerEntryNode *)a4;
  v7 = v6;
  if (self->_editable)
  {
    if (self != v6)
    {
      properties = self->_properties;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", 0, v9);

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_children;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "parentEntryNodeWillSetProperty:updatedParentNode:", a3, self);
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassEntitlementsComposer: '%lu' should not be updated on non editable composer"), a3);
  }

}

- (void)childEntryNodeDidSetProperty:(unint64_t)a3 updatedChildNode:(id)a4
{
  _QWORD *v6;
  NSMutableDictionary *properties;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id WeakRetained;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _QWORD *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_editable)
  {
    properties = self->_properties;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = self->_properties;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = self->_properties;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", 0, v14);

      WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
      objc_msgSend(WeakRetained, "childEntryNodeDidSetProperty:updatedChildNode:", a3, self);

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = self->_children;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (v21 != v6)
            {
              v22 = (void *)v21[2];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v23);

            }
          }
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v18);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassEntitlementsComposer: '%lu' should not be updated on non editable composer"), a3);
  }

}

- (void)_mutateCapability:(id)a3
{
  void (**v4)(id, id);
  PKMutablePassEntitlementCapabilitySet *v5;
  id WeakRetained;
  PKMutablePassEntitlementCapabilitySet *v7;

  v4 = (void (**)(id, id))a3;
  -[PKPassEntitlementsComposerEntryNode parentEntryNodeWillSetProperty:updatedParentNode:](self, "parentEntryNodeWillSetProperty:updatedParentNode:", 1, self);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", &unk_1E2C3F7D8);
  v5 = (PKMutablePassEntitlementCapabilitySet *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = -[PKPassEntitlementCapabilitySet initWithLocalizedName:shareability:manageability:visibility:]([PKMutablePassEntitlementCapabilitySet alloc], "initWithLocalizedName:shareability:manageability:visibility:", &stru_1E2ADF4C0, -[PKPassEntitlementsComposerEntryNode possibleShareability](self, "possibleShareability"), -[PKPassEntitlementsComposerEntryNode possibleManageability](self, "possibleManageability"), -[PKPassEntitlementsComposerEntryNode possibleVisibility](self, "possibleVisibility"));
  v7 = v5;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0, &unk_1E2C3F7D8);
  v4[2](v4, v7);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v7, &unk_1E2C3F7D8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "childEntryNodeDidSetProperty:updatedChildNode:", 1, self);

}

- (unint64_t)_mostRestrictiveCapabilityForAccumulateBlock:(id)a3 maxCapability:(unint64_t)a4
{
  uint64_t (**v6)(id, void *);
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a3;
  if (-[PKPassEntitlementsComposerEntryNode hasEnabledEntitlements](self, "hasEnabledEntitlements"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_children;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "enabled", (_QWORD)v15))
          {
            v13 = v6[2](v6, v12);
            if (v13 < a4)
              a4 = v13;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (unint64_t)_leastRestrictivePossibleCapabilityForAccumulateBlock:(id)a3 maxCapability:(unint64_t)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t j;
  unint64_t v18;
  NSMutableArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_children;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11
          && (v23 = 0u,
              v24 = 0u,
              v21 = 0u,
              v22 = 0u,
              (v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16)) != 0))
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v12);
              v18 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "unsignedIntegerValue");
              if (v15 <= v18)
                v15 = v18;
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v14);
        }
        else
        {
          v15 = 0;
        }
        if (a4 >= v15)
          a4 = v15;

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  return a4;
}

- (id)_allPossibleCapabilityForAccumulateBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x1E0C99E60]);
        v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithArray:", v13, (_QWORD)v20);

        if (v8)
          objc_msgSend(v8, "intersectSet:", v14);
        else
          v8 = (void *)objc_msgSend(v14, "mutableCopy");

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_122_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = (void *)MEMORY[0x1E0C9AA60];
  v18 = v16;

  return v18;
}

uint64_t __80__PKPassEntitlementsComposerEntryNode__allPossibleCapabilityForAccumulateBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)hasEnabledEntitlements
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_children;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "enabled", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_effectiveValueForProperty:(unint64_t)a3 ofType:(Class)a4
{
  PKPassEntitlementsComposerEntryNode *v5;
  PKPassEntitlementsComposerEntryNode *v6;
  uint64_t v7;
  NSMutableDictionary *properties;
  void *v9;
  void *v10;
  void *v11;
  PKPassEntitlementsComposerEntryNode *WeakRetained;
  id v13;

  v5 = self;
  if (!v5)
  {
LABEL_8:
    v13 = 0;
    return v13;
  }
  v6 = v5;
  v7 = *MEMORY[0x1E0C99768];
  while (1)
  {
    properties = v6->_properties;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      break;
LABEL_7:
    WeakRetained = (PKPassEntitlementsComposerEntryNode *)objc_loadWeakRetained((id *)&v6->_parent);

    v6 = WeakRetained;
    if (!WeakRetained)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    v13 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v7, CFSTR("PKPassEntitlementsComposer: Found unexpected value %@ for property '%lu'"), v10, a3);
    goto LABEL_7;
  }
  v13 = v10;
LABEL_11:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSCopying *identifier;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  identifier = self->_identifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
  v7 = objc_msgSend(v4, "initWithIdentifier:parentEntitlementComposer:", identifier, WeakRetained);

  *(_BYTE *)(v7 + 24) = self->_editable;
  v8 = -[NSMutableDictionary mutableCopy](self->_properties, "mutableCopy");
  v9 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v8;

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_children;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (id *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copy", (_QWORD)v19);
        objc_storeWeak(v17 + 5, (id)v7);
        objc_msgSend(*(id *)(v7 + 48), "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (id)v7;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (PKPassEntitlementsComposerEntryNode)parent
{
  return (PKPassEntitlementsComposerEntryNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_destroyWeak((id *)&self->_parentEntitlementComposer);
}

@end
