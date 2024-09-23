@implementation TSUEncodedBlockInfoInternal

- (TSUEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3
{
  TSUEncodedBlockInfoInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUEncodedBlockInfoInternal;
  result = -[TSUEncodedBlockInfoInternal init](&v5, sel_init);
  if (result)
    result->_encodedLength = a3;
  return result;
}

- (unint64_t)decodedLength
{
  return self->_encodedLength;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  BOOL v10;

  TSUProtocolCast(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&unk_255B11138);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = TSUEncodedBlockInfoAreEqual(self, v9);
  else
    v10 = 0;

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[TSUEncodedBlockInfoInternal encodedLength](self, "encodedLength");
  return -[TSUEncodedBlockInfoInternal decodedLength](self, "decodedLength") ^ v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[EncodedLength=%zu; DecodedLength=%zu]"),
                       -[TSUEncodedBlockInfoInternal encodedLength](self, "encodedLength"),
                       -[TSUEncodedBlockInfoInternal decodedLength](self, "decodedLength"));
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

@end
