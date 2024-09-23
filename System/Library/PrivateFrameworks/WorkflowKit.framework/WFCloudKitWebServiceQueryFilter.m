@implementation WFCloudKitWebServiceQueryFilter

- (id)stringRepresentationWithRecordType:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitWebServiceQueryFilter.m"), 65, CFSTR("-[WFCloudKitWebServiceQueryFilter stringRepresentationWithRecordType:] should be overridden by subclass"));

  return 0;
}

+ (id)filterWithCombinationOf:(id)a3 by:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setFilters:", v5);

  objc_msgSend(v6, "setType:", a4);
  return v6;
}

+ (id)filterWithComparisonOf:(id)a3 toString:(id)a4 by:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setRecordKey:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:", v10);
  objc_msgSend(v9, "setType:", a5);
  return v9;
}

+ (id)filterWithComparisonOf:(id)a3 toInt:(int64_t)a4 by:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setRecordKey:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v9);

  objc_msgSend(v8, "setType:", a5);
  return v8;
}

+ (id)filterWithComparisonOf:(id)a3 toStringArray:(id)a4 by:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setRecordKey:", v8);

  objc_msgSend(v7, "if_map:", &__block_literal_global_39527);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v11);

  objc_msgSend(v9, "setType:", a5);
  return v9;
}

uint64_t __75__WFCloudKitWebServiceQueryFilter_filterWithComparisonOf_toStringArray_by___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), a2);
}

@end
