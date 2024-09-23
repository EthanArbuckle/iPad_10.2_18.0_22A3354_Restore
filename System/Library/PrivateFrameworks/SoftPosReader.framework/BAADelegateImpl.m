@implementation BAADelegateImpl

+ (BOOL)isInternal
{
  if (qword_254DEF3E0 != -1)
    dispatch_once(&qword_254DEF3E0, &unk_24D3CD8C8);
  return byte_254DEF3D9;
}

+ (int)generateSigKey:(unsigned int)a3 keyData:(id *)a4 attestation:(id *)a5 pubKey:(id *)a6
{
  unsigned int *v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  size_t outputStructCnt;
  uint64_t inputStruct;
  unsigned int v41;

  v41 = 0;
  outputStructCnt = 0;
  inputStruct = 0;
  if (!a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2159834EC();
    goto LABEL_21;
  }
  if (!a5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598357C();
    goto LABEL_21;
  }
  if (!a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598360C();
LABEL_21:
    v34 = 4294967292;
    goto LABEL_14;
  }
  v10 = (unsigned int *)malloc_type_calloc(0x4000uLL, 1uLL, 0xD72640C9uLL);
  if (v10)
  {
    v11 = v10;
    v12 = sub_2159801EC();
    if ((_DWORD)v12)
    {
      v34 = v12;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_215983A8C();
      goto LABEL_13;
    }
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 18;
    v41 = a3;
    outputStructCnt = 0x4000;
    v13 = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 0xCuLL, v11, &outputStructCnt);
    if ((_DWORD)v13)
    {
      v34 = v13;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2159839FC();
      goto LABEL_13;
    }
    if (outputStructCnt <= 0xB)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598372C();
    }
    else
    {
      v17 = *v11;
      if (outputStructCnt == v17 + v11[1] + v11[2] + 12)
      {
        v18 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v14, (uint64_t)(v11 + 3), v17, v15, v16);
        if (v18)
        {
          v22 = v18;
          v23 = (uint64_t)v11 + *v11 + 12;
          v24 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v19, v23, v11[1], v20, v21);
          if (v24)
          {
            v28 = v24;
            v29 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v25, v23 + v11[1], v11[2], v26, v27);
            if (v29)
            {
              v30 = v29;
              v31 = objc_retainAutorelease(v22);
              *a4 = v31;
              v32 = objc_retainAutorelease(v28);
              *a5 = v32;
              v33 = objc_retainAutorelease(v30);
              *a6 = v33;

              v34 = 0;
LABEL_13:
              free(v11);
              goto LABEL_14;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              sub_2159838DC();

          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            sub_21598384C();
          }

        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          sub_2159837BC();
        }
        v34 = 4294967291;
        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598396C();
    }
    v34 = 4294967290;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_21598369C();
  v34 = 4294967291;
LABEL_14:
  sub_2159805F8((uint64_t)"generateSigKey", v34, 0, 0, 0, v35, v36, v37);
  return v34;
}

+ (int)setSigKey:(unsigned int)a3 expirationDate:(unint64_t)a4 keyData:(id)a5 certificates:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  v11 = v9;
  v12 = v10;
  v13 = (char *)malloc_type_calloc(0x4000uLL, 1uLL, 0xE63C3C98uLL);
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215983B1C();
    v83 = 4294967291;
    goto LABEL_32;
  }
  v14 = v13;
  v15 = sub_2159801EC();
  if ((_DWORD)v15)
  {
    v83 = v15;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215983E7C();
    goto LABEL_31;
  }
  *(_DWORD *)v14 = 1397966179;
  *((_WORD *)v14 + 2) = 19;
  *((_DWORD *)v14 + 2) = a3;
  *(_QWORD *)(v14 + 12) = a4;
  v21 = v14 + 28;
  if (v11)
  {
    if ((unint64_t)objc_msgSend_length(v11, v16, v17, v18, v19, v20) >= 0x3FE5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_215983DEC();
      v83 = 4294967292;
      goto LABEL_31;
    }
    *((_DWORD *)v14 + 5) = objc_msgSend_length(v11, v22, v23, v24, v25, v26);
    v32 = objc_msgSend_length(v11, v27, v28, v29, v30, v31);
    objc_msgSend_getBytes_length_(v11, v33, (uint64_t)(v14 + 28), v32, v34, v35);
    v21 += objc_msgSend_length(v11, v36, v37, v38, v39, v40);
  }
  else
  {
    *((_DWORD *)v14 + 5) = 0;
  }
  if (!objc_msgSend_count(v12, v16, v17, v18, v19, v20))
  {
    *((_DWORD *)v14 + 6) = 0;
    goto LABEL_20;
  }
  *((_DWORD *)v14 + 6) = objc_msgSend_count(v12, v41, v42, v43, v44, v45);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v89 = v12;
  v46 = v12;
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v90, (uint64_t)v94, 16, v48);
  if (!v49)
    goto LABEL_18;
  v50 = v49;
  v51 = v14 + 0x4000;
  v52 = *(_QWORD *)v91;
  while (2)
  {
    for (i = 0; i != v50; ++i)
    {
      if (*(_QWORD *)v91 != v52)
        objc_enumerationMutation(v46);
      v54 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_215983D5C();
        goto LABEL_30;
      }
      if ((unint64_t)(v51 - v21) <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_215983C3C();
        goto LABEL_30;
      }
      *(_DWORD *)v21 = objc_msgSend_length(v54, v55, v56, v57, v58, v59);
      v60 = (uint64_t)(v21 + 4);
      if (objc_msgSend_length(v54, v61, v62, v63, v64, v65) > (unint64_t)&v51[-v60])
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_215983CCC();
LABEL_30:

        v83 = 4294967292;
        v12 = v89;
        goto LABEL_31;
      }
      v71 = objc_msgSend_length(v54, v66, v67, v68, v69, v70);
      objc_msgSend_getBytes_length_(v54, v72, v60, v71, v73, v74);
      v21 = (char *)(v60 + objc_msgSend_length(v54, v75, v76, v77, v78, v79));
    }
    v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v80, (uint64_t)&v90, (uint64_t)v94, 16, v81);
    if (v50)
      continue;
    break;
  }
LABEL_18:

  v12 = v89;
LABEL_20:
  v82 = IOConnectCallStructMethod(dword_254DEF394, 0, v14, v21 - v14, 0, 0);
  v83 = 0;
  if ((_DWORD)v82)
  {
    v84 = v82;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215983BAC();
    v83 = v84;
  }
LABEL_31:
  free(v14);
LABEL_32:
  sub_2159805F8((uint64_t)"setSigKey", v83, 0, 0, 0, v85, v86, v87);

  return v83;
}

+ (int)getSigKeyExpDate:(unsigned int)a3 expirationDate:(unint64_t *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v13;
  unint64_t outputStruct;
  uint64_t inputStruct;
  unsigned int v16;

  v16 = 0;
  outputStruct = 0;
  inputStruct = 0;
  v13 = 0;
  if (a4)
  {
    v6 = sub_2159801EC();
    if ((_DWORD)v6)
    {
      v11 = v6;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2159840BC();
    }
    else
    {
      LODWORD(inputStruct) = 1397966179;
      WORD2(inputStruct) = 20;
      v16 = a3;
      v13 = 8;
      v7 = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 0xCuLL, &outputStruct, &v13);
      if ((_DWORD)v7)
      {
        v11 = v7;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_21598402C();
      }
      else if (v13 == 8)
      {
        v11 = 0;
        *a4 = outputStruct;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_215983F9C();
        v11 = 4294967290;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215983F0C();
    v11 = 4294967292;
  }
  sub_2159805F8((uint64_t)"getSigKeyExpDate", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

+ (int)getSigKeyCertificates:(unsigned int)a3 certificates:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  id v18;
  size_t outputStructCnt;
  uint64_t inputStruct;
  unsigned int v21;

  v21 = 0;
  outputStructCnt = 0;
  inputStruct = 0;
  v18 = 0;
  if (a4)
  {
    v6 = malloc_type_calloc(0x4000uLL, 1uLL, 0x7CCF5ECFuLL);
    if (v6)
    {
      v7 = v6;
      v8 = sub_2159801EC();
      if ((_DWORD)v8)
      {
        v12 = v8;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_21598438C();
      }
      else
      {
        LODWORD(inputStruct) = 1397966179;
        WORD2(inputStruct) = 25;
        v21 = a3;
        outputStructCnt = 0x4000;
        v9 = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 0xCuLL, v7, &outputStructCnt);
        if ((_DWORD)v9)
        {
          v12 = v9;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_2159842FC();
        }
        else
        {
          v17 = 0;
          v12 = sub_2159806AC((const char *)v7, (const char *)v7 + outputStructCnt, &v18, &v17, v10, v11);
          if ((_DWORD)v12)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              sub_21598426C();
            if (v18)
              CFRelease(v18);
          }
          else
          {
            *a4 = v18;
          }
        }
      }
      free(v7);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2159841DC();
      v12 = 4294967291;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598414C();
    v12 = 4294967292;
  }
  sub_2159805F8((uint64_t)"getSigKeyCertificates", v12, 0, 0, 0, v13, v14, v15);
  return v12;
}

+ (int)confirmSigKey:(unsigned int)a3 status:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v13 = 0;
  v14 = 0;
  v6 = sub_2159801EC();
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2159844AC();
  }
  else
  {
    LODWORD(v13) = 1397966179;
    WORD2(v13) = 21;
    v14 = __PAIR64__(a4, a3);
    v7 = IOConnectCallStructMethod(dword_254DEF394, 0, &v13, 0x10uLL, 0, 0);
    if ((_DWORD)v7)
    {
      v12 = v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598441C();
      v6 = v12;
    }
  }
  sub_2159805F8((uint64_t)"confirmSigKey", v6, 0, 0, 0, v8, v9, v10);
  return v6;
}

+ (int)getBlessedUser:(unsigned int *)a3 keybagUUID:(unsigned __int8)a4[16]
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v13;
  uint64_t inputStruct;
  _BYTE outputStruct[20];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  inputStruct = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  v13 = 0;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598453C();
    goto LABEL_12;
  }
  if (!a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2159845CC();
LABEL_12:
    v11 = 4294967292;
    goto LABEL_7;
  }
  v6 = sub_2159801EC();
  if ((_DWORD)v6)
  {
    v11 = v6;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598477C();
  }
  else
  {
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 24;
    v13 = 20;
    v7 = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 8uLL, outputStruct, &v13);
    if ((_DWORD)v7)
    {
      v11 = v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_2159846EC();
    }
    else if (v13 == 20)
    {
      v11 = 0;
      *a3 = *(_DWORD *)outputStruct;
      *(_OWORD *)a4 = *(_OWORD *)&outputStruct[4];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598465C();
      v11 = 4294967290;
    }
  }
LABEL_7:
  sub_2159805F8((uint64_t)"getBlessedUser", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

@end
