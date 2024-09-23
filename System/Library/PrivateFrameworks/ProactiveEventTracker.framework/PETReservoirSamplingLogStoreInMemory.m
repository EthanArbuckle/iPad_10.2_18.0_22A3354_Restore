@implementation PETReservoirSamplingLogStoreInMemory

- (PETReservoirSamplingLogStoreInMemory)init
{
  PETReservoirSamplingLogStoreInMemory *v2;
  uint64_t v3;
  NSMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PETReservoirSamplingLogStoreInMemory;
  v2 = -[PETReservoirSamplingLogStoreInMemory init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

  }
  return v2;
}

- (BOOL)lock
{
  return 1;
}

- (unint64_t)currentLength
{
  return -[NSMutableData length](self->_data, "length");
}

- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)remap:(unint64_t *)a3
{
  if (a3)
    *a3 = -[NSMutableData length](self->_data, "length");
  return ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)-[NSMutableData mutableBytes](self->_data, "mutableBytes");
}

- (BOOL)changeLength:(unint64_t)a3
{
  -[NSMutableData setLength:](self->_data, "setLength:", a3);
  return 1;
}

- (BOOL)appendData:(id)a3 andReturnMapPointer:(id *)a4
{
  -[NSMutableData appendData:](self->_data, "appendData:", a3);
  if (a4)
    *a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[NSMutableData mutableBytes](self->_data, "mutableBytes");
  return 1;
}

- (BOOL)attemptToRecreate
{
  NSMutableData *v3;
  NSMutableData *data;

  v3 = (NSMutableData *)objc_opt_new();
  data = self->_data;
  self->_data = v3;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
