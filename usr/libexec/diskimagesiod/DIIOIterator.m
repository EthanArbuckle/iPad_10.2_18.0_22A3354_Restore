@implementation DIIOIterator

- (DIIOIterator)initWithIOIterator:(unsigned int)a3 retain:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIIOIterator;
  return -[DIIOObject initWithIOObject:retain:](&v5, "initWithIOObject:retain:", *(_QWORD *)&a3, a4);
}

- (unsigned)copyNextObject
{
  DIIOIterator *i;
  unsigned int result;

  for (i = self; ; self = i)
  {
    result = IOIteratorNext(-[DIIOObject ioObj](self, "ioObj"));
    if (result)
      break;
    if (IOIteratorIsValid(-[DIIOObject ioObj](i, "ioObj")))
      return 0;
    IOIteratorReset(-[DIIOObject ioObj](i, "ioObj"));
    -[DIIOIterator setStartedOver:](i, "setStartedOver:", 1);
  }
  return result;
}

- (BOOL)startedOver
{
  return *((_BYTE *)&self->super._ioObj + 4);
}

- (void)setStartedOver:(BOOL)a3
{
  *((_BYTE *)&self->super._ioObj + 4) = a3;
}

@end
