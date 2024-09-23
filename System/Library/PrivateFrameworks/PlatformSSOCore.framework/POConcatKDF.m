@implementation POConcatKDF

+ (id)concatKDFWithKey:(id)a3 algorithm:(id)a4 partyUInfo:(id)a5 partyVInfo:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  const void *v17;
  id v18;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;

  v9 = (objc_class *)MEMORY[0x24BDBCEC8];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  v24 = 0x1000000;
  objc_msgSend(v14, "appendBytes:length:", &v24, 4);
  objc_msgSend(v14, "appendData:", v13);

  v23 = bswap32(objc_msgSend(v12, "length"));
  objc_msgSend(v14, "appendBytes:length:", &v23, 4);
  objc_msgSend(v14, "appendData:", v12);

  v22 = bswap32(objc_msgSend(v11, "length"));
  objc_msgSend(v14, "appendBytes:length:", &v22, 4);
  objc_msgSend(v14, "appendData:", v11);

  v21 = bswap32(objc_msgSend(v10, "length"));
  objc_msgSend(v14, "appendBytes:length:", &v21, 4);
  objc_msgSend(v14, "appendData:", v10);

  v20 = 0x10000;
  objc_msgSend(v14, "appendBytes:length:", &v20, 4);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v14);
  v17 = (const void *)objc_msgSend(v16, "bytes");
  LODWORD(v12) = objc_msgSend(v16, "length");
  v18 = objc_retainAutorelease(v15);
  CC_SHA256(v17, (CC_LONG)v12, (unsigned __int8 *)objc_msgSend(v18, "mutableBytes"));

  return v18;
}

@end
