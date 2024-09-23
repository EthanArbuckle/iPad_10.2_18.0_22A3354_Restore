@implementation TSUPathSet

- (TSUPathSet)init
{
  TSUPathSet *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUPathSet;
  v2 = -[TSUPathSet init](&v4, sel_init);
  if (v2)
  {
    v2->mPaths = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 4096);
    v2->mBasePathToNumberMap = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 128);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPaths:basePathToNumberMap:", self->mPaths, self->mBasePathToNumberMap);
  objc_msgSend(v4, "setUnderlyingPathSet:", self->mUnderlyingSet);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUPathSet;
  -[TSUPathSet dealloc](&v3, sel_dealloc);
}

- (id)addPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *mBasePathToNumberMap;
  uint64_t v15;
  unsigned int v16;
  char v17;
  id v18;

  v18 = 0;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  objc_msgSend((id)objc_opt_class(), "processPath:base:hasBaseNumber:baseNumber:extension:", a3, &v18, &v17, &v16, &v15);
  v4 = v18;
  if (v17)
    v4 = (id)objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("-%u"), v16);
  if (v15)
  {
    v4 = (id)objc_msgSend(v4, "tsu_tolerantStringByAppendingPathExtension:");
    v5 = v18;
    if (v15)
      v5 = (id)objc_msgSend(v18, "tsu_tolerantStringByAppendingPathExtension:");
  }
  else
  {
    v5 = v18;
  }
  v6 = objc_msgSend((id)objc_msgSend(v5, "uppercaseString"), "lowercaseString");
  if (-[TSUPathSet isPathUsed:](self, "isPathUsed:", v4))
  {
    v7 = v16;
    if (v7 <= objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue"))v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue");
    else
      v8 = v16;
    do
    {
      v4 = v18;
      if ((_DWORD)v8)
        v4 = (id)objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("-%u"), v8);
      if (v15)
        v4 = (id)objc_msgSend(v4, "tsu_tolerantStringByAppendingPathExtension:");
      v8 = (v8 + 1);
    }
    while (-[TSUPathSet isPathUsed:](self, "isPathUsed:", v4));
    mBasePathToNumberMap = self->mBasePathToNumberMap;
    v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
    v12 = mBasePathToNumberMap;
    goto LABEL_19;
  }
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue");
  if (v16 >= v9)
  {
    v10 = self->mBasePathToNumberMap;
    v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16 + 1);
    v12 = v10;
LABEL_19:
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v6);
  }
  -[TSUPathSet pathIsUsed:](self, "pathIsUsed:", v4);
  return v4;
}

- (void)pathIsUsed:(id)a3
{
  -[NSMutableSet addObject:](self->mPaths, "addObject:", objc_msgSend((id)objc_msgSend(a3, "uppercaseString"), "lowercaseString"));
}

- (void)pathIsNoLongerUsed:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  char v10;
  id v11;

  v4 = objc_msgSend((id)objc_msgSend(a3, "uppercaseString"), "lowercaseString");
  if (-[NSMutableSet containsObject:](self->mPaths, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->mPaths, "removeObject:", v4);
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    objc_msgSend((id)objc_opt_class(), "processPath:base:hasBaseNumber:baseNumber:extension:", v4, &v11, &v10, &v9, &v8);
    v5 = v11;
    if (v8)
      v5 = (id)objc_msgSend(v11, "tsu_tolerantStringByAppendingPathExtension:");
    v6 = objc_msgSend((id)objc_msgSend(v5, "uppercaseString"), "lowercaseString");
    v7 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue");
    if (v7 == v9 + 1)
      -[NSMutableDictionary setObject:forKey:](self->mBasePathToNumberMap, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:"), v6);
  }
}

- (BOOL)isPathUsed:(id)a3
{
  TSUPathSet *mUnderlyingSet;

  if ((-[NSMutableSet containsObject:](self->mPaths, "containsObject:", objc_msgSend((id)objc_msgSend(a3, "uppercaseString"), "lowercaseString")) & 1) != 0)
  {
    LOBYTE(mUnderlyingSet) = 1;
  }
  else
  {
    mUnderlyingSet = self->mUnderlyingSet;
    if (mUnderlyingSet)
      LOBYTE(mUnderlyingSet) = -[TSUPathSet isPathUsed:](mUnderlyingSet, "isPathUsed:", a3);
  }
  return (char)mUnderlyingSet;
}

- (void)setUnderlyingPathSet:(id)a3
{
  id v5;

  v5 = a3;

  self->mUnderlyingSet = (TSUPathSet *)a3;
}

- (void)unionPathSet:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  -[NSMutableSet unionSet:](self->mPaths, "unionSet:", *((_QWORD *)a3 + 1));
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v12, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mBasePathToNumberMap, "allKeys"));
  objc_msgSend(v12, "addObjectsFromArray:", objc_msgSend(*((id *)a3 + 2), "allKeys"));
  v5 = (void *)objc_msgSend(v12, "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = (void *)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v7);
      v9 = (void *)objc_msgSend(*((id *)a3 + 2), "objectForKey:", v7);
      v10 = v9;
      if (!v8
        || v9 && (v11 = objc_msgSend(v9, "unsignedIntValue"), v11 > objc_msgSend(v8, "unsignedIntValue")))
      {
        -[NSMutableDictionary setObject:forKey:](self->mBasePathToNumberMap, "setObject:forKey:", v10, v7);
      }
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }

}

- (TSUPathSet)initWithPaths:(id)a3 basePathToNumberMap:(id)a4
{
  TSUPathSet *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUPathSet;
  v6 = -[TSUPathSet init](&v8, sel_init);
  if (v6)
  {
    v6->mPaths = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
    v6->mBasePathToNumberMap = (NSMutableDictionary *)objc_msgSend(a4, "mutableCopy");
  }
  return v6;
}

+ (id)parseNumberOutOfBasename:(id)a3 hasNumber:(BOOL *)a4 number:(unsigned int *)a5
{
  id v5;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v15;
  signed int v16;
  signed int v17;

  v5 = a3;
  *a4 = 0;
  if (a3)
  {
    v8 = objc_msgSend(a3, "length");
    if (v8 - 1 >= 1)
    {
      v9 = v8;
      v10 = objc_msgSend(v5, "characterAtIndex:");
      if (v10 <= 0xFF)
      {
        v11 = MEMORY[0x24BDAC740];
        if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v10 + 60) & 0x400) != 0)
        {
          v12 = v9 - 2;
          while (1)
          {
            v13 = objc_msgSend(v5, "characterAtIndex:", v12);
            if (v13 > 0xFF || (*(_DWORD *)(v11 + 4 * v13 + 60) & 0x400) == 0)
              break;
            if (v12-- <= 0)
              return v5;
          }
          if (v12)
          {
            if (objc_msgSend(v5, "characterAtIndex:", v12) == 45)
            {
              v15 = (void *)objc_msgSend(v5, "substringToIndex:", v12);
              v16 = objc_msgSend((id)objc_msgSend(v5, "substringFromIndex:", v12 + 1), "intValue");
              if (v15)
              {
                v17 = v16;
                if (objc_msgSend(v15, "length"))
                {
                  if (v17 != 0x7FFFFFFF && v17 >= 1)
                  {
                    *a4 = 1;
                    if (a5)
                    {
                      *a5 = v17;
                      return v15;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

+ (void)processPath:(id)a3 base:(id *)a4 hasBaseNumber:(BOOL *)a5 baseNumber:(unsigned int *)a6 extension:(id *)a7
{
  id v11;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;

  v11 = a3;
  v13 = (void *)objc_msgSend(a3, "pathExtension");
  *a7 = v13;
  if (!objc_msgSend(v13, "length"))
    *a7 = 0;
  if (!objc_msgSend(v11, "length"))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v11 = (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("%.0f"), v15 * 1000.0);
  }
  *a4 = (id)objc_msgSend(v11, "stringByDeletingPathExtension");
  *a6 = 0;
  v16 = (void *)objc_msgSend(a1, "parseNumberOutOfBasename:hasNumber:number:", *a4, a5, a6);
  *a4 = v16;
  v17 = (void *)objc_msgSend(v16, "lastPathComponent");
  v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("~"));
  if (v18)
    v17 = (void *)objc_msgSend(CFSTR("x"), "stringByAppendingString:", v17);
  v19 = 255 - objc_msgSend(CFSTR("-0000"), "length");
  if (*a7)
    v19 += ~objc_msgSend(*a7, "length");
  v20 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
  if (!v20)
  {
    if (!v18)
      return;
    goto LABEL_13;
  }
  v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "stringWithFileSystemRepresentation:length:", v20, strlen(v20)), "tsu_substringWithComposedCharacterSequencesToIndex:", v19);
  v22 = objc_msgSend(v17, "isEqualToString:", v21);
  if (!v22)
    v17 = (void *)v21;
  if (((v18 | v22 ^ 1) & 1) != 0)
LABEL_13:
    *a4 = (id)objc_msgSend((id)objc_msgSend(*a4, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v17);
}

@end
