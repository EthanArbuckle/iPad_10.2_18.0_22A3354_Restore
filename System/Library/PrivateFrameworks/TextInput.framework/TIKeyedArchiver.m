@implementation TIKeyedArchiver

- (unint64_t)tiVersion
{
  return self->tiVersion;
}

- (void)setTiVersion:(unint64_t)a3
{
  self->tiVersion = a3;
}

@end
