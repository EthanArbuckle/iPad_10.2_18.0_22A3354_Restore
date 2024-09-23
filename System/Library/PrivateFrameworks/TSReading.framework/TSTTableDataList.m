@implementation TSTTableDataList

- (BOOL)supportsIDMapForType:(int)a3
{
  return (a3 > 0xA) | (0x2CFu >> a3) & 1;
}

- (void)p_setupWithType:(int)a3 nextKeyID:(unsigned int)a4
{
  uint64_t v4;
  TSTTableDataObjectKeyDict *v6;

  v4 = *(_QWORD *)&a3;
  self->mListType = a3;
  self->mNextID = a4;
  self->mData = objc_alloc_init(TSTIntegerKeyDict);
  if (-[TSTTableDataList supportsIDMapForType:](self, "supportsIDMapForType:", v4))
    v6 = objc_alloc_init(TSTTableDataObjectKeyDict);
  else
    v6 = 0;
  self->mIDs = v6;
}

- (TSTTableDataList)initWithType:(int)a3 context:(id)a4
{
  uint64_t v4;
  TSTTableDataList *v5;
  TSTTableDataList *v6;
  objc_super v8;

  v4 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)TSTTableDataList;
  v5 = -[TSPObject initWithContext:](&v8, sel_initWithContext_, a4);
  v6 = v5;
  if (v5)
    -[TSTTableDataList p_setupWithType:nextKeyID:](v5, "p_setupWithType:nextKeyID:", v4, 1);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataList;
  -[TSTTableDataList dealloc](&v3, sel_dealloc);
}

- (unint64_t)flushableSize
{
  int64_t v2;
  objc_class *v3;

  v2 = -[TSTIntegerKeyDict count](self->mData, "count");
  v3 = (objc_class *)objc_opt_class();
  return class_getInstanceSize(v3) * v2;
}

- (id)packageLocator
{
  return CFSTR("Tables/DataList");
}

- (id)allRichTextPayloadStorages
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v2 = -[TSTIntegerKeyDict allValues](self->mData, "allValues");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__TSTTableDataList_allRichTextPayloadStorages__block_invoke;
  v5[3] = &unk_24D82AA10;
  v5[4] = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  return v3;
}

uint64_t __46__TSTTableDataList_allRichTextPayloadStorages__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = TSUDynamicCast();
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(result + 16), "storage"));
  return result;
}

- (TSTIntegerKeyDict)data
{
  return self->mData;
}

- (unsigned)nextID
{
  return self->mNextID;
}

@end
