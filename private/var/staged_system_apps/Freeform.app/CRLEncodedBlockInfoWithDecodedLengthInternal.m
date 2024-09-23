@implementation CRLEncodedBlockInfoWithDecodedLengthInternal

- (CRLEncodedBlockInfoWithDecodedLengthInternal)initWithEncodedLength:(unint64_t)a3 decodedLength:(unint64_t)a4
{
  CRLEncodedBlockInfoWithDecodedLengthInternal *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLEncodedBlockInfoWithDecodedLengthInternal;
  result = -[CRLEncodedBlockInfoInternal initWithEncodedLength:](&v6, "initWithEncodedLength:", a3);
  if (result)
    result->_decodedLength = a4;
  return result;
}

- (unint64_t)decodedLength
{
  return self->_decodedLength;
}

@end
