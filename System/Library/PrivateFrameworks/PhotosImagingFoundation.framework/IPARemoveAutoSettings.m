@implementation IPARemoveAutoSettings

- (IPARemoveAutoSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IPARemoveAutoSettings;
  return -[IPAAutoSettings initWithIdentifier:](&v3, sel_initWithIdentifier_, CFSTR("remove"));
}

- (IPARemoveAutoSettings)initWithIdentifier:(id)a3
{
  id v3;
  objc_class *v4;
  IPAAutoSettings *v5;
  SEL v6;
  id v7;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPAAutoSettings *)_PFAssertFailHandler();
  return (IPARemoveAutoSettings *)-[IPAAutoSettings _applyArchiveDictionary:](v5, v6, v7);
}

@end
