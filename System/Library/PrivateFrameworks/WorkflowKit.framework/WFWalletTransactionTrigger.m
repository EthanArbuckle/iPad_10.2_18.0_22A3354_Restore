@implementation WFWalletTransactionTrigger

- (WFWalletTransactionTrigger)init
{
  WFWalletTransactionTrigger *v2;
  WFWalletTransactionTrigger *v3;
  NSArray *selectedPassUniqueIDs;
  NSArray *selectedMerchantTypes;
  WFWalletTransactionTrigger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWalletTransactionTrigger;
  v2 = -[WFTrigger init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    selectedPassUniqueIDs = v2->_selectedPassUniqueIDs;
    v2->_selectedPassUniqueIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    selectedMerchantTypes = v3->_selectedMerchantTypes;
    v3->_selectedMerchantTypes = (NSArray *)&unk_1E7B8D880;

    v6 = v3;
  }

  return v3;
}

- (BOOL)hasValidConfiguration
{
  void *v2;
  BOOL v3;

  -[WFWalletTransactionTrigger selectedPassUniqueIDs](self, "selectedPassUniqueIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  return WFPassTypeToLocalizedDescriptionWithTrigger(self, 0);
}

- (id)localizedPastTenseDescription
{
  return WFPassTypeToLocalizedDescriptionWithTrigger(self, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWalletTransactionTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFWalletTransactionTrigger selectedPassUniqueIDs](self, "selectedPassUniqueIDs", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selectedPassUniqueIDs"));

  -[WFWalletTransactionTrigger selectedMerchantTypes](self, "selectedMerchantTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selectedMerchantTypes"));

  -[WFWalletTransactionTrigger selectedMerchants](self, "selectedMerchants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("selectedMerchants"));

}

- (WFWalletTransactionTrigger)initWithCoder:(id)a3
{
  id v4;
  WFWalletTransactionTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *selectedPassUniqueIDs;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *selectedMerchantTypes;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *selectedMerchants;
  WFWalletTransactionTrigger *v21;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFWalletTransactionTrigger;
  v5 = -[WFTrigger initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("selectedPassUniqueIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedPassUniqueIDs = v5->_selectedPassUniqueIDs;
    v5->_selectedPassUniqueIDs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("selectedMerchantTypes"));
    v14 = objc_claimAutoreleasedReturnValue();
    selectedMerchantTypes = v5->_selectedMerchantTypes;
    v5->_selectedMerchantTypes = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("selectedMerchants"));
    v19 = objc_claimAutoreleasedReturnValue();
    selectedMerchants = v5->_selectedMerchants;
    v5->_selectedMerchants = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFWalletTransactionTrigger;
  v4 = -[WFTrigger copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[WFWalletTransactionTrigger selectedPassUniqueIDs](self, "selectedPassUniqueIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSelectedPassUniqueIDs:", v6);

  -[WFWalletTransactionTrigger selectedMerchantTypes](self, "selectedMerchantTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedMerchantTypes:", v7);

  -[WFWalletTransactionTrigger selectedMerchants](self, "selectedMerchants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedMerchants:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WFWalletTransactionTrigger *v4;
  WFWalletTransactionTrigger *v5;
  WFWalletTransactionTrigger *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (WFWalletTransactionTrigger *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[WFWalletTransactionTrigger selectedPassUniqueIDs](self, "selectedPassUniqueIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWalletTransactionTrigger selectedPassUniqueIDs](v6, "selectedPassUniqueIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[WFWalletTransactionTrigger selectedMerchantTypes](self, "selectedMerchantTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWalletTransactionTrigger selectedMerchantTypes](v6, "selectedMerchantTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[WFWalletTransactionTrigger selectedMerchants](self, "selectedMerchants");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWalletTransactionTrigger selectedMerchants](v6, "selectedMerchants");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqual:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (Class)shortcutInputContentItemClass
{
  return (Class)objc_opt_class();
}

- (id)suggestedActions
{
  void *v2;
  void *v3;
  void *v4;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8D898, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_objectsPassingTest:", &__block_literal_global_20493);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletTransactionTrigger selectedPassUniqueIDs](self, "selectedPassUniqueIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletTransactionTrigger selectedMerchantTypes](self, "selectedMerchantTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletTransactionTrigger selectedMerchants](self, "selectedMerchants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, selectedPassUniqueIDs: %@, selectedMerchantTypes: %@, selectedMerchants: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)selectedPassUniqueIDs
{
  return self->_selectedPassUniqueIDs;
}

- (void)setSelectedPassUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPassUniqueIDs, a3);
}

- (NSArray)selectedMerchantTypes
{
  return self->_selectedMerchantTypes;
}

- (void)setSelectedMerchantTypes:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMerchantTypes, a3);
}

- (NSArray)selectedMerchants
{
  return self->_selectedMerchants;
}

- (void)setSelectedMerchants:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMerchants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMerchants, 0);
  objc_storeStrong((id *)&self->_selectedMerchantTypes, 0);
  objc_storeStrong((id *)&self->_selectedPassUniqueIDs, 0);
}

BOOL __46__WFWalletTransactionTrigger_suggestedActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (BOOL)isUserInitiated
{
  return 1;
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Transaction"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When I tap a Wallet Card or Pass”"));
}

+ (id)displayGlyph
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("Wallet"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
