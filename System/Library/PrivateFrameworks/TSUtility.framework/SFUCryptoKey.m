@implementation SFUCryptoKey

- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4
{
  uint64_t v4;
  const char *v6;

  if (!a3)
    return 0;
  v4 = *(_QWORD *)&a4;
  v6 = (const char *)objc_msgSend(a3, "UTF8String");
  return -[SFUCryptoKey initAes128KeyFromPassphrase:length:iterationCount:saltData:](self, "initAes128KeyFromPassphrase:length:iterationCount:saltData:", v6, strlen(v6), v4, +[SFUCryptoUtils generateRandomSaltWithLength:](SFUCryptoUtils, "generateRandomSaltWithLength:", 16));
}

- (id)initAes128KeyFromPassphrase:(id)a3 withIterationCountAndSaltDataFromCryptoKey:(id)a4
{
  const char *v6;

  if (!a3)
    return 0;
  v6 = (const char *)objc_msgSend(a3, "UTF8String");
  return -[SFUCryptoKey initAes128KeyFromPassphrase:length:iterationCount:saltData:](self, "initAes128KeyFromPassphrase:length:iterationCount:saltData:", v6, strlen(v6), objc_msgSend(a4, "iterationCount"), objc_msgSend(a4, "saltData"));
}

- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5
{
  return -[SFUCryptoKey initAes128KeyFromPassphrase:length:iterationCount:saltData:](self, "initAes128KeyFromPassphrase:length:iterationCount:saltData:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4 saltData:(id)a5
{
  if (a3)
    return -[SFUCryptoKey initAes128KeyFromPassphrase:length:iterationCount:saltData:](self, "initAes128KeyFromPassphrase:length:iterationCount:saltData:", objc_msgSend(a3, "UTF8String"), strlen((const char *)objc_msgSend(a3, "UTF8String")), *(_QWORD *)&a4, a5);
  else
    return 0;
}

- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5 saltData:(id)a6
{
  SFUCryptoKey *v10;
  SFUCryptoKey *v11;
  NSData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFUCryptoKey;
  v10 = -[SFUCryptoKey init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->mIterationCount = a5;
    v10->mKeyLength = 16;
    v10->mKey = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0xE3DC6D96uLL);
    v11->_passphrase = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, a4, 4);
    v12 = (NSData *)objc_msgSend(a6, "copy");
    v11->mSaltData = v12;
    if ((SFUDeriveAes128Key((uint64_t)a3, a4, v11->mIterationCount, v11->mKey, v11->mKeyLength, (void *)-[NSData bytes](v12, "bytes"), -[NSData length](v11->mSaltData, "length")) & 1) == 0)
    {

      return 0;
    }
  }
  return v11;
}

- (id)initAes128Key:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5
{
  SFUCryptoKey *v8;
  SFUCryptoKey *v9;
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFUCryptoKey;
  v8 = -[SFUCryptoKey init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mIterationCount = a5;
    v8->mKeyLength = 16;
    v10 = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x5DE6D7FuLL);
    v9->mKey = v10;
    memcpy(v10, a3, v9->mKeyLength);
    if (v9->mKeyLength != a4)
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  char *mKey;
  objc_super v4;

  mKey = self->mKey;
  if (mKey)
  {
    free(mKey);
    self->mKey = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SFUCryptoKey;
  -[SFUCryptoKey dealloc](&v4, sel_dealloc);
}

- (int)keyType
{
  return 0;
}

- (unsigned)iterationCount
{
  return self->mIterationCount;
}

- (const)keyData
{
  return self->mKey;
}

- (unint64_t)keyLength
{
  return self->mKeyLength;
}

- (id)saltData
{
  return self->mSaltData;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

@end
