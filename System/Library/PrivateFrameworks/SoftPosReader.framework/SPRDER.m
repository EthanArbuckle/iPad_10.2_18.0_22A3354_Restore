@implementation SPRDER

+ (id)DERDecodeData:(id)a3 expectedSingleByteTag:(unsigned __int8)a4
{
  return (id)((uint64_t (*)(id, char *, id, unint64_t))MEMORY[0x24BEDD108])(a1, sel_DERDecodeData_expectedTag_, a3, a4 & 0x1F | ((unint64_t)((a4 & 0xE0) >> 5) << 61));
}

+ (id)DERDecodeData:(id)a3 expectedTag:(unint64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[2];
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = 0;
  v25 = 0;
  v26 = 0;
  v5 = objc_retainAutorelease(a3);
  v23[0] = objc_msgSend_bytes(v5, v6, v7, v8, v9, v10);
  v16 = objc_msgSend_length(v5, v11, v12, v13, v14, v15);

  v23[1] = v16;
  v17 = sub_21598492C((uint64_t)v23, &v24);
  if ((_DWORD)v17)
  {
    NSLog(CFSTR("DERDecodeData: non DR_Success return: %d"), v17);
  }
  else if (a4 == -1 || v24 == a4)
  {
    if (v26)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v18, v25, v26, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      return v21;
    }
    NSLog(CFSTR("DERDecodeData: null data"));
  }
  else
  {
    NSLog(CFSTR("DERDecodeData: unexpected tag: %llx"), v24);
  }
  v21 = 0;
  return v21;
}

+ (id)DERDecodeData:(id)a3
{
  return (id)((uint64_t (*)(id, char *, id, uint64_t))MEMORY[0x24BEDD108])(a1, sel_DERDecodeData_expectedTag_, a3, -1);
}

+ (id)DEREncodeData:(id)a3 tag:(unint64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _BYTE v25[512];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 512;
  v5 = a3;
  v11 = objc_msgSend_length(v5, v6, v7, v8, v9, v10);
  v12 = objc_retainAutorelease(v5);
  v18 = (const void *)objc_msgSend_bytes(v12, v13, v14, v15, v16, v17);

  v19 = sub_2159854D0(a4, v11, v18, (unint64_t)v25, (unint64_t *)&v24);
  if ((_DWORD)v19)
  {
    NSLog(CFSTR("DEREncodeData: non DR_Success return: %d"), v19);
    return 0;
  }
  if (!v24)
  {
    NSLog(CFSTR("DEREncodeData: null data"));
    return 0;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v20, (uint64_t)v25, v24, v21, v22);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)DEREncodeData:(id)a3 singleByteTag:(unsigned __int8)a4
{
  return (id)((uint64_t (*)(id, char *, id, unint64_t))MEMORY[0x24BEDD108])(a1, sel_DEREncodeData_tag_, a3, a4 & 0x1F | ((unint64_t)((a4 & 0xE0) >> 5) << 61));
}

+ (BOOL)DERParseSEFWSequence:(id *)a3 info:(id *)a4
{
  uint64_t v4;
  int v5;
  _QWORD v7[3];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7[2] = 0;
  v9 = 0;
  v7[0] = 0;
  v7[1] = 0x8000000000000000;
  v8 = xmmword_21599B160;
  v4 = sub_2159851D8((uint64_t)a3, 2u, (uint64_t)v7, (unint64_t)a4, 0);
  v5 = v4;
  if ((_DWORD)v4)
    NSLog(CFSTR("non DR_Success return: %d"), v4);
  return v5 == 0;
}

+ (BOOL)DERParseScriptSequence:(id *)a3 info:(id *)a4
{
  uint64_t v4;
  int v5;
  _OWORD v7[9];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7[6] = xmmword_21599B1D8;
  v7[7] = unk_21599B1E8;
  v7[8] = xmmword_21599B1F8;
  v7[2] = xmmword_21599B198;
  v7[3] = unk_21599B1A8;
  v7[4] = xmmword_21599B1B8;
  v7[5] = unk_21599B1C8;
  v7[0] = xmmword_21599B178;
  v7[1] = *(_OWORD *)algn_21599B188;
  v4 = sub_2159851D8((uint64_t)a3, 6u, (uint64_t)v7, (unint64_t)a4, 0);
  v5 = v4;
  if ((_DWORD)v4)
    NSLog(CFSTR("non DR_Success return: %d"), v4);
  return v5 == 0;
}

+ (BOOL)DERDecodeSequenceContentWithData:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t);
  void *v25;
  id v26;
  unint64_t v27[2];

  v5 = a4;
  v6 = objc_retainAutorelease(a3);
  v27[0] = objc_msgSend_bytes(v6, v7, v8, v9, v10, v11);
  v17 = objc_msgSend_length(v6, v12, v13, v14, v15, v16);

  v27[1] = v17;
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = sub_21596ECF4;
  v25 = &unk_24D3CCC98;
  v18 = v5;
  v26 = v18;
  v19 = sub_2159852B4(v27, (uint64_t)&v22);
  v20 = v19;
  if ((_DWORD)v19)
    NSLog(CFSTR("non DR_Success return: %d"), v19, v22, v23, v24, v25);

  return v20 == 0;
}

+ (BOOL)DERDecodeSequenceWithData:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t);
  void *v25;
  id v26;
  _QWORD v27[2];

  v5 = a4;
  v6 = objc_retainAutorelease(a3);
  v27[0] = objc_msgSend_bytes(v6, v7, v8, v9, v10, v11);
  v17 = objc_msgSend_length(v6, v12, v13, v14, v15, v16);

  v27[1] = v17;
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = sub_21596EE34;
  v25 = &unk_24D3CCC98;
  v18 = v5;
  v26 = v18;
  v19 = sub_215985218((uint64_t)v27, (uint64_t)&v22);
  v20 = v19;
  if ((_DWORD)v19)
    NSLog(CFSTR("non DR_Success return: %d"), v19, v22, v23, v24, v25);

  return v20 == 0;
}

+ (id)DERParseScriptInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  SPRScriptInfo *v30;
  const char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];

  v4 = objc_retainAutorelease(a3);
  v41[0] = objc_msgSend_bytes(v4, v5, v6, v7, v8, v9);
  v15 = objc_msgSend_length(v4, v10, v11, v12, v13, v14);

  v41[1] = v15;
  v39 = 0u;
  v40 = 0u;
  if ((objc_msgSend_DERParseSEFWSequence_info_(a1, v16, (uint64_t)v41, (uint64_t)&v39, v17, v18) & 1) == 0)
  {
    NSLog(CFSTR("Parse SEFW seq failed"));
    goto LABEL_7;
  }
  if (*((_QWORD *)&v39 + 1) != 4)
  {
    NSLog(CFSTR("parse format version failed"));
    goto LABEL_7;
  }
  if (bswap32(*(_DWORD *)v39) - 3 <= 0xFFFFFFFD)
  {
    NSLog(CFSTR("unsupported format version"));
LABEL_7:
    v22 = 0;
    return v22;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  if ((objc_msgSend_DERParseScriptSequence_info_(a1, v19, (uint64_t)&v40, (uint64_t)&v33, v20, v21) & 1) == 0)
  {
    NSLog(CFSTR("Parse script seq failed"));
    goto LABEL_7;
  }
  if (*((_QWORD *)&v33 + 1) != 8)
  {
    NSLog(CFSTR("Parse scriptID failed"));
    goto LABEL_7;
  }
  v24 = *(_QWORD *)v33;
  v25 = objc_alloc(MEMORY[0x24BDD17C8]);
  v28 = (void *)objc_msgSend_initWithBytes_length_encoding_(v25, v26, v34, *((uint64_t *)&v34 + 1), 1, v27);
  if (*((_QWORD *)&v36 + 1) == 4)
  {
    v29 = bswap32(*(_DWORD *)v36);
    v30 = [SPRScriptInfo alloc];
    v22 = (void *)objc_msgSend_initWithScriptID_scriptName_apduCount_(v30, v31, bswap64(v24), (uint64_t)v28, v29, v32);
  }
  else
  {
    NSLog(CFSTR("Parse apdu count failed"));
    v22 = 0;
  }

  return v22;
}

@end
