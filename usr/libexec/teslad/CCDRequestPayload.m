@implementation CCDRequestPayload

- (NSDictionary)dictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v11[0] = CFSTR("device");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDRequestPayload _deviceInfoDictionary](self, "_deviceInfoDictionary"));
  v5 = v4;
  if (!v4)
    v5 = (void *)objc_opt_new(NSDictionary, v3);
  v11[1] = CFSTR("action");
  v12[0] = v5;
  v6 = objc_claimAutoreleasedReturnValue(-[CCDRequestPayload action](self, "action"));
  v7 = (void *)v6;
  v8 = &stru_100019AB0;
  if (v6)
    v8 = (const __CFString *)v6;
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  if (!v4)
  return (NSDictionary *)v9;
}

- (id)_deviceInfoDictionary
{
  void *v2;
  __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities serialNumber](CCDDeviceUtilities, "serialNumber"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CCDFeatures depDeviceSerialNumberWithValue:](CCDFeatures, "depDeviceSerialNumberWithValue:", v2));

  if (v3)
    v4 = v3;
  else
    v4 = &stru_100019AB0;
  v10[0] = CFSTR("serial_number");
  v10[1] = CFSTR("udid");
  v11[0] = v4;
  v5 = objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities UDID](CCDDeviceUtilities, "UDID"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_100019AB0;
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  return v8;
}

- (NSString)action
{
  return 0;
}

@end
