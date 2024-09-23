@implementation TPHashBuilder

- (TPHashBuilder)init
{
  TPHashBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPHashBuilder;
  result = -[TPHashBuilder init](&v3, sel_init);
  if (result)
  {
    result->_algo = -1;
    result->_keyed = 0;
  }
  return result;
}

- (TPHashBuilder)initWithAlgo:(int64_t)a3
{
  TPHashBuilder *v4;

  v4 = -[TPHashBuilder init](self, "init");
  -[TPHashBuilder resetWithAlgo:](v4, "resetWithAlgo:", a3);
  return v4;
}

- (TPHashBuilder)initWithKeyedAlgo:(int64_t)a3 key:(id)a4
{
  id v6;
  TPHashBuilder *v7;
  TPHashBuilder *v8;
  id v9;

  v6 = a4;
  v7 = -[TPHashBuilder init](self, "init");
  v8 = v7;
  v7->_algo = a3;
  if (a3 == 4)
  {
    v9 = objc_retainAutorelease(v6);
    CCHmacInit((CCHmacContext *)&v8->_ctxHMAC, 2u, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    v8->_keyed = 1;
  }
  else
  {
    -[TPHashBuilder throwInvalidAlgo](v7, "throwInvalidAlgo");
  }

  return v8;
}

- (void)resetWithAlgo:(int64_t)a3
{
  self->_algo = a3;
  switch(a3)
  {
    case 0:
      CC_SHA224_Init(&self->_ctxSHA256);
      goto LABEL_7;
    case 1:
      CC_SHA256_Init(&self->_ctxSHA256);
      goto LABEL_7;
    case 2:
      CC_SHA384_Init(&self->_ctxSHA512);
      goto LABEL_7;
    case 3:
      CC_SHA512_Init(&self->_ctxSHA512);
LABEL_7:
      self->_keyed = 0;
      break;
    default:
      -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
      break;
  }
}

- (void)updateWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  -[TPHashBuilder updateWithBytes:len:](self, "updateWithBytes:len:", v5, v6);
}

- (void)updateWithBytes:(const void *)a3 len:(unint64_t)a4
{
  CC_LONG v4;

  v4 = a4;
  switch(-[TPHashBuilder algo](self, "algo"))
  {
    case 0:
      CC_SHA224_Update(&self->_ctxSHA256, a3, v4);
      break;
    case 1:
      CC_SHA256_Update(&self->_ctxSHA256, a3, v4);
      break;
    case 2:
      CC_SHA384_Update(&self->_ctxSHA512, a3, v4);
      break;
    case 3:
      CC_SHA512_Update(&self->_ctxSHA512, a3, v4);
      break;
    case 4:
      CCHmacUpdate((CCHmacContext *)&self->_ctxHMAC, a3, v4);
      break;
    default:
      -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
      break;
  }
}

- (id)finalHash
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0C99DF0]);
  switch(-[TPHashBuilder algo](self, "algo"))
  {
    case 0:
      v3 = objc_retainAutorelease((id)objc_msgSend(v3, "initWithLength:", 28));
      CC_SHA224_Final((unsigned __int8 *)objc_msgSend(v3, "mutableBytes"), &self->_ctxSHA256);
      v4 = CFSTR("SHA224");
      break;
    case 1:
      v3 = objc_retainAutorelease((id)objc_msgSend(v3, "initWithLength:", 32));
      CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v3, "mutableBytes"), &self->_ctxSHA256);
      v4 = CFSTR("SHA256");
      break;
    case 2:
      v3 = objc_retainAutorelease((id)objc_msgSend(v3, "initWithLength:", 48));
      CC_SHA384_Final((unsigned __int8 *)objc_msgSend(v3, "mutableBytes"), &self->_ctxSHA512);
      v4 = CFSTR("SHA384");
      break;
    case 3:
      v3 = objc_retainAutorelease((id)objc_msgSend(v3, "initWithLength:", 64));
      CC_SHA512_Final((unsigned __int8 *)objc_msgSend(v3, "mutableBytes"), &self->_ctxSHA512);
      v4 = CFSTR("SHA512");
      break;
    default:
      -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
      v4 = 0;
      break;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPHashBuilder setAlgo:](self, "setAlgo:", -1);
  return v7;
}

- (id)finalKeyedHash
{
  id v3;

  v3 = objc_alloc(MEMORY[0x1E0C99DF0]);
  if (-[TPHashBuilder algo](self, "algo") == 4)
  {
    v3 = objc_retainAutorelease((id)objc_msgSend(v3, "initWithLength:", 32));
    CCHmacFinal((CCHmacContext *)&self->_ctxHMAC, (void *)objc_msgSend(v3, "mutableBytes"));
  }
  else
  {
    -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
  }
  -[TPHashBuilder setAlgo:](self, "setAlgo:", -1);
  return v3;
}

- (void)throwInvalidAlgo
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("InvalidTPHashAlgo"), CFSTR("Invalid TPHash algorithm"), 0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_exception_throw(v2);
}

- (int64_t)algo
{
  return self->_algo;
}

- (void)setAlgo:(int64_t)a3
{
  self->_algo = a3;
}

- (BOOL)keyed
{
  return self->_keyed;
}

- (void)setKeyed:(BOOL)a3
{
  self->_keyed = a3;
}

- (CC_SHA256state_st)ctxSHA256
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->wbuf[8];
  v4 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->wbuf[10] = v4;
  *(_QWORD *)&retstr->wbuf[14] = *(_QWORD *)&self[1].hash[2];
  v5 = *(_OWORD *)self->wbuf;
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[4];
  *(_OWORD *)&retstr->hash[2] = v5;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[4];
  *(_OWORD *)&retstr->wbuf[2] = v3;
  return self;
}

- (void)setCtxSHA256:(CC_SHA256state_st *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)a3->count;
  v4 = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_ctxSHA256.hash[6] = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctxSHA256.hash[2] = v4;
  *(_OWORD *)self->_ctxSHA256.count = v3;
  v5 = *(_OWORD *)&a3->wbuf[2];
  v6 = *(_OWORD *)&a3->wbuf[6];
  v7 = *(_OWORD *)&a3->wbuf[10];
  *(_QWORD *)&self->_ctxSHA256.wbuf[14] = *(_QWORD *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctxSHA256.wbuf[10] = v7;
  *(_OWORD *)&self->_ctxSHA256.wbuf[6] = v6;
  *(_OWORD *)&self->_ctxSHA256.wbuf[2] = v5;
}

- (CC_SHA512state_st)ctxSHA512
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self[1].wbuf[2];
  *(_OWORD *)&retstr->wbuf[10] = *(_OWORD *)self[1].wbuf;
  *(_OWORD *)&retstr->wbuf[12] = v3;
  *(_OWORD *)&retstr->wbuf[14] = *(_OWORD *)&self[1].wbuf[4];
  v4 = *(_OWORD *)&self[1].hash[2];
  *(_OWORD *)&retstr->wbuf[2] = *(_OWORD *)self[1].hash;
  *(_OWORD *)&retstr->wbuf[4] = v4;
  v5 = *(_OWORD *)&self[1].hash[6];
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self[1].hash[4];
  *(_OWORD *)&retstr->wbuf[8] = v5;
  v6 = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->hash[2] = *(_OWORD *)&self->wbuf[10];
  *(_OWORD *)&retstr->hash[4] = v6;
  v7 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[14];
  *(_OWORD *)retstr->wbuf = v7;
  v8 = *(_OWORD *)&self->wbuf[8];
  *(_OWORD *)retstr->count = *(_OWORD *)&self->wbuf[6];
  *(_OWORD *)retstr->hash = v8;
  return self;
}

- (void)setCtxSHA512:(CC_SHA512state_st *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *(_OWORD *)self->_ctxSHA512.count = *(_OWORD *)a3->count;
  v3 = *(_OWORD *)a3->hash;
  v4 = *(_OWORD *)&a3->hash[2];
  v5 = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctxSHA512.hash[4] = *(_OWORD *)&a3->hash[4];
  *(_OWORD *)&self->_ctxSHA512.hash[6] = v5;
  *(_OWORD *)self->_ctxSHA512.hash = v3;
  *(_OWORD *)&self->_ctxSHA512.hash[2] = v4;
  v6 = *(_OWORD *)a3->wbuf;
  v7 = *(_OWORD *)&a3->wbuf[2];
  v8 = *(_OWORD *)&a3->wbuf[6];
  *(_OWORD *)&self->_ctxSHA512.wbuf[4] = *(_OWORD *)&a3->wbuf[4];
  *(_OWORD *)&self->_ctxSHA512.wbuf[6] = v8;
  *(_OWORD *)self->_ctxSHA512.wbuf = v6;
  *(_OWORD *)&self->_ctxSHA512.wbuf[2] = v7;
  v9 = *(_OWORD *)&a3->wbuf[8];
  v10 = *(_OWORD *)&a3->wbuf[10];
  v11 = *(_OWORD *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctxSHA512.wbuf[12] = *(_OWORD *)&a3->wbuf[12];
  *(_OWORD *)&self->_ctxSHA512.wbuf[14] = v11;
  *(_OWORD *)&self->_ctxSHA512.wbuf[8] = v9;
  *(_OWORD *)&self->_ctxSHA512.wbuf[10] = v10;
}

- ($1DC23E134A5F43A06C89BE309303CDCF)ctxHMAC
{
  return ($1DC23E134A5F43A06C89BE309303CDCF *)memcpy(retstr, &self->_ctxHMAC, sizeof($1DC23E134A5F43A06C89BE309303CDCF));
}

- (void)setCtxHMAC:(id *)a3
{
  memcpy(&self->_ctxHMAC, a3, sizeof(self->_ctxHMAC));
}

+ (int64_t)algoOfHash:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("SHA224:")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("SHA256:")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("SHA384:")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("SHA512:")))
  {
    v4 = 3;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (id)hashWithAlgo:(int64_t)a3 ofData:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_retainAutorelease(a4);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  return +[TPHashBuilder hashWithAlgo:ofBytes:len:](TPHashBuilder, "hashWithAlgo:ofBytes:len:", a3, v6, v7);
}

+ (id)hashWithAlgo:(int64_t)a3 ofBytes:(const void *)a4 len:(unint64_t)a5
{
  TPHashBuilder *v7;
  void *v8;

  v7 = -[TPHashBuilder initWithAlgo:]([TPHashBuilder alloc], "initWithAlgo:", a3);
  -[TPHashBuilder updateWithBytes:len:](v7, "updateWithBytes:len:", a4, a5);
  -[TPHashBuilder finalHash](v7, "finalHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)keyedHashWithAlgo:(int64_t)a3 key:(id)a4 data:(id)a5
{
  id v7;
  id v8;
  TPHashBuilder *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = -[TPHashBuilder initWithKeyedAlgo:key:]([TPHashBuilder alloc], "initWithKeyedAlgo:key:", a3, v8);

  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v7);
  -[TPHashBuilder finalKeyedHash](v9, "finalKeyedHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
