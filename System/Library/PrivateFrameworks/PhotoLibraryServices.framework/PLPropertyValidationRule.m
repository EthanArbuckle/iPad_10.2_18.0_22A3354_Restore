@implementation PLPropertyValidationRule

- (id)reverseRule
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  switch(-[PLPropertyValidationRule type](self, "type"))
  {
    case 2:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 9;
      goto LABEL_16;
    case 3:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValue](self, "expectedValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 4;
      goto LABEL_6;
    case 4:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValue](self, "expectedValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 3;
LABEL_6:
      v8 = v3;
      v9 = v6;
      v10 = 0;
      goto LABEL_13;
    case 5:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 7;
      goto LABEL_10;
    case 6:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValues](self, "expectedValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 8;
      goto LABEL_12;
    case 7:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 5;
LABEL_10:
      _PLPropertyValidationRuleMake(v12, v3, 0, v6, v11, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 8:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValues](self, "expectedValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 6;
LABEL_12:
      v8 = v3;
      v9 = 0;
      v10 = v6;
LABEL_13:
      _PLPropertyValidationRuleMake(v7, v8, v9, 0, 0, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_17;
    case 9:
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 2;
LABEL_16:
      _PLPropertyValidationRuleMake(v4, v3, 0, 0, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)evaluateWithObject:(id)a3 outMessage:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = -[PLPropertyValidationRule type](self, "type");
  if (v7 == 1)
  {
LABEL_7:
    v15 = 1;
    goto LABEL_12;
  }
  if (!v7)
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule keyPaths](self, "keyPaths");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule descriptionOfCurrentValuesOfObject:](self, "descriptionOfCurrentValuesOfObject:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Skipping property validation for: %@.(%@). Actual value: %@"), v10, v13, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 1;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_7;
  }
  -[PLPropertyValidationRule predicate](self, "predicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v16, "evaluateWithObject:", v6);

  if (a4 && (v15 & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPropertyValidationRule keyPaths](self, "keyPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPropertyValidationRule descriptionOfCurrentValuesOfObject:](self, "descriptionOfCurrentValuesOfObject:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPropertyValidationRule predicate](self, "predicate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Property value validation failure: %@.(%@) (%@). Actual values: (%@). Expected values: (%@)"), v10, v13, v14, v18, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v15;
}

- (id)predicate
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  switch(-[PLPropertyValidationRule type](self, "type"))
  {
    case 2:
      v3 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K != NULL"), v4);
      goto LABEL_13;
    case 3:
      v6 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValue](self, "expectedValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), v4, v7);
      goto LABEL_21;
    case 4:
      v8 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValue](self, "expectedValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K != %@"), v4, v7);
      goto LABEL_21;
    case 5:
      -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v30 = (void *)MEMORY[0x1E0CB3880];
        -[PLPropertyValidationRule keyPath](self, "keyPath");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K <= %@"), v4, v7);
LABEL_21:
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v10)
      {
        v34[0] = v13;
        -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K BETWEEN %@"), v12, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K >= %@"), v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 6:
      v18 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValues](self, "expectedValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K in %@"), v4, v7);
      goto LABEL_21;
    case 7:
      v19 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v7;
      -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "predicateWithFormat:", CFSTR("NOT (%K BETWEEN %@)"), v4, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_24;
    case 8:
      v22 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValues](self, "expectedValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "predicateWithFormat:", CFSTR("NOT (%K in %@)"), v4, v7);
      goto LABEL_21;
    case 9:
      v23 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "predicateWithFormat:", CFSTR("%K == nil"), v4);
LABEL_13:
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 10:
      v24 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predicateWithFormat:", CFSTR("%K == NULL OR %K == 0"), v4, v7);
      goto LABEL_21;
    case 11:
      v25 = (void *)MEMORY[0x1E0CB3880];
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule keyPath](self, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPropertyValidationRule expectedValue](self, "expectedValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "predicateWithFormat:", CFSTR("%K == nil OR %K == %@"), v4, v7, v20);
      goto LABEL_23;
    case 12:
      -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0CB3880];
        -[PLPropertyValidationRule keyPath](self, "keyPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPropertyValidationRule keyPath](self, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v15;
          -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K == NULL OR (%K BETWEEN %@)"), v12, v14, v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        }
        else
        {
          -[PLPropertyValidationRule expectedValueRangeHigh](self, "expectedValueRangeHigh");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K == NULL OR %K <= %@"), v12, v14, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

LABEL_32:
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0CB3880];
        -[PLPropertyValidationRule keyPath](self, "keyPath");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPropertyValidationRule keyPath](self, "keyPath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPropertyValidationRule expectedValueRangeLow](self, "expectedValueRangeLow");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "predicateWithFormat:", CFSTR("%K == NULL OR %K >= %@"), v4, v7, v20);
LABEL_23:
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
LABEL_26:

      }
      return v17;
    default:
      return 0;
  }
}

- (id)keyPaths
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PLPropertyValidationRule keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentValuesOfObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPropertyValidationRule keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPropertyValidationRule keyPath](self, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  return v9;
}

- (id)descriptionOfCurrentValuesOfObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLPropertyValidationRule currentValuesOfObject:](self, "currentValuesOfObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSObject)expectedValue
{
  return self->_expectedValue;
}

- (void)setExpectedValue:(id)a3
{
  objc_storeStrong((id *)&self->_expectedValue, a3);
}

- (NSObject)expectedValueRangeLow
{
  return self->_expectedValueRangeLow;
}

- (void)setExpectedValueRangeLow:(id)a3
{
  objc_storeStrong((id *)&self->_expectedValueRangeLow, a3);
}

- (NSObject)expectedValueRangeHigh
{
  return self->_expectedValueRangeHigh;
}

- (void)setExpectedValueRangeHigh:(id)a3
{
  objc_storeStrong((id *)&self->_expectedValueRangeHigh, a3);
}

- (NSArray)expectedValues
{
  return self->_expectedValues;
}

- (void)setExpectedValues:(id)a3
{
  objc_storeStrong((id *)&self->_expectedValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_expectedValueRangeHigh, 0);
  objc_storeStrong((id *)&self->_expectedValueRangeLow, 0);
  objc_storeStrong((id *)&self->_expectedValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
