@implementation PXDebugValueList

- (PXDebugValueList)init
{
  PXDebugValueList *v2;
  uint64_t v3;
  NSMutableArray *debugValues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDebugValueList;
  v2 = -[PXDebugValueList init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    debugValues = v2->_debugValues;
    v2->_debugValues = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addValueWithLabel:(id)a3
{
  id v4;
  PXDebugValue *v5;
  id v6;

  v4 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PXDebugValue initWithLabel:]([PXDebugValue alloc], "initWithLabel:", v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)addValueWithLabel:(id)a3 BOOLValue:(BOOL)a4 positiveValue:(BOOL)a5 positiveHighlighted:(BOOL)a6 negativeHighlighted:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  PXDebugStringValue *v13;
  id v14;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v13 = -[PXDebugStringValue initWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:]([PXDebugStringValue alloc], "initWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", v12, v10, v9, v8, v7);

  objc_msgSend(v14, "addObject:", v13);
}

- (void)addValueWithLabel:(id)a3 BOOLValue:(BOOL)a4
{
  -[PXDebugValueList addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:](self, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", a3, a4, 1, 0, 0);
}

- (void)addValueWithLabel:(id)a3 doubleValue:(double)a4
{
  id v6;
  PXDebugStringValue *v7;
  id v8;

  v6 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PXDebugStringValue initWithLabel:doubleValue:]([PXDebugStringValue alloc], "initWithLabel:doubleValue:", v6, a4);

  objc_msgSend(v8, "addObject:", v7);
}

- (void)addValueWithLabel:(id)a3 integerValue:(int64_t)a4
{
  id v6;
  PXDebugStringValue *v7;
  id v8;

  v6 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PXDebugStringValue initWithLabel:integerValue:]([PXDebugStringValue alloc], "initWithLabel:integerValue:", v6, a4);

  objc_msgSend(v8, "addObject:", v7);
}

- (void)addValueWithLabel:(id)a3 stringValue:(id)a4 highlightStyle:(unint64_t)a5
{
  id v8;
  id v9;
  PXDebugStringValue *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[PXDebugStringValue initWithLabel:string:highlightStyle:]([PXDebugStringValue alloc], "initWithLabel:string:highlightStyle:", v9, v8, a5);

  objc_msgSend(v11, "addObject:", v10);
}

- (void)addValueWithLabel:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  PXDebugStringValue *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[PXDebugStringValue initWithLabel:string:highlightStyle:]([PXDebugStringValue alloc], "initWithLabel:string:highlightStyle:", v7, v6, 0);

  objc_msgSend(v9, "addObject:", v8);
}

- (void)addValueWithLabel:(id)a3 highlightedScore:(double)a4
{
  id v6;
  PXDebugStringValue *v7;
  id v8;

  v6 = a3;
  -[PXDebugValueList debugValues](self, "debugValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PXDebugStringValue initWithLabel:highlightedScore:]([PXDebugStringValue alloc], "initWithLabel:highlightedScore:", v6, a4);

  objc_msgSend(v8, "addObject:", v7);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[PXDebugValueList debugValues](self, "debugValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (NSMutableArray)debugValues
{
  return self->_debugValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugValues, 0);
}

@end
