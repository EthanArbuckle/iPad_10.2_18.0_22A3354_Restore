@implementation PMLDataChunkDenseFloatVector

- (id)toVec
{
  PMLMutableDenseVector *v3;
  PMLDataChunkDenseFloatVector *v4;

  v3 = [PMLMutableDenseVector alloc];
  v4 = objc_retainAutorelease(self);
  return -[PMLDenseVector initWithFloats:count:](v3, "initWithFloats:count:", -[PMLDataChunkDenseFloatVector vector](v4, "vector"), -[PMLDataChunkDenseFloatVector count](v4, "count"));
}

- (const)vector
{
  return (const float *)-[NSData bytes](self->super._backingData, "bytes");
}

- (int)count
{
  return -[NSData length](self->super._backingData, "length") >> 2;
}

+ (unsigned)dataChunkType
{
  return 2;
}

+ (id)chunkWithVector:(const float *)a3 count:(int)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3, 4 * a4);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v4);

  return v5;
}

@end
