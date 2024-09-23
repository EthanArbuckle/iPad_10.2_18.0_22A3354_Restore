@implementation SHAffinityGroup

- (SHAffinityGroup)init
{
  return -[SHAffinityGroup initWithType:cohesionLevel:](self, "initWithType:cohesionLevel:", 1, 1);
}

- (SHAffinityGroup)initWithType:(int64_t)a3 cohesionLevel:(int64_t)a4
{
  SHAffinityGroup *v6;
  SHAffinityGroup *v7;
  uint64_t v8;
  NSMutableArray *mutableMediaItems;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SHAffinityGroup;
  v6 = -[SHAffinityGroup init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_groupType = a3;
    v6->_cohesionLevel = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    mutableMediaItems = v7->_mutableMediaItems;
    v7->_mutableMediaItems = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)appendMediaItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHAffinityGroup mutableMediaItems](self, "mutableMediaItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSArray)mediaItems
{
  void *v2;
  void *v3;

  -[SHAffinityGroup mutableMediaItems](self, "mutableMediaItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (int64_t)cohesionLevel
{
  return self->_cohesionLevel;
}

- (NSMutableArray)mutableMediaItems
{
  return self->_mutableMediaItems;
}

- (void)setMutableMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_mutableMediaItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableMediaItems, 0);
}

@end
