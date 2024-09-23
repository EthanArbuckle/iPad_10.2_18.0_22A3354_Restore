@implementation CNVCardData

+ (BOOL)isJPEGData:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  return v5 >= 4 && *v4 == 255 && v4[1] == 216 && v4[2] == 255 && (char)v4[3] < 0;
}

+ (id)stringFromUTF7Data:(id)a3
{
  id v3;
  char *v4;
  char *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  int v10;
  BOOL v12;
  void *v13;
  char v15;
  __int16 v16;

  v3 = a3;
  v16 = 0;
  v4 = (char *)objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = (char *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v10 = *v5++;
      v9 = v10;
      v15 = v10;
      if ((v7 & 1) == 0)
        break;
      v12 = (v9 - 48) >= 0xA && (v9 - 64) >= 0x1Bu && (v9 - 97) >= 0x1Au;
      if (v12 && ((v9 - 43) & 0xFB) != 0)
      {
        objc_msgSend(v8, "_cn_decodeBase64");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "appendData:", v13);
          if (v8)
          {

            v8 = 0;
          }
        }
        if (v15 != 45)
        {
          v16 = v15;
          objc_msgSend(v6, "appendBytes:length:", &v16, 2);
        }

        goto LABEL_26;
      }
      if (!v8)
        goto LABEL_24;
      v7 = 1;
      objc_msgSend(v8, "appendBytes:length:", &v15, 1);
LABEL_27:
      if (!--v4)
      {
        v4 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 10);

        goto LABEL_29;
      }
    }
    if (v9 != 43)
    {
      v16 = v9;
      objc_msgSend(v6, "appendBytes:length:", &v16, 2);
LABEL_26:
      v7 = 0;
      goto LABEL_27;
    }
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:
    v7 = 1;
    goto LABEL_27;
  }
LABEL_29:

  return v4;
}

@end
