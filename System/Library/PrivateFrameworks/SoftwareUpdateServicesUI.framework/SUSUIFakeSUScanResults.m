@implementation SUSUIFakeSUScanResults

- (SUSUIFakeSUScanResults)init
{
  id v4;
  id v5;
  SUSUIFakeSUScanResults *v6;
  objc_super v7;
  SEL v8;
  SUSUIFakeSUScanResults *v9;

  v9 = self;
  v8 = a2;
  v5 = -[SUSUIFakeSUScanResults fakePreferredDescriptor](self, "fakePreferredDescriptor");
  v4 = -[SUSUIFakeSUScanResults fakeAlternateDescriptor](v9, "fakeAlternateDescriptor");
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUIFakeSUScanResults;
  v9 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:](&v7, sel_initWithPreferredDescriptor_alternateDescriptor_, v5);
  objc_storeStrong((id *)&v9, v9);

  v6 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (id)fakePreferredDescriptor
{
  return objc_alloc_init(SUSUIFakeSUDescriptor);
}

- (id)fakeAlternateDescriptor
{
  return objc_alloc_init(SUSUIFakeSUDescriptor);
}

@end
