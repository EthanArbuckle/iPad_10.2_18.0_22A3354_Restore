@implementation SiriInstrumentationObjectContainer

- (void)addTier1Event:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SiriInstrumentationObjectContainer tier1Events](self, "tier1Events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SiriInstrumentationObjectContainer setTier1Events:](self, "setTier1Events:", v5);

  }
  -[SiriInstrumentationObjectContainer tier1Events](self, "tier1Events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (SISchemaInstrumentationMessage)mainItem
{
  return self->_mainItem;
}

- (void)setMainItem:(id)a3
{
  objc_storeStrong((id *)&self->_mainItem, a3);
}

- (NSMutableArray)tier1Events
{
  return self->_tier1Events;
}

- (void)setTier1Events:(id)a3
{
  objc_storeStrong((id *)&self->_tier1Events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tier1Events, 0);
  objc_storeStrong((id *)&self->_mainItem, 0);
}

@end
