@implementation NSArray(CRCodable)

- (id)crCodableDataRepresentation
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(a1, "count");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v15, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {

          v9 = 0;
          goto LABEL_11;
        }
        +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v8, v2, (_QWORD)v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  v9 = v2;
LABEL_11:

  return v9;
}

- (id)initWithCRCodableDataRepresentation:()CRCodable objectProviderBlock:
{
  id v6;
  void (**v7)(id, void *);
  unint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v14 = 0;
    v8 = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v6, &v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    for (i = (void *)objc_claimAutoreleasedReturnValue(); v8; --v8)
    {
      +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v6, &v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(i, "addObject:", v11);

    }
    a1 = (id)objc_msgSend(a1, "initWithArray:", i);

    v12 = a1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
