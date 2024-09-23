@implementation MSDEnrollPassword

+ (id)sharedInstance
{
  if (qword_1001755A8 != -1)
    dispatch_once(&qword_1001755A8, &stru_10013FC80);
  return (id)qword_1001755A0;
}

- (id)encodeBase64:(char *)a3 ofLength:(unsigned int)a4
{
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  int v14;
  char v15;
  char v16;
  __CFString *v17;

  if (a4)
  {
    v6 = (2 * ((2863311531u * (unint64_t)(a4 + 2)) >> 32)) & 0xFFFFFFFC;
    v7 = malloc_type_malloc((4 * ((a4 + 2) / 3)) | 1, 0x8BCE78CAuLL);
    v8 = v7;
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = a3[v10] << 8;
      v12 = v10 + 1;
      if (v10 + 1 < a4)
        v11 |= a3[v12];
      v13 = (v11 << 8);
      if (v10 + 2 >= a4)
      {
        v15 = 61;
      }
      else
      {
        v14 = a3[v10 + 2];
        v13 = v13 | v14;
        v15 = aAbcdefghijklmn[v14 & 0x3F];
      }
      *((_BYTE *)v7 + v9 + 3) = v15;
      if (v12 >= a4)
        v16 = 61;
      else
        v16 = aAbcdefghijklmn[(v13 >> 6) & 0x3F];
      *((_BYTE *)v7 + v9 + 2) = v16;
      *((_BYTE *)v7 + v9 + 1) = aAbcdefghijklmn[(v13 >> 12) & 0x3F];
      *((_BYTE *)v7 + v9) = aAbcdefghijklmn[(unint64_t)v13 >> 18];
      v10 += 3;
      v9 += 4;
    }
    while (v10 < a4);
    *((_BYTE *)v7 + v6) = 0;
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4));
    free(v8);
  }
  else
  {
    v17 = &stru_100141020;
  }
  return v17;
}

- (id)createPasswordFor:(id)a3 pairingCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unsigned __int8 *v15;
  id v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &unk_100174F58, 216));
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "cStringUsingEncoding:", 4);
  v11 = objc_msgSend(v9, "length");

  objc_msgSend(v8, "appendBytes:length:", v10, v11);
  v12 = objc_retainAutorelease(v6);
  v13 = objc_msgSend(v12, "cStringUsingEncoding:", 4);
  v14 = objc_msgSend(v12, "length");

  objc_msgSend(v8, "appendBytes:length:", v13, v14);
  v15 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x4302BE8DuLL);
  v16 = objc_retainAutorelease(v8);
  CC_SHA1(objc_msgSend(v16, "bytes"), (CC_LONG)objc_msgSend(v16, "length"), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollPassword encodeBase64:ofLength:](self, "encodeBase64:ofLength:", v15, 20));
  free(v15);

  return v17;
}

@end
