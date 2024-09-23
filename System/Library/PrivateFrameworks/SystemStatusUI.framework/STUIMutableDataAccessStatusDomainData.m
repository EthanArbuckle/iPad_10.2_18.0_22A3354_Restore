@implementation STUIMutableDataAccessStatusDomainData

- (void)setDataAccessAttributions:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STUIMutableDataAccessStatusDomainData attributionListData](self, "attributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_19);
      self = (STUIMutableDataAccessStatusDomainData *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v5, "setObjects:", self);
  }
}

- (STUIMutableDataAccessStatusDomainData)initWithAttributionListData:(id)a3
{
  void *v4;
  STUIMutableDataAccessStatusDomainData *v5;
  objc_super v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v7.receiver = self;
  v7.super_class = (Class)STUIMutableDataAccessStatusDomainData;
  v5 = -[STUIDataAccessStatusDomainData _initWithAttributionListData:](&v7, sel__initWithAttributionListData_, v4);

  return v5;
}

- (STMutableListData)attributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIMutableDataAccessStatusDomainData;
  -[STUIDataAccessStatusDomainData attributionListData](&v3, sel_attributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STUIDataAccessStatusDomainData initWithData:](+[STUIDataAccessStatusDomainData allocWithZone:](STUIDataAccessStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
}

@end
