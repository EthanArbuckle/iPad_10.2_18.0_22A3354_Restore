@implementation _BKHIDHumanPresenceSensorRecord

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = NSStringFromBKSHIDServicesHumanPresenceStatus(self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("status"));

  v7 = objc_msgSend(v3, "appendFloat:withName:", CFSTR("proximityInCentimeters"), self->_proximityInCentimeters);
  v8 = objc_msgSend(v3, "appendBool:withName:", self->_humanIsPresent, CFSTR("humanIsPresent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v9;
}

- (void)_resetServiceStatus
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  unsigned int v8;
  uint64_t v9;
  unint64_t status;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  self->_status &= 0xFFFFFFFFFFFFFFFCLL;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_services;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "primaryUsage", (_QWORD)v12);
        if (v8 == 17)
        {
          v9 = 1;
        }
        else
        {
          if (v8 != 18)
            continue;
          v9 = 2;
        }
        self->_status |= v9;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  status = self->_status;
  v11 = status & 0xFFFFFFFFFFFFFFFBLL;
  if ((status & 1) == 0 || (v11 = self->_status, (v11 & 2) == 0))
  {
    if ((v11 & 2) == 0)
      v11 &= ~8uLL;
    self->_status = v11;
  }
}

- (void)setProximityInCentimeters:(double)a3
{
  if (self->_proximityInCentimeters != a3)
  {
    self->_proximityInCentimeters = a3;
    self->_status |= 8uLL;
  }
}

- (void)setHumanIsPresent:(BOOL)a3
{
  if (self->_humanIsPresent != a3)
  {
    self->_humanIsPresent = a3;
    self->_status |= 4uLL;
  }
}

- (void)addService:(id)a3
{
  id v4;
  NSMutableArray *services;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  services = self->_services;
  v8 = v4;
  if (!services)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_services;
    self->_services = v6;

    v4 = v8;
    services = self->_services;
  }
  -[NSMutableArray addObject:](services, "addObject:", v4);
  -[_BKHIDHumanPresenceSensorRecord _resetServiceStatus](self, "_resetServiceStatus");

}

- (void)removeService:(id)a3
{
  -[NSMutableArray removeObject:](self->_services, "removeObject:", a3);
  -[_BKHIDHumanPresenceSensorRecord _resetServiceStatus](self, "_resetServiceStatus");
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (double)proximityInCentimeters
{
  return self->_proximityInCentimeters;
}

- (BOOL)humanIsPresent
{
  return self->_humanIsPresent;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

@end
