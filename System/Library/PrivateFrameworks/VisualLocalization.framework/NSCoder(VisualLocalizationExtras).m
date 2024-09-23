@implementation NSCoder(VisualLocalizationExtras)

- (uint64_t)_vl_encodeSimdDouble4x4:()VisualLocalizationExtras forKey:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3[1];
  v9[0] = *a3;
  v9[1] = v4;
  v5 = a3[3];
  v9[2] = a3[2];
  v9[3] = v5;
  v6 = a3[5];
  v9[4] = a3[4];
  v9[5] = v6;
  v7 = a3[7];
  v9[6] = a3[6];
  v9[7] = v7;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v9, 128, a4);
}

- (uint64_t)_vl_decodeSimdDouble4x4:()VisualLocalizationExtras forKey:
{
  id v6;
  id v7;
  _OWORD *v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v24 = 0;
  v7 = objc_retainAutorelease(a1);
  v8 = (_OWORD *)objc_msgSend(v7, "decodeBytesForKey:returnedLength:", v6, &v24);
  if (v8)
    v9 = v24 == 128;
  else
    v9 = 0;
  v10 = v9;
  if (v9)
  {
    if (a3)
    {
      v11 = v8[1];
      v13 = v8[2];
      v12 = v8[3];
      v15 = v8[4];
      v14 = v8[5];
      v17 = v8[6];
      v16 = v8[7];
      *a3 = *v8;
      a3[1] = v11;
      a3[2] = v13;
      a3[3] = v12;
      a3[4] = v15;
      a3[5] = v14;
      a3[6] = v17;
      a3[7] = v16;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0B88];
    v25 = *MEMORY[0x24BDBD370];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 4864, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "failWithError:", v22);

  }
  return v10;
}

- (uint64_t)_vl_encodeFloat6x6:()VisualLocalizationExtras forKey:
{
  return objc_msgSend(a1, "encodeBytes:length:forKey:", a3, 144, a4);
}

- (uint64_t)_vl_decodeFloat6x6:()VisualLocalizationExtras forKey:
{
  id v6;
  id v7;
  _DWORD *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17 = 0;
  v7 = objc_retainAutorelease(a1);
  v8 = (_DWORD *)objc_msgSend(v7, "decodeBytesForKey:returnedLength:", v6, &v17);
  if (v8)
    v9 = v17 == 144;
  else
    v9 = 0;
  v10 = v9;
  if (v9)
  {
    if (a3)
    {
      *a3 = *v8;
      a3[1] = v8[1];
      a3[2] = v8[2];
      a3[3] = v8[3];
      a3[4] = v8[4];
      a3[5] = v8[5];
      a3[6] = v8[6];
      a3[7] = v8[7];
      a3[8] = v8[8];
      a3[9] = v8[9];
      a3[10] = v8[10];
      a3[11] = v8[11];
      a3[12] = v8[12];
      a3[13] = v8[13];
      a3[14] = v8[14];
      a3[15] = v8[15];
      a3[16] = v8[16];
      a3[17] = v8[17];
      a3[18] = v8[18];
      a3[19] = v8[19];
      a3[20] = v8[20];
      a3[21] = v8[21];
      a3[22] = v8[22];
      a3[23] = v8[23];
      a3[24] = v8[24];
      a3[25] = v8[25];
      a3[26] = v8[26];
      a3[27] = v8[27];
      a3[28] = v8[28];
      a3[29] = v8[29];
      a3[30] = v8[30];
      a3[31] = v8[31];
      a3[32] = v8[32];
      a3[33] = v8[33];
      a3[34] = v8[34];
      a3[35] = v8[35];
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0B88];
    v18 = *MEMORY[0x24BDBD370];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ bytes were not the expected length"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 4864, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "failWithError:", v15);

  }
  return v10;
}

@end
