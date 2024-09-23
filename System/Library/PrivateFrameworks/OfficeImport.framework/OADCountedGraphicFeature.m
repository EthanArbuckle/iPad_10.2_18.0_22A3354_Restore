@implementation OADCountedGraphicFeature

- (OADCountedGraphicFeature)initWithFeature:(id)a3
{
  id v5;
  OADCountedGraphicFeature *v6;
  OADCountedGraphicFeature *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADCountedGraphicFeature;
  v6 = -[OADCountedGraphicFeature init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->mFeature, a3);
    v7->mUsageCount = 1;
  }

  return v7;
}

- (void)dealloc
{
  id mFeature;
  objc_super v4;

  mFeature = self->mFeature;
  self->mFeature = 0;

  v4.receiver = self;
  v4.super_class = (Class)OADCountedGraphicFeature;
  -[OADCountedGraphicFeature dealloc](&v4, sel_dealloc);
}

- (void)incrementUsageCount
{
  ++self->mUsageCount;
}

- (id)feature
{
  return self->mFeature;
}

- (int64_t)compareUsageCount:(id)a3
{
  unint64_t mUsageCount;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  mUsageCount = self->mUsageCount;
  v4 = *((_QWORD *)a3 + 2);
  v5 = mUsageCount > v4;
  v6 = mUsageCount != v4;
  if (v5)
    return -1;
  else
    return v6;
}

- (unint64_t)usageCount
{
  return self->mUsageCount;
}

- (void)setUsageCount:(unint64_t)a3
{
  self->mUsageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mFeature, 0);
}

@end
