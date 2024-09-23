@implementation PLDisambiguation

- (PLDisambiguation)initWithQueryTerm:(id)a3 disambiguationType:(unint64_t)a4
{
  id v7;
  PLDisambiguation *v8;
  uint64_t v9;
  NSString *queryTerm;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSIndexSet *indexingCategories;
  void *v20;
  void *v21;
  objc_super v22;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDisambiguation.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryTerm.length > 0"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDisambiguation.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("disambiguationType != PLDisambiguationTypeUndefined"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PLDisambiguation;
  v8 = -[PLDisambiguation init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    queryTerm = v8->_queryTerm;
    v8->_queryTerm = (NSString *)v9;

    v8->_disambiguationType = a4;
    switch(a4)
    {
      case 1uLL:
        v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        PLSearchIndexCategoriesForCategoryMask(1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addIndexes:", v14);

        PLSearchIndexCategoriesForCategoryMask(64);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addIndexes:", v15);

        PLSearchIndexCategoriesForCategoryMask(0x40000);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addIndexes:", v16);

LABEL_11:
        v17 = objc_msgSend(v11, "copy");
        indexingCategories = v8->_indexingCategories;
        v8->_indexingCategories = (NSIndexSet *)v17;

        break;
      case 2uLL:
        v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        objc_msgSend(v11, "addIndex:", 1500);
        objc_msgSend(v11, "addIndex:", 1501);
        objc_msgSend(v11, "addIndex:", 1510);
        objc_msgSend(v11, "addIndex:", 1511);
        objc_msgSend(v11, "addIndex:", 1520);
        objc_msgSend(v11, "addIndex:", 1521);
        objc_msgSend(v11, "addIndex:", 1530);
        objc_msgSend(v11, "addIndex:", 1531);
        objc_msgSend(v11, "addIndex:", 1600);
        objc_msgSend(v11, "addIndex:", 1601);
        objc_msgSend(v11, "addIndex:", 1700);
        objc_msgSend(v11, "addIndex:", 1701);
        objc_msgSend(v11, "addIndex:", 1800);
        objc_msgSend(v11, "addIndex:", 1802);
        v12 = v11;
        v13 = 1803;
        goto LABEL_10;
      case 3uLL:
        v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        objc_msgSend(v11, "addIndex:", 1300);
        objc_msgSend(v11, "addIndex:", 1301);
        objc_msgSend(v11, "addIndex:", 1330);
        v12 = v11;
        v13 = 1331;
LABEL_10:
        objc_msgSend(v12, "addIndex:", v13);
        goto LABEL_11;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLDisambiguation queryTerm](self, "queryTerm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLDisambiguation disambiguationType](self, "disambiguationType");
  if (v5 - 1 > 2)
    v6 = CFSTR("PLDisambiguationTypeUndefined");
  else
    v6 = off_1E366F4B8[v5 - 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("QueryTerm: %@, disambiguationType: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)queryTerm
{
  return self->_queryTerm;
}

- (NSIndexSet)indexingCategories
{
  return self->_indexingCategories;
}

- (unint64_t)disambiguationType
{
  return self->_disambiguationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingCategories, 0);
  objc_storeStrong((id *)&self->_queryTerm, 0);
}

@end
