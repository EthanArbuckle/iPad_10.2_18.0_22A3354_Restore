@implementation _IMMemoryCacheItem

+ (id)cacheItemWithItem:(id)a3 key:(id)a4 cost:(unint64_t)a5
{
  id v7;
  id v8;
  _IMMemoryCacheItem *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = objc_opt_new(_IMMemoryCacheItem);
  if (!a5)
    NSLog(CFSTR("Adding Cost Zero Cache Item: %@"), v7);
  -[_IMMemoryCacheItem setItem:](v9, "setItem:", v8);
  -[_IMMemoryCacheItem setCost:](v9, "setCost:", a5);
  -[_IMMemoryCacheItem setTimeStamp:](v9, "setTimeStamp:", mach_absolute_time());
  -[_IMMemoryCacheItem setKey:](v9, "setKey:", v7);
  v10 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___NSDiscardableContent);

  -[_IMMemoryCacheItem setConformsToProtocol:](v9, "setConformsToProtocol:", v10);
  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>; Item: %@; Cost: %d; Key: %@; Conforms: %d"),
           objc_opt_class(self),
           self,
           self->_item,
           self->_cost,
           self->_keyString,
           self->_conformsToProtocol);
}

- (NSString)key
{
  return self->_keyString;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong(&self->_item, a3);
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void)setCost:(unint64_t)a3
{
  self->_cost = a3;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->_timeStamp = a3;
}

- (BOOL)conformsToProtocol
{
  return self->_conformsToProtocol;
}

- (void)setConformsToProtocol:(BOOL)a3
{
  self->_conformsToProtocol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
