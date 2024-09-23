@implementation VMUMutableFieldInfo

- (void)setIvarName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setIvarName:](&v3, sel__setIvarName_, a3);
}

- (void)setScanType:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setScanType:](&v3, sel__setScanType_, *(_QWORD *)&a3);
}

- (void)setOffset:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setOffset:](&v3, sel__setOffset_, *(_QWORD *)&a3);
}

- (void)setSize:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setSize:](&v3, sel__setSize_, *(_QWORD *)&a3);
}

- (void)setKind:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setKind:](&v3, sel__setKind_, *(_QWORD *)&a3);
}

- (void)setIsByref:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setFlags:](&v3, sel__setFlags_, -[VMUFieldInfo flags](self, "flags", a3) | 2);
}

- (void)setIsCapture:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setFlags:](&v3, sel__setFlags_, -[VMUFieldInfo flags](self, "flags", a3) | 1);
}

- (void)setFlags:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setFlags:](&v3, sel__setFlags_, *(_QWORD *)&a3);
}

- (void)setScannableSize:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setScannableSize:](&v3, sel__setScannableSize_, *(_QWORD *)&a3);
}

- (void)setStride:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  -[VMUFieldInfo _setStride:](&v3, sel__setStride_, *(_QWORD *)&a3);
}

- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3 parentOffset:(unsigned int)a4
{
  uint64_t v4;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, id, uint64_t);
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[VMUFieldInfo subFieldArray](self, "subFieldArray", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = (void (*)(_QWORD *, id, uint64_t))v6[2];
          v14 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v12);
          v13(v6, v14, v4);
          objc_msgSend(v14, "mutateTypeFieldsRecursivelyWithBlock:parentOffset:", v6, objc_msgSend(v14, "offset") + v4);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a5;
  -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "offset");
    if (a4 - (unint64_t)v14 < objc_msgSend(v13, "size"))
    {
      v15 = 0;
      v16 = 1;
LABEL_8:
      v18 = a4 - v14;
      if ((_DWORD)v18 || !objc_msgSend(v13, "isEqual:", v8))
      {
        objc_msgSend(v13, "subFieldArray");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19 || (objc_msgSend(v13, "replaceFieldRecursively:atOffset:withField:", v8, v18, v9) & 1) == 0)
        {
          LOBYTE(a4) = 0;
          goto LABEL_16;
        }
      }
      else
      {
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, v15);
      }
      LOBYTE(a4) = 1;
LABEL_16:

      goto LABEL_17;
    }
    v17 = 1;
    while (1)
    {

      if (v12 == v17)
        break;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "offset");
      ++v17;
      if (a4 - (unint64_t)v14 < objc_msgSend(v13, "size"))
      {
        v15 = v17 - 1;
        v16 = v15 < v12;
        goto LABEL_8;
      }
    }
  }
  v16 = 0;
LABEL_17:

  return v16 & a4;
}

- (void)addSubField:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[VMUFieldInfo initializeSubFieldArray](self, "initializeSubFieldArray");
  -[VMUFieldInfo subFieldArray](self, "subFieldArray");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

@end
