@implementation PSGStructuredInfoSuggestion

- (PSGStructuredInfoSuggestion)initWithProactiveTrigger:(id)a3 portraitItem:(id)a4 operationalItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  PSGStructuredInfoSuggestion *v12;
  PSGStructuredInfoSuggestion *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSGStructuredInfoSuggestion;
  v12 = -[PSGStructuredInfoSuggestion init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_proactiveTrigger, a3);
    objc_storeStrong((id *)&v13->_portraitItem, a4);
    objc_storeStrong((id *)&v13->_operationalItem, a5);
  }

  return v13;
}

- (id)predictedValue
{
  void *portraitItem;

  portraitItem = self->_portraitItem;
  if (!portraitItem)
  {
    portraitItem = self->_operationalItem;
    if (!portraitItem)
      return &stru_1EA3F1D80;
  }
  objc_msgSend(portraitItem, "value");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isApplePay
{
  PSGOperationalPredictedItem *operationalItem;
  void *v4;
  void *v5;
  char v6;

  operationalItem = self->_operationalItem;
  if (!operationalItem)
    return 0;
  -[PSGOperationalPredictedItem itemIdentifier](operationalItem, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PSGOperationalPredictedItem itemIdentifier](self->_operationalItem, "itemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("surf"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PSGStructuredInfoSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PSGStructuredInfoSuggestion *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ppi"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("opi"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:](self, "initWithProactiveTrigger:portraitItem:operationalItem:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  PSGProactiveTrigger *proactiveTrigger;
  id v5;

  proactiveTrigger = self->_proactiveTrigger;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", proactiveTrigger, CFSTR("prt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_portraitItem, CFSTR("ppi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationalItem, CFSTR("opi"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[PSGProactiveTrigger copyWithZone:](self->_proactiveTrigger, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[PPQuickTypeItem copy](self->_portraitItem, "copy");
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[PSGOperationalPredictedItem copyWithZone:](self->_operationalItem, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  id *v4;
  id *v5;
  PSGProactiveTrigger *proactiveTrigger;
  PSGProactiveTrigger *v7;
  PSGProactiveTrigger *v8;
  PSGProactiveTrigger *v9;
  BOOL v10;
  PPQuickTypeItem *portraitItem;
  PPQuickTypeItem *v12;
  PPQuickTypeItem *v13;
  PPQuickTypeItem *v14;
  char v15;
  char v16;
  PSGOperationalPredictedItem *v17;
  PSGOperationalPredictedItem *v18;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  proactiveTrigger = self->_proactiveTrigger;
  v7 = (PSGProactiveTrigger *)v4[1];
  if (proactiveTrigger == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = proactiveTrigger;
    v10 = -[PSGProactiveTrigger isEqual:](v9, "isEqual:", v8);

    if (!v10)
      goto LABEL_8;
  }
  portraitItem = self->_portraitItem;
  v12 = (PPQuickTypeItem *)v5[2];
  if (portraitItem == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = portraitItem;
    v15 = -[PPQuickTypeItem isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_14;
    }
  }
  v17 = self->_operationalItem;
  v18 = v17;
  if (v17 == v5[3])
    v16 = 1;
  else
    v16 = -[PSGOperationalPredictedItem isEqual:](v17, "isEqual:");

LABEL_14:
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PSGStructuredInfoSuggestion *v4;
  PSGStructuredInfoSuggestion *v5;
  BOOL v6;

  v4 = (PSGStructuredInfoSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGStructuredInfoSuggestion isEqualToItem:](self, "isEqualToItem:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PSGProactiveTrigger hash](self->_proactiveTrigger, "hash");
  v4 = -[PPQuickTypeItem hash](self->_portraitItem, "hash") - v3 + 32 * v3;
  return -[PSGOperationalPredictedItem hash](self->_operationalItem, "hash") - v4 + 32 * v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PSGInputSuggestionsResponseItem prt:%@ ppi:%@ opi:%@>"), self->_proactiveTrigger, self->_portraitItem, self->_operationalItem);
}

- (PSGProactiveTrigger)proactiveTrigger
{
  return self->_proactiveTrigger;
}

- (PPQuickTypeItem)portraitItem
{
  return self->_portraitItem;
}

- (PSGOperationalPredictedItem)operationalItem
{
  return self->_operationalItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalItem, 0);
  objc_storeStrong((id *)&self->_portraitItem, 0);
  objc_storeStrong((id *)&self->_proactiveTrigger, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
