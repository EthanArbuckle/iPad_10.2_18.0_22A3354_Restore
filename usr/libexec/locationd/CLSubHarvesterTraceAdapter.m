@implementation CLSubHarvesterTraceAdapter

- (CLSubHarvesterTraceAdapter)initWithHarvesterExternal:(void *)a3
{
  CLSubHarvesterTraceAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterTraceAdapter;
  result = -[CLSubHarvesterTraceAdapter init](&v5, "init");
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

- (void)handleVIOEstimation:(id)a3 fromClient:(id)a4
{
  (*(void (**)(_QWORD, id))(**((_QWORD **)self->_harvesterExternal + 38) + 56))(*((_QWORD *)self->_harvesterExternal + 38), a3);
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  (*(void (**)(_QWORD, id, id))(**((_QWORD **)self->_harvesterExternal + 38) + 64))(*((_QWORD *)self->_harvesterExternal + 38), a3, a4);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
