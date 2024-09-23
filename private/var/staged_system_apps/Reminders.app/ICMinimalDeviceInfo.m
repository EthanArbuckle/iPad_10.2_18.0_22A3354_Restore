@implementation ICMinimalDeviceInfo

- (ICMinimalDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMinimalDeviceInfo;
  return -[ICMigrationDeviceInfo initWithName:upgradable:upgraded:](&v6, "initWithName:upgradable:upgraded:", a3, a4, a5);
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICMinimalDeviceInfo;
  v3 = -[ICMinimalDeviceInfo description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationDeviceInfo name](self, "name"));
  if (-[ICMigrationDeviceInfo upgradable](self, "upgradable"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[ICMigrationDeviceInfo upgraded](self, "upgraded"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <name: %@, Upgradable: %@, Upgraded: %@"), v4, v5, v6, v7));

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICMinimalDeviceInfo;
  v3 = -[ICMinimalDeviceInfo description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[ICMigrationDeviceInfo upgradable](self, "upgradable"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[ICMigrationDeviceInfo upgraded](self, "upgraded"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <Upgradable: %@, Upgraded: %@"), v4, v5, v6));

  return v7;
}

@end
