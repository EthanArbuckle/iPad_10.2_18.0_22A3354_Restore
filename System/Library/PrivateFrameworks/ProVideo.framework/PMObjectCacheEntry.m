@implementation PMObjectCacheEntry

- (PMObjectCacheEntry)initWithKey:(id)a3 cacheItem:(id)a4 size:(unint64_t)a5 cost:(double)a6 forCache:(id)a7
{
  PMObjectCacheEntry *v11;
  PMObjectCacheEntry *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PMObjectCacheEntry;
  v11 = -[PMObjectCacheEntry init](&v14, sel_init, a3, a4, a5, a7);
  v12 = v11;
  if (v11)
  {
    v11->_cost = a6;
    v11->_item = a4;
    v12->_size = a5;
    v12->_cacheKey = (NSString *)a3;
    if (a3)
      v12->_hashValue = a3;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMObjectCacheEntry;
  -[PMObjectCacheEntry dealloc](&v3, sel_dealloc);
}

- (id)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  self->_hashValue = a3;
  self->_cacheKey = (NSString *)a3;
}

- (unsigned)hashValue
{
  return self->_hashValue;
}

- (id)getItem
{
  return self->_item;
}

- (unint64_t)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(unint64_t)a3
{
  self->_lastAccess = a3;
}

- (unint64_t)getSize
{
  return self->_size;
}

- (double)cost
{
  return self->_cost;
}

- (float)getValue:(unint64_t)a3 decayRate:(float)a4
{
  unint64_t v4;
  float freq;
  float v6;

  v4 = a3 - self->_lastAccess;
  freq = self->_freq;
  v6 = (float)((float)v4 - freq) * a4;
  if (freq > (float)v4)
    v6 = -0.0;
  return self->_value / (float)(freq + v6);
}

- (void)setValue:(unint64_t)a3 cost:(double)a4 maxCacheSize:(unint64_t)a5
{
  self->_lastAccess = a3;
  self->_freq = (float)a5 / (float)-[PMObjectCacheEntry getSize](self, "getSize");
  *(float *)&a4 = a4;
  self->_value = (float)(*(float *)&a4 / (float)-[PMObjectCacheEntry getSize](self, "getSize")) * *(float *)&a4;
}

- (void)resetValue:(unint64_t)a3 responseRate:(float)a4 penalty:(float)a5
{
  unint64_t lastAccess;

  lastAccess = self->_lastAccess;
  if (lastAccess + 1 < a3)
    self->_freq = self->_freq + (float)((float)((float)(a3 - lastAccess) - self->_freq) * a4);
}

- (BOOL)canBePurgedFromCache
{
  id item;

  item = self->_item;
  return !item || (unint64_t)objc_msgSend(item, "retainCount") < 2;
}

@end
