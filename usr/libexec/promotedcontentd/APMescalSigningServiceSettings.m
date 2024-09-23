@implementation APMescalSigningServiceSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", v3);

  return v4;
}

- (BOOL)useAMSMescal
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningServiceSettings useAMSMescalObject](self, "useAMSMescalObject"));

  if (!v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSigningServiceSettings useAMSMescalObject](self, "useAMSMescalObject"));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setUseAMSMescal:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[APMescalSigningServiceSettings setUseAMSMescalObject:](self, "setUseAMSMescalObject:", v4);

}

- (NSNumber)useAMSMescalObject
{
  return self->_useAMSMescalObject;
}

- (void)setUseAMSMescalObject:(id)a3
{
  objc_storeStrong((id *)&self->_useAMSMescalObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useAMSMescalObject, 0);
}

@end
