@implementation SKBlockDevice

- (id)copyIOMedia
{
  void *v2;
  SKIOMedia *v3;

  -[SKIOObject ioObjectWithClassName:iterateParents:](self, "ioObjectWithClassName:iterateParents:", CFSTR("IOMedia"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SKIOObject initWithSKIOObject:]([SKIOMedia alloc], "initWithSKIOObject:", v2);

  return v3;
}

@end
