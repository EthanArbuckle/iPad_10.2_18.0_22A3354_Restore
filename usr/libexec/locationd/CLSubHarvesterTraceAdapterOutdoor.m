@implementation CLSubHarvesterTraceAdapterOutdoor

- (BOOL)valid
{
  return self->_valid;
}

- (void)onOutdoorUpdate:(id)a3
{
  _QWORD **harvesterExternal;
  _QWORD v4[7];

  harvesterExternal = (_QWORD **)self->_harvesterExternal;
  (*((void (**)(_QWORD *__return_ptr, id, SEL))a3 + 2))(v4, a3, a2);
  (*(void (**)(_QWORD *, _QWORD *))(*harvesterExternal[38] + 48))(harvesterExternal[38], v4);
}

- (CLSubHarvesterTraceAdapterOutdoor)initWithHarvesterExternal:(void *)a3
{
  CLSubHarvesterTraceAdapterOutdoor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterTraceAdapterOutdoor;
  result = -[CLSubHarvesterTraceAdapterOutdoor init](&v5, "init");
  if (result)
  {
    result->_harvesterExternal = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
