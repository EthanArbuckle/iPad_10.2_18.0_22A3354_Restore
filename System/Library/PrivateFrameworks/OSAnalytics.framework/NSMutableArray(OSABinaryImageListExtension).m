@implementation NSMutableArray(OSABinaryImageListExtension)

- (void)sortByAddressAndSetInferredSizes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v2 = objc_msgSend(a1, "count");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(a1, "sortUsingComparator:", &__block_literal_global_8);
    objc_msgSend(a1, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 1)
    {
      v18 = v4;
      objc_msgSend(v4, "symbolInfo");
    }
    else
    {
      for (i = 1; i != v3; ++i)
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", i);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "symbolInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "size");

        if (!v8)
        {
          objc_msgSend(v18, "symbolInfo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "start");
          objc_msgSend(v5, "symbolInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10 - objc_msgSend(v11, "start");

          if (v12 >= 0x40000000)
            v13 = 0x40000000;
          else
            v13 = v12;
          objc_msgSend(v5, "symbolInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSize:", v13);

        }
        v5 = v18;
      }
      objc_msgSend(v18, "symbolInfo");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "size");

    if (!v16)
    {
      objc_msgSend(v18, "symbolInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSize:", 0x40000000);

    }
  }
}

- (void)addImageLegacy:()OSABinaryImageListExtension address:size:name:path:arch:
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  OSABinaryImageSegment *v21;

  v21 = -[OSABinaryImageSegment initWithAddress:size:for:]([OSABinaryImageSegment alloc], "initWithAddress:size:for:", a4, a5, a3);
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", v12);

  }
  if (a7)
  {
    -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPath:", v15);

  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a8);
    v16 = objc_claimAutoreleasedReturnValue();
    -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17[3];
    v17[3] = v16;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSABinaryImageSegment symbolInfo](v21, "symbolInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCpuArch:", v19);

  }
  objc_msgSend(a1, "addObject:", v21);

}

- (void)addImage:()OSABinaryImageListExtension address:size:
{
  OSABinaryImageSegment *v6;

  v6 = -[OSABinaryImageSegment initWithAddress:size:for:]([OSABinaryImageSegment alloc], "initWithAddress:size:for:", a4, a5, a3);
  objc_msgSend(a1, "addObject:", v6);

}

@end
