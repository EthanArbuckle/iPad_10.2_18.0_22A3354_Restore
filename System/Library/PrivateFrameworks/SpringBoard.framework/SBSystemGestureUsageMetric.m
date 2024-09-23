@implementation SBSystemGestureUsageMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;

  v6 = a4;
  v7 = v6;
  if (a3 == 3)
  {
    objc_msgSend(v6, "eventPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self->_currentLocation = SBAnalyticsLayoutLocationForDisplayLayoutElements(v9);
    v11 = 1;
LABEL_11:

    goto LABEL_12;
  }
  if (a3 == 12)
  {
    objc_msgSend(v6, "eventPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF58]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_typeToMetric, "objectForKeyedSubscript:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = -[SBSystemGestureMetric initForType:parentMetric:]([SBSystemGestureMetric alloc], "initForType:parentMetric:", objc_msgSend(v9, "unsignedIntegerValue"), self);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_typeToMetric, "setObject:forKeyedSubscript:", v10, v9);
      }
      v11 = objc_msgSend(v10, "handleEvent:withContext:", 12, v7);
      if ((unint64_t)(objc_msgSend(v10, "currentState") - 3) <= 2)
        -[NSMutableDictionary removeObjectForKey:](self->_typeToMetric, "removeObjectForKey:", v9);

      goto LABEL_11;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)currentLocation
{
  return self->_currentLocation;
}

- (SBSystemGestureUsageMetric)init
{
  SBSystemGestureUsageMetric *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *typeToMetric;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSystemGestureUsageMetric;
  v2 = -[SBSystemGestureUsageMetric init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    typeToMetric = v2->_typeToMetric;
    v2->_typeToMetric = v3;

  }
  return v2;
}

- (void)setCurrentLocation:(unint64_t)a3
{
  self->_currentLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeToMetric, 0);
}

@end
