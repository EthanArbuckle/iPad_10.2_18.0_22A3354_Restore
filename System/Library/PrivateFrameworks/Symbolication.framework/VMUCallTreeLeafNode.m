@implementation VMUCallTreeLeafNode

- (VMUCallTreeLeafNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  VMUCallTreeLeafNode *v6;
  NSCountedSet *v7;
  NSCountedSet *addresses;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VMUCallTreeLeafNode;
  v6 = -[VMUCallTreeNode initWithName:address:count:numBytes:](&v10, sel_initWithName_address_count_numBytes_, a3, a4, *(_QWORD *)&a5, a6);
  if (v6)
  {
    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    addresses = v6->_addresses;
    v6->_addresses = v7;

  }
  return v6;
}

- (VMUCallTreeLeafNode)init
{
  return -[VMUCallTreeLeafNode initWithName:address:count:numBytes:](self, "initWithName:address:count:numBytes:", &stru_1E4E04720, 0, 0, 0);
}

- (void)addAddress:(unint64_t)a3
{
  NSCountedSet *addresses;
  void *v5;
  NSString *combinedName;

  addresses = self->_addresses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](addresses, "addObject:", v5);

  combinedName = self->_combinedName;
  self->_combinedName = 0;

}

- (void)getBrowserName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  NSString *combinedName;
  NSString *v22;
  NSString *name;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1A85A9758]();
  v6 = (void *)v5;
  if (!self->_combinedName)
  {
    v27 = (void *)v5;
    v28 = v4;
    v39 = 0;
    v40 = 0;
    v37 = 0;
    v38 = 0;
    -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:](self, "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:", &v39, &v38, 0, 0, &v40, &v37);
    v26 = v39;
    v25 = v38;
    v24 = v37;
    -[NSCountedSet allObjects](self->_addresses, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __38__VMUCallTreeLeafNode_getBrowserName___block_invoke;
    v36[3] = &unk_1E4E036D8;
    v36[4] = self;
    objc_msgSend(v7, "sortedArrayUsingComparator:", v36);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v33;
      while (2)
      {
        v16 = 0;
        v29 = v14 + v13;
        v30 = v14;
        do
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v11);
          v17 = v14 + v16;
          if ((unint64_t)(v14 + v16) > 1)
          {
            if (v17 == 2)
            {
              objc_msgSend(v9, "appendString:", CFSTR(",..."));
              objc_msgSend(v10, "appendString:", CFSTR(",..."));
              goto LABEL_16;
            }
          }
          else
          {
            v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
            if (v17 == 1)
            {
              objc_msgSend(v9, "appendString:", CFSTR(","));
              v14 = v30;
              objc_msgSend(v10, "appendString:", CFSTR(","));
            }
            v19 = objc_msgSend(v18, "unsignedLongLongValue");
            objc_msgSend(v9, "appendFormat:", CFSTR("%qu"), v19 - v40);
            objc_msgSend(v10, "appendFormat:", CFSTR("0x%qx"), v19);
          }
          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        v14 = v29;
        if (v13)
          continue;
        break;
      }
    }
LABEL_16:

    -[VMUCallTreeNode nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:](self, "nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:", v26, v25, 0, v9, v10, v24);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    combinedName = self->_combinedName;
    self->_combinedName = v20;

    v6 = v27;
    v4 = v28;
  }
  v22 = self->super._name;
  objc_storeStrong((id *)&self->super._name, self->_combinedName);
  v31.receiver = self;
  v31.super_class = (Class)VMUCallTreeLeafNode;
  -[VMUCallTreeNode getBrowserName:](&v31, sel_getBrowserName_, v4);
  name = self->super._name;
  self->super._name = v22;

  objc_autoreleasePoolPop(v6);
}

uint64_t __38__VMUCallTreeLeafNode_getBrowserName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "countForObject:", v5);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "countForObject:", v6);
  if (v7 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 < v8)
    v10 = 1;
  else
    v10 = v9;
  if (v7 == v8)
  {
    v11 = objc_msgSend(v5, "unsignedLongLongValue");
    if (v11 < objc_msgSend(v6, "unsignedLongLongValue"))
      v12 = -1;
    else
      v12 = v10;
    v13 = objc_msgSend(v5, "unsignedLongLongValue");
    if (v13 > objc_msgSend(v6, "unsignedLongLongValue"))
      v10 = 1;
    else
      v10 = v12;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedName, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
