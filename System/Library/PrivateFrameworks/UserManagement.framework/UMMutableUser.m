@implementation UMMutableUser

- (BOOL)commitChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UMMutableUser;
  return -[UMUser commitChanges](&v3, sel_commitChanges);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UMMutableUser;
  return -[UMUser commitChangesWithError:](&v4, sel_commitChangesWithError_, a3);
}

@end
