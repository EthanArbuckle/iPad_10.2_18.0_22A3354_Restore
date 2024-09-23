@implementation FMDRequestFMIPUnregister

- (FMDRequestFMIPUnregister)initWithAccount:(id)a3 device:(id)a4 otherDevices:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDRequestFMIPUnregister *v11;
  FMDRequestFMIPUnregister *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestFMIPUnregister;
  v11 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v8);
  v12 = v11;
  if (v11)
  {
    -[FMDRequestFMIPUnregister setAccount:](v11, "setAccount:", v8);
    -[FMDRequestFMIPUnregister setDevice:](v12, "setDevice:", v9);
    -[FMDRequestFMIPUnregister setOtherDevices:](v12, "setOtherDevices:", v10);
  }

  return v12;
}

- (id)urlTemplateType
{
  return CFSTR("unregisterV2");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  FMDActingRequestDecorator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];

  v30.receiver = self;
  v30.super_class = (Class)FMDRequestFMIPUnregister;
  v3 = -[FMDRequest requestBody](&v30, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc_init(FMDActingRequestDecorator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](v5, "standardDeviceContext"));

  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestFMIPUnregister device](self, "device"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "udid"));
    v11 = (uint64_t)objc_msgSend(v10, "isEqualToString:", v8);

  }
  else
  {
    v11 = 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestFMIPUnregister device](self, "device"));
  -[FMDRequestFMIPUnregister _dumpInfoForDevice:into:host:](self, "_dumpInfoForDevice:into:host:", v12, v4, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestFMIPUnregister otherDevices](self, "otherDevices"));
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v24 = v8;
    v25 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestFMIPUnregister otherDevices](self, "otherDevices"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          -[FMDRequestFMIPUnregister _dumpInfoForDevice:into:host:](self, "_dumpInfoForDevice:into:host:", v21, v22, 0);
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("otherDevices"));
    v8 = v24;
    v6 = v25;
  }
  if ((v11 & 1) == 0)
    objc_msgSend(v4, "fm_safeSetObject:forKey:", v8, CFSTR("hostDeviceUdid"));

  return v4;
}

- (id)authToken
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestFMIPUnregister account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oneTimeRemoveAuthToken"));

  return v3;
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (BOOL)canReplace:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(FMDRequest, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (void)_dumpInfoForDevice:(id)a3 into:(id)a4 host:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "udid"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("udid"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "productType"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("productType"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "buildVersion"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("buildVersion"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "productVersion"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "unregisterToken"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("unregisterToken"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pairingId"));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("pairingId"), v14);

  if (!a5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v23, "paired")));
    objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("paired"), v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v23, "migrationConfirmed")));
    objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("migrationConfirmed"), v16);

  }
  v17 = objc_msgSend(v23, "disableContext");
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("fmipDisableReason"));

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("deviceInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imei"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("imei"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imei2"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("imei2"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "meid"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("meid"), v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "serialNumber"));
  objc_msgSend(v7, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v22);

}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FMDFMIPUnregisterDeviceInfo)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSArray)otherDevices
{
  return self->_otherDevices;
}

- (void)setOtherDevices:(id)a3
{
  objc_storeStrong((id *)&self->_otherDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherDevices, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
