@implementation NSData(VCSEncodings)

- (id)VCSDecodeBase64
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v20;
  BOOL v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char v26;
  int v27;
  char *v28;
  void *v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
    goto LABEL_73;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(v1, "length")) >> 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(v2);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  if (v6 >= 1)
  {
    v30 = v2;
    v7 = 0;
    v8 = 0;
    v9 = v5 + v6;
    while (1)
    {
      v10 = (char *)v5;
      while (2)
      {
        v11 = 0;
        v12 = 0;
        v13 = v10 + 1;
        v14 = 1;
LABEL_6:
        v15 = v14;
        v14 = 0;
        switch(Decode64Table[*(v13 - 1) & 0x7F])
        {
          case -6:
            v16 = v13 + 1;
            if ((unint64_t)(v13 + 1) < v9 && *v13 == 10 && *v16 == 32)
            {
              v20 = v13 + 1;
            }
            else
            {
              if ((unint64_t)(v13 + 2) >= v9 || *v13 != 13 || *v16 != 10 || v13[2] != 32)
              {
                v14 = 0;
                goto LABEL_32;
              }
              v20 = v13 + 2;
            }
            goto LABEL_40;
          case -5:
            LODWORD(v14) = v11 == 0;
            if (v11)
              v17 = v12;
            else
              v17 = v12 + 1;
            if ((unint64_t)(v12 + 1) >= 0xA)
              LODWORD(v14) = 0;
            if ((v15 & 1) != 0)
              v14 = v14;
            else
              v14 = 0;
            if ((v15 & 1) != 0)
              v12 = v17;
            goto LABEL_32;
          case -4:
            if ((v15 & (v11 == 0)) != 0)
              v11 = (unint64_t)(v13 - 1);
            v14 = v15;
            goto LABEL_32;
          case -3:
            v20 = v13 - 1;
            if ((unint64_t)v13 < v9 && *v13 == 10)
              v20 = v13;
            goto LABEL_40;
          case -2:
            v20 = v13 - 1;
LABEL_40:
            v5 = (uint64_t)(v20 + 1);
            v21 = (unint64_t)(v20 + 1) < v9;
            if ((v15 & 1) != 0)
            {
              v33 = v21;
              v22 = v13 - 1;
              if (v11)
                v23 = (char *)v11;
              else
                v23 = v22;
              v24 = &v10[v12];
              if (&v10[v12] == v23)
              {
                v10 = (char *)v5;
                if (!v21)
                  goto LABEL_67;
                continue;
              }
              v31 = v5;
LABEL_55:
              v25 = v23 - v24;
              v32 = v8;
              do
              {
                v26 = *v10++;
                v27 = Decode64Table[v26 & 0x7F];
                if ((v27 & 0x80000000) == 0)
                {
                  v7 = v27 + (v7 << 6);
                  if ((~v8 & 3) == 0)
                  {
                    v34 = BYTE2(v7);
                    objc_msgSend(v3, "appendBytes:length:", &v34, 1);
                    v35 = BYTE1(v7);
                    objc_msgSend(v3, "appendBytes:length:", &v35, 1);
                    v36 = v7;
                    objc_msgSend(v3, "appendBytes:length:", &v36, 1);
                    v7 = 0;
                  }
                }
                ++v8;
                --v25;
              }
              while (v25);
              v8 = v32 - (_DWORD)v24 + (_DWORD)v23;
              v5 = v31;
              if (!v33)
                goto LABEL_67;
            }
            else
            {
              if (!v21)
              {
LABEL_66:
                objc_msgSend(v3, "appendBytes:length:", v10, v9 - (_QWORD)v10, v30);
LABEL_67:
                if ((v8 & 3) == 2)
                {
                  v39 = v7 >> 4;
                  v28 = &v39;
LABEL_71:
                  objc_msgSend(v3, "appendBytes:length:", v28, 1, v30);
                }
                else if ((v8 & 3) == 3)
                {
                  v37 = v7 >> 10;
                  objc_msgSend(v3, "appendBytes:length:", &v37, 1);
                  v38 = v7 >> 2;
                  v28 = &v38;
                  goto LABEL_71;
                }
                v2 = v30;
                goto LABEL_73;
              }
              objc_msgSend(v3, "appendBytes:length:", v10, v5 - (_QWORD)v10);
            }
            break;
          case -1:
            goto LABEL_32;
          default:
            v14 = (v15 & 1) != 0 && (v12 | v11) == 0;
LABEL_32:
            v18 = v13 + 1;
            if ((unint64_t)v13++ < v9)
              goto LABEL_6;
            if ((v14 & 1) == 0)
              goto LABEL_66;
            if (v11)
              v23 = (char *)v11;
            else
              v23 = (char *)v9;
            v24 = &v10[v12];
            if (&v10[v12] == v23)
              goto LABEL_67;
            v33 = 0;
            v31 = (uint64_t)(v18 - 1);
            goto LABEL_55;
        }
        break;
      }
    }
  }
LABEL_73:

  return v3;
}

- (id)VCSConvert8bitBufferToUTF8From:()VCSEncodings
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  NSObject *v12;

  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = objc_retainAutorelease(a1);
  objc_msgSend(v6, "dataWithBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length") - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithData:encoding:", v8, CFStringConvertEncodingToNSStringEncoding(a3));

  if (v9)
  {
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v10, strlen(v10));
  }
  else
  {
    VCSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSData(VCSEncodings) VCSConvert8bitBufferToUTF8From:].cold.1(v12);

    v11 = 0;
  }

  return v11;
}

- (id)VCSDecodeQuotedPrintableForText:()VCSEncodings
{
  void *v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  unint64_t v16;
  unsigned __int8 *v17;
  int v18;
  char v20;
  char v21;
  int v22;
  int v23;
  char v24;

  if (a1)
  {
    v4 = a1;
    v5 = VCSByteBufferWithCapacity(objc_msgSend(a1, "length") / 3uLL);
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    if (v8)
    {
      v9 = 0;
      v10 = (unsigned __int8 *)v7;
      while (1)
      {
        v11 = v8 - 1;
        v13 = *v10++;
        v12 = v13;
        if (v13 != 61)
        {
          if (v12 == 10 && v9 != 0)
            v5[1] -= v9;
          if (v12 == 32)
            ++v9;
          else
            v9 = 0;
          if (v12 == 10)
            v20 = a3;
          else
            v20 = 1;
          if ((v20 & 1) == 0)
            VCSByteBufferAppendByte((uint64_t)v5, 13);
          VCSByteBufferAppendByte((uint64_t)v5, v12);
          goto LABEL_41;
        }
        if (v8 == 1)
          goto LABEL_42;
        v14 = *v10;
        if (v14 == 32 || v14 == 10)
          break;
        if (v11 >= 2)
        {
          v10 = (unsigned __int8 *)(v7 + 3);
          v21 = *(_BYTE *)(v7 + 2);
          v22 = DecodeHexTable[v14 & 0x7F];
          v11 = v8 - 3;
          if (v22 < 0 || (v23 = DecodeHexTable[v21 & 0x7F], v23 < 0))
          {
            VCSByteBufferAppendByte((uint64_t)v5, 61);
            VCSByteBufferAppendByte((uint64_t)v5, v14);
            v24 = v21;
          }
          else
          {
            v24 = v23 + 16 * v22;
          }
          VCSByteBufferAppendByte((uint64_t)v5, v24);
LABEL_40:
          v9 = 0;
          goto LABEL_41;
        }
        v9 = 0;
        v11 = 1;
LABEL_41:
        v8 = v11;
        v7 = (uint64_t)v10;
        if (!v11)
          goto LABEL_42;
      }
      v16 = v8 - 2;
      if (v8 >= 2)
      {
        v17 = v10;
        while (1)
        {
          v18 = *v17;
          if (v18 != 32)
            break;
          ++v17;
          --v16;
          if ((unint64_t)v17 >= v7 + v8)
            goto LABEL_40;
        }
        if (v18 == 10)
        {
          v10 = v17 + 1;
          v11 = v16;
        }
        v9 = 0;
        goto LABEL_41;
      }
      goto LABEL_40;
    }
LABEL_42:
    VCSByteBufferData(v5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)VCSConvert8bitBufferToUTF8From:()VCSEncodings .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3456000, log, OS_LOG_TYPE_ERROR, "8bits to UTF-8 failed.", v1, 2u);
}

@end
