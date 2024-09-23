@implementation STMutableStatusItemsStatusDomainData

- (STMutableStatusItemsStatusDomainData)initWithStatusItemsAttributionListData:(id)a3 visualDescriptorsByIdentifierDictionaryData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  STMutableStatusItemsStatusDomainData *v9;
  objc_super v11;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v8 = (void *)objc_msgSend(v6, "mutableCopy");

  v11.receiver = self;
  v11.super_class = (Class)STMutableStatusItemsStatusDomainData;
  v9 = -[STStatusItemsStatusDomainData _initWithStatusItemsAttributionListData:visualDescriptorsByIdentifierDictionaryData:](&v11, sel__initWithStatusItemsAttributionListData_visualDescriptorsByIdentifierDictionaryData_, v7, v8);

  return v9;
}

- (void)setAttributions:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableStatusItemsStatusDomainData statusItemsAttributionListData](self, "statusItemsAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObjects:", v4);

  }
}

- (void)addAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableStatusItemsStatusDomainData statusItemsAttributionListData](self, "statusItemsAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableStatusItemsStatusDomainData statusItemsAttributionListData](self, "statusItemsAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)setVisualDescriptor:(id)a3 forStatusItemWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[STMutableStatusItemsStatusDomainData visualDescriptorsByIdentifierDictionaryData](self, "visualDescriptorsByIdentifierDictionaryData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STStatusItemsStatusDomainData initWithData:](+[STStatusItemsStatusDomainData allocWithZone:](STStatusItemsStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

- (STMutableListData)statusItemsAttributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableStatusItemsStatusDomainData;
  -[STStatusItemsStatusDomainData statusItemsAttributionListData](&v3, sel_statusItemsAttributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (STMutableDictionaryData)visualDescriptorsByIdentifierDictionaryData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableStatusItemsStatusDomainData;
  -[STStatusItemsStatusDomainData visualDescriptorsByIdentifierDictionaryData](&v3, sel_visualDescriptorsByIdentifierDictionaryData);
  return (STMutableDictionaryData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
