@implementation PBUIImageSlotRepository

- (PBUIImageSlotRepository)initWithWindowScene:(id)a3
{
  PBUIImageSlotRepository *v3;
  uint64_t v4;
  NSMutableSet *lifetimes;
  uint64_t v6;
  NSMutableDictionary *slots;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBUIImageSlotRepository;
  v3 = -[PBUIImageSlotRepository init](&v9, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    lifetimes = v3->_lifetimes;
    v3->_lifetimes = (NSMutableSet *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    slots = v3->_slots;
    v3->_slots = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)allocateImageSlotForIdentifier:(id)a3 size:(CGSize)a4 actualStyle:(int64_t)a5 url:(id)a6 lifetimeObject:(id)a7
{
  double height;
  double width;
  NSMutableSet *lifetimes;
  id v14;
  id v15;
  _PBUIImageSlotRepositoryEntry *v16;

  height = a4.height;
  width = a4.width;
  lifetimes = self->_lifetimes;
  v14 = a6;
  v15 = a3;
  -[NSMutableSet addObject:](lifetimes, "addObject:", a7);
  v16 = objc_alloc_init(_PBUIImageSlotRepositoryEntry);
  -[_PBUIImageSlotRepositoryEntry setUrl:](v16, "setUrl:", v14);

  -[_PBUIImageSlotRepositoryEntry setSize:](v16, "setSize:", width, height);
  -[_PBUIImageSlotRepositoryEntry setActualStyle:](v16, "setActualStyle:", a5);
  -[NSMutableDictionary setObject:forKey:](self->_slots, "setObject:forKey:", v16, v15);

}

- (void)freeImageSlotWithIdentifier:(id)a3 lifetime:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_slots, "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[NSMutableDictionary removeObjectForKey:](self->_slots, "removeObjectForKey:", v8);
  -[NSMutableSet removeObject:](self->_lifetimes, "removeObject:", v6);

}

- (void)setImageSlot:(id)a3 forIdentifier:(id)a4
{
  NSMutableDictionary *slots;
  id v6;
  id v7;

  slots = self->_slots;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](slots, "objectForKeyedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (BOOL)hasSlotForIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_slots, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)urlForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_slots, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)sizeForIdentifier:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_slots, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)actualStyleForIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_slots, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "actualStyle");

  return v4;
}

- (id)ioSurfaceForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_slots, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ioSurface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_lifetimes, 0);
}

@end
