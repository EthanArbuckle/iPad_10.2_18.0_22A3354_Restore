@implementation CRFragmentedDetectedLineRegion

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRFragmentedDetectedLineRegion;
  v4 = -[CRDetectedLineRegion copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
    -[CRFragmentedDetectedLineRegion _copyContentsToObject:](self, "_copyContentsToObject:", v4);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRMutableFragmentedDetectedLineRegion *v4;

  v4 = objc_alloc_init(CRMutableFragmentedDetectedLineRegion);
  if (v4)
    -[CRFragmentedDetectedLineRegion _copyContentsToObject:](self, "_copyContentsToObject:", v4);
  return v4;
}

- (void)_copyContentsToObject:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRFragmentedDetectedLineRegion;
  v4 = a3;
  -[CRDetectedLineRegion _copyContentsToObject:](&v6, sel__copyContentsToObject_, v4);
  -[CRFragmentedDetectedLineRegion regionFragments](self, "regionFragments", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRegionFragments:", v5);

}

- (NSArray)regionFragments
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRegionFragments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionFragments, 0);
}

@end
