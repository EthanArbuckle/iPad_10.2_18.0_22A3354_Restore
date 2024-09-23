@implementation _SUIAAbstractDictionaryBackedConfiguration

- (_SUIAAbstractDictionaryBackedConfiguration)init
{
  _SUIAAbstractDictionaryBackedConfiguration *v2;
  uint64_t v3;
  NSMutableDictionary *propertyDictionary;
  uint64_t v5;
  NSMutableDictionary *behaviorSettingsDictionary;
  uint64_t v7;
  NSMutableDictionary *delayDictionary;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SUIAAbstractDictionaryBackedConfiguration;
  v2 = -[_SUIAAbstractDictionaryBackedConfiguration init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    propertyDictionary = v2->_propertyDictionary;
    v2->_propertyDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    behaviorSettingsDictionary = v2->_behaviorSettingsDictionary;
    v2->_behaviorSettingsDictionary = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    delayDictionary = v2->_delayDictionary;
    v2->_delayDictionary = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)_setBehaviorSettings:(id)a3 forKeypath:(id)a4
{
  NSMutableDictionary *behaviorSettingsDictionary;

  behaviorSettingsDictionary = self->_behaviorSettingsDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](behaviorSettingsDictionary, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](behaviorSettingsDictionary, "removeObjectForKey:", a4);
}

- (id)behaviorSettingsForKeypath:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[NSMutableDictionary objectForKey:](self->_behaviorSettingsDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)_setDelay:(double)a3 forApplicationOfKeypath:(id)a4
{
  int IsZero;
  NSMutableDictionary *delayDictionary;
  void *v8;
  id v9;

  v9 = a4;
  IsZero = BSFloatIsZero();
  delayDictionary = self->_delayDictionary;
  if (IsZero)
  {
    -[NSMutableDictionary removeObjectForKey:](delayDictionary, "removeObjectForKey:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](delayDictionary, "setObject:forKey:", v8, v9);

  }
}

- (double)delayForApplicationOfKeypath:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  float v10;
  double v11;

  -[NSMutableDictionary objectForKey:](self->_delayDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "bs_CGFloatValue");
    v9 = v8;
    UIAnimationDragCoefficient();
    v11 = v9 * v10;
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayDictionary, 0);
  objc_storeStrong((id *)&self->_behaviorSettingsDictionary, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
}

@end
