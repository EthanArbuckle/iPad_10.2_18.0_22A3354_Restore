@implementation TSTCustomFormatList

- (TSTCustomFormatList)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCustomFormatList init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCustomFormatList.mm"), 16, CFSTR("Don't use init for TSTCustomFormatList"));
  return 0;
}

- (TSTCustomFormatList)initWithContext:(id)a3
{
  TSTCustomFormatList *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTCustomFormatList;
  result = -[TSTTableDataList initWithType:context:](&v4, sel_initWithType_context_, 6, a3);
  if (result)
    result->mNamesList = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTCustomFormatList;
  -[TSTTableDataList dealloc](&v3, sel_dealloc);
}

- (BOOL)supportsIDMapForType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 6)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSTCustomFormatList;
  return -[TSTTableDataList supportsIDMapForType:](&v6, sel_supportsIDMapForType_);
}

- (unsigned)addCustomFormat:(void *)a3 duringImport:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t KeyForCustomFormat;
  unsigned int v8;
  NSString *v9;
  uint64_t v10;
  NSMutableDictionary *mNamesList;
  BOOL v12;

  v4 = a4;
  KeyForCustomFormat = TSTTableDataListGetKeyForCustomFormat(&self->super, (TSUCustomFormat *)a3);
  if ((_DWORD)KeyForCustomFormat)
  {
    v8 = KeyForCustomFormat;
    TSTTableDataListAddReferenceForKey((id *)&self->super.super.super.isa, KeyForCustomFormat);
  }
  else
  {
    v9 = -[TSTCustomFormatList newUniqueNameFromName:preserveSeed:](self, "newUniqueNameFromName:preserveSeed:", TSUCustomFormat::formatName((TSUCustomFormat *)a3), v4);
    TSUCustomFormat::setFormatName((TSUCustomFormat *)a3, v9);
    v10 = TSTTableDataListAddCustomFormat(&self->super, (uint64_t)a3);
    v8 = v10;
    mNamesList = self->mNamesList;
    if (mNamesList)
      v12 = (_DWORD)v10 == 0;
    else
      v12 = 1;
    if (!v12)
      -[NSMutableDictionary setObject:forKey:](mNamesList, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10), v9);

  }
  return v8;
}

- (unsigned)addCustomFormat:(void *)a3 withOldKey:(unsigned int)a4
{
  TSUCustomFormat *v7;

  v7 = -[TSTCustomFormatList customFormatForKey:](self, "customFormatForKey:", *(_QWORD *)&a4);
  if (v7 && (TSUCustomFormat::customFormatIsEqual(v7, (TSUCustomFormat *)a3) & 1) != 0)
    return a4;
  else
    return -[TSTCustomFormatList addCustomFormat:duringImport:](self, "addCustomFormat:duringImport:", a3, 0);
}

- (void)customFormatForKey:(unsigned int)a3
{
  return (void *)TSTTableDataListGetCustomFormatForKey((uint64_t)self, *(uint64_t *)&a3);
}

- (id)customFormatWrapperForKey:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C50]), "initWithCustomFormat:", TSTTableDataListGetCustomFormatForKey((uint64_t)self, *(uint64_t *)&a3));
}

- (unsigned)maxKey
{
  return -[TSTTableDataList nextID](self, "nextID") - 1;
}

- (id)allNumberKeys
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[TSTCustomFormatList count](self, "count"));
  if (-[TSTTableDataList nextID](self, "nextID"))
  {
    v4 = 0;
    do
    {
      if (-[TSTCustomFormatList customFormatForKey:](self, "customFormatForKey:", v4))
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4));
      v4 = (v4 + 1);
    }
    while (v4 < -[TSTTableDataList nextID](self, "nextID"));
  }
  return v3;
}

- (void)p_setupNamesList
{
  int64_t v3;
  NSMutableDictionary *v4;
  unsigned int v5;
  uint64_t v6;
  TSUCustomFormat *v7;

  if (!self->mNamesList)
  {
    v3 = -[TSTCustomFormatList count](self, "count") <= 20 ? -[TSTCustomFormatList count](self, "count") : 20;
    v4 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v3);
    self->mNamesList = v4;
    if (v4)
    {
      if (-[TSTCustomFormatList count](self, "count") >= 1)
      {
        v5 = -[TSTTableDataList nextID](self, "nextID");
        if ((int)(v5 - 1) >= 1)
        {
          LODWORD(v6) = v5;
          do
          {
            v6 = (v6 - 1);
            v7 = -[TSTCustomFormatList customFormatForKey:](self, "customFormatForKey:", v6);
            if (v7)
              -[NSMutableDictionary setObject:forKey:](self->mNamesList, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6), TSUCustomFormat::formatName(v7));
          }
          while ((int)v6 > 1);
        }
      }
    }
  }
}

- (id)newUniqueNameFromName:(id)a3
{
  return -[TSTCustomFormatList newUniqueNameFromName:preserveSeed:](self, "newUniqueNameFromName:preserveSeed:", a3, 0);
}

- (id)newUniqueNameFromName:(id)a3 preserveSeed:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  id v16;
  void *v17;
  uint64_t v18;

  if (!a3)
    a3 = (id)objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("Custom Format"), &stru_24D82FEB0, CFSTR("TSTables"));
  v16 = a3;
  -[TSTCustomFormatList p_setupNamesList](self, "p_setupNamesList");
  if (-[NSMutableDictionary objectForKey:](self->mNamesList, "objectForKey:", v16))
  {
    v6 = v16;
    do
    {
      v17 = v6;
      v7 = (void *)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
      v8 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 1), "integerValue");
      if (!v8 || a4)
      {
        v13 = v17;
        v12 = CFSTR(" 1");
      }
      else
      {
        v9 = v8;
        v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        objc_msgSend(v10, "addObjectsFromArray:", v7);
        objc_msgSend(v10, "removeLastObject");
        v11 = objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
        v12 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %li"), v9 + 1);
        v13 = (void *)v11;
      }
      v18 = objc_msgSend(v13, "stringByAppendingString:", v12);
      v14 = -[NSMutableDictionary objectForKey:](self->mNamesList, "objectForKey:", v18);
      v6 = (void *)v18;
      a4 = 0;
    }
    while (v14);
  }
  else
  {
    v6 = v16;
  }
  return v6;
}

@end
