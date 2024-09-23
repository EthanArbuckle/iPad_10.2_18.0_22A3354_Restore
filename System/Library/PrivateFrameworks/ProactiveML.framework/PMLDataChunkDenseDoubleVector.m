@implementation PMLDataChunkDenseDoubleVector

- (const)vector
{
  return (const double *)-[NSData bytes](self->super._backingData, "bytes");
}

- (int)count
{
  return -[NSData length](self->super._backingData, "length") >> 3;
}

+ (unsigned)dataChunkType
{
  return 3;
}

+ (id)chunkWithVector:(const double *)a3 count:(int)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3, 8 * a4);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v4);

  return v5;
}

@end
