@implementation PKPassAutomaticSelectionCriterion

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_type, "hash");
  v4 = -[NSSet hash](self->_primaryTCIs, "hash") - v3 + 32 * v3;
  v5 = -[NSSet hash](self->_TCIs, "hash") - v4 + 32 * v4;
  v6 = -[NSData hash](self->_mask, "hash") - v5 + 32 * v5;
  v7 = -[NSSet hash](self->_readerIDs, "hash") - v6 + 32 * v6;
  v8 = -[NSSet hash](self->_associatedReaderIDs, "hash");
  v9 = self->_supportsInSessionExpress - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  return self->_supportsExpress - v9 + 32 * v9 + 0xD2FD88B5F11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryTCIs, CFSTR("primaryTCIs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_TCIs, CFSTR("tcis"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mask, CFSTR("mask"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsExpress, CFSTR("supportsExpress"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsInSessionExpress, CFSTR("supportsInSessionExpress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIDs, CFSTR("readerIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedReaderIDs, CFSTR("associatedReaderIDs"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsExpress
{
  return self->_supportsExpress;
}

+ (id)expressModeForCriterion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  v5 = objc_msgSend(v3, "technologyType");
  if (v5 == 3)
  {
    v6 = (id *)&PKPaymentExpressModeTypeAGeneric;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    objc_msgSend(v4, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("ecp.1.access.")))
    {
      objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("ecp.1.access."), "length"), CFSTR("access.hid."));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }

LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  if (v5 != 1)
    goto LABEL_11;
  v6 = (id *)&PKPaymentExpressModeSuica;
LABEL_7:
  v7 = *v6;
LABEL_12:

  return v7;
}

- (int64_t)technologyType
{
  return self->_technologyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_associatedReaderIDs, 0);
  objc_storeStrong((id *)&self->_readerIDs, 0);
  objc_storeStrong((id *)&self->_TCIs, 0);
  objc_storeStrong((id *)&self->_primaryTCIs, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (PKPassAutomaticSelectionCriterion)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKPassAutomaticSelectionCriterion *v6;
  uint64_t v7;
  int64_t v8;
  PKPassAutomaticSelectionCriterion *v9;
  uint64_t v10;
  NSString *type;
  void *v12;
  uint64_t v13;
  NSSet *primaryTCIs;
  void *v15;
  uint64_t v16;
  NSSet *TCIs;
  void *v18;
  uint64_t v19;
  NSSet *readerIDs;
  BOOL v21;
  void *v22;
  uint64_t v23;
  NSData *mask;
  _BYTE *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSSet *associatedReaderIDs;
  uint64_t v31;
  unint64_t v33;
  void *v34;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (PKPassAutomaticSelectionCriterion *)objc_claimAutoreleasedReturnValue();
    v7 = PKPassAutomaticSelectionTechnologyTypeFromType(v6);
    if (v6)
    {
      v8 = v7;
      v9 = -[PKPassAutomaticSelectionCriterion init](self, "init");
      if (!v9)
      {
LABEL_25:
        self = v9;

        v6 = self;
        goto LABEL_26;
      }
      v10 = -[PKPassAutomaticSelectionCriterion copy](v6, "copy");
      type = v9->_type;
      v9->_type = (NSString *)v10;

      v9->_technologyType = v8;
      if (v8 == 5)
      {
        objc_msgSend(v5, "PKStringForKey:", CFSTR("openLoopExpressMask"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pk_decodeHexadecimal");
        v23 = objc_claimAutoreleasedReturnValue();
        mask = v9->_mask;
        v9->_mask = (NSData *)v23;

        v25 = -[NSData bytes](v9->_mask, "bytes");
        v26 = -[NSData length](v9->_mask, "length");
        if (v26)
        {
          if (*v25)
          {
            v21 = 1;
          }
          else
          {
            v31 = 1;
            while (v26 != v31)
            {
              if (v25[v31++])
              {
                v33 = v31 - 1;
                goto LABEL_21;
              }
            }
            v33 = v26;
LABEL_21:
            v21 = v33 < v26;
          }
        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        if (v8 != 4)
        {
          v21 = 1;
          goto LABEL_23;
        }
        objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("primaryTCIs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(v12, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        primaryTCIs = v9->_primaryTCIs;
        v9->_primaryTCIs = (NSSet *)v13;

        objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("tcis"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(v15, v9->_primaryTCIs);
        v16 = objc_claimAutoreleasedReturnValue();
        TCIs = v9->_TCIs;
        v9->_TCIs = (NSSet *)v16;

        objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("readerIDs"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(v18, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        readerIDs = v9->_readerIDs;
        v9->_readerIDs = (NSSet *)v19;

        if (-[NSSet count](v9->_primaryTCIs, "count"))
          v21 = 1;
        else
          v21 = -[NSSet count](v9->_TCIs, "count") != 0;
        objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedReaderIDs"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v22, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setWithArray:", v28);
        v29 = objc_claimAutoreleasedReturnValue();
        associatedReaderIDs = v9->_associatedReaderIDs;
        v9->_associatedReaderIDs = (NSSet *)v29;

      }
LABEL_23:
      v9->_supportsInSessionExpress = objc_msgSend(v5, "PKBoolForKey:", CFSTR("supportsInSessionExpress"));
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supportsExpress"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_supportsExpress = objc_msgSend(v34, "BOOLValue");

      if (!v21)
      {

        v9 = 0;
      }
      goto LABEL_25;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_26:

  return v6;
}

id __56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "pk_decodeHexadecimal", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length") && (!v4 || (objc_msgSend(v4, "containsObject:", v11) & 1) == 0))
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = (void *)objc_msgSend(v5, "copy");
  else
    v12 = 0;

  return v12;
}

- (PKPassAutomaticSelectionCriterion)initWithCoder:(id)a3
{
  id v4;
  PKPassAutomaticSelectionCriterion *v5;
  uint64_t v6;
  NSString *type;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *primaryTCIs;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSSet *TCIs;
  uint64_t v18;
  NSData *mask;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSSet *readerIDs;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSSet *associatedReaderIDs;

  v4 = a3;
  v5 = -[PKPassAutomaticSelectionCriterion init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    v5->_technologyType = PKPassAutomaticSelectionTechnologyTypeFromType(v5->_type);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("primaryTCIs"));
    v11 = objc_claimAutoreleasedReturnValue();
    primaryTCIs = v5->_primaryTCIs;
    v5->_primaryTCIs = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("tcis"));
    v16 = objc_claimAutoreleasedReturnValue();
    TCIs = v5->_TCIs;
    v5->_TCIs = (NSSet *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mask"));
    v18 = objc_claimAutoreleasedReturnValue();
    mask = v5->_mask;
    v5->_mask = (NSData *)v18;

    v5->_supportsExpress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsExpress"));
    v5->_supportsInSessionExpress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsInSessionExpress"));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("readerIDs"));
    v23 = objc_claimAutoreleasedReturnValue();
    readerIDs = v5->_readerIDs;
    v5->_readerIDs = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("associatedReaderIDs"));
    v28 = objc_claimAutoreleasedReturnValue();
    associatedReaderIDs = v5->_associatedReaderIDs;
    v5->_associatedReaderIDs = (NSSet *)v28;

  }
  return v5;
}

+ (id)criterionForExpressMode:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  PKPassAutomaticSelectionCriterion *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("supportsExpress"));
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("transit.felica.suica")) & 1) != 0)
    {
      v5 = CFSTR("suica");
LABEL_10:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("type"));
      v6 = -[PKPassAutomaticSelectionCriterion initWithDictionary:]([PKPassAutomaticSelectionCriterion alloc], "initWithDictionary:", v4);

LABEL_12:
      goto LABEL_13;
    }
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("access.hid.")) & 1) != 0)
    {
      objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("access.hid."), "length"), CFSTR("ecp.1.access."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_10;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("type_a.generic")) & 1) != 0)
    {
      v5 = CFSTR("generic.type_a");
      goto LABEL_10;
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

PKASCAssociatedReaderID *__56__PKPassAutomaticSelectionCriterion_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKASCAssociatedReaderID *v3;

  v2 = a2;
  v3 = -[PKASCAssociatedReaderID initWithDictionary:]([PKASCAssociatedReaderID alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  NSString *type;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSData *mask;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", type, CFSTR("type"));
  if (-[NSSet count](self->_primaryTCIs, "count"))
  {
    -[NSSet pk_setByApplyingBlock:](self->_primaryTCIs, "pk_setByApplyingBlock:", &__block_literal_global_35_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("primaryTCIs"));

  }
  if (-[NSSet count](self->_TCIs, "count"))
  {
    -[NSSet pk_setByApplyingBlock:](self->_TCIs, "pk_setByApplyingBlock:", &__block_literal_global_36_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("tcis"));

  }
  if (-[NSSet count](self->_readerIDs, "count"))
  {
    -[NSSet pk_setByApplyingBlock:](self->_readerIDs, "pk_setByApplyingBlock:", &__block_literal_global_37_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("readerIDs"));

  }
  if (-[NSSet count](self->_associatedReaderIDs, "count"))
  {
    -[NSSet pk_setByApplyingBlock:](self->_associatedReaderIDs, "pk_setByApplyingBlock:", &__block_literal_global_39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("associatedReaderIDs"));

  }
  mask = self->_mask;
  if (mask)
  {
    -[NSData hexEncoding](mask, "hexEncoding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("openLoopExpressMask"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInSessionExpress);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("supportsInSessionExpress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsExpress);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("supportsExpress"));

  v18 = (void *)objc_msgSend(v4, "copy");
  return v18;
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hexEncoding");
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hexEncoding");
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hexEncoding");
}

uint64_t __49__PKPassAutomaticSelectionCriterion_asDictionary__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asDictionary");
}

- (BOOL)isEqual:(id)a3
{
  PKPassAutomaticSelectionCriterion *v4;
  PKPassAutomaticSelectionCriterion *v5;
  PKPassAutomaticSelectionCriterion *v6;
  PKPassAutomaticSelectionCriterion *v7;
  NSString *type;
  NSString *v9;
  BOOL v10;
  char v11;
  NSSet *primaryTCIs;
  NSSet *v13;
  BOOL v14;
  NSSet *TCIs;
  NSSet *v16;
  BOOL v17;
  NSData *mask;
  NSData *v19;
  BOOL v20;
  NSSet *readerIDs;
  NSSet *v22;
  NSSet *associatedReaderIDs;
  NSSet *v24;

  v4 = (PKPassAutomaticSelectionCriterion *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (!v6)
      goto LABEL_48;
    type = v6->_type;
    v9 = self->_type;
    if (type)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
      if (type != v9)
        goto LABEL_48;
    }
    else if ((-[NSString isEqual:](type, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    primaryTCIs = v7->_primaryTCIs;
    v13 = self->_primaryTCIs;
    if (primaryTCIs)
      v14 = v13 == 0;
    else
      v14 = 1;
    if (v14)
    {
      if (primaryTCIs != v13)
        goto LABEL_48;
    }
    else if ((-[NSSet isEqual:](primaryTCIs, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    TCIs = v7->_TCIs;
    v16 = self->_TCIs;
    if (TCIs)
      v17 = v16 == 0;
    else
      v17 = 1;
    if (v17)
    {
      if (TCIs != v16)
        goto LABEL_48;
    }
    else if ((-[NSSet isEqual:](TCIs, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    mask = v7->_mask;
    v19 = self->_mask;
    if (mask)
      v20 = v19 == 0;
    else
      v20 = 1;
    if (v20)
    {
      if (mask != v19)
        goto LABEL_48;
    }
    else if ((-[NSData isEqual:](mask, "isEqual:") & 1) == 0)
    {
      goto LABEL_48;
    }
    if (v7->_supportsInSessionExpress == self->_supportsInSessionExpress
      && v7->_supportsExpress == self->_supportsExpress)
    {
      readerIDs = v7->_readerIDs;
      v22 = self->_readerIDs;
      if (readerIDs && v22)
      {
        if ((-[NSSet isEqual:](readerIDs, "isEqual:") & 1) != 0)
        {
LABEL_44:
          associatedReaderIDs = v7->_associatedReaderIDs;
          v24 = self->_associatedReaderIDs;
          if (associatedReaderIDs && v24)
            v11 = -[NSSet isEqual:](associatedReaderIDs, "isEqual:");
          else
            v11 = associatedReaderIDs == v24;
          goto LABEL_49;
        }
      }
      else if (readerIDs == v22)
      {
        goto LABEL_44;
      }
    }
LABEL_48:
    v11 = 0;
LABEL_49:

    goto LABEL_50;
  }
  v11 = 1;
LABEL_50:

  return v11;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; Type %@; Supports Express %ld; "),
    objc_opt_class(),
    self,
    self->_type,
    self->_supportsExpress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet count](self->_primaryTCIs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Primary TCIs %@; "), self->_primaryTCIs);
  if (-[NSSet count](self->_TCIs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("TCIs %@; "), self->_TCIs);
  if (-[NSData length](self->_mask, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Mask %@; "), self->_mask);
  objc_msgSend(v3, "appendFormat:", CFSTR("Supports In Session Express %ld; "), self->_supportsInSessionExpress);
  if (-[NSSet count](self->_readerIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("ReaderIds %@; "), self->_readerIDs);
  if (-[NSSet count](self->_associatedReaderIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("AssociatedReaderIDs %@; "), self->_associatedReaderIDs);
  objc_msgSend(v3, "appendString:", CFSTR(" >"));
  return v3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setTechnologyType:(int64_t)a3
{
  self->_technologyType = a3;
}

- (void)setSupportsExpress:(BOOL)a3
{
  self->_supportsExpress = a3;
}

- (BOOL)supportsInSessionExpress
{
  return self->_supportsInSessionExpress;
}

- (void)setSupportsInSessionExpress:(BOOL)a3
{
  self->_supportsInSessionExpress = a3;
}

- (NSSet)primaryTCIs
{
  return self->_primaryTCIs;
}

- (void)setPrimaryTCIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)TCIs
{
  return self->_TCIs;
}

- (void)setTCIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)readerIDs
{
  return self->_readerIDs;
}

- (void)setReaderIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)associatedReaderIDs
{
  return self->_associatedReaderIDs;
}

- (void)setAssociatedReaderIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)mask
{
  return self->_mask;
}

- (void)setMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

@end
