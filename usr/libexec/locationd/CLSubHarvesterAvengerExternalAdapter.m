@implementation CLSubHarvesterAvengerExternalAdapter

- (CLSubHarvesterAvengerExternalAdapter)initWithHarvesterExternal:(void *)a3
{
  CLSubHarvesterAvengerExternalAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterAvengerExternalAdapter;
  result = -[CLSubHarvesterAvengerExternalAdapter init](&v5, "init");
  if (result)
  {
    result->_subHarvesterExternal = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  (*(void (**)(void *, id, id))(*(_QWORD *)self->_subHarvesterExternal + 160))(self->_subHarvesterExternal, a3, a4);
}

- (void)onAggressiveScanStarted
{
  (*(void (**)(void *))(*(_QWORD *)self->_subHarvesterExternal + 168))(self->_subHarvesterExternal);
}

- (void)onAggressiveScanEnded
{
  (*(void (**)(void *))(*(_QWORD *)self->_subHarvesterExternal + 176))(self->_subHarvesterExternal);
}

- (id)clientIdentifier
{
  return CFSTR("CLSubHarvesterAvenger");
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
