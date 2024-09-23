@implementation TSKChangeRecord

- (TSKChangeRecord)initWithKind:(int)a3 details:(id)a4
{
  TSKChangeRecord *v6;
  TSKChangeRecord *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSKChangeRecord;
  v6 = -[TSKChangeRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mKind = a3;
    v6->mDetails = a4;
  }
  return v7;
}

+ (id)changeRecordWithKind:(int)a3 details:(id)a4
{
  return -[TSKChangeRecord initWithKind:details:]([TSKChangeRecord alloc], "initWithKind:details:", *(_QWORD *)&a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKChangeRecord;
  -[TSKChangeRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)allowedInCommit
{
  int mKind;
  unsigned int v3;
  BOOL v4;

  mKind = self->mKind;
  v3 = mKind - 1;
  v4 = mKind == 1000;
  return v3 < 2 || v4;
}

- (int)kind
{
  return self->mKind;
}

- (id)details
{
  return self->mDetails;
}

@end
