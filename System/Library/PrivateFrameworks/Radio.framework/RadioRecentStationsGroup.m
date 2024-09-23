@implementation RadioRecentStationsGroup

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_active)
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p '%@' active:%@ stations:%@>"), v5, self, self->_localizedTitle, v7, self->_stations);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  _BOOL8 active;
  NSUInteger v4;

  active = self->_active;
  v4 = -[NSString hash](self->_localizedTitle, "hash") ^ active;
  return v4 ^ -[NSArray hash](self->_stations, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RadioRecentStationsGroup *v4;
  NSString *localizedTitle;
  NSArray *stations;
  char v7;

  v4 = (RadioRecentStationsGroup *)a3;
  if (v4 == self)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_active != v4->_active
    || (localizedTitle = self->_localizedTitle, localizedTitle != v4->_localizedTitle)
    && !-[NSString isEqualToString:](localizedTitle, "isEqualToString:"))
  {
    v7 = 0;
    goto LABEL_10;
  }
  stations = self->_stations;
  if (stations == v4->_stations)
  {
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  v7 = -[NSArray isEqualToArray:](stations, "isEqualToArray:");
LABEL_10:

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RadioRecentStationsGroup _copyWithRecentStationsGroupClass:](self, "_copyWithRecentStationsGroupClass:", objc_opt_class());
}

- (id)_copyWithRecentStationsGroupClass:(Class)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 8) = self->_active;
    objc_storeStrong(v4 + 2, self->_localizedTitle);
    objc_storeStrong(v5 + 3, self->_stations);
  }
  return v5;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSArray)stations
{
  return self->_stations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
