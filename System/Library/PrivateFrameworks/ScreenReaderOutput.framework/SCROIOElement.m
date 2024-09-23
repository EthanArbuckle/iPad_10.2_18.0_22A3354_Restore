@implementation SCROIOElement

- (SCROIOElement)initWithIOObject:(unsigned int)a3
{
  SCROIOElement *v4;
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCROIOElement;
  v4 = -[SCROIOElement init](&v7, sel_init);
  if (v4)
  {
    if (a3)
    {
      IOObjectRetain(a3);
      v4->_ioObject = a3;
    }
    do
      v5 = __ldxr((unsigned int *)&_currentIdentifier_1);
    while (__stxr(v5 + 1, (unsigned int *)&_currentIdentifier_1));
    v4->_identifier = v5;
  }
  return v4;
}

- (void)dealloc
{
  io_object_t ioObject;
  objc_super v4;

  ioObject = self->_ioObject;
  if (ioObject)
    IOObjectRelease(ioObject);
  v4.receiver = self;
  v4.super_class = (Class)SCROIOElement;
  -[SCROIOElement dealloc](&v4, sel_dealloc);
}

- (unsigned)ioObject
{
  return self->_ioObject;
}

- (int)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return self->_ioObject;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  io_object_t ioObject;

  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    ioObject = self->_ioObject;
    if (ioObject)
    {
      IOObjectRetain(ioObject);
      v4[2] = self->_ioObject;
      v4[3] = self->_identifier;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  io_object_t v6;
  io_object_t ioObject;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCROIOElement;
  if (-[SCROIOElement isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v4, "ioObject");
      ioObject = self->_ioObject;
      v5 = (ioObject | v6) == 0;
      if (ioObject && v6)
        v5 = IOObjectIsEqualTo(ioObject, v6) != 0;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (int)transport
{
  return 0;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

@end
