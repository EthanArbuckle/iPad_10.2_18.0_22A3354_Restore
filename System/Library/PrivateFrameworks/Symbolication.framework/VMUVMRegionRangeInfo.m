@implementation VMUVMRegionRangeInfo

- (VMUVMRegionRangeInfo)init
{
  VMUVMRegionRangeInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUVMRegionRangeInfo;
  result = -[VMUVMRegionRangeInfo init](&v3, sel_init);
  if (result)
    result->stackIdentifier = -1;
  return result;
}

- (_VMURange)range
{
  unint64_t size;
  unint64_t address;
  _VMURange result;

  size = self->size;
  address = self->address;
  result.length = size;
  result.location = address;
  return result;
}

- (unint64_t)address
{
  return self->address;
}

- (void)setAddress:(unint64_t)a3
{
  self->address = a3;
}

- (unint64_t)size
{
  return self->size;
}

- (void)setSize:(unint64_t)a3
{
  self->size = a3;
}

- (unint64_t)stackIdentifier
{
  return self->stackIdentifier;
}

- (void)setStackIdentifier:(unint64_t)a3
{
  self->stackIdentifier = a3;
}

- (unsigned)userTag
{
  return self->userTag;
}

- (void)setUserTag:(unsigned int)a3
{
  self->userTag = a3;
}

@end
