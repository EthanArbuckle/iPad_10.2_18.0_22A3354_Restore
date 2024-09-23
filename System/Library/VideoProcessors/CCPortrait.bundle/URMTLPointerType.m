@implementation URMTLPointerType

- (URMTLPointerType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)URMTLPointerType;
  return -[URMTLPointerType init](&v3, sel_init);
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(unint64_t)a3
{
  self->_elementType = a3;
}

- (unint64_t)access
{
  return self->_access;
}

- (void)setAccess:(unint64_t)a3
{
  self->_access = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (BOOL)elementIsArgumentBuffer
{
  return self->_elementIsArgumentBuffer;
}

- (void)setElementIsArgumentBuffer:(BOOL)a3
{
  self->_elementIsArgumentBuffer = a3;
}

@end
