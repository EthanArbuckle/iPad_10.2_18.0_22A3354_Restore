@implementation _TUIIdentifier

- (_TUIIdentifier)initWithUUID:(id)a3 indexes:(void *)a4 identifiers:(id)a5
{
  id v9;
  id v10;
  _TUIIdentifier *v11;
  _TUIIdentifier *v12;
  unsigned int *begin;
  unsigned int *end;
  unsigned int *value;
  NSArray *v16;
  NSArray *identifiers;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIIdentifier;
  v11 = -[_TUIIdentifier init](&v19, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_UUID, a3);
    begin = v12->_indexes.__begin_;
    v12->_indexes.__begin_ = *(unsigned int **)a4;
    *(_QWORD *)a4 = begin;
    end = v12->_indexes.__end_;
    v12->_indexes.__end_ = (unsigned int *)*((_QWORD *)a4 + 1);
    *((_QWORD *)a4 + 1) = end;
    value = v12->_indexes.__end_cap_.__value_;
    v12->_indexes.__end_cap_.__value_ = (unsigned int *)*((_QWORD *)a4 + 2);
    *((_QWORD *)a4 + 2) = value;
    v16 = (NSArray *)objc_msgSend(v10, "copy");
    identifiers = v12->_identifiers;
    v12->_identifiers = v16;

    -[_TUIIdentifier _computeHash](v12, "_computeHash");
  }

  return v12;
}

- (_TUIIdentifier)initWithOther:(id)a3
{
  _TUIIdentifier *v4;
  _TUIIdentifier *v5;
  _TUIIdentifier *v6;
  objc_super v8;

  v4 = (_TUIIdentifier *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_TUIIdentifier;
  v5 = -[_TUIIdentifier init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_UUID, v4->_UUID);
    objc_storeStrong((id *)&v6->_identifiers, v4->_identifiers);
    if (v6 != v4)
      sub_FCBE8((char *)&v6->_indexes, (char *)v4->_indexes.__begin_, (uint64_t)v4->_indexes.__end_, v4->_indexes.__end_ - v4->_indexes.__begin_);
    v6->_hash = v4->_hash;
  }

  return v6;
}

- (id)tui_identifierWithoutUUID
{
  _TUIIdentifier *v2;
  NSUUID *UUID;

  v2 = -[_TUIIdentifier initWithOther:]([_TUIIdentifier alloc], "initWithOther:", self);
  UUID = v2->_UUID;
  v2->_UUID = 0;

  -[_TUIIdentifier _computeHash](v2, "_computeHash");
  return v2;
}

- (void)_appendIdentifier:(id)a3
{
  unsigned int v4;
  NSArray *v5;
  NSArray *identifiers;
  unsigned int *value;
  int v8;
  unsigned int *end;
  unsigned int *v10;
  unsigned int *begin;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int v19;
  id v20;

  v20 = a3;
  v4 = -[NSArray count](self->_identifiers, "count");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_identifiers, "arrayByAddingObject:", v20));
  identifiers = self->_identifiers;
  self->_identifiers = v5;

  value = self->_indexes.__end_cap_.__value_;
  v8 = 2 * v4;
  end = self->_indexes.__end_;
  if (end >= value)
  {
    begin = self->_indexes.__begin_;
    v12 = end - begin;
    if ((unint64_t)(v12 + 1) >> 62)
      sub_6F9C();
    v13 = (char *)value - (char *)begin;
    v14 = ((char *)value - (char *)begin) >> 1;
    if (v14 <= v12 + 1)
      v14 = v12 + 1;
    if (v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v15 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
    {
      v16 = (char *)sub_FC474((uint64_t)&self->_indexes.__end_cap_, v15);
      begin = self->_indexes.__begin_;
      end = self->_indexes.__end_;
    }
    else
    {
      v16 = 0;
    }
    v17 = (unsigned int *)&v16[4 * v12];
    v18 = (unsigned int *)&v16[4 * v15];
    *v17 = v8;
    v10 = v17 + 1;
    while (end != begin)
    {
      v19 = *--end;
      *--v17 = v19;
    }
    self->_indexes.__begin_ = v17;
    self->_indexes.__end_ = v10;
    self->_indexes.__end_cap_.__value_ = v18;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = v8;
    v10 = end + 1;
  }
  self->_indexes.__end_ = v10;

}

- (void)_appendIndex:(unint64_t)a3
{
  __compressed_pair<unsigned int *, std::allocator<unsigned int>> *p_end_cap;
  unsigned int *value;
  unsigned int v6;
  unsigned int *end;
  unsigned int *v8;
  unsigned int *begin;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int v17;

  p_end_cap = &self->_indexes.__end_cap_;
  value = self->_indexes.__end_cap_.__value_;
  v6 = (2 * a3) | 1;
  end = self->_indexes.__end_;
  if (end >= value)
  {
    begin = self->_indexes.__begin_;
    v10 = end - begin;
    if ((unint64_t)(v10 + 1) >> 62)
      sub_6F9C();
    v11 = (char *)value - (char *)begin;
    v12 = ((char *)value - (char *)begin) >> 1;
    if (v12 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
    {
      v14 = (char *)sub_FC474((uint64_t)p_end_cap, v13);
      begin = self->_indexes.__begin_;
      end = self->_indexes.__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = (unsigned int *)&v14[4 * v10];
    v16 = (unsigned int *)&v14[4 * v13];
    *v15 = v6;
    v8 = v15 + 1;
    while (end != begin)
    {
      v17 = *--end;
      *--v15 = v17;
    }
    self->_indexes.__begin_ = v15;
    self->_indexes.__end_ = v8;
    self->_indexes.__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = v6;
    v8 = end + 1;
  }
  self->_indexes.__end_ = v8;
}

- (_TUIIdentifier)initWithUUID:(id)a3 indexPath:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIIdentifier *v11;
  NSUUID *v12;
  NSUUID *UUID;
  uint64_t v14;
  NSArray *identifiers;
  id v16;
  vector<unsigned int, std::allocator<unsigned int>> *p_indexes;
  void *i;
  unsigned int v19;
  unsigned int *begin;
  objc_super v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_TUIIdentifier;
  v11 = -[_TUIIdentifier init](&v22, "init");
  if (v11)
  {
    v12 = (NSUUID *)objc_msgSend(v8, "copy");
    UUID = v11->_UUID;
    v11->_UUID = v12;

    v23 = v10;
    v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    identifiers = v11->_identifiers;
    v11->_identifiers = (NSArray *)v14;

    v16 = objc_msgSend(v9, "length");
    p_indexes = &v11->_indexes;
    sub_108AF0((uint64_t)&v11->_indexes, (unint64_t)v16 + 1);
    if (v16)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        v19 = objc_msgSend(v9, "indexAtPosition:", i);
        begin = p_indexes->__begin_;
        p_indexes->__begin_[(_QWORD)i] = (2 * v19) | 1;
      }
    }
    else
    {
      begin = p_indexes->__begin_;
    }
    begin[(_QWORD)v16] = 0;
    -[_TUIIdentifier _computeHash](v11, "_computeHash");
  }

  return v11;
}

- (void)_computeHash
{
  unsigned int *begin;
  unsigned int *end;
  unint64_t v5;
  unsigned int v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  begin = self->_indexes.__begin_;
  end = self->_indexes.__end_;
  if (begin == end)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    do
    {
      v6 = *begin++;
      v5 = v6 ^ (16 * v5);
    }
    while (begin != end);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_identifiers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12 = (unint64_t)objc_msgSend(v11, "hash", (_QWORD)v13);

        v5 ^= v12;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  self->_hash = (unint64_t)-[NSUUID hash](self->_UUID, "hash") ^ v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  _TUIIdentifier *v4;
  uint64_t v5;
  unsigned int *begin;
  char *v7;
  unsigned int *v8;
  unsigned __int8 v9;
  NSArray *identifiers;
  NSUUID *UUID;

  v4 = (_TUIIdentifier *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class(_TUIIdentifier);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    begin = self->_indexes.__begin_;
    v7 = (char *)((char *)self->_indexes.__end_ - (char *)begin);
    v8 = v4->_indexes.__begin_;
    if (v7 == (char *)((char *)v4->_indexes.__end_ - (char *)v8) && !memcmp(begin, v8, (size_t)v7))
    {
      identifiers = self->_identifiers;
      if (identifiers == v4->_identifiers || -[NSArray isEqual:](identifiers, "isEqual:"))
      {
        UUID = self->_UUID;
        if (UUID != v4->_UUID)
        {
          v9 = -[NSUUID isEqual:](UUID, "isEqual:");
          goto LABEL_11;
        }
LABEL_10:
        v9 = 1;
        goto LABEL_11;
      }
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)tui_identifierByAppendingString:(id)a3
{
  id v4;
  _TUIIdentifier *v5;

  v4 = a3;
  if (v4 && !self->_UUID)
  {
    v5 = -[_TUIIdentifier initWithOther:]([_TUIIdentifier alloc], "initWithOther:", self);
    -[_TUIIdentifier _appendIdentifier:](v5, "_appendIdentifier:", v4);
    -[_TUIIdentifier _computeHash](v5, "_computeHash");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tui_identifierByAppendingIndex:(unint64_t)a3
{
  _TUIIdentifier *v3;

  if (self->_UUID)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[_TUIIdentifier initWithOther:]([_TUIIdentifier alloc], "initWithOther:", self);
    -[_TUIIdentifier _appendIndex:](v3, "_appendIndex:", a3);
    -[_TUIIdentifier _computeHash](v3, "_computeHash");
  }
  return v3;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  id v5;
  _TUIIdentifier *v6;

  v5 = a3;
  if (self->_UUID)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[_TUIIdentifier initWithOther:]([_TUIIdentifier alloc], "initWithOther:", self);
    objc_storeStrong((id *)&v6->_UUID, a3);
    -[_TUIIdentifier _computeHash](v6, "_computeHash");
  }

  return v6;
}

- (id)tui_identifierToString
{
  id v3;
  NSUUID *UUID;
  void *v5;
  unsigned int *i;
  unint64_t v7;
  void *v8;
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 64);
  UUID = self->_UUID;
  if (UUID)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](UUID, "UUIDString"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v5);

  }
  for (i = self->_indexes.__begin_; i != self->_indexes.__end_; ++i)
  {
    v7 = *i;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("/%lu"), v7 >> 1);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", v7 >> 1));
      objc_msgSend(v3, "appendFormat:", CFSTR(";%@"), v8);

    }
  }
  v9 = objc_msgSend(v3, "copy");

  return v9;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSUUID *UUID;
  void *v7;
  unsigned int *i;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  UUID = self->_UUID;
  if (UUID)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](UUID, "UUIDString"));
    -[NSMutableArray addObject:](v5, "addObject:", v7);

  }
  for (i = self->_indexes.__begin_; i != self->_indexes.__end_; ++i)
  {
    v9 = *i;
    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIIdentifierMap describeForDebuggingIdentifierIndex:package:](TUIIdentifierMap, "describeForDebuggingIdentifierIndex:package:", v9 >> 1, v4));
      -[NSMutableArray addObject:](v5, "addObject:", v10);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", v9 >> 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Identifier:%@"), v10));
      -[NSMutableArray addObject:](v5, "addObject:", v11);

    }
  }
  v12 = -[NSMutableArray copy](v5, "copy");

  return v12;
}

- (id)tui_identifierUUID
{
  return self->_UUID;
}

+ (id)fromString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _TUIIdentifier *v6;
  _TUIIdentifier *v7;
  id v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  int v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  int v24;
  unsigned __int8 v25;
  id v26;
  void *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  int v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSMutableArray *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *__p;
  char *v47;
  char *v48;

  v41 = a3;
  v42 = objc_opt_new(NSMutableArray);
  __p = 0;
  v47 = 0;
  v48 = 0;
  v3 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", v41);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("/;")));
  if ((objc_msgSend(v3, "isAtEnd") & 1) != 0)
  {
    v5 = 0;
LABEL_3:
    v6 = 0;
  }
  else
  {
    v45 = 0;
    objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v4, &v45);
    v9 = v45;
    if (objc_msgSend(v9, "length"))
      v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v9);
    else
      v5 = 0;

    v10 = 0;
    while ((objc_msgSend(v3, "isAtEnd") & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));
      v12 = objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v3, "scanLocation"));

      objc_msgSend(v3, "setScanLocation:", (char *)objc_msgSend(v3, "scanLocation") + 1);
      if (v12 == 47)
      {
        v44 = 0;
        v13 = objc_msgSend(v3, "scanUnsignedLongLong:", &v44);
        if ((v13 & 1) == 0)
          goto LABEL_3;
        v14 = (2 * v44) | 1;
        v15 = v47;
        if (v47 >= v48)
        {
          v17 = (char *)__p;
          v18 = (v47 - (_BYTE *)__p) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            sub_6F9C();
          v20 = v48 - (_BYTE *)__p;
          if ((v48 - (_BYTE *)__p) >> 1 > v19)
            v19 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = (char *)sub_FC474((uint64_t)&v48, v21);
            v17 = (char *)__p;
            v15 = v47;
          }
          else
          {
            v22 = 0;
          }
          v23 = &v22[4 * v18];
          *(_DWORD *)v23 = v14;
          v16 = v23 + 4;
          while (v15 != v17)
          {
            v24 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v24;
            v23 -= 4;
          }
          __p = v23;
          v47 = v16;
          v48 = &v22[4 * v21];
          if (v17)
            operator delete(v17);
        }
        else
        {
          *(_DWORD *)v47 = v14;
          v16 = v15 + 4;
        }
        v47 = v16;
        if ((v13 & 1) == 0)
          goto LABEL_3;
      }
      else
      {
        if (v12 != 59)
          goto LABEL_3;
        v43 = 0;
        v25 = objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v4, &v43);
        v26 = v43;
        v27 = v26;
        if ((v25 & 1) == 0)
        {

          goto LABEL_3;
        }
        -[NSMutableArray addObject:](v42, "addObject:", v26);
        v28 = v47;
        if (v47 >= v48)
        {
          v30 = (char *)__p;
          v31 = (v47 - (_BYTE *)__p) >> 2;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62)
            sub_6F9C();
          v33 = v48 - (_BYTE *)__p;
          if ((v48 - (_BYTE *)__p) >> 1 > v32)
            v32 = v33 >> 1;
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
            v34 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v34 = v32;
          if (v34)
          {
            v35 = (char *)sub_FC474((uint64_t)&v48, v34);
            v30 = (char *)__p;
            v28 = v47;
          }
          else
          {
            v35 = 0;
          }
          v36 = &v35[4 * v31];
          *(_DWORD *)v36 = 2 * v10;
          v29 = v36 + 4;
          while (v28 != v30)
          {
            v37 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            *((_DWORD *)v36 - 1) = v37;
            v36 -= 4;
          }
          __p = v36;
          v47 = v29;
          v48 = &v35[4 * v34];
          if (v30)
            operator delete(v30);
        }
        else
        {
          *(_DWORD *)v47 = 2 * v10;
          v29 = v28 + 4;
        }
        v47 = v29;
        ++v10;

        if ((v25 & 1) == 0)
          goto LABEL_3;
      }
    }
    if (v10)
    {
      v6 = -[_TUIIdentifier initWithUUID:indexes:identifiers:]([_TUIIdentifier alloc], "initWithUUID:indexes:identifiers:", v5, &__p, v42);
    }
    else
    {
      v38 = (char *)__p;
      if (v47 - (_BYTE *)__p == 4)
      {
        v6 = (_TUIIdentifier *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)*(unsigned int *)__p >> 1));
      }
      else if (__p == v47)
      {
        v6 = 0;
      }
      else
      {
        v6 = 0;
        do
        {
          if (v6)
          {
            v39 = objc_claimAutoreleasedReturnValue(-[_TUIIdentifier indexPathByAddingIndex:](v6, "indexPathByAddingIndex:", (unint64_t)*(unsigned int *)v38 >> 1));

            v6 = (_TUIIdentifier *)v39;
          }
          else
          {
            v6 = (_TUIIdentifier *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", (unint64_t)*(unsigned int *)v38 >> 1));
          }
          v38 += 4;
        }
        while (v38 != v47);
      }
      if (v5)
      {
        v40 = objc_claimAutoreleasedReturnValue(-[_TUIIdentifier tui_identifierByPrependingUUID:](v6, "tui_identifierByPrependingUUID:", v5));

        v6 = (_TUIIdentifier *)v40;
      }
    }
  }
  v7 = v6;

  if (__p)
  {
    v47 = (char *)__p;
    operator delete(__p);
  }

  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  unsigned int *begin;

  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  begin = self->_indexes.__begin_;
  if (begin)
  {
    self->_indexes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
