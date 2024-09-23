@implementation TSULinkedPointerSetEntry

- (TSULinkedPointerSetEntry)initWithObject:(id)a3 previousEntry:(id)a4
{
  TSULinkedPointerSetEntry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSULinkedPointerSetEntry;
  v6 = -[TSULinkedPointerSetEntry init](&v8, sel_init);
  if (v6)
  {
    v6->mObject = a3;
    v6->mPrevious = (TSULinkedPointerSetEntry *)a4;
    v6->mNext = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSULinkedPointerSetEntry;
  -[TSULinkedPointerSetEntry dealloc](&v3, sel_dealloc);
}

@end
