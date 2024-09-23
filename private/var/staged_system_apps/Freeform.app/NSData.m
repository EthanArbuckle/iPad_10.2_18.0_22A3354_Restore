@implementation NSData

- (id)crl_compressWithAlgorithm:(int)a3 operation:(int)a4
{
  CRLStreamDataCompression *v5;
  unsigned int v6;
  void *v7;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v12;
  CRLStreamDataCompression *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1002A9DBC;
  v12 = &unk_10124BE28;
  v14 = &v15;
  v5 = -[CRLStreamDataCompression initWithAlgorithm:operation:]([CRLStreamDataCompression alloc], "initWithAlgorithm:operation:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v13 = v5;
  -[NSData enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", &v9);
  if (*((_BYTE *)v16 + 24))
  {
    v6 = -[CRLStreamCompression didFinishProcessing](v5, "didFinishProcessing", v9, v10, v11, v12);
    *((_BYTE *)v16 + 24) = v6;
    if (v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStreamDataCompression outputData](v5, "outputData"));
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
    *((_BYTE *)v16 + 24) = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)crl_encodeToHexidecimalString
{
  char *v3;
  NSUInteger v4;
  unsigned __int8 *v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  unsigned int v9;
  int v10;
  int v11;
  char v12;

  v3 = -[NSData length](self, "length");
  if (v3)
  {
    v4 = -[NSData length](self, "length");
    v5 = -[NSData bytes](objc_retainAutorelease(self), "bytes");
    v6 = 2 * v4;
    v3 = (char *)malloc_type_calloc(2 * v4, 1uLL, 0x100004077774924uLL);
    if (v3)
    {
      if (v4)
      {
        v7 = v3 + 1;
        do
        {
          v9 = *v5++;
          v8 = v9;
          v10 = (v9 >> 4) + 55;
          v11 = (v9 >> 4) | 0x30;
          if (v9 > 0x9F)
            LOBYTE(v11) = v10;
          *(v7 - 1) = v11;
          if ((v8 & 0xFu) <= 9)
            v12 = v8 & 0xF | 0x30;
          else
            v12 = (v8 & 0xF) + 55;
          *v7 = v12;
          v7 += 2;
          --v4;
        }
        while (v4);
      }
      v3 = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v3, v6, 1, 1);
    }
  }
  return v3;
}

+ (id)crl_decodeFromHexidecimalString:(id)a3
{
  id v3;
  unint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned int v11;
  char v12;
  char v13;
  unsigned int v14;
  char v15;
  id v16;

  v3 = a3;
  if (!objc_msgSend(v3, "length") || (objc_msgSend(v3, "length") & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v4 = (unint64_t)objc_msgSend(v3, "length");
    v5 = malloc_type_calloc(2 * v4, 1uLL, 0x100004077774924uLL);
    v6 = v5;
    v7 = v4 >> 1;
    if (v4 >= 2)
    {
      if (v7 <= 1)
        v8 = 1;
      else
        v8 = v4 >> 1;
      v9 = 1;
      v10 = v5;
      do
      {
        v11 = objc_msgSend(v3, "characterAtIndex:", v9 - 1);
        if (v11 <= 0x39)
          v12 = 0;
        else
          v12 = 57;
        v13 = v12 + v11;
        v14 = objc_msgSend(v3, "characterAtIndex:", v9);
        if (v14 <= 0x39)
          v15 = -48;
        else
          v15 = -55;
        *v10++ = v15 + v14 + 16 * v13;
        v9 += 2;
        --v8;
      }
      while (v8);
    }
    v16 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v6, v7, 1);
  }

  return v16;
}

+ (id)crl_dataWithInputStream:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  id i;
  _BYTE v9[1024];

  v4 = a3;
  objc_msgSend(v4, "open");
  v5 = objc_alloc_init((Class)NSMutableData);
  v6 = (uint64_t)objc_msgSend(v4, "read:maxLength:", v9, 1024);
  if (v6 >= 1)
  {
    for (i = (id)v6; (uint64_t)i > 0; i = objc_msgSend(v4, "read:maxLength:", v9, 1024))
      objc_msgSend(v5, "appendBytes:length:", v9, i);
  }

  return v5;
}

- (id)crl_dispatchData
{
  return -[NSData crl_dispatchDataWithApplier:](self, "crl_dispatchDataWithApplier:", 0);
}

- (id)crl_dispatchDataWithApplier:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_global_t global_queue;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100458A84;
  v19 = sub_100458A94;
  v5 = &_dispatch_data_empty;
  v20 = &_dispatch_data_empty;
  global_queue = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100458A9C;
  v11[3] = &unk_10125F5C0;
  v11[4] = self;
  v7 = (id)objc_claimAutoreleasedReturnValue(global_queue);
  v12 = v7;
  v14 = &v15;
  v8 = v4;
  v13 = v8;
  -[NSData enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)crl_dataFromDispatchData:(id)a3
{
  return a3;
}

@end
