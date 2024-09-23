@implementation SiriCoreAceSerialization

+ (id)dataForStreamHeaderWithCompressionType:(unsigned __int8)a3
{
  __int16 buffer;
  char v5;
  unsigned __int8 v6;

  v5 = -18;
  buffer = -13142;
  v6 = a3;
  return dispatch_data_create(&buffer, 4uLL, 0, 0);
}

+ (id)dataForObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  char *v8;
  id v9;
  dispatch_data_t v10;
  uint64_t v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "_serializedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v5, "dictionary"), (v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v13 = (void *)v12,
        objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v12, 200, 0, a4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v6))
  {
    v7 = objc_msgSend(v6, "length");
    v8 = (char *)malloc_type_malloc(v7 + 5, 0xBD97235BuLL);
    *v8 = 2;
    *(_DWORD *)(v8 + 1) = bswap32(v7);
    v9 = objc_retainAutorelease(v6);
    memmove(v8 + 5, (const void *)objc_msgSend(v9, "bytes"), v7);
    v10 = dispatch_data_create(v8, v7 + 5, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);

  }
  else if (a4 && !*a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), 5, 0);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)dataForPing:(unsigned int)a3
{
  char buffer;
  unsigned int v5;

  buffer = 3;
  v5 = bswap32(a3);
  return dispatch_data_create(&buffer, 5uLL, 0, 0);
}

+ (id)dataForPong:(unsigned int)a3
{
  char buffer;
  unsigned int v5;

  buffer = 4;
  v5 = bswap32(a3);
  return dispatch_data_create(&buffer, 5uLL, 0, 0);
}

+ (id)dataForNop
{
  int buffer;
  char v4;

  v4 = 0;
  buffer = 0;
  return dispatch_data_create(&buffer, 5uLL, 0, 0);
}

+ (id)dataForStreamEnd
{
  int buffer;
  char v4;

  v4 = 0;
  buffer = 255;
  return dispatch_data_create(&buffer, 5uLL, 0, 0);
}

+ (id)dataForSpeechPacket:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  const char *v9;
  size_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  dispatch_data_t v18;
  unint64_t v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  signed int v27;
  unsigned int v28;
  char *v29;
  _BYTE *v30;
  _WORD *v31;
  char *v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void *v43;
  SEL v44;
  id v45;
  id *size;
  uint64_t sizea;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "refId");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  if (v9)
  {
    v10 = strlen(v9);
    v11 = v10;
    if (v10 > 0x7F)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), 6, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v11 = 0;
LABEL_9:
        v15 = 0;
        goto LABEL_11;
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  v14 = objc_msgSend(v7, "packetNumber");
  v15 = v14;
  if (v14 != (__int16)v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), 6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v13 = 0;
LABEL_11:
  objc_msgSend(v7, "packets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
    goto LABEL_12;
  v20 = objc_msgSend(v16, "count");
  v48 = v17;
  if (!(v20 >> 15))
  {
    LODWORD(v13) = v20;
    v44 = a2;
    v45 = a1;
    size = a4;
    v21 = 2 * v20;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v54 != v25)
            objc_enumerationMutation(v22);
          v21 += objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "length", v44, v45);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v24);
    }

    a4 = size;
    v17 = v48;
LABEL_26:
    v27 = v21 + v11 + 5;
    v28 = bswap32(v27);
    sizea = v27 + 5;
    v29 = (char *)malloc_type_malloc(sizea, 0x7046D227uLL);
    v30 = v29;
    *v29 = 7;
    *(_DWORD *)(v29 + 1) = v28;
    v29[5] = v11;
    v31 = v29 + 6;
    if ((char)v11 >= 1)
    {
      memmove(v29 + 6, v9, v11);
      v31 = (_WORD *)((char *)v31 + v11);
    }
    *v31 = bswap32(v15) >> 16;
    v31[1] = bswap32(v13) >> 16;
    v32 = (char *)(v31 + 2);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v33 = v17;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v50;
      for (j = *(_QWORD *)v50; ; j = *(_QWORD *)v50)
      {
        if (j != v37)
          objc_enumerationMutation(v33);
        v39 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v36);
        v40 = objc_msgSend(v39, "length", v44, v45);
        *(_WORD *)v32 = bswap32(v40) >> 16;
        v41 = v32 + 2;
        memmove(v41, (const void *)objc_msgSend(objc_retainAutorelease(v39), "bytes"), v40);
        v32 = &v41[v40];
        if (++v36 >= v35)
        {
          v42 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (!v42)
          {
            v17 = v48;
            break;
          }
          v35 = v42;
          v36 = 0;
        }
      }
    }

    if (v32 - v30 != sizea)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", v44, v45, CFSTR("SiriCoreAceSerialization.m"), 229, CFSTR("Error serializing SiriCoreSpeechPacket"));

    }
    v18 = dispatch_data_create(v30, sizea, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
    v13 = 0;
    if (a4)
      goto LABEL_13;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), 6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v44 = a2;
    v45 = a1;
    v21 = 0;
    goto LABEL_26;
  }
LABEL_12:
  v18 = 0;
  if (a4)
LABEL_13:
    *a4 = objc_retainAutorelease(v13);
LABEL_14:

  return v18;
}

+ (BOOL)tryParsingAceHeaderData:(id)a3 compressionType:(unsigned __int8 *)a4 bytesRead:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  unsigned __int8 v18;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  _BYTE v24[10];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v20 = 0;
  if ((unint64_t)objc_msgSend(v10, "length") < 4)
  {
    v14 = (void *)*MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      *(_DWORD *)buf = 136315650;
      v22 = "+[SiriCoreAceSerialization tryParsingAceHeaderData:compressionType:bytesRead:error:]";
      v23 = 2048;
      *(_QWORD *)v24 = 4;
      *(_WORD *)&v24[8] = 2048;
      v25 = objc_msgSend(v10, "length");
      _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_INFO, "%s Ace Header needs %lu bytes, but have %lu", buf, 0x20u);

    }
    objc_msgSend(a1, "_insufficientDataErrorForBytesNeeded:available:", 4, objc_msgSend(v10, "length"));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v16 = (void *)v13;
    v17 = 0;
    v18 = 1;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(v10, "getBytes:length:", &v20, 4);
  if ((unsigned __int16)v20 != 52394 || BYTE2(v20) != 238)
  {
    v12 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "+[SiriCoreAceSerialization tryParsingAceHeaderData:compressionType:bytesRead:error:]";
      v23 = 1024;
      *(_DWORD *)v24 = v20;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = BYTE1(v20);
      LOWORD(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 2) = BYTE2(v20);
      _os_log_error_impl(&dword_211AB2000, v12, OS_LOG_TYPE_ERROR, "%s Got invalid header for connection! %x %x %x", buf, 0x1Eu);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), 2, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v16 = 0;
  v18 = HIBYTE(v20);
  v17 = 4;
  if (a4)
LABEL_13:
    *a4 = v18;
LABEL_14:
  if (a5)
    *a5 = v17;
  if (a6)
    *a6 = objc_retainAutorelease(v16);

  return v16 != 0;
}

+ (id)_tryParsingPlistPacketBytes:(const void *)a3 length:(unint64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3, a4);
  objc_msgSend(MEMORY[0x24BE81080], "aceObjectWithPlistData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_tryParsingSpeechPacketBytes:(const void *)a3 length:(unint64_t)a4
{
  size_t v4;
  unint64_t v5;
  SiriCoreSpeechPacket *v6;
  char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  char *v11;
  int v12;
  id v13;
  int v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  unsigned int v18;
  size_t v19;
  char *v20;
  id v21;
  unsigned int v23;

  if (a4 && (v4 = *(unsigned __int8 *)a3, v5 = a4 - 1 - v4, a4 - 1 >= v4))
  {
    v7 = (char *)a3 + 1;
    v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v4));
    memmove((void *)objc_msgSend(v8, "mutableBytes"), v7, v4);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    v10 = (void *)v9;
    v6 = 0;
    if (v5 >= 2 && v9)
    {
      if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v6 = 0;
      }
      else
      {
        v11 = &v7[v4];
        v23 = *(unsigned __int16 *)&v7[v4];
        v12 = (int)bswap32(*(unsigned __int16 *)&v7[v4 + 2]) >> 16;
        v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (v12 < 1)
        {
LABEL_13:
          v6 = objc_alloc_init(SiriCoreSpeechPacket);
          -[SiriCoreSpeechPacket setRefId:](v6, "setRefId:", v10);
          -[SiriCoreSpeechPacket setPacketNumber:](v6, "setPacketNumber:", (__int16)(bswap32(v23) >> 16));
          -[SiriCoreSpeechPacket setPackets:](v6, "setPackets:", v13);
        }
        else
        {
          LOWORD(v14) = 0;
          v15 = v5 - 4;
          v16 = v11 + 4;
          while (1)
          {
            v17 = v15 - 2;
            if (v15 < 2)
              break;
            v18 = bswap32(*(unsigned __int16 *)v16) >> 16;
            if (v17 < (__int16)v18)
              break;
            v19 = (__int16)v18;
            v20 = v16 + 2;
            v21 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (__int16)v18));
            memmove((void *)objc_msgSend(v21, "mutableBytes"), v20, v19);
            v16 = &v20[v19];
            v15 = v17 - v19;
            objc_msgSend(v13, "addObject:", v21);

            v14 = (__int16)(v14 + 1);
            if (v14 >= v12)
              goto LABEL_13;
          }
          v6 = 0;
        }

      }
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)tryParsingPacketWithBytes:(const void *)a3 length:(unint64_t)a4 rawPacket:(id *)a5 object:(id *)a6 bytesRead:(unint64_t *)a7 error:(id *)a8
{
  unint64_t v13;
  int v14;
  unsigned __int8 v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unsigned int v21;
  char *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 || (v13 = a4 - 5, a4 < 5))
  {
    v17 = 5;
    v13 = a4;
LABEL_7:
    objc_msgSend(a1, "_insufficientDataErrorForBytesNeeded:available:", v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = 0;
    goto LABEL_8;
  }
  v14 = *(unsigned __int8 *)a3;
  v15 = 0;
  switch(*(_BYTE *)a3)
  {
    case 0:
      v15 = 1;
      goto LABEL_26;
    case 1:
    case 2:
    case 7:
      v16 = bswap32(*(_DWORD *)((char *)a3 + 1));
      if (v13 < v16)
      {
        v17 = v16;
        goto LABEL_7;
      }
      v23 = (char *)a3 + 5;
      v24 = (char *)a3 + 5;
      if (v14 == 7)
      {
        +[SiriCoreAceSerialization _tryParsingSpeechPacketBytes:length:](SiriCoreAceSerialization, "_tryParsingSpeechPacketBytes:length:", v24, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v23, v16);
          v32 = CFSTR("SiriCoreAceSerializationErrorUserInfoPlist");
          v33[0] = v25;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x24BDD1540];
          v28 = 6;
          goto LABEL_31;
        }
LABEL_29:
        v29 = v20;
        v18 = 0;
        v19 = v16 + 5;
        goto LABEL_32;
      }
      +[SiriCoreAceSerialization _tryParsingPlistPacketBytes:length:](SiriCoreAceSerialization, "_tryParsingPlistPacketBytes:length:", v24, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_29;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v23, v16);
      v30 = CFSTR("SiriCoreAceSerializationErrorUserInfoPlist");
      v31 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = 4;
LABEL_31:
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), v28, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
LABEL_32:

LABEL_8:
      v21 = 0;
      v15 = 0;
      if (a5)
      {
LABEL_9:
        a5->var0 = v15;
        *(_WORD *)(&a5->var0 + 1) = 0;
        *(&a5->var0 + 3) = 0;
        a5->var1 = v21;
      }
LABEL_10:
      if (a6)
        *a6 = objc_retainAutorelease(v20);
      if (a7)
        *a7 = v19;
      if (a8)
        *a8 = objc_retainAutorelease(v18);

      return v18 != 0;
    case 3:
      v15 = 2;
      goto LABEL_26;
    case 4:
      v15 = 3;
      goto LABEL_26;
    case 5:
    case 6:
      goto LABEL_26;
    default:
      if (v14 == 255)
        v15 = 4;
      else
        v15 = 0;
LABEL_26:
      v18 = 0;
      v20 = 0;
      v21 = bswap32(*(_DWORD *)((char *)a3 + 1));
      v19 = 5;
      if (!a5)
        goto LABEL_10;
      goto LABEL_9;
  }
}

+ (id)_insufficientDataErrorForBytesNeeded:(unint64_t)a3 available:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("SiriCoreAceSerializationErrorUserInfoBytesNeeded");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("SiriCoreAceSerializationErrorUserInfoBytesAvailable");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreAceSerializationErrorDomain"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
