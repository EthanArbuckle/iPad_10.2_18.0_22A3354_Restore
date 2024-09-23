@implementation TRIPBUnknownField

- (TRIPBUnknownField)initWithNumber:(int)a3
{
  TRIPBUnknownField *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIPBUnknownField;
  result = -[TRIPBUnknownField init](&v5, sel_init);
  if (result)
    result->number_ = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIPBUnknownField;
  -[TRIPBUnknownField dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TRIPBUnknownField *v5;
  NSMutableArray *mutableGroupList;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[TRIPBUnknownField initWithNumber:](+[TRIPBUnknownField allocWithZone:](TRIPBUnknownField, "allocWithZone:"), "initWithNumber:", self->number_);
  v5->mutableFixed32List_ = (TRIPBUInt32Array *)-[TRIPBUInt32Array copyWithZone:](self->mutableFixed32List_, "copyWithZone:", a3);
  v5->mutableFixed64List_ = (TRIPBUInt64Array *)-[TRIPBUInt64Array copyWithZone:](self->mutableFixed64List_, "copyWithZone:", a3);
  v5->mutableLengthDelimitedList_ = (NSMutableArray *)-[NSMutableArray mutableCopyWithZone:](self->mutableLengthDelimitedList_, "mutableCopyWithZone:", a3);
  v5->mutableVarintList_ = (TRIPBUInt64Array *)-[TRIPBUInt64Array copyWithZone:](self->mutableVarintList_, "copyWithZone:", a3);
  if (-[NSMutableArray count](self->mutableGroupList_, "count"))
  {
    v5->mutableGroupList_ = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->mutableGroupList_, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    mutableGroupList = self->mutableGroupList_;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(mutableGroupList);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
          -[NSMutableArray addObject:](v5->mutableGroupList_, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->number_ != *((_DWORD *)a3 + 2))
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((!-[TRIPBUInt64Array count](self->mutableVarintList_, "count") && !objc_msgSend(*((id *)a3 + 2), "count")
     || (v5 = -[TRIPBUInt64Array isEqual:](self->mutableVarintList_, "isEqual:", *((_QWORD *)a3 + 2))) != 0)
    && (!-[TRIPBUInt32Array count](self->mutableFixed32List_, "count") && !objc_msgSend(*((id *)a3 + 3), "count")
     || (v5 = -[TRIPBUInt32Array isEqual:](self->mutableFixed32List_, "isEqual:", *((_QWORD *)a3 + 3))) != 0)
    && (!-[TRIPBUInt64Array count](self->mutableFixed64List_, "count") && !objc_msgSend(*((id *)a3 + 4), "count")
     || (v5 = -[TRIPBUInt64Array isEqual:](self->mutableFixed64List_, "isEqual:", *((_QWORD *)a3 + 4))) != 0)
    && (!-[NSMutableArray count](self->mutableLengthDelimitedList_, "count") && !objc_msgSend(*((id *)a3 + 5), "count")
     || (v5 = -[NSMutableArray isEqual:](self->mutableLengthDelimitedList_, "isEqual:", *((_QWORD *)a3 + 5))) != 0))
  {
    if (-[NSMutableArray count](self->mutableGroupList_, "count") || objc_msgSend(*((id *)a3 + 6), "count"))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](self->mutableGroupList_, "isEqual:", *((_QWORD *)a3 + 6));
      return v5;
    }
LABEL_20:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[TRIPBUInt64Array hash](self->mutableVarintList_, "hash");
  v4 = -[TRIPBUInt32Array hash](self->mutableFixed32List_, "hash") - v3 + 32 * v3;
  v5 = -[TRIPBUInt64Array hash](self->mutableFixed64List_, "hash") - v4 + 32 * v4;
  v6 = -[NSMutableArray hash](self->mutableLengthDelimitedList_, "hash") - v5 + 32 * v5;
  return -[NSMutableArray hash](self->mutableGroupList_, "hash") - v6 + 32 * v6 + 28629151;
}

- (void)writeToOutput:(id)a3
{
  if (-[TRIPBUInt64Array count](self->mutableVarintList_, "count"))
    objc_msgSend(a3, "writeUInt64Array:values:tag:", self->number_, self->mutableVarintList_, 0);
  if (-[TRIPBUInt32Array count](self->mutableFixed32List_, "count"))
    objc_msgSend(a3, "writeFixed32Array:values:tag:", self->number_, self->mutableFixed32List_, 0);
  if (-[TRIPBUInt64Array count](self->mutableFixed64List_, "count"))
    objc_msgSend(a3, "writeFixed64Array:values:tag:", self->number_, self->mutableFixed64List_, 0);
  if (-[NSMutableArray count](self->mutableLengthDelimitedList_, "count"))
    objc_msgSend(a3, "writeBytesArray:values:", self->number_, self->mutableLengthDelimitedList_);
  if (-[NSMutableArray count](self->mutableGroupList_, "count"))
    objc_msgSend(a3, "writeUnknownGroupArray:values:", self->number_, self->mutableGroupList_);
}

- (unint64_t)serializedSize
{
  unsigned int number;
  TRIPBUInt64Array *mutableVarintList;
  uint64_t v5;
  TRIPBUInt32Array *mutableFixed32List;
  TRIPBUInt64Array *mutableFixed64List;
  NSMutableArray *mutableLengthDelimitedList;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSMutableArray *mutableGroupList;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  unsigned int v33;
  _QWORD v34[5];
  unsigned int v35;
  _QWORD v36[5];
  unsigned int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  number = self->number_;
  mutableVarintList = self->mutableVarintList_;
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __35__TRIPBUnknownField_serializedSize__block_invoke;
  v36[3] = &unk_1E2E9BA00;
  v36[4] = &v38;
  v37 = number;
  -[TRIPBUInt64Array enumerateValuesWithBlock:](mutableVarintList, "enumerateValuesWithBlock:", v36);
  mutableFixed32List = self->mutableFixed32List_;
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __35__TRIPBUnknownField_serializedSize__block_invoke_2;
  v34[3] = &unk_1E2E9BA28;
  v34[4] = &v38;
  v35 = number;
  -[TRIPBUInt32Array enumerateValuesWithBlock:](mutableFixed32List, "enumerateValuesWithBlock:", v34);
  mutableFixed64List = self->mutableFixed64List_;
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __35__TRIPBUnknownField_serializedSize__block_invoke_3;
  v32[3] = &unk_1E2E9BA00;
  v32[4] = &v38;
  v33 = number;
  -[TRIPBUInt64Array enumerateValuesWithBlock:](mutableFixed64List, "enumerateValuesWithBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(mutableLengthDelimitedList);
        v12 = TRIPBComputeBytesSize(number, *(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
        v39[3] += v12;
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
    }
    while (v9);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  mutableGroupList = self->mutableGroupList_;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v24, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    v16 = 8 * number;
    v17 = 10;
    if (((number >> 25) & 0xF) == 0)
      v17 = 8;
    v18 = 4;
    if (v16 < 0x80)
      v18 = 2;
    if (v16 < 0x200000)
      v17 = 6;
    if (v16 >= 0x4000)
      v19 = v17;
    else
      v19 = v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(mutableGroupList);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "serializedSize");
        v39[3] += v21 + v19;
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v24, v42, 16);
    }
    while (v14);
  }
  v22 = v39[3];
  _Block_object_dispose(&v38, 8);
  return v22;
}

uint64_t __35__TRIPBUnknownField_serializedSize__block_invoke(uint64_t a1, unint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = 8 * *(_DWORD *)(a1 + 40);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  result = TRIPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result + v7;
  return result;
}

uint64_t __35__TRIPBUnknownField_serializedSize__block_invoke_2(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = 8 * *(_DWORD *)(result + 40);
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (v1 >> 28)
    v4 = 9;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    v5 = v2;
  else
    v5 = 5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v5;
  return result;
}

uint64_t __35__TRIPBUnknownField_serializedSize__block_invoke_3(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = 8 * *(_DWORD *)(result + 40);
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if (v1 >> 28)
    v4 = 13;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    v5 = v2;
  else
    v5 = 9;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v5;
  return result;
}

- (void)writeAsMessageSetExtensionToOutput:(id)a3
{
  NSMutableArray *mutableLengthDelimitedList;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mutableLengthDelimitedList);
        objc_msgSend(a3, "writeRawMessageSetExtension:value:", self->number_, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)serializedSizeAsMessageSetExtension
{
  NSMutableArray *mutableLengthDelimitedList;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(mutableLengthDelimitedList);
      v6 += TRIPBComputeRawMessageSetExtensionSize(self->number_, *(void **)(*((_QWORD *)&v10 + 1) + 8 * i));
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  TRIPBUInt64Array *mutableVarintList;
  TRIPBUInt32Array *mutableFixed32List;
  TRIPBUInt64Array *mutableFixed64List;
  NSMutableArray *mutableLengthDelimitedList;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *mutableGroupList;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>: Field: %d {\n"), objc_opt_class(), self, self->number_);
  v4 = MEMORY[0x1E0C809B0];
  mutableVarintList = self->mutableVarintList_;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __32__TRIPBUnknownField_description__block_invoke;
  v29[3] = &unk_1E2E9BA50;
  v29[4] = v3;
  -[TRIPBUInt64Array enumerateValuesWithBlock:](mutableVarintList, "enumerateValuesWithBlock:", v29);
  mutableFixed32List = self->mutableFixed32List_;
  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __32__TRIPBUnknownField_description__block_invoke_2;
  v28[3] = &unk_1E2E9BA78;
  v28[4] = v3;
  -[TRIPBUInt32Array enumerateValuesWithBlock:](mutableFixed32List, "enumerateValuesWithBlock:", v28);
  mutableFixed64List = self->mutableFixed64List_;
  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __32__TRIPBUnknownField_description__block_invoke_3;
  v27[3] = &unk_1E2E9BA50;
  v27[4] = v3;
  -[TRIPBUInt64Array enumerateValuesWithBlock:](mutableFixed64List, "enumerateValuesWithBlock:", v27);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(mutableLengthDelimitedList);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v10);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  mutableGroupList = self->mutableGroupList_;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(mutableGroupList);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v15);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

uint64_t __32__TRIPBUnknownField_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

uint64_t __32__TRIPBUnknownField_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%u\n"), a2);
}

uint64_t __32__TRIPBUnknownField_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

- (void)mergeFromField:(id)a3
{
  void *v5;
  TRIPBUInt64Array *mutableVarintList;
  void *v7;
  TRIPBUInt32Array *mutableFixed32List;
  void *v9;
  TRIPBUInt64Array *mutableFixed64List;
  void *v11;
  NSMutableArray *mutableLengthDelimitedList;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "varintList");
  if (objc_msgSend(v5, "count"))
  {
    mutableVarintList = self->mutableVarintList_;
    if (mutableVarintList)
      -[TRIPBUInt64Array addValuesFromArray:](mutableVarintList, "addValuesFromArray:", v5);
    else
      self->mutableVarintList_ = (TRIPBUInt64Array *)objc_msgSend(v5, "copy");
  }
  v7 = (void *)objc_msgSend(a3, "fixed32List");
  if (objc_msgSend(v7, "count"))
  {
    mutableFixed32List = self->mutableFixed32List_;
    if (mutableFixed32List)
      -[TRIPBUInt32Array addValuesFromArray:](mutableFixed32List, "addValuesFromArray:", v7);
    else
      self->mutableFixed32List_ = (TRIPBUInt32Array *)objc_msgSend(v7, "copy");
  }
  v9 = (void *)objc_msgSend(a3, "fixed64List");
  if (objc_msgSend(v9, "count"))
  {
    mutableFixed64List = self->mutableFixed64List_;
    if (mutableFixed64List)
      -[TRIPBUInt64Array addValuesFromArray:](mutableFixed64List, "addValuesFromArray:", v9);
    else
      self->mutableFixed64List_ = (TRIPBUInt64Array *)objc_msgSend(v9, "copy");
  }
  v11 = (void *)objc_msgSend(a3, "lengthDelimitedList");
  if (objc_msgSend(v11, "count"))
  {
    mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
    if (mutableLengthDelimitedList)
      -[NSMutableArray addObjectsFromArray:](mutableLengthDelimitedList, "addObjectsFromArray:", v11);
    else
      self->mutableLengthDelimitedList_ = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
  }
  v13 = (void *)objc_msgSend(a3, "groupList");
  if (objc_msgSend(v13, "count"))
  {
    if (!self->mutableGroupList_)
      self->mutableGroupList_ = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "copy");
          -[NSMutableArray addObject:](self->mutableGroupList_, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }
  }
}

- (void)addVarint:(unint64_t)a3
{
  TRIPBUInt64Array *mutableVarintList;
  unint64_t v5;

  v5 = a3;
  mutableVarintList = self->mutableVarintList_;
  if (mutableVarintList)
    -[TRIPBUInt64Array addValue:](mutableVarintList, "addValue:");
  else
    self->mutableVarintList_ = -[TRIPBUInt64Array initWithValues:count:]([TRIPBUInt64Array alloc], "initWithValues:count:", &v5, 1);
}

- (void)addFixed32:(unsigned int)a3
{
  TRIPBUInt32Array *mutableFixed32List;
  unsigned int v5;

  v5 = a3;
  mutableFixed32List = self->mutableFixed32List_;
  if (mutableFixed32List)
    -[TRIPBUInt32Array addValue:](mutableFixed32List, "addValue:");
  else
    self->mutableFixed32List_ = -[TRIPBUInt32Array initWithValues:count:]([TRIPBUInt32Array alloc], "initWithValues:count:", &v5, 1);
}

- (void)addFixed64:(unint64_t)a3
{
  TRIPBUInt64Array *mutableFixed64List;
  unint64_t v5;

  v5 = a3;
  mutableFixed64List = self->mutableFixed64List_;
  if (mutableFixed64List)
    -[TRIPBUInt64Array addValue:](mutableFixed64List, "addValue:");
  else
    self->mutableFixed64List_ = -[TRIPBUInt64Array initWithValues:count:]([TRIPBUInt64Array alloc], "initWithValues:count:", &v5, 1);
}

- (void)addLengthDelimited:(id)a3
{
  NSMutableArray *mutableLengthDelimitedList;
  id v5;

  v5 = a3;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  if (mutableLengthDelimitedList)
    -[NSMutableArray addObject:](mutableLengthDelimitedList, "addObject:");
  else
    self->mutableLengthDelimitedList_ = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v5, 1);
}

- (void)addGroup:(id)a3
{
  NSMutableArray *mutableGroupList;
  id v5;

  v5 = a3;
  mutableGroupList = self->mutableGroupList_;
  if (mutableGroupList)
    -[NSMutableArray addObject:](mutableGroupList, "addObject:");
  else
    self->mutableGroupList_ = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v5, 1);
}

- (int)number
{
  return self->number_;
}

- (TRIPBUInt64Array)varintList
{
  return self->mutableVarintList_;
}

- (TRIPBUInt32Array)fixed32List
{
  return self->mutableFixed32List_;
}

- (TRIPBUInt64Array)fixed64List
{
  return self->mutableFixed64List_;
}

- (NSArray)lengthDelimitedList
{
  return &self->mutableLengthDelimitedList_->super;
}

- (NSArray)groupList
{
  return &self->mutableGroupList_->super;
}

@end
