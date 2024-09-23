@implementation CNVCardLine

+ (id)lineWithName:(id)a3 value:(id)a4
{
  return (id)objc_msgSend(a1, "lineWithName:value:itemSeparator:", a3, a4, 0);
}

+ (id)lineWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:value:itemSeparator:", v10, v9, v8);

  return v11;
}

+ (id)lineWithLiteralValue:(id)a3
{
  return +[CNVCardLiteralLine lineWithLiteralValue:](CNVCardLiteralLine, "lineWithLiteralValue:", a3);
}

+ (id)versionPlaceholderLine
{
  return +[CNVCardVersionPlaceholderLine line](CNVCardVersionPlaceholderLine, "line");
}

- (CNVCardLine)initWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNVCardLine *v11;
  uint64_t v12;
  NSString *name;
  NSMutableArray *v14;
  NSMutableArray *parameters;
  NSMutableArray *v16;
  NSMutableArray *groupedLines;
  uint64_t v18;
  NSString *itemSeparator;
  CNVCardLine *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CNVCardLine init](self, "init");
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong(&v11->_value, a4);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parameters = v11->_parameters;
    v11->_parameters = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    groupedLines = v11->_groupedLines;
    v11->_groupedLines = v16;

    v18 = objc_msgSend(v10, "copy");
    itemSeparator = v11->_itemSeparator;
    v11->_itemSeparator = (NSString *)v18;

    v20 = v11;
  }

  return v11;
}

- (void)addParameterWithName:(id)a3 value:(id)a4
{
  id v5;

  +[CNVCardParameter parameterWithName:value:](CNVCardParameter, "parameterWithName:value:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray _cn_addNonNilObject:](self->_parameters, "_cn_addNonNilObject:", v5);

}

- (void)insertParameterWithName:(id)a3 value:(id)a4 atIndex:(unint64_t)a5
{
  id v7;

  +[CNVCardParameter parameterWithName:value:](CNVCardParameter, "parameterWithName:value:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray _cn_insertNonNilObject:atIndex:](self->_parameters, "_cn_insertNonNilObject:atIndex:", v7, a5);

}

- (void)addGroupedLine:(id)a3 withCounter:(int64_t *)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *grouping;
  id v10;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    if (!self->_grouping)
    {
      -[CNVCardLine makeGroupingNameWithCounter:](self, "makeGroupingNameWithCounter:", a4);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      grouping = self->_grouping;
      self->_grouping = v8;

    }
    -[NSMutableArray addObject:](self->_groupedLines, "addObject:", v10);
    v7 = v10;
  }

}

- (id)makeGroupingNameWithCounter:(int64_t *)a3
{
  int64_t v3;

  v3 = *a3 + 1;
  *a3 = v3;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item%ld"), v3);
}

- (BOOL)canSerializeWithStrategy:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "canSerializeString:", self->_value);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v4, "canSerializeArray:", self->_value);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        goto LABEL_8;
      }
      v5 = objc_msgSend(v4, "canSerializeData:", self->_value);
    }
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)serializeWithStrategy:(id)a3
{
  objc_msgSend(a3, "serializeLine:", self);
}

- (void)serializeValueWithStrategy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  v4 = self->_value;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v13, "serializeString:", v6);
  }
  else
  {
    objc_opt_class();
    v7 = self->_value;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      -[CNVCardLine itemSeparator](self, "itemSeparator");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serializeArray:withItemSeparator:", v9, v10);
    }
    else
    {
      objc_opt_class();
      v11 = self->_value;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v10 = v12;

      if (v10)
        objc_msgSend(v13, "serializeData:", v10);
    }

  }
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSArray)parameters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)groupingName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)groupedLines
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)itemSeparator
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSeparator, 0);
  objc_storeStrong((id *)&self->_groupedLines, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
