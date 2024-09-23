@implementation ISPropertyListProvider

- (ISPropertyListProvider)init
{
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISPropertyListProvider;
  return -[ISProtocolDataProvider init](&v4, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISPropertyListProvider;
  return -[ISProtocolDataProvider copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)processDialogFromPropertyList:(id)a3 returningError:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISPropertyListProvider;
  return -[ISProtocolDataProvider processDialogFromDictionary:error:](&v5, sel_processDialogFromDictionary_error_, a3, a4);
}

- (BOOL)processPropertyList:(id)a3 returningError:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISPropertyListProvider;
  return -[ISProtocolDataProvider processDictionary:error:](&v5, sel_processDictionary_error_, a3, a4);
}

@end
