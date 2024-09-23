@implementation BitVector

- (BitVector)initWithNumberOfBits:(unint64_t)a3
{
  char *v4;
  BitVector *v5;
  uint64_t v6;
  NSData *bvData;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BitVector;
  v4 = -[BitVector init](&v9, sel_init);
  v5 = (BitVector *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = xmmword_21184B3E0;
    *((_QWORD *)v4 + 4) = a3;
    *((_QWORD *)v4 + 5) = vcvtps_u32_f32((float)a3 * 0.125);
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
    v6 = objc_claimAutoreleasedReturnValue();
    bvData = v5->_bvData;
    v5->_bvData = (NSData *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numBits %lu, dataLen %lu"), self->_numberOfBits, -[NSData length](self->_bvData, "length"));
}

- (void)loadData:(id)a3
{
  NSData *v4;
  NSData *bvData;

  v4 = (NSData *)objc_msgSend(a3, "mutableCopy");
  bvData = self->_bvData;
  self->_bvData = v4;

}

- (void)setAtIndex:(unint64_t)a3
{
  _BYTE *v5;

  v5 = -[NSData bytes](self->_bvData, "bytes");
  v5[a3 >> self->_bitShift] |= 1 << (a3 % self->_bitsPerBlock);
}

- (BOOL)testAtIndex:(unint64_t)a3
{
  return (*(unsigned __int8 *)(-[NSData bytes](self->_bvData, "bytes") + (a3 >> self->_bitShift)) >> (a3 % self->_bitsPerBlock)) & 1;
}

- (int64_t)numberOfBits
{
  return self->_numberOfBits;
}

- (unint64_t)numberOfBytes
{
  return self->_numberOfBytes;
}

- (NSData)bvData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bvData, 0);
}

@end
