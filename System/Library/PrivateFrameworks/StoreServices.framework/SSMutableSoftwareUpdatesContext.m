@implementation SSMutableSoftwareUpdatesContext

- (void)setClientIdentifierHeader:(id)a3
{
  NSString *clientIdentifierHeader;

  clientIdentifierHeader = self->super._clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->super._clientIdentifierHeader = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setForced:(BOOL)a3
{
  self->super._forced = a3;
}

- (void)setSoftwareTypes:(id)a3
{
  NSArray *softwareTypes;

  softwareTypes = self->super._softwareTypes;
  if (softwareTypes != a3)
  {

    self->super._softwareTypes = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)copyXPCEncoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSMutableSoftwareUpdatesContext;
  return -[SSSoftwareUpdatesContext copyXPCEncoding](&v3, sel_copyXPCEncoding);
}

- (SSMutableSoftwareUpdatesContext)initWithXPCEncoding:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSMutableSoftwareUpdatesContext;
  return -[SSSoftwareUpdatesContext initWithXPCEncoding:](&v4, sel_initWithXPCEncoding_, a3);
}

@end
