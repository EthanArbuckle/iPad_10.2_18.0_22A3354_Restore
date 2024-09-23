@implementation SSMetricsEventLocation

- (NSDictionary)reportingDictionary
{
  void *v3;
  void *v4;
  NSString *type;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_position);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("locationPosition"));

  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("locationType"));
  if (self->_values)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  return (NSDictionary *)v3;
}

- (void)setValue:(id)a3 forLocationKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *values;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  values = self->_values;
  if (v12)
  {
    if (!values)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_values;
      self->_values = v10;

      v7 = v12;
      values = self->_values;
    }
    -[NSMutableDictionary setObject:forKey:](values, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](values, "removeObjectForKey:", v8);
  }

}

- (id)valueForLocationKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_values, "objectForKey:", a3);
}

- (int64_t)locationPosition
{
  return self->_position;
}

- (void)setLocationPosition:(int64_t)a3
{
  self->_position = a3;
}

- (NSString)locationType
{
  return self->_type;
}

- (void)setLocationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
