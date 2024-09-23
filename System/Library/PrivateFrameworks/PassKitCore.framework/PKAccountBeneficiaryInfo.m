@implementation PKAccountBeneficiaryInfo

- (PKAccountBeneficiaryInfo)initWithDictionary:(id)a3
{
  id v4;
  PKAccountBeneficiaryInfo *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKAccountBeneficiary *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *beneficiaries;
  PKAccountBeneficiaryInfo *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKAccountBeneficiaryInfo;
  v5 = -[PKAccountBeneficiaryInfo init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayForKey:", CFSTR("beneficiaries"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
LABEL_14:

      v18 = 0;
      goto LABEL_15;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v6;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
          v13 = [PKAccountBeneficiary alloc];
          v14 = -[PKAccountBeneficiary initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v20);
          if (!v14)
          {

            goto LABEL_14;
          }
          v15 = (void *)v14;
          objc_msgSend(v7, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = objc_msgSend(v7, "copy");
    beneficiaries = v5->_beneficiaries;
    v5->_beneficiaries = (NSArray *)v16;

  }
  v18 = v5;
LABEL_15:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_beneficiaries, CFSTR("beneficiaries"));
}

- (PKAccountBeneficiaryInfo)initWithCoder:(id)a3
{
  id v4;
  PKAccountBeneficiaryInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *beneficiaries;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountBeneficiaryInfo;
  v5 = -[PKAccountBeneficiaryInfo init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("beneficiaries"));
    v9 = objc_claimAutoreleasedReturnValue();
    beneficiaries = v5->_beneficiaries;
    v5->_beneficiaries = (NSArray *)v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_beneficiaries;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copy", (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  v13 = (void *)v4[1];
  v4[1] = v12;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray description](self->_beneficiaries, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("beneficiaries"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSArray)beneficiaries
{
  return self->_beneficiaries;
}

- (void)setBeneficiaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaries, 0);
}

@end
