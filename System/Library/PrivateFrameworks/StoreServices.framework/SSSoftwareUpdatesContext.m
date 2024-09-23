@implementation SSSoftwareUpdatesContext

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdatesContext;
  -[SSSoftwareUpdatesContext dealloc](&v3, sel_dealloc);
}

- (NSArray)softwareTypes
{
  NSArray *result;

  result = self->_softwareTypes;
  if (!result)
  {
    result = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("newsstand"), CFSTR("regular"), 0);
    self->_softwareTypes = result;
  }
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_forced);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)-[SSSoftwareUpdatesContext softwareTypes](self, "softwareTypes"));
  return v3;
}

- (SSSoftwareUpdatesContext)initWithXPCEncoding:(id)a3
{
  SSSoftwareUpdatesContext *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSSoftwareUpdatesContext;
    v5 = -[SSSoftwareUpdatesContext init](&v7, sel_init);
    if (v5)
    {
      v5->_forced = xpc_dictionary_get_BOOL(a3, "0");
      objc_opt_class();
      v5->_softwareTypes = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SSSoftwareUpdatesContext *v5;

  v5 = -[SSSoftwareUpdatesContext init](+[SSSoftwareUpdatesContext allocWithZone:](SSSoftwareUpdatesContext, "allocWithZone:"), "init");
  v5->_clientIdentifierHeader = (NSString *)-[NSString copyWithZone:](self->_clientIdentifierHeader, "copyWithZone:", a3);
  v5->_forced = self->_forced;
  v5->_softwareTypes = (NSArray *)-[NSArray copyWithZone:](self->_softwareTypes, "copyWithZone:", a3);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SSMutableSoftwareUpdatesContext *v5;

  v5 = -[SSMutableSoftwareUpdatesContext init](+[SSMutableSoftwareUpdatesContext allocWithZone:](SSMutableSoftwareUpdatesContext, "allocWithZone:"), "init");
  v5->super._clientIdentifierHeader = (NSString *)-[NSString copyWithZone:](self->_clientIdentifierHeader, "copyWithZone:", a3);
  v5->super._forced = self->_forced;
  v5->super._softwareTypes = (NSArray *)-[NSArray copyWithZone:](self->_softwareTypes, "copyWithZone:", a3);
  return v5;
}

- (NSString)clientIdentifierHeader
{
  return self->_clientIdentifierHeader;
}

- (BOOL)isForced
{
  return self->_forced;
}

@end
