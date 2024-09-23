@implementation STStorageSpace

- (STStorageSpace)initWithTotal:(int64_t)a3 free:(int64_t)a4 purgeable:(int64_t)a5
{
  STStorageSpace *result;
  int64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STStorageSpace;
  result = -[STStorageSpace init](&v13, sel_init);
  if (result)
  {
    result->_totalBytes = a3;
    result->_freeBytes = a4;
    v9 = a5 + a4;
    result->_purgeableBytes = a5;
    result->_usedBytes = a3 - (a5 + a4);
    result->_availableBytes = a5 + a4;
    v10 = 3000000000;
    if ((unint64_t)a3 < 0x773594001)
      v10 = 2000000000;
    if (a3 < 0x3B9ACA001)
      v10 = 1000000000;
    v11 = v9 < v10;
    result->_isLowSpace = v11;
    v12 = v9 < 500000000 && v11;
    result->_isVeryLowSpace = v12;
  }
  return result;
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (int64_t)freeBytes
{
  return self->_freeBytes;
}

- (int64_t)purgeableBytes
{
  return self->_purgeableBytes;
}

- (int64_t)usedBytes
{
  return self->_usedBytes;
}

- (int64_t)availableBytes
{
  return self->_availableBytes;
}

- (BOOL)isLowSpace
{
  return self->_isLowSpace;
}

- (BOOL)isVeryLowSpace
{
  return self->_isVeryLowSpace;
}

@end
