@implementation TSUUUIDPath

- (TSUUUIDPath)initWithArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSUUUIDPath *v11;
  TSUUUIDPath *v12;
  uint64_t v13;
  NSArray *uuids;
  void *v15;
  void *v16;
  TSUUUIDPath *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUUUIDPath initWithArray:]");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDPath.m");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 25, 0, "Invalid entry for TSUUUIDPath array: %{public}@", v10);

          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          v17 = 0;
          goto LABEL_16;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)TSUUUIDPath;
  v11 = -[TSUUUIDPath init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v5)
    {
      v13 = objc_msgSend(v5, "copy");
      uuids = v12->_uuids;
      v12->_uuids = (NSArray *)v13;
    }
    else
    {
      uuids = v11->_uuids;
      v11->_uuids = (NSArray *)MEMORY[0x24BDBD1A8];
    }

  }
  self = v12;
  v17 = self;
LABEL_16:

  return v17;
}

- (TSUUUIDPath)initWithUUIDPathString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TSUUUIDPath *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");
  if (v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
          if (!v12)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUUUIDPath initWithUUIDPathString:]");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDPath.m");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 49, 0, "Invalid UUID path string: %{public}@", v4);

            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            v14 = 0;
            goto LABEL_13;
          }
          v13 = (void *)v12;
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  self = -[TSUUUIDPath initWithArray:](self, "initWithArray:", v6);
  v14 = self;
LABEL_13:

  return v14;
}

- (id)UUIDPathByAppendingUUID:(id)a3
{
  void *v3;
  TSUUUIDPath *v4;

  -[NSArray arrayByAddingObject:](self->_uuids, "arrayByAddingObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TSUUUIDPath initWithArray:]([TSUUUIDPath alloc], "initWithArray:", v3);

  return v4;
}

- (NSUUID)lastUUID
{
  return (NSUUID *)-[NSArray lastObject](self->_uuids, "lastObject");
}

- (NSString)UUIDPathString
{
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSArray count](self->_uuids, "count");
  if (v3)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 36 * v3 + objc_msgSend(CFSTR("/"), "length") * (v3 - 1));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_uuids;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = 1;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          if ((v8 & 1) == 0)
            objc_msgSend((id)v3, "appendString:", CFSTR("/"), (_QWORD)v15);
          objc_msgSend(v10, "UUIDString", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v3, "appendString:", v11);

          v8 = 0;
          ++v9;
        }
        while (v6 != v9);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 = 0;
      }
      while (v6);
    }

  }
  if (v3)
    v12 = (__CFString *)v3;
  else
    v12 = &stru_24F3BFFF8;
  v13 = v12;

  return v13;
}

+ (id)lastUUIDFromUUIDPathString:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_msgSend(CFSTR("/"), "length");
  if (v4 < 0x25)
  {
    if (v4 != 36)
      goto LABEL_7;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
    if (!v11)
      goto LABEL_7;
  }
  else
  {
    v6 = v4 - 36;
    objc_msgSend(v3, "substringWithRange:", v6 - v5, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(CFSTR("/"), "isEqualToString:", v7);

    if (!v8
      || (v9 = objc_alloc(MEMORY[0x24BDD1880]),
          objc_msgSend(v3, "substringFromIndex:", v6),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10),
          v10,
          !v11))
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUUUIDPath lastUUIDFromUUIDPathString:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDPath.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 100, 0, "Invalid UUID path string: %{public}@", v3);

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *uuids;
  uint64_t v6;
  BOOL v8;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uuids = self->_uuids;
    v6 = v4[1];

    return -[NSArray isEqual:](uuids, "isEqual:", v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSUUUIDPath;
    v8 = -[TSUUUIDPath isEqual:](&v9, sel_isEqual_, v4);

    return v8;
  }
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_uuids, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUUUIDPath UUIDPathString](self, "UUIDPathString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_uuids, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuids, 0);
}

@end
