@implementation PKPassEntitlementsComposerEntitlementEntryNode

- (PKPassEntitlementsComposerEntitlementEntryNode)init
{

  return 0;
}

- (PKPassEntitlementsComposerEntitlementEntryNode)initWithDisplayableEntitlement:(id)a3 sharedEntitlement:(id)a4 parentEntitlementComposer:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PKPassEntitlementsComposerEntitlementEntryNode *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "entitlementIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PKPassEntitlementsComposerEntitlementEntryNode;
  v13 = -[PKPassEntitlementsComposerEntryNode initWithIdentifier:parentEntitlementComposer:](&v15, sel_initWithIdentifier_parentEntitlementComposer_, v12, v11);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_displayableEntitlement, a3);
    objc_storeStrong((id *)&v13->_sharedEntitlement, a4);
  }

  return v13;
}

- (unint64_t)possibleShareability
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v7 <= objc_msgSend(v10, "unsignedIntegerValue", (_QWORD)v12))
          v7 = objc_msgSend(v10, "unsignedIntegerValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)possibleVisibility
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v7 <= objc_msgSend(v10, "unsignedIntegerValue", (_QWORD)v12))
          v7 = objc_msgSend(v10, "unsignedIntegerValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)possibleManageability
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manageability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v7 <= objc_msgSend(v10, "unsignedIntegerValue", (_QWORD)v12))
          v7 = objc_msgSend(v10, "unsignedIntegerValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)possibleIntraAccountSharing
{
  return -[PKPassEntitlementsComposerEntitlementEntryNode possibleShareability](self, "possibleShareability") != 0;
}

- (id)allPossibleShareability
{
  void *v2;
  void *v3;

  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allPossibleVisibility
{
  void *v2;
  void *v3;

  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allPossibleManageability
{
  void *v2;
  void *v3;

  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manageability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)possibleTimeConfiguration
{
  void *v2;
  void *v3;

  -[PKDisplayablePassEntitlement entitlement](self->_displayableEntitlement, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateEntitlementEntries:(id)a3
{
  (*((void (**)(id, PKPassEntitlementsComposerEntitlementEntryNode *))a3 + 2))(a3, self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPassEntitlementsComposerEntitlementEntryNode;
  v4 = -[PKPassEntitlementsComposerEntryNode copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[PKDisplayablePassEntitlement copy](self->_displayableEntitlement, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[PKPassSharedEntitlement copy](self->_sharedEntitlement, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (PKDisplayablePassEntitlement)displayableEntitlement
{
  return self->_displayableEntitlement;
}

- (void)setDisplayableEntitlement:(id)a3
{
  objc_storeStrong((id *)&self->_displayableEntitlement, a3);
}

- (PKPassSharedEntitlement)sharedEntitlement
{
  return self->_sharedEntitlement;
}

- (void)setSharedEntitlement:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEntitlement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntitlement, 0);
  objc_storeStrong((id *)&self->_displayableEntitlement, 0);
}

@end
