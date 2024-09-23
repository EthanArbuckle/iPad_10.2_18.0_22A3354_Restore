@implementation CRLEncodedBlockInfoInternal

- (CRLEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3
{
  CRLEncodedBlockInfoInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLEncodedBlockInfoInternal;
  result = -[CRLEncodedBlockInfoInternal init](&v5, "init");
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
  id v9;
  void *v10;
  BOOL v11;

  v9 = sub_100221DDC(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLEncodedBlockInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
    v11 = sub_1001FD938(self, v10);
  else
    v11 = 0;

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CRLEncodedBlockInfoInternal encodedLength](self, "encodedLength");
  return -[CRLEncodedBlockInfoInternal decodedLength](self, "decodedLength") ^ v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[EncodedLength=%zu; DecodedLength=%zu]"),
           -[CRLEncodedBlockInfoInternal encodedLength](self, "encodedLength"),
           -[CRLEncodedBlockInfoInternal decodedLength](self, "decodedLength"));
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

@end
