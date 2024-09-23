@implementation STMutableLocationStatusDomainData

- (STMutableListData)locationAttributionListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableLocationStatusDomainData;
  -[STLocationStatusDomainData locationAttributionListData](&v3, sel_locationAttributionListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

- (STMutableLocationStatusDomainData)initWithLocationAttributionListData:(id)a3 activeDisplayModes:(unint64_t)a4
{
  void *v6;
  STMutableLocationStatusDomainData *v7;
  objc_super v9;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v9.receiver = self;
  v9.super_class = (Class)STMutableLocationStatusDomainData;
  v7 = -[STLocationStatusDomainData _initWithLocationAttributionListData:activeDisplayModes:](&v9, sel__initWithLocationAttributionListData_activeDisplayModes_, v6, a4);

  return v7;
}

- (void)setAttributions:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
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
    -[STMutableLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)setActiveDisplayModes:(unint64_t)a3
{
  if (self->super._activeDisplayModes != a3)
    self->super._activeDisplayModes = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STLocationStatusDomainData initWithData:](+[STLocationStatusDomainData allocWithZone:](STLocationStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
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

- (void)removeAttribution:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableLocationStatusDomainData locationAttributionListData](self, "locationAttributionListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)setLocationAttributions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[STLocationStatusDomainData attributions](self, "attributions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_116);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v4, "bs_map:", &__block_literal_global_118);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObjectsFromArray:", v7);
    -[STMutableLocationStatusDomainData setAttributions:](self, "setAttributions:", v6);

  }
}

BOOL __61__STMutableLocationStatusDomainData_setLocationAttributions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationState") != 1;
}

STLocationStatusDomainLocationAttribution *__61__STMutableLocationStatusDomainData_setLocationAttributions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  STLocationStatusDomainLocationAttribution *v3;

  v2 = a2;
  v3 = -[STLocationStatusDomainLocationAttribution initWithLocationState:activityAttribution:]([STLocationStatusDomainLocationAttribution alloc], "initWithLocationState:activityAttribution:", 1, v2);

  return v3;
}

- (void)addLocationAttribution:(id)a3
{
  id v4;
  STLocationStatusDomainLocationAttribution *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[STLocationStatusDomainLocationAttribution initWithLocationState:activityAttribution:]([STLocationStatusDomainLocationAttribution alloc], "initWithLocationState:activityAttribution:", 1, v4);

    -[STMutableLocationStatusDomainData addAttribution:](self, "addAttribution:", v5);
  }
}

- (void)removeLocationAttribution:(id)a3
{
  id v4;
  STLocationStatusDomainLocationAttribution *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[STLocationStatusDomainLocationAttribution initWithLocationState:activityAttribution:]([STLocationStatusDomainLocationAttribution alloc], "initWithLocationState:activityAttribution:", 1, v4);

    -[STMutableLocationStatusDomainData removeAttribution:](self, "removeAttribution:", v5);
  }
}

@end
