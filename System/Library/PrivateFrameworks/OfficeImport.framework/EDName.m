@implementation EDName

- (EDName)init
{
  EDName *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDName;
  result = -[EDName init](&v3, sel_init);
  if (result)
    result->_sheetIndex = 0;
  return result;
}

- (void)setSheetIndex:(unint64_t)a3
{
  self->_sheetIndex = a3;
}

- (void)setNameString:(id)a3
{
  objc_storeStrong((id *)&self->_nameString, a3);
}

- (void)setFormula:(id)a3 workbook:(id)a4
{
  id v7;
  void *v8;
  EDFormula *v9;

  v9 = (EDFormula *)a3;
  v7 = a4;
  if (self->_formula != v9)
  {
    objc_storeStrong((id *)&self->_formula, a3);
    objc_msgSend(v7, "processors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markObject:processor:", self, objc_opt_class());

  }
}

- (unint64_t)sheetIndex
{
  return self->_sheetIndex;
}

- (EDFormula)formula
{
  return self->_formula;
}

- (EDString)nameString
{
  return self->_nameString;
}

+ (id)name
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)isEqualToEDName:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;

  v6 = a3;
  -[EDName nameString](self, "nameString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[EDName nameString](self, "nameString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nameString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v10 = -[EDName sheetIndex](self, "sheetIndex");
  v9 = v10 == objc_msgSend(v6, "sheetIndex");
  if (v7 != v8)
    goto LABEL_5;
LABEL_6:

  return v9;
}

- (BOOL)isEqualToString:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EDName nameString](self, "nameString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  EDName *v4;
  EDName *v5;
  BOOL v6;
  BOOL v7;

  v4 = (EDName *)a3;
  v5 = v4;
  if (v4 != self)
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[EDName isEqualToString:](self, "isEqualToString:", v5);
LABEL_8:
        v7 = v6;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[EDName isEqualToEDName:](self, "isEqualToEDName:", v5);
        goto LABEL_8;
      }
    }
    v7 = 0;
    goto LABEL_10;
  }
  v7 = 1;
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  unint64_t sheetIndex;
  unint64_t v4;

  sheetIndex = self->_sheetIndex;
  v4 = (-[EDString hash](self->_nameString, "hash") << 8) + (sheetIndex << 16);
  return v4 + -[NSString hash](self->_formulaString, "hash");
}

- (BOOL)isInternalFunction
{
  void *v2;
  void *v3;
  char v4;

  -[EDName nameString](self, "nameString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("_xlfn."));

  return v4;
}

- (NSString)internalFunctionName
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[EDName isInternalFunction](self, "isInternalFunction");
  -[EDName nameString](self, "nameString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("_xlfn."), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (OITSUPointerKeyDictionary)maxWorksheetReferences
{
  OITSUPointerKeyDictionary *maxWorksheetReferences;
  OITSUPointerKeyDictionary *v4;
  OITSUPointerKeyDictionary *v5;

  maxWorksheetReferences = self->_maxWorksheetReferences;
  if (!maxWorksheetReferences)
  {
    v4 = objc_alloc_init(OITSUPointerKeyDictionary);
    v5 = self->_maxWorksheetReferences;
    self->_maxWorksheetReferences = v4;

    maxWorksheetReferences = self->_maxWorksheetReferences;
  }
  return maxWorksheetReferences;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDName;
  -[EDName description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formula, 0);
  objc_storeStrong((id *)&self->_nameString, 0);
  objc_storeStrong((id *)&self->_maxWorksheetReferences, 0);
  objc_storeStrong((id *)&self->_formulaString, 0);
}

- (id)formulaString
{
  return self->_formulaString;
}

- (void)setFormulaString:(id)a3 workbook:(id)a4
{
  id v7;
  void *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v7 = a4;
  if (self->_formulaString != v9)
  {
    objc_storeStrong((id *)&self->_formulaString, a3);
    if (self->_formulaString)
    {
      objc_msgSend(v7, "processors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "markObject:processor:", self, objc_opt_class());

    }
  }

}

@end
