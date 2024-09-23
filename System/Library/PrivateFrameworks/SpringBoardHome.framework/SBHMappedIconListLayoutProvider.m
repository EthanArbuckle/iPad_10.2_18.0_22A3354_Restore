@implementation SBHMappedIconListLayoutProvider

- (SBHMappedIconListLayoutProvider)initWithTargetListLayoutProvider:(id)a3
{
  id v5;
  SBHMappedIconListLayoutProvider *v6;
  SBHMappedIconListLayoutProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHMappedIconListLayoutProvider;
  v6 = -[SBHMappedIconListLayoutProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_targetListLayoutProvider, a3);

  return v7;
}

- (void)mapIconLocation:(id)a3 toIconLocation:(id)a4
{
  id v6;
  NSMutableDictionary *mappedIconLocations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  mappedIconLocations = self->_mappedIconLocations;
  if (!mappedIconLocations)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_mappedIconLocations;
    self->_mappedIconLocations = v8;

    mappedIconLocations = self->_mappedIconLocations;
  }
  -[NSMutableDictionary setObject:forKey:](mappedIconLocations, "setObject:forKey:", v6, v10);

}

- (id)layoutForIconLocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_mappedIconLocations, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = v4;
  -[SBHMappedIconListLayoutProvider targetListLayoutProvider](self, "targetListLayoutProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutForIconLocation:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBIconListLayoutProvider)targetListLayoutProvider
{
  return self->_targetListLayoutProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetListLayoutProvider, 0);
  objc_storeStrong((id *)&self->_mappedIconLocations, 0);
}

@end
