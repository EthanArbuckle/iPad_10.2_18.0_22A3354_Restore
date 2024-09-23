@implementation PMLNoNoiseStrategy

- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5
{
  *a5 = 1.0;
  return 1;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end
