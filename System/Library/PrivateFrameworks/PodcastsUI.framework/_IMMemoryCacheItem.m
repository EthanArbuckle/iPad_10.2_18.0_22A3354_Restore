@implementation _IMMemoryCacheItem

+ (id)cacheItemWithItem:(id)a3 key:(id)a4 cost:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (!a5)
    NSLog(CFSTR("Adding Cost Zero Cache Item: %@"), v7);
  objc_msgSend(v9, "setItem:", v8);
  objc_msgSend(v9, "setCost:", a5);
  objc_msgSend(v9, "setTimeStamp:", mach_absolute_time());
  objc_msgSend(v9, "setKey:", v7);
  v10 = objc_msgSend(v8, "conformsToProtocol:", &unk_1F02CFA90);

  objc_msgSend(v9, "setConformsToProtocol:", v10);
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>; Item: %@; Cost: %d; Key: %@; Conforms: %d"),
               objc_opt_class(),
               self,
               self->_item,
               self->_cost,
               self->_keyString,
               self->_conformsToProtocol);
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

- (NSString)key
{
  return self->_keyString;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_keyString, 0);
  objc_storeStrong(&self->_item, 0);
}

@end
