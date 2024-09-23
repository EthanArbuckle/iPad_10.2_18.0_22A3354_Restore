@implementation _EditScriptDataArray

- (_EditScriptDataArray)initWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v7;
  _EditScriptDataArray *v8;
  _EditScriptDataArray *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *data;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  NSArray *v23;
  _EditScriptDataArray *v24;
  void *v25;
  NSArray *v26;
  void *v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  _EditScriptDataArray *v33;
  objc_super v34;

  v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_EditScriptDataArray;
  v8 = -[_EditScriptDataArray init](&v34, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_EditScriptDataArray setCachedStringValue:](v8, "setCachedStringValue:", v7);
    v10 = objc_msgSend(v7, "length");
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v15 = objc_claimAutoreleasedReturnValue();
      data = v9->_data;
      v9->_data = (NSArray *)v15;

      v31 = v10 - 1;
      if (v10 >= 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v29 = v7;
        v30 = v10;
        do
        {
          v20 = objc_msgSend(v7, "characterAtIndex:", v19);
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "characterIsMember:", v20);

          if ((v22 & 1) != 0 || v19 == v31)
          {
            v17 += v18;
            v18 = v19 + 1 - v17 - v22;
            v23 = v9->_data;
            objc_msgSend(v7, "substringWithRange:", v17, v18);
            v24 = v9;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v23, "addObject:", v25);

            if (v22)
            {
              v26 = v24->_data;
              objc_msgSend(v7, "substringWithRange:", v19, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v26, "addObject:", v27);

              v17 = v19;
              v18 = 1;
            }
            v9 = v24;
            ++v19;
            v7 = v29;
            v10 = v30;
          }
          else
          {
            ++v19;
          }
        }
        while (v19 != v10);
      }
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_EditScriptDataArray.m"), 61, CFSTR("Unexpected chunk size == %ld!"), a4);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v9->_data;
        v9->_data = (NSArray *)v11;

        v13 = objc_msgSend(v7, "length");
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __49___EditScriptDataArray_initWithString_chunkSize___block_invoke;
        v32[3] = &unk_1E16D5580;
        v33 = v9;
        objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 2, v32);
        v14 = v33;
      }

    }
  }

  return v9;
}

- (_EditScriptDataArray)initWithArray:(id)a3
{
  id v4;
  _EditScriptDataArray *v5;
  uint64_t v6;
  NSArray *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EditScriptDataArray;
  v5 = -[_EditScriptDataArray init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSArray *)v6;

  }
  return v5;
}

- (NSString)description
{
  return -[NSArray description](self->_data, "description");
}

+ (id)EditScriptDataWithString:(id)a3 chunkSize:(int64_t)a4
{
  id v5;
  _EditScriptDataArray *v6;

  v5 = a3;
  v6 = -[_EditScriptDataArray initWithString:chunkSize:]([_EditScriptDataArray alloc], "initWithString:chunkSize:", v5, a4);

  return v6;
}

+ (id)EditScriptDataWithArray:(id)a3
{
  id v3;
  _EditScriptDataArray *v4;

  v3 = a3;
  v4 = -[_EditScriptDataArray initWithArray:]([_EditScriptDataArray alloc], "initWithArray:", v3);

  return v4;
}

- (int64_t)length
{
  return -[NSArray count](self->_data, "count");
}

- (id)stringAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", a3);
}

- (id)stringValue
{
  NSString *cachedStringValue;
  void *v4;

  cachedStringValue = self->_cachedStringValue;
  if (!cachedStringValue)
  {
    -[NSArray componentsJoinedByString:](self->_data, "componentsJoinedByString:", &stru_1E16EDF20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EditScriptDataArray setCachedStringValue:](self, "setCachedStringValue:", v4);

    cachedStringValue = self->_cachedStringValue;
  }
  return cachedStringValue;
}

- (int64_t)lengthOfItem:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (int64_t)characterIndexForItem:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;

  if (a3 < 1)
    return 0;
  v5 = 0;
  v6 = 0;
  do
    v6 += -[_EditScriptDataArray lengthOfItem:](self, "lengthOfItem:", v5++);
  while (a3 != v5);
  return v6;
}

- (int64_t)indexOfFirstDifferenceWithOtherData:(id)a3 shouldReverseIterate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int64_t v19;
  unint64_t v21;
  unint64_t v22;

  v4 = a4;
  v6 = a3;
  v7 = -[_EditScriptDataArray length](self, "length");
  v8 = objc_msgSend(v6, "length");
  v9 = 0;
  if (v7 >= v8)
    v10 = v8;
  else
    v10 = v7;
  if (v10)
  {
    v21 = v8;
    v22 = v7;
    v11 = v8 - 1;
    v12 = v7 - 1;
    while (1)
    {
      v13 = v4 ? v12 : v9;
      v14 = v4 ? v11 : v9;
      -[_EditScriptDataArray stringAtIndex:](self, "stringAtIndex:", v13, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (!v17)
        break;
      ++v9;
      --v11;
      --v12;
      if (v10 == v9)
      {
        v9 = v10;
        break;
      }
    }
    v8 = v21;
    v7 = v22;
  }
  if (v9 == v10 && v7 == v8)
    v19 = -1;
  else
    v19 = v9;

  return v19;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)cachedStringValue
{
  return self->_cachedStringValue;
}

- (void)setCachedStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStringValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStringValue, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
