@implementation STMutableCallingStatusDomainData

- (STMutableCallingStatusDomainData)initWithCallDescriptorListData:(id)a3
{
  void *v4;
  STMutableCallingStatusDomainData *v5;
  objc_super v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v7.receiver = self;
  v7.super_class = (Class)STMutableCallingStatusDomainData;
  v5 = -[STCallingStatusDomainData _initWithCallDescriptorListData:](&v7, sel__initWithCallDescriptorListData_, v4);

  return v5;
}

- (void)setCallDescriptors:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObjects:", v4);

  }
}

- (void)addCallDescriptor:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeCallDescriptor:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)setActiveCallAttributions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STCallingStatusDomainData _activeAudioCallDescriptors](self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_map:", &__block_literal_global_121);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToArray:", v6) & 1) == 0)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeObjectsInArray:", v10);
    objc_msgSend(v9, "addObjectsFromArray:", v6);
    objc_msgSend(v7, "setObjects:", v9);

  }
}

id __62__STMutableCallingStatusDomainData_setActiveCallAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "audioCallDescriptorWithState:", 0);
}

- (void)addActiveCallAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "audioCallDescriptorWithState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
}

- (void)removeActiveCallAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "audioCallDescriptorWithState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v3);

  }
}

- (void)setRingingCallAttributions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STCallingStatusDomainData _ringingAudioCallDescriptors](self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_map:", &__block_literal_global_122);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToArray:", v6) & 1) == 0)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeObjectsInArray:", v10);
    objc_msgSend(v9, "addObjectsFromArray:", v6);
    objc_msgSend(v7, "setObjects:", v9);

  }
}

id __63__STMutableCallingStatusDomainData_setRingingCallAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "audioCallDescriptorWithState:", 1);
}

- (void)addRingingCallAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "audioCallDescriptorWithState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
}

- (void)removeRingingCallAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor audioCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "audioCallDescriptorWithState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v3);

  }
}

- (void)setActiveVideoConferenceAttributions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (self)
  {
    -[STCallingStatusDomainData callDescriptors](self, "callDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_19_1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bs_map:", &__block_literal_global_123);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToArray:", v7) & 1) == 0)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeObjectsInArray:", v11);
    objc_msgSend(v10, "addObjectsFromArray:", v7);
    objc_msgSend(v8, "setObjects:", v10);

  }
}

id __73__STMutableCallingStatusDomainData_setActiveVideoConferenceAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "videoCallDescriptorWithState:", 0);
}

- (void)addActiveVideoConferenceAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "videoCallDescriptorWithState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
}

- (void)removeActiveVideoConferenceAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "videoCallDescriptorWithState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v3);

  }
}

- (void)setRingingVideoConferenceAttributions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (self)
  {
    -[STCallingStatusDomainData callDescriptors](self, "callDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_20_0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bs_map:", &__block_literal_global_124);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToArray:", v7) & 1) == 0)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeObjectsInArray:", v11);
    objc_msgSend(v10, "addObjectsFromArray:", v7);
    objc_msgSend(v8, "setObjects:", v10);

  }
}

id __74__STMutableCallingStatusDomainData_setRingingVideoConferenceAttributions___block_invoke()
{
  return +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "videoCallDescriptorWithState:", 1);
}

- (void)addRingingVideoConferenceAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "videoCallDescriptorWithState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
}

- (void)removeRingingVideoConferenceAttribution:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[STMutableCallingStatusDomainData callDescriptorListData](self, "callDescriptorListData");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[STCallingStatusDomainCallDescriptor videoCallDescriptorWithState:](STCallingStatusDomainCallDescriptor, "videoCallDescriptorWithState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v3);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STCallingStatusDomainData initWithData:](+[STCallingStatusDomainData allocWithZone:](STCallingStatusDomainData, "allocWithZone:", a3), "initWithData:", self);
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

- (STMutableListData)callDescriptorListData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableCallingStatusDomainData;
  -[STCallingStatusDomainData callDescriptorListData](&v3, sel_callDescriptorListData);
  return (STMutableListData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
