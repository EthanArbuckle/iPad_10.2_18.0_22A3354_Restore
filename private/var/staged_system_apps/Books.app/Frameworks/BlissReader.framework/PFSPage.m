@implementation PFSPage

- (PFSPage)init
{
  PFSPage *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFSPage;
  v2 = -[PFSPage init](&v4, "init");
  if (v2)
  {
    v2->mProperties = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mSlots = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mFlows = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFSPage;
  -[PFSPage dealloc](&v3, "dealloc");
}

- (id)valueForProperty:(const char *)a3
{
  return -[NSMutableDictionary objectForKey:](self->mProperties, "objectForKey:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", a3));
}

- (id)addSlotWithId:(id)a3
{
  PFSSlot *v5;

  v5 = -[PFSSlot initWithId:]([PFSSlot alloc], "initWithId:", a3);
  -[NSMutableDictionary setObject:forKey:](self->mSlots, "setObject:forKey:", v5, a3);

  return v5;
}

- (id)slotWithId:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mSlots, "objectForKey:", a3);
}

- (void)addFlow:(id)a3
{
  -[NSMutableArray addObject:](self->mFlows, "addObject:", a3);
}

- (NSMutableDictionary)properties
{
  return self->mProperties;
}

- (NSMutableDictionary)slots
{
  return self->mSlots;
}

- (NSMutableArray)flows
{
  return self->mFlows;
}

@end
