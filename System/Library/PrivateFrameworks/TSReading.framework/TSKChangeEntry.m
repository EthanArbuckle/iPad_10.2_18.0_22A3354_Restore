@implementation TSKChangeEntry

- (TSKChangeEntry)initWithChangeSource:(id)a3 changes:(id)a4
{
  TSKChangeEntry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSKChangeEntry;
  v6 = -[TSKChangeEntry init](&v8, sel_init);
  if (v6)
  {
    v6->mChangeSource = a3;
    v6->mChanges = (NSMutableArray *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKChangeEntry;
  -[TSKChangeEntry dealloc](&v3, sel_dealloc);
}

- (id)changeSource
{
  return self->mChangeSource;
}

- (NSMutableArray)changes
{
  return self->mChanges;
}

@end
