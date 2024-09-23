@implementation TransparencyGPBUnknownField

- (TransparencyGPBUnknownField)initWithNumber:(int)a3
{
  TransparencyGPBUnknownField *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransparencyGPBUnknownField;
  result = -[TransparencyGPBUnknownField init](&v5, "init");
  if (result)
    result->number_ = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUnknownField;
  -[TransparencyGPBUnknownField dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  TransparencyGPBUnknownField *v5;
  NSMutableArray *mutableGroupList;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = -[TransparencyGPBUnknownField initWithNumber:](+[TransparencyGPBUnknownField allocWithZone:](TransparencyGPBUnknownField, "allocWithZone:"), "initWithNumber:", self->number_);
  v5->mutableFixed32List_ = (TransparencyGPBUInt32Array *)-[TransparencyGPBUInt32Array copyWithZone:](self->mutableFixed32List_, "copyWithZone:", a3);
  v5->mutableFixed64List_ = (TransparencyGPBUInt64Array *)-[TransparencyGPBUInt64Array copyWithZone:](self->mutableFixed64List_, "copyWithZone:", a3);
  v5->mutableLengthDelimitedList_ = (NSMutableArray *)-[NSMutableArray mutableCopyWithZone:](self->mutableLengthDelimitedList_, "mutableCopyWithZone:", a3);
  v5->mutableVarintList_ = (TransparencyGPBUInt64Array *)-[TransparencyGPBUInt64Array copyWithZone:](self->mutableVarintList_, "copyWithZone:", a3);
  if (-[NSMutableArray count](self->mutableGroupList_, "count"))
  {
    v5->mutableGroupList_ = -[NSMutableArray initWithCapacity:](+[NSMutableArray allocWithZone:](NSMutableArray, "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->mutableGroupList_, "count"));
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
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3);
          -[NSMutableArray addObject:](v5->mutableGroupList_, "addObject:", v11);

          v10 = (char *)v10 + 1;
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
  uint64_t v5;
  unsigned int v6;

  if (self == a3)
    goto LABEL_20;
  v5 = objc_opt_class(TransparencyGPBUnknownField, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0 || self->number_ != *((_DWORD *)a3 + 2))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  if ((!-[TransparencyGPBUInt64Array count](self->mutableVarintList_, "count")
     && !objc_msgSend(*((id *)a3 + 2), "count")
     || (v6 = -[TransparencyGPBUInt64Array isEqual:](self->mutableVarintList_, "isEqual:", *((_QWORD *)a3 + 2))) != 0)
    && (!-[TransparencyGPBUInt32Array count](self->mutableFixed32List_, "count")
     && !objc_msgSend(*((id *)a3 + 3), "count")
     || (v6 = -[TransparencyGPBUInt32Array isEqual:](self->mutableFixed32List_, "isEqual:", *((_QWORD *)a3 + 3))) != 0)
    && (!-[TransparencyGPBUInt64Array count](self->mutableFixed64List_, "count")
     && !objc_msgSend(*((id *)a3 + 4), "count")
     || (v6 = -[TransparencyGPBUInt64Array isEqual:](self->mutableFixed64List_, "isEqual:", *((_QWORD *)a3 + 4))) != 0)
    && (!-[NSMutableArray count](self->mutableLengthDelimitedList_, "count") && !objc_msgSend(*((id *)a3 + 5), "count")
     || (v6 = -[NSMutableArray isEqual:](self->mutableLengthDelimitedList_, "isEqual:", *((_QWORD *)a3 + 5))) != 0))
  {
    if (-[NSMutableArray count](self->mutableGroupList_, "count") || objc_msgSend(*((id *)a3 + 6), "count"))
    {
      LOBYTE(v6) = -[NSMutableArray isEqual:](self->mutableGroupList_, "isEqual:", *((_QWORD *)a3 + 6));
      return v6;
    }
LABEL_20:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;

  v3 = -[TransparencyGPBUInt64Array hash](self->mutableVarintList_, "hash");
  v4 = (char *)-[TransparencyGPBUInt32Array hash](self->mutableFixed32List_, "hash") + 32 * v3 - v3;
  v5 = (_BYTE *)-[TransparencyGPBUInt64Array hash](self->mutableFixed64List_, "hash") - v4 + 32 * (_QWORD)v4;
  v6 = (int64_t)-[NSMutableArray hash](self->mutableLengthDelimitedList_, "hash") + 32 * v5 - v5;
  return (unint64_t)-[NSMutableArray hash](self->mutableGroupList_, "hash") + 32 * v6 - v6 + 28629151;
}

- (void)writeToOutput:(id)a3
{
  if (-[TransparencyGPBUInt64Array count](self->mutableVarintList_, "count"))
    objc_msgSend(a3, "writeUInt64Array:values:tag:", self->number_, self->mutableVarintList_, 0);
  if (-[TransparencyGPBUInt32Array count](self->mutableFixed32List_, "count"))
    objc_msgSend(a3, "writeFixed32Array:values:tag:", self->number_, self->mutableFixed32List_, 0);
  if (-[TransparencyGPBUInt64Array count](self->mutableFixed64List_, "count"))
    objc_msgSend(a3, "writeFixed64Array:values:tag:", self->number_, self->mutableFixed64List_, 0);
  if (-[NSMutableArray count](self->mutableLengthDelimitedList_, "count"))
    objc_msgSend(a3, "writeBytesArray:values:", self->number_, self->mutableLengthDelimitedList_);
  if (-[NSMutableArray count](self->mutableGroupList_, "count"))
    _objc_msgSend(a3, "writeUnknownGroupArray:values:", self->number_, self->mutableGroupList_);
}

- (unint64_t)serializedSize
{
  int number;
  TransparencyGPBUInt64Array *mutableVarintList;
  TransparencyGPBUInt32Array *mutableFixed32List;
  TransparencyGPBUInt64Array *mutableFixed64List;
  NSMutableArray *mutableLengthDelimitedList;
  id v8;
  uint64_t v9;
  void *i;
  char *v11;
  NSMutableArray *mutableGroupList;
  id v13;
  uint64_t v14;
  void *j;
  char *v16;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  int v28;
  _QWORD v29[5];
  int v30;
  _QWORD v31[5];
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  number = self->number_;
  mutableVarintList = self->mutableVarintList_;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C7510;
  v31[3] = &unk_10010C008;
  v31[4] = &v33;
  v32 = number;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableVarintList, "enumerateValuesWithBlock:", v31);
  mutableFixed32List = self->mutableFixed32List_;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000C7548;
  v29[3] = &unk_10010C030;
  v29[4] = &v33;
  v30 = number;
  -[TransparencyGPBUInt32Array enumerateValuesWithBlock:](mutableFixed32List, "enumerateValuesWithBlock:", v29);
  mutableFixed64List = self->mutableFixed64List_;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C7580;
  v27[3] = &unk_10010C008;
  v27[4] = &v33;
  v28 = number;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableFixed64List, "enumerateValuesWithBlock:", v27);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v23, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(mutableLengthDelimitedList);
        v11 = sub_1000A0DD4(number, *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i));
        v34[3] += (uint64_t)v11;
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v23, v38, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  mutableGroupList = self->mutableGroupList_;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v19, v37, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(mutableGroupList);
        v16 = sub_1000A0CD0(number, *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j));
        v34[3] += (uint64_t)v16;
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v19, v37, 16);
    }
    while (v13);
  }
  v17 = v34[3];
  _Block_object_dispose(&v33, 8);
  return v17;
}

- (void)writeAsMessageSetExtensionToOutput:(id)a3
{
  NSMutableArray *mutableLengthDelimitedList;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

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
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mutableLengthDelimitedList);
        objc_msgSend(a3, "writeRawMessageSetExtension:value:", self->number_, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)serializedSizeAsMessageSetExtension
{
  NSMutableArray *mutableLengthDelimitedList;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

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
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(mutableLengthDelimitedList);
      v6 += (unint64_t)sub_1000A108C(self->number_, *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (id)description
{
  NSMutableString *v3;
  TransparencyGPBUInt64Array *mutableVarintList;
  TransparencyGPBUInt32Array *mutableFixed32List;
  TransparencyGPBUInt64Array *mutableFixed64List;
  NSMutableArray *mutableLengthDelimitedList;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *mutableGroupList;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p>: Field: %d {\n"), objc_opt_class(self, a2), self, self->number_);
  mutableVarintList = self->mutableVarintList_;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000C7A20;
  v28[3] = &unk_10010B4C8;
  v28[4] = v3;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableVarintList, "enumerateValuesWithBlock:", v28);
  mutableFixed32List = self->mutableFixed32List_;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C7A4C;
  v27[3] = &unk_10010B630;
  v27[4] = v3;
  -[TransparencyGPBUInt32Array enumerateValuesWithBlock:](mutableFixed32List, "enumerateValuesWithBlock:", v27);
  mutableFixed64List = self->mutableFixed64List_;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C7A78;
  v26[3] = &unk_10010B4C8;
  v26[4] = v3;
  -[TransparencyGPBUInt64Array enumerateValuesWithBlock:](mutableFixed64List, "enumerateValuesWithBlock:", v26);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(mutableLengthDelimitedList);
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i));
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableLengthDelimitedList, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  mutableGroupList = self->mutableGroupList_;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(mutableGroupList);
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j));
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableGroupList, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    }
    while (v14);
  }
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("}"));
  return v3;
}

- (void)mergeFromField:(id)a3
{
  id v5;
  TransparencyGPBUInt64Array *mutableVarintList;
  id v7;
  TransparencyGPBUInt32Array *mutableFixed32List;
  id v9;
  TransparencyGPBUInt64Array *mutableFixed64List;
  id v11;
  NSMutableArray *mutableLengthDelimitedList;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = objc_msgSend(a3, "varintList");
  if (objc_msgSend(v5, "count"))
  {
    mutableVarintList = self->mutableVarintList_;
    if (mutableVarintList)
      -[TransparencyGPBUInt64Array addValuesFromArray:](mutableVarintList, "addValuesFromArray:", v5);
    else
      self->mutableVarintList_ = (TransparencyGPBUInt64Array *)objc_msgSend(v5, "copy");
  }
  v7 = objc_msgSend(a3, "fixed32List");
  if (objc_msgSend(v7, "count"))
  {
    mutableFixed32List = self->mutableFixed32List_;
    if (mutableFixed32List)
      -[TransparencyGPBUInt32Array addValuesFromArray:](mutableFixed32List, "addValuesFromArray:", v7);
    else
      self->mutableFixed32List_ = (TransparencyGPBUInt32Array *)objc_msgSend(v7, "copy");
  }
  v9 = objc_msgSend(a3, "fixed64List");
  if (objc_msgSend(v9, "count"))
  {
    mutableFixed64List = self->mutableFixed64List_;
    if (mutableFixed64List)
      -[TransparencyGPBUInt64Array addValuesFromArray:](mutableFixed64List, "addValuesFromArray:", v9);
    else
      self->mutableFixed64List_ = (TransparencyGPBUInt64Array *)objc_msgSend(v9, "copy");
  }
  v11 = objc_msgSend(a3, "lengthDelimitedList");
  if (objc_msgSend(v11, "count"))
  {
    mutableLengthDelimitedList = self->mutableLengthDelimitedList_;
    if (mutableLengthDelimitedList)
      -[NSMutableArray addObjectsFromArray:](mutableLengthDelimitedList, "addObjectsFromArray:", v11);
    else
      self->mutableLengthDelimitedList_ = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
  }
  v13 = objc_msgSend(a3, "groupList");
  if (objc_msgSend(v13, "count"))
  {
    if (!self->mutableGroupList_)
      self->mutableGroupList_ = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
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
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17), "copy");
          -[NSMutableArray addObject:](self->mutableGroupList_, "addObject:", v18);

          v17 = (char *)v17 + 1;
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
  TransparencyGPBUInt64Array *mutableVarintList;
  unint64_t v5;

  v5 = a3;
  mutableVarintList = self->mutableVarintList_;
  if (mutableVarintList)
    -[TransparencyGPBUInt64Array addValue:](mutableVarintList, "addValue:");
  else
    self->mutableVarintList_ = -[TransparencyGPBUInt64Array initWithValues:count:]([TransparencyGPBUInt64Array alloc], "initWithValues:count:", &v5, 1);
}

- (void)addFixed32:(unsigned int)a3
{
  TransparencyGPBUInt32Array *mutableFixed32List;
  unsigned int v5;

  v5 = a3;
  mutableFixed32List = self->mutableFixed32List_;
  if (mutableFixed32List)
    -[TransparencyGPBUInt32Array addValue:](mutableFixed32List, "addValue:");
  else
    self->mutableFixed32List_ = -[TransparencyGPBUInt32Array initWithValues:count:]([TransparencyGPBUInt32Array alloc], "initWithValues:count:", &v5, 1);
}

- (void)addFixed64:(unint64_t)a3
{
  TransparencyGPBUInt64Array *mutableFixed64List;
  unint64_t v5;

  v5 = a3;
  mutableFixed64List = self->mutableFixed64List_;
  if (mutableFixed64List)
    -[TransparencyGPBUInt64Array addValue:](mutableFixed64List, "addValue:");
  else
    self->mutableFixed64List_ = -[TransparencyGPBUInt64Array initWithValues:count:]([TransparencyGPBUInt64Array alloc], "initWithValues:count:", &v5, 1);
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
    self->mutableLengthDelimitedList_ = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:count:", &v5, 1);
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
    self->mutableGroupList_ = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:count:", &v5, 1);
}

- (int)number
{
  return self->number_;
}

- (TransparencyGPBUInt64Array)varintList
{
  return self->mutableVarintList_;
}

- (TransparencyGPBUInt32Array)fixed32List
{
  return self->mutableFixed32List_;
}

- (TransparencyGPBUInt64Array)fixed64List
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
