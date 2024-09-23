@implementation MSUiBootHeaderV2

- (MSUiBootHeaderV2)initWithIOServiceWriter:(id)a3
{
  MSUiBootHeaderV2 *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSUiBootHeaderV2;
  v3 = -[MSUiBootHeader initWithIOServiceWriter:](&v5, "initWithIOServiceWriter:", a3);
  if (v3)
  {
    v3->_headerHash = (char *)calloc(0x20uLL, 1uLL);
    v3->_headerReserved = (char *)calloc(0x10uLL, 1uLL);
    v3->_headerSignature = 1;
  }
  return v3;
}

- (void)setHeaderHash:(char *)a3
{
  char *headerHash;
  __int128 v4;

  headerHash = self->_headerHash;
  v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)headerHash = *(_OWORD *)a3;
  *((_OWORD *)headerHash + 1) = v4;
}

- (void)setHeaderReserved:(char *)a3
{
  *(_OWORD *)self->_headerReserved = *(_OWORD *)a3;
}

- (id)packStructure
{
  char *headerHash;
  __int128 v4;
  _DWORD v6[4];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v6[0] = 1095128392;
  v6[1] = -[MSUiBootHeaderV2 headerVersion](self, "headerVersion");
  v6[2] = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  v6[3] = -[MSUiBootHeader imageAddress](self, "imageAddress");
  headerHash = self->_headerHash;
  v4 = *((_OWORD *)headerHash + 1);
  v8 = *(_OWORD *)headerHash;
  v9 = v4;
  v7 = *(_OWORD *)self->_headerReserved;
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, 64);
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];

  v3 = *(_QWORD *)&a3;
  memset(v10, 0, sizeof(v10));
  v8 = 0u;
  v9 = 0u;
  v5 = -[IOServiceWriter readDataAtOffset:ofLength:](-[MSUiBootHeader serviceWriter](self, "serviceWriter"), "readDataAtOffset:ofLength:", *(_QWORD *)&a3, 64);
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    objc_msgSend(v5, "getBytes:length:", &v8, 64);
    -[MSUiBootHeaderV2 setHeaderVersion:](self, "setHeaderVersion:", DWORD1(v8));
    -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", DWORD2(v8));
    -[MSUiBootHeader setImageAddress:](self, "setImageAddress:", HIDWORD(v8));
    -[MSUiBootHeaderV2 setHeaderSignature:](self, "setHeaderSignature:", v8);
    -[MSUiBootHeaderV2 setHeaderHash:](self, "setHeaderHash:", v10);
    -[MSUiBootHeaderV2 setHeaderReserved:](self, "setHeaderReserved:", &v9);
    -[MSUiBootHeader setStartLocation:](self, "setStartLocation:", v3);
  }
  return v6 != 0;
}

- (unsigned)secondaryPayloadOffset
{
  return *(_DWORD *)self->_headerReserved;
}

- (void)setSecondaryPayloadOffset:(unsigned int)a3
{
  *(_DWORD *)self->_headerReserved = a3;
}

- (void)setAsFirstGeneration
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeaderV2;
  -[MSUiBootHeaderV1 setAsFirstGeneration](&v3, "setAsFirstGeneration");
  -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", 1);
}

- (unsigned)length
{
  return 64;
}

- (void)invalidate
{
  objc_super v3;

  -[MSUiBootHeaderV2 setHeaderSignature:](self, "setHeaderSignature:", 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeaderV2;
  -[MSUiBootHeaderV1 invalidate](&v3, "invalidate");
}

- (BOOL)isValid
{
  unsigned __int8 v3;

  v3 = -[MSUiBootHeaderV2 validHeaderSignature](self, "validHeaderSignature");
  return -[MSUiBootHeaderV2 validHash](self, "validHash") & v3;
}

- (BOOL)validHeaderSignature
{
  return -[MSUiBootHeaderV2 headerSignature](self, "headerSignature") == 1095128392;
}

- (void)makeValid
{
  -[MSUiBootHeaderV2 setHeaderSignature:](self, "setHeaderSignature:", 1095128392);
  -[MSUiBootHeaderV2 setHeaderVersion:](self, "setHeaderVersion:", 1);
  -[MSUiBootHeaderV2 setHeaderHash:](self, "setHeaderHash:", objc_msgSend(-[MSUiBootHeaderV2 computeHash](self, "computeHash"), "bytes"));
}

- (BOOL)validHash
{
  _QWORD *v3;

  v3 = objc_msgSend(-[MSUiBootHeaderV2 computeHash](self, "computeHash"), "bytes");
  return *v3 == *(_QWORD *)-[MSUiBootHeaderV2 headerHash](self, "headerHash");
}

- (id)computeHash
{
  return -[MSUiBootHeaderV2 _hashDataWithNativeHashMethod:](self, "_hashDataWithNativeHashMethod:", objc_msgSend(-[MSUiBootHeaderV2 packStructure](self, "packStructure"), "subdataWithRange:", 0, 32));
}

- (id)_hashDataWithNativeHashMethod:(id)a3
{
  uint64_t v5;

  v5 = MGCopyAnswer(CFSTR("Image4CryptoHashMethod"), 0);
  return -[MSUiBootHeaderV2 _hashData:withMethod:](self, "_hashData:withMethod:", a3, v5);
}

- (id)_hashData:(id)a3 withMethod:(id)a4
{
  CC_LONG v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSData *v15;

  v6 = objc_msgSend(a3, "length");
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("sha1")))
  {
    v7 = 20;
    v8 = (unsigned __int8 *)calloc(0x14uLL, 1uLL);
    CC_SHA1(objc_msgSend(a3, "bytes"), v6, v8);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("sha2-384")))
  {
    v7 = 48;
    v8 = (unsigned __int8 *)calloc(0x30uLL, 1uLL);
    CC_SHA384(objc_msgSend(a3, "bytes"), v6, v8);
  }
  else
  {
    iBU_LOG_real((uint64_t)CFSTR("Unknown hash digest type: %@"), "-[MSUiBootHeaderV2 _hashData:withMethod:]", v9, v10, v11, v12, v13, v14, (uint64_t)a4);
    v8 = 0;
    v7 = 0;
  }
  v15 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, v7);
  free(v8);
  return v15;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Generation: 0x%08x. Version: 0x%08x. HeaderStart: 0x%08x. PayloadAddress: 0x%08x. SecondaryOffset: 0x%08x"), -[MSUiBootHeader headerGeneration](self, "headerGeneration"), -[MSUiBootHeaderV2 headerVersion](self, "headerVersion"), -[MSUiBootHeader startLocation](self, "startLocation"), -[MSUiBootHeader imageAddress](self, "imageAddress"), -[MSUiBootHeaderV2 secondaryPayloadOffset](self, "secondaryPayloadOffset"));
}

- (void)dealloc
{
  objc_super v3;

  free(self->_headerHash);
  free(self->_headerReserved);
  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeaderV2;
  -[MSUiBootHeader dealloc](&v3, "dealloc");
}

- (unsigned)headerSignature
{
  return *(&self->super._valid + 1);
}

- (void)setHeaderSignature:(unsigned int)a3
{
  *(&self->super._valid + 1) = a3;
}

- (char)headerHash
{
  return self->_headerHash;
}

- (unsigned)headerVersion
{
  return self->_headerSignature;
}

- (void)setHeaderVersion:(unsigned int)a3
{
  self->_headerSignature = a3;
}

- (char)headerReserved
{
  return self->_headerReserved;
}

@end
