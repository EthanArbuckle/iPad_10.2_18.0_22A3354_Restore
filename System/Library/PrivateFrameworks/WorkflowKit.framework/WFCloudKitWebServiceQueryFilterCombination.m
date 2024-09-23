@implementation WFCloudKitWebServiceQueryFilterCombination

- (id)stringRepresentationWithRecordType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;

  v4 = a3;
  -[WFCloudKitWebServiceQueryFilterCombination filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __81__WFCloudKitWebServiceQueryFilterCombination_stringRepresentationWithRecordType___block_invoke;
  v18 = &unk_1E7AF33D0;
  v19 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_map:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFCloudKitWebServiceQueryFilterCombination type](self, "type");
  v9 = CFSTR(" OR ");
  if (v8 != 1)
    v9 = 0;
  if (v8)
    v10 = v9;
  else
    v10 = CFSTR(" AND ");
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "componentsJoinedByString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@)"), v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

uint64_t __81__WFCloudKitWebServiceQueryFilterCombination_stringRepresentationWithRecordType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentationWithRecordType:", *(_QWORD *)(a1 + 32));
}

@end
