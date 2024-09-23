@implementation WBSCRDTPosition

- (WBSCRDTPosition)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WBSCRDTPosition *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("sortValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    self = -[WBSCRDTPosition initWithSortValues:](self, "initWithSortValues:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WBSCRDTPosition)initWithSortValues:(id)a3
{
  id v4;
  WBSCRDTPosition *v5;
  uint64_t v6;
  NSArray *sortValues;
  WBSCRDTPosition *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCRDTPosition;
  v5 = -[WBSCRDTPosition init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sortValues = v5->_sortValues;
    v5->_sortValues = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)positionBetweenPosition:(id)a3 andPosition:(id)a4 withDeviceIdentifier:(id)a5 changeID:(int64_t)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  WBSCRDTPositionSortValue *v13;
  WBSCRDTPositionSortValue *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void **v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  WBSCRDTPositionSortValue *v56;
  void *v57;
  void *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = -[WBSCRDTPositionSortValue initWithSortValue:deviceIdentifier:changeID:]([WBSCRDTPositionSortValue alloc], "initWithSortValue:deviceIdentifier:changeID:", 0, v12, a6);
  v14 = v13;
  if (v10 | v11)
  {
    if (v11)
    {
      if (v10)
      {
        v55 = v12;
        v56 = v13;
        v54 = v10;
        objc_msgSend((id)v10, "sortValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v11;
        objc_msgSend((id)v11, "sortValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "count");
        v18 = objc_msgSend(v16, "count");
        v52 = v18;
        if (v17 >= v18)
          v19 = v18;
        else
          v19 = v17;
        if (!v19)
        {
LABEL_12:
          if (v17 != v52)
          {
            v36 = objc_alloc((Class)a1);
            v11 = v53;
            if (v17 <= v52)
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", objc_msgSend(v21, "sortValue") - 1000);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v16;
              v39 = v17;
            }
            else
            {
              objc_msgSend(v15, "objectAtIndexedSubscript:", v52);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", objc_msgSend(v21, "sortValue") + 1000);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v15;
              v39 = v52;
            }
            objc_msgSend(v38, "subarrayWithRange:", 0, v39);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v36, "initWithSortValue:parentSortValues:", v37, v45);

            v10 = v54;
            goto LABEL_36;
          }
          v25 = objc_alloc((Class)a1);
          -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "initWithSortValue:parentSortValues:", v21, v15);
LABEL_35:
          v11 = v53;
          v10 = v54;
LABEL_36:

          v12 = v55;
          v14 = v56;
          goto LABEL_19;
        }
        v20 = 0;
        while (1)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToPositionSortValue:", v22) & 1) == 0)
          {
            v23 = objc_msgSend(v21, "sortValue");
            v24 = objc_msgSend(v22, "sortValue");
            if (v24 != v23)
              break;
          }

          if (v19 == ++v20)
            goto LABEL_12;
        }
        if (v24 - v23 < 2)
        {
          v46 = v20 + 1;
          if (v17 > v46)
          {
            v47 = objc_alloc((Class)a1);
            objc_msgSend(v15, "objectAtIndexedSubscript:", v46);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", objc_msgSend(v43, "sortValue") + 1000);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "subarrayWithRange:", 0, v46);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v47, "initWithSortValue:parentSortValues:", v48, v49);

            goto LABEL_34;
          }
          v50 = objc_alloc((Class)a1);
          if (v52 <= v46)
          {
            objc_msgSend(v15, "subarrayWithRange:", 0, v46);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v50, "initWithSortValue:parentSortValues:", v56, v43);
            goto LABEL_34;
          }
          objc_msgSend(v16, "objectAtIndexedSubscript:", v46);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", objc_msgSend(v43, "sortValue") - 1000);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "subarrayWithRange:", 0, v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v50, "initWithSortValue:parentSortValues:", v44, v51);

        }
        else
        {
          v40 = v24;
          v41 = objc_alloc((Class)a1);
          v42 = v40 + v23;
          if (v40 + v23 < 0 != __OFADD__(v40, v23))
            ++v42;
          -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v56, "positionSortValueWithSortValue:", v42 >> 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "subarrayWithRange:", 0, v20);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v41, "initWithSortValue:parentSortValues:", v43, v44);
        }

LABEL_34:
        goto LABEL_35;
      }
      v29 = objc_alloc((Class)a1);
      objc_msgSend((id)v11, "sortValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v14, "positionSortValueWithSortValue:", objc_msgSend(v30, "sortValue") - 1000);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = &v57;
    }
    else
    {
      v29 = objc_alloc((Class)a1);
      objc_msgSend((id)v10, "sortValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCRDTPositionSortValue positionSortValueWithSortValue:](v14, "positionSortValueWithSortValue:", objc_msgSend(v30, "sortValue") + 1000);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = &v58;
    }
    objc_msgSend(v32, "arrayWithObjects:count:", v33, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v29, "initWithSortValues:", v34);

  }
  else
  {
    v27 = objc_alloc((Class)a1);
    v59[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v27, "initWithSortValues:", v28);
  }

LABEL_19:
  return v26;
}

- (WBSCRDTPosition)init
{

  return 0;
}

- (WBSCRDTPosition)initWithSortValue:(id)a3 parentSortValues:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  WBSCRDTPosition *v9;

  v6 = a4;
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v7, "arrayByAddingObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WBSCRDTPosition initWithSortValues:](self, "initWithSortValues:", v8);

  return v9;
}

- (WBSCRDTPosition)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WBSCRDTPositionSortValue *v12;
  WBSCRDTPositionSortValue *v13;
  WBSCRDTPosition *v14;
  WBSCRDTPosition *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "safari_arrayForKey:", CFSTR("sortValues"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (v12 = -[WBSCRDTPositionSortValue initWithDictionaryRepresentation:]([WBSCRDTPositionSortValue alloc], "initWithDictionaryRepresentation:", v11)) == 0)
        {

          v15 = 0;
          goto LABEL_15;
        }
        v13 = v12;
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (objc_msgSend(v5, "count"))
  {
    self = -[WBSCRDTPosition initWithSortValues:](self, "initWithSortValues:", v5);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
LABEL_15:

  return v15;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("sortValues");
  -[NSArray valueForKey:](self->_sortValues, "valueForKey:", CFSTR("dictionaryRepresentation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSArray lastObject](self->_sortValues, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WBSCRDTPosition *v4;
  BOOL v5;

  v4 = (WBSCRDTPosition *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSArray isEqualToArray:](self->_sortValues, "isEqualToArray:", v4->_sortValues);
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  WBSCRDTPosition *v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;

  v4 = (WBSCRDTPosition *)a3;
  if (self == v4)
  {
    v12 = 0;
  }
  else
  {
    v5 = -[NSArray count](self->_sortValues, "count");
    v6 = -[NSArray count](v4->_sortValues, "count");
    v7 = v6;
    if (v5 >= v6)
      v8 = v6;
    else
      v8 = v5;
    if (v8)
    {
      v9 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_sortValues, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](v4->_sortValues, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "compare:", v11);

        if (v12)
          break;
        if (v8 == ++v9)
          goto LABEL_9;
      }
    }
    else
    {
LABEL_9:
      if (v5 >= v7)
        v12 = v5 > v7;
      else
        v12 = -1;
    }
  }

  return v12;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray valueForKey:](self->_sortValues, "valueForKey:", CFSTR("description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[ %@ ]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sortValues, CFSTR("sortValues"));
}

- (NSArray)sortValues
{
  return self->_sortValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortValues, 0);
}

@end
