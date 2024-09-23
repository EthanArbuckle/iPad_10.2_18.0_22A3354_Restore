@implementation WFSystemContentWhitelistItem

- (WFSystemContentWhitelistItem)initWithDomainGlob:(id)a3
{
  WFSystemContentWhitelistItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSystemContentWhitelistItem;
  v4 = -[WFSystemContentWhitelistItem init](&v6, sel_init);
  if (v4)
    v4->_utf8DomainGlob = strdup((const char *)objc_msgSend(a3, "UTF8String"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_utf8DomainGlob);
  v3.receiver = self;
  v3.super_class = (Class)WFSystemContentWhitelistItem;
  -[WFSystemContentWhitelistItem dealloc](&v3, sel_dealloc);
}

- (BOOL)matchesURL:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "host");
  if (v4)
    LOBYTE(v4) = fnmatch(self->_utf8DomainGlob, (const char *)objc_msgSend(v4, "UTF8String"), 0) == 0;
  return (char)v4;
}

@end
