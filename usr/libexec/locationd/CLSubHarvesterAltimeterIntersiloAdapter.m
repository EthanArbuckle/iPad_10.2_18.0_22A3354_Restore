@implementation CLSubHarvesterAltimeterIntersiloAdapter

- (CLSubHarvesterAltimeterIntersiloAdapter)initWithHarvesterExternal:(void *)a3
{
  CLSubHarvesterAltimeterIntersiloAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterAltimeterIntersiloAdapter;
  result = -[CLSubHarvesterAltimeterIntersiloAdapter init](&v5, "init");
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

- (void)onBarometerCalibrationNotification:(unint64_t)a3 track:(id)a4 data:(id)a5
{
  _QWORD **harvesterExternal;
  uint64_t i;
  _QWORD v9[54];

  harvesterExternal = (_QWORD **)self->_harvesterExternal;
  (*((void (**)(_QWORD *__return_ptr, id, SEL))a5 + 2))(v9, a5, a2);
  if (!a3)
    (*(void (**)(_QWORD *, _QWORD, id, _QWORD *))(*harvesterExternal[5] + 16))(harvesterExternal[5], 0, a4, v9);
  for (i = 48; i != -6; i -= 6)
    sub_1006F0FB8(&v9[i]);
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
