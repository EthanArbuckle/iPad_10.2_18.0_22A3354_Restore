@implementation SXDataTableSelectorValidator

- (SXDataTableSelectorValidator)initWithRecordStore:(id)a3 dataOrientation:(unint64_t)a4
{
  id v7;
  SXDataTableSelectorValidator *v8;
  SXDataTableSelectorValidator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXDataTableSelectorValidator;
  v8 = -[SXDataTableSelectorValidator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordStore, a3);
    v9->_dataOrientation = a4;
  }

  return v9;
}

- (BOOL)validateRowSelector:(id)a3 forRowIndex:(unint64_t)a4
{
  unint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;

  if (a4 == -1)
    return 0;
  v4 = a4;
  v6 = a3;
  -[SXDataTableSelectorValidator conditionEngineForSelector:forIndexPath:](self, "conditionEngineForSelector:forIndexPath:", v6, v4, -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v6, "even"), v4);
  v8 = objc_msgSend(v6, "odd");

  objc_msgSend(v7, "addConditionForOddBoolean:withInteger:", v8, v4);
  LOBYTE(v4) = objc_msgSend(v7, "isValid");

  return v4;
}

- (BOOL)validateColumnSelector:(id)a3 forColumnIndex:(unint64_t)a4
{
  unint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;

  if (a4 == -1)
    return 0;
  v4 = a4;
  v6 = a3;
  -[SXDataTableSelectorValidator conditionEngineForSelector:forIndexPath:](self, "conditionEngineForSelector:forIndexPath:", v6, -1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v6, "even"), v4);
  v8 = objc_msgSend(v6, "odd");

  objc_msgSend(v7, "addConditionForOddBoolean:withInteger:", v8, v4);
  LOBYTE(v4) = objc_msgSend(v7, "isValid");

  return v4;
}

- (BOOL)validateCellSelector:(id)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;

  if (a4.var0 == -1)
    return 0;
  var1 = a4.var1;
  if (a4.var1 == -1)
    return 0;
  var0 = a4.var0;
  v7 = a3;
  -[SXDataTableSelectorValidator conditionEngineForSelector:forIndexPath:](self, "conditionEngineForSelector:forIndexPath:", v7, var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v7, "evenRows"), var0);
  objc_msgSend(v8, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v7, "evenColumns"), var1);
  objc_msgSend(v8, "addConditionForOddBoolean:withInteger:", objc_msgSend(v7, "oddRows"), var0);
  v9 = objc_msgSend(v7, "oddColumns");

  objc_msgSend(v8, "addConditionForOddBoolean:withInteger:", v9, var1);
  v10 = objc_msgSend(v8, "isValid");

  return v10;
}

- (id)conditionEngineForSelector:(id)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  -[SXDataTableSelectorValidator descriptorForIndexPath:](self, "descriptorForIndexPath:", var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXDataTableConditionEngine engine](SXDataTableConditionEngine, "engine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConditionForEqualInteger:withInteger:", objc_msgSend(v7, "columnIndex"), var1);
  objc_msgSend(v9, "addConditionForEqualInteger:withInteger:", objc_msgSend(v7, "rowIndex"), var0);
  objc_msgSend(v7, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConditionForEqualString:withString:", v10, v11);

  return v9;
}

- (id)descriptorForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[SXDataTableSelectorValidator dataOrientation](self, "dataOrientation");
  if (v6 == 1)
  {
    var1 = var0;
  }
  else if (v6)
  {
LABEL_8:
    v12 = 0;
    return v12;
  }
  if (var1 == -1)
    goto LABEL_8;
  -[SXDataTableSelectorValidator recordStore](self, "recordStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (var1 >= v9)
    goto LABEL_8;
  -[SXDataTableSelectorValidator recordStore](self, "recordStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", var1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (SXDataRecordStore)recordStore
{
  return self->_recordStore;
}

- (unint64_t)dataOrientation
{
  return self->_dataOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordStore, 0);
}

@end
