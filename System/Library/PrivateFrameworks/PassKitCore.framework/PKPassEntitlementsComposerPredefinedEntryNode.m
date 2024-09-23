@implementation PKPassEntitlementsComposerPredefinedEntryNode

- (PKPassEntitlementsComposerPredefinedEntryNode)initWithPredefinedSelection:(id)a3 parentEntitlementComposer:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PKPassEntitlementsComposerPredefinedEntryNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PKPassEntitlementsComposerPredefinedEntryNode;
  v10 = -[PKPassEntitlementsComposerEntryNode initWithIdentifier:parentEntitlementComposer:](&v12, sel_initWithIdentifier_parentEntitlementComposer_, v9, v8);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_predefinedSelection, a3);
    -[PKPassEntitlementsComposerEntryNode setEditable:](v10, "setEditable:", 0);
  }

  return v10;
}

- (unint64_t)possibleShareability
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPredefinedSharedEntitlementSelection sharedEntitlements](self->_predefinedSelection, "sharedEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recipientShareability");

  return v4;
}

- (unint64_t)possibleVisibility
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPredefinedSharedEntitlementSelection sharedEntitlements](self->_predefinedSelection, "sharedEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recipientVisibility");

  return v4;
}

- (unint64_t)possibleManageability
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPredefinedSharedEntitlementSelection sharedEntitlements](self->_predefinedSelection, "sharedEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recipientManageability");

  return v4;
}

- (BOOL)possibleIntraAccountSharing
{
  void *v2;
  void *v3;
  char v4;

  -[PKPredefinedSharedEntitlementSelection sharedEntitlements](self->_predefinedSelection, "sharedEntitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intraAccountSharingEnabled");

  return v4;
}

- (id)allPossibleShareability
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode possibleShareability](self, "possibleShareability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allPossibleVisibility
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode possibleVisibility](self, "possibleVisibility"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allPossibleManageability
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode possibleManageability](self, "possibleManageability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassEntitlementsComposerPredefinedEntryNode;
  v4 = -[PKPassEntitlementsComposerEntryNode copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 7, self->_predefinedSelection);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predefinedSelection, 0);
}

@end
