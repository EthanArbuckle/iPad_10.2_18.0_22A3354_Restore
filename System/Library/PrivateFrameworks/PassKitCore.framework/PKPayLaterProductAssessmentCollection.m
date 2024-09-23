@implementation PKPayLaterProductAssessmentCollection

- (PKPayLaterProductAssessmentCollection)initWithArray:(id)a3
{
  id v4;
  PKPayLaterProductAssessmentCollection *v5;
  PKPayLaterProductAssessmentCollection *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  PKPayLaterProductAssessment *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *productAssessments;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *eligibleProductAssessments;
  uint64_t v27;
  NSArray *ineligibleProductAssessments;
  PKPayLaterProductAssessmentCollection *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPayLaterProductAssessmentCollection;
  v5 = -[PKPayLaterProductAssessmentCollection init](&v35, sel_init);
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            v15 = -[PKPayLaterProductAssessment initWithDictionary:]([PKPayLaterProductAssessment alloc], "initWithDictionary:", v14);

            if (v15)
            {
              v16 = -[PKPayLaterProductAssessment productType](v15, "productType");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v15, v17);

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v18 = objc_msgSend(v7, "copy");
      v6 = v30;
      productAssessments = v30->_productAssessments;
      v30->_productAssessments = (NSDictionary *)v18;
    }
    else
    {
      v6 = v30;
      productAssessments = v30->_productAssessments;
      v30->_productAssessments = 0;
    }

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PKPayLaterProductAssessmentCollection productAssessmentForProductType:](v6, "productAssessmentForProductType:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "isEligible"))
        v24 = v20;
      else
        v24 = v21;
      objc_msgSend(v24, "addObject:", v23, v30);
    }
    v25 = objc_msgSend(v20, "copy", v30);
    eligibleProductAssessments = v6->_eligibleProductAssessments;
    v6->_eligibleProductAssessments = (NSArray *)v25;

    v27 = objc_msgSend(v21, "copy");
    ineligibleProductAssessments = v6->_ineligibleProductAssessments;
    v6->_ineligibleProductAssessments = (NSArray *)v27;

  }
  return v6;
}

- (id)eligibleProductAssessments
{
  return self->_eligibleProductAssessments;
}

- (id)ineligibleProductAssessments
{
  return self->_ineligibleProductAssessments;
}

- (id)productAssessmentForProductType:(unint64_t)a3
{
  NSDictionary *productAssessments;
  void *v4;
  void *v5;

  productAssessments = self->_productAssessments;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](productAssessments, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)financingOptionWithSelectionIdentifier:(id)a3 productType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPayLaterProductAssessmentCollection productAssessmentForProductType:](self, "productAssessmentForProductType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "financingOptions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "selectionIdentifier");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = v14;
        if (v13 == v14)
        {

LABEL_16:
          v9 = v12;
          goto LABEL_17;
        }
        if (v6 && v13)
        {
          v16 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v16 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_17:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSDictionary copyWithZone:](self->_productAssessments, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterProductAssessmentCollection *v4;
  PKPayLaterProductAssessmentCollection *v5;
  NSDictionary *productAssessments;
  NSDictionary *v7;
  char v8;

  v4 = (PKPayLaterProductAssessmentCollection *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    productAssessments = self->_productAssessments;
    v7 = v5->_productAssessments;
    if (productAssessments && v7)
      v8 = -[NSDictionary isEqual:](productAssessments, "isEqual:");
    else
      v8 = productAssessments == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_productAssessments);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_productAssessments, CFSTR("productAssessments"));
}

- (PKPayLaterProductAssessmentCollection)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterProductAssessmentCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *productAssessments;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterProductAssessmentCollection;
  v5 = -[PKPayLaterProductAssessmentCollection init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("productAssessments"));
    v10 = objc_claimAutoreleasedReturnValue();
    productAssessments = v5->_productAssessments;
    v5->_productAssessments = (NSDictionary *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productAssessments: %@; "), self->_productAssessments);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ineligibleProductAssessments, 0);
  objc_storeStrong((id *)&self->_eligibleProductAssessments, 0);
  objc_storeStrong((id *)&self->_productAssessments, 0);
}

@end
