@implementation NCNotificationAction(Siri)

- (uint64_t)isSiriAction
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return objc_msgSend(a1, "_isSiriAction");
  return result;
}

- (uint64_t)_isSiriAction
{
  int v2;
  int v3;
  int v4;
  unsigned int v5;

  v2 = objc_msgSend(a1, "isSiriActionCandidate");
  v3 = objc_msgSend(a1, "isSiriAvailable");
  v4 = objc_msgSend(a1, "isDrivingFocusEnabled");
  v5 = v4 & (objc_msgSend(a1, "isUserConnectedToCarPlay") ^ 1);
  if (!v3)
    v5 = 0;
  if (v2)
    return v5;
  else
    return 0;
}

- (uint64_t)isSiriAvailable
{
  uint64_t result;

  result = objc_msgSend(a1, "isSiriEnabled");
  if ((_DWORD)result)
  {
    result = objc_msgSend(a1, "isSiriSupported");
    if ((_DWORD)result)
      return objc_msgSend(a1, "isSiriRestricted") ^ 1;
  }
  return result;
}

- (uint64_t)isSiriEnabled
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D97808], "sharedSystemState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "siriIsEnabled");

  return v1;
}

- (uint64_t)isSiriRestricted
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D97808], "sharedSystemState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "siriIsRestricted");

  return v1;
}

- (uint64_t)isSiriSupported
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D97808], "sharedSystemState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "siriIsSupported");

  return v1;
}

- (uint64_t)isDrivingFocusEnabled
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D97808], "sharedSystemState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "carDNDActive");

  return v1;
}

- (uint64_t)isUserConnectedToBluetoothDevice
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D97808], "sharedSystemState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isConnectedToEyesFreeDevice");

  return v1;
}

- (uint64_t)isUserConnectedToCarPlay
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D97808], "sharedSystemState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isConnectedToCarPlay");

  return v1;
}

@end
