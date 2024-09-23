@implementation NSData(Hex)

- (BOOL)wl_blobIsComplete
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  if ((unint64_t)objc_msgSend(a1, "length") < 5)
    return 0;
  objc_msgSend(a1, "subdataWithRange:", 0, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);
  v4 = objc_msgSend(v3, "integerValue");
  v5 = objc_msgSend(a1, "length") == v4 + 4;

  return v5;
}

+ (id)wl_lengthPrefixedBlobSequenceFromDataArray:()Hex
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "wl_lengthPrefixedBlob", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendData:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v11 = v4;
  }
  else
  {
    objc_msgSend(v4, "wl_lengthPrefixedBlob");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)wl_lengthPrefixedBlob
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(a1, "length") + 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.4lu"), objc_msgSend(a1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendData:", v4);

  objc_msgSend(v2, "appendData:", a1);
  return v2;
}

- (id)wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:()Hex
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1;
  v7 = v6;
  if (a3 >= 2)
  {
    objc_msgSend(v6, "wl_dataFromLengthPrefixedBlob");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (objc_msgSend(v5, "count") < a3)
  {
    while ((unint64_t)objc_msgSend(v7, "length") >= 4)
    {
      objc_msgSend(v7, "subdataWithRange:", 0, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
      v11 = objc_msgSend(v10, "integerValue");
      objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "length") < v11)
      {

        v7 = v12;
        break;
      }
      objc_msgSend(v12, "subdataWithRange:", 0, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);
      objc_msgSend(v12, "subdataWithRange:", v11, objc_msgSend(v12, "length") - v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "count") >= a3)
        break;
    }
  }
  if (objc_msgSend(v7, "length"))
  {

    v5 = 0;
  }
  if (objc_msgSend(v5, "count") != a3)
  {

    v5 = 0;
  }

  return v5;
}

- (id)wl_dataFromLengthPrefixedBlob
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wl_hexEncodedData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wl_hexEncodedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wl_dataFromHexEncodedData:()Hex
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "wl_utf8String");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wl_dataFromHexEncodedString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wl_hexEncodedString
{
  size_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = 2 * objc_msgSend(a1, "length");
  v3 = malloc_type_malloc(v2, 0xA72B8D6DuLL);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__NSData_Hex__wl_hexEncodedString__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v6[4] = v3;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v6);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v3, v2, 4);
  free(v3);
  return v4;
}

+ (id)wl_dataFromHexEncodedString:()Hex
{
  id v3;
  size_t v4;
  _BYTE *v5;
  unint64_t v6;
  int v7;
  char v8;
  char v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v14;
  void *v15;
  __int16 v16;

  v3 = a3;
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    _WLLog();
    v12 = 0;
    goto LABEL_17;
  }
  v4 = (unint64_t)objc_msgSend(v3, "length") >> 1;
  v5 = malloc_type_malloc(v4, 0xD885B27EuLL);
  if (!objc_msgSend(v3, "length"))
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v6 = 0;
  while (1)
  {
    v7 = objc_msgSend(v3, "characterAtIndex:", v6);
    v16 = v7;
    if ((v7 - 48) >= 0xA)
      break;
    v8 = -48;
LABEL_10:
    v9 = v8 + v7;
    v10 = v6 >> 1;
    if ((v6 & 1) != 0)
      v11 = v5[v10] | v9;
    else
      v11 = 16 * v9;
    v5[v10] = v11;
    if (++v6 >= objc_msgSend(v3, "length"))
      goto LABEL_14;
  }
  if ((v7 - 97) < 6)
  {
    v8 = -87;
    goto LABEL_10;
  }
  if ((v7 - 65) <= 5)
  {
    v8 = -55;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v12 = 0;
LABEL_15:
  free(v5);
LABEL_17:

  return v12;
}

- (id)wl_utf8String
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 4);
}

@end
