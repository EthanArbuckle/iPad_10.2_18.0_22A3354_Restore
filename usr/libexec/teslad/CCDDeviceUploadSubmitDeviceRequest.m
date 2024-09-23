@implementation CCDDeviceUploadSubmitDeviceRequest

- (int64_t)requestType
{
  return 3;
}

- (id)httpMethod
{
  return CFSTR("POST");
}

- (id)endpointPath
{
  return CFSTR("/device/upload/submitrequest");
}

- (id)requestBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[9];
  _QWORD v21[9];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadSubmitDeviceRequest submitDeviceRequestPayload](self, "submitDeviceRequestPayload"));
  v20[0] = kDEPDeviceUploadOrgIdKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orgId"));
  v21[0] = v19;
  v20[1] = kDEPDeviceUploadOrgNameKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orgName"));
  v21[1] = v18;
  v20[2] = kDEPDeviceUploadRequestTypeKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "code"));
  v21[2] = v16;
  v20[3] = kDEPDeviceUploadSubmitterDsidKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "submitter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dsid"));
  v21[3] = v4;
  v20[4] = kDEPDeviceUploadSubmitterNameKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "submitter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v21[4] = v6;
  v20[5] = kDEPDeviceUploadSoldToIdKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "soldToId"));
  v21[5] = v7;
  v20[6] = kDEPDeviceUploadApproverDsidKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "approver"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dsid"));
  v21[6] = v9;
  v20[7] = kDEPDeviceUploadApproverNameKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "approver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v21[7] = v11;
  v20[8] = kDEPDeviceUploadDeviceDetailsKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadSubmitDeviceRequest _deviceDetails](self, "_deviceDetails"));
  v21[8] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 9));

  return v14;
}

- (id)_deviceDetails
{
  __CFString *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];
  _QWORD v17[8];
  _QWORD v18[8];
  void *v19;

  if (+[CCDDeviceUtilities isiPad](CCDDeviceUtilities, "isiPad"))
  {
    v2 = CFSTR("MQD22/A");
  }
  else if (+[CCDDeviceUtilities isiPhone](CCDDeviceUtilities, "isiPhone"))
  {
    v2 = CFSTR("MNAC2/A");
  }
  else
  {
    v3 = +[CCDDeviceUtilities isAppleTV](CCDDeviceUtilities, "isAppleTV");
    if (v3)
    {
      v2 = CFSTR("MR8A2/A");
    }
    else
    {
      v6 = *(NSObject **)(DEPLogObjects(v3, v4, v5) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unknown device type. Using actual model number, which is unlikely to work once the request is approved", v16, 2u);
      }
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities modelNumber](CCDDeviceUtilities, "modelNumber"));
    }
  }
  v17[0] = kDEPDeviceUploadSerialNumberKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities serialNumber](CCDDeviceUtilities, "serialNumber"));
  v18[0] = v7;
  v17[1] = kDEPDeviceUploadProductFamilyKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceType](CCDDeviceUtilities, "deviceType"));
  v18[1] = v8;
  v18[2] = CFSTR("iOS Device");
  v17[2] = kDEPDeviceUploadProductDescriptionKey;
  v17[3] = kDEPDeviceUploadStorageSizeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceCapacity](CCDDeviceUtilities, "deviceCapacity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  v18[3] = v10;
  v18[4] = CFSTR("size unknown");
  v17[4] = kDEPDeviceUploadScreenSizeKey;
  v17[5] = kDEPDeviceUploadColorKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceColor](CCDDeviceUtilities, "deviceColor"));
  v18[5] = v11;
  v17[6] = kDEPDeviceUploadModelKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDDeviceUtilities deviceType](CCDDeviceUtilities, "deviceType"));
  v17[7] = kDEPDeviceUploadPartNumberKey;
  v18[6] = v12;
  v18[7] = v2;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 8));
  v19 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));

  return v14;
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)submitDeviceRequestPayload
{
  return self->_submitDeviceRequestPayload;
}

- (void)setSubmitDeviceRequestPayload:(id)a3
{
  objc_storeStrong((id *)&self->_submitDeviceRequestPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitDeviceRequestPayload, 0);
}

@end
