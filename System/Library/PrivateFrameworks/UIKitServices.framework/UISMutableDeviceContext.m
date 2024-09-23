@implementation UISMutableDeviceContext

- (void)setDeviceInfoValue:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!-[UISDeviceContext _isDeviceInfoValue:appropriateForKey:](self, "_isDeviceInfoValue:appropriateForKey:", v9, v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 207, CFSTR("values like '%@' aren't valid for the key '%@'"), v9, v7);

  }
  -[NSDictionary setObject:forKey:](self->super._deviceInfoKeysToValues, "setObject:forKey:", v9, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UISDeviceContext initWithDeviceInfoValues:]([UISDeviceContext alloc], "initWithDeviceInfoValues:", self->super._deviceInfoKeysToValues);
}

- (id)_dictionaryWithOnlyValidKeysFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISMutableDeviceContext;
  -[UISDeviceContext _dictionaryWithOnlyValidKeysFromDictionary:](&v6, sel__dictionaryWithOnlyValidKeysFromDictionary_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

@end
