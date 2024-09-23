@implementation ICSDigestPair

+ (id)digestPairWithSerializedData:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  switch(v4)
  {
    case 40:
      v8 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
      v5 = (_QWORD *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 20);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v5[1];
      v5[1] = v9;

      v11 = (void *)MEMORY[0x1E0C99D50];
      v12 = v8 + 20;
      goto LABEL_9;
    case 21:
      v13 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
      if (*v13)
        break;
      v14 = v13;
      v5 = (_QWORD *)objc_opt_new();
      v11 = (void *)MEMORY[0x1E0C99D50];
      v12 = (uint64_t)(v14 + 1);
LABEL_9:
      objc_msgSend(v11, "dataWithBytes:length:", v12, 20);
      v15 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v5[2];
      v5[2] = v15;
      goto LABEL_10;
    case 20:
      v5 = (_QWORD *)objc_opt_new();
      v6 = v3;
      v7 = (void *)v5[1];
      v5[1] = v6;
LABEL_10:

      goto LABEL_11;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (id)serializedData
{
  NSData *unprocessedDigest;
  NSData *v4;
  void *v5;
  uint64_t v7;

  unprocessedDigest = self->_unprocessedDigest;
  if (!unprocessedDigest && !self->_processedDigest
    || -[NSData length](unprocessedDigest, "length") && -[NSData length](self->_unprocessedDigest, "length") != 20
    || -[NSData length](self->_processedDigest, "length") && -[NSData length](self->_processedDigest, "length") != 20)
  {
    return 0;
  }
  v4 = self->_unprocessedDigest;
  if (!self->_processedDigest)
    return v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", self->_unprocessedDigest);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v5, "appendBytes:length:", &v7, 1);
  }
  objc_msgSend(v5, "appendData:", self->_processedDigest);
  return v5;
}

- (NSData)unprocessedDigest
{
  return self->_unprocessedDigest;
}

- (void)setUnprocessedDigest:(id)a3
{
  objc_storeStrong((id *)&self->_unprocessedDigest, a3);
}

- (NSData)processedDigest
{
  return self->_processedDigest;
}

- (void)setProcessedDigest:(id)a3
{
  objc_storeStrong((id *)&self->_processedDigest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedDigest, 0);
  objc_storeStrong((id *)&self->_unprocessedDigest, 0);
}

@end
