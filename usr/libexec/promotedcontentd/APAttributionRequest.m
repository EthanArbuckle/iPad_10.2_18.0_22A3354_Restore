@implementation APAttributionRequest

- (void)loadDeviceInfo
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
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apDefaultSharedFormatter](NSISO8601DateFormatter, "apDefaultSharedFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromDate:", v3));
  -[APAttributionRequest setTimestamp:](self, "setTimestamp:", v4);

  -[APAttributionRequest setDaemonBundleId:](self, "setDaemonBundleId:", CFSTR("com.apple.ap.promotedcontentd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storefront"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userAgentStringForBundleID:storefront:", CFSTR("com.apple.ap.promotedcontentd"), v7));
  -[APAttributionRequest setUserAgent:](self, "setUserAgent:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemName"));
  -[APAttributionRequest setOsPlatform:](self, "setOsPlatform:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemVersion"));
  -[APAttributionRequest setOsVersion:](self, "setOsVersion:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildVersion"));
  -[APAttributionRequest setOsBuild:](self, "setOsBuild:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceModel"));
  -[APAttributionRequest setDevice:](self, "setDevice:", v12);

}

- (void)loadIDAccountDetails
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toroID"));
  -[APAttributionRequest setToroId:](self, "setToroId:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anonymousDemandID"));
  -[APAttributionRequest setAnonymousDemandId:](self, "setAnonymousDemandId:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storefront"));
  -[APAttributionRequest setStorefront:](self, "setStorefront:", v5);

}

- (void)addCapData:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  -[APAttributionRequest setAttributionDownloadType:](self, "setAttributionDownloadType:", objc_msgSend(v6, "attributionDownloadType"));
  objc_msgSend(v6, "searchAdClickTimestamp");
  -[APAttributionRequest setSearchAdClickTimestamp:](self, "setSearchAdClickTimestamp:");
  -[APAttributionRequest setAttributionDownloadType:](self, "setAttributionDownloadType:", objc_msgSend(v6, "attributionDownloadType"));
  objc_msgSend(v6, "downloadClickTimestamp");
  -[APAttributionRequest setDownloadClickTimestamp:](self, "setDownloadClickTimestamp:");
  objc_msgSend(v6, "downloadClickTimestamp");
  if (v4 != 0.0)
    -[APAttributionRequest setAttributionMetadataExistsOnDevice:](self, "setAttributionMetadataExistsOnDevice:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adMetadata"));
  -[APAttributionRequest setAdMetadata:](self, "setAdMetadata:", v5);

}

- (void)addMetaData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  -[APAttributionRequest setAttributionMetadataExistsOnDevice:](self, "setAttributionMetadataExistsOnDevice:", objc_msgSend(v15, "isAttributed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apDefaultSharedFormatter](NSISO8601DateFormatter, "apDefaultSharedFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "purchaseDate"));
  -[APAttributionRequest setPurchaseTimestamp:](self, "setPurchaseTimestamp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "impressionDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v6));
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  if (v9 > 0.0)
    -[APAttributionRequest setIAdImpressionTimestamp:](self, "setIAdImpressionTimestamp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "conversionDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v10));
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;

  if (v13 > 0.0)
    -[APAttributionRequest setIAdConversionTimestamp:](self, "setIAdConversionTimestamp:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "adamID"));
  -[APAttributionRequest setAdamId:](self, "setAdamId:", v14);

}

- (id)requestHeader
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  BOOL v38;
  _QWORD v39[7];
  _QWORD v40[7];

  v3 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest timestamp](self, "timestamp"));
  if (!v3)
    goto LABEL_19;
  v4 = (void *)v3;
  v5 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest osBuild](self, "osBuild"));
  if (!v5)
    goto LABEL_18;
  v6 = (void *)v5;
  v7 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest osPlatform](self, "osPlatform"));
  if (!v7)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v8 = (void *)v7;
  v9 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest osVersion](self, "osVersion"));
  if (!v9)
  {
LABEL_16:

    goto LABEL_17;
  }
  v10 = (void *)v9;
  v11 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest storefront](self, "storefront"));
  if (!v11)
  {
LABEL_15:

    goto LABEL_16;
  }
  v12 = (void *)v11;
  v13 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest daemonBundleId](self, "daemonBundleId"));
  if (!v13)
  {
LABEL_14:

    goto LABEL_15;
  }
  v14 = (void *)v13;
  v15 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest userAgent](self, "userAgent"));
  if (!v15)
  {

    goto LABEL_14;
  }
  v16 = (void *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest mescalSignature](self, "mescalSignature"));
  if (v17
    || (v37 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest fpdiSignature](self, "fpdiSignature"))) != 0)
  {
    v18 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest mescalSignature](self, "mescalSignature"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest fpdiSignature](self, "fpdiSignature"));
      v38 = v20 != 0;

      v21 = v38;
      if (v17)
        goto LABEL_26;
    }
    else
    {
      if (v17)
      {

        goto LABEL_27;
      }
      v21 = 0;
    }

  }
  else
  {
    v21 = 1;

  }
LABEL_26:

  if ((v21 & 1) == 0)
  {
LABEL_27:
    v39[0] = CFSTR("timestamp");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest timestamp](self, "timestamp"));
    v40[0] = v24;
    v39[1] = CFSTR("osPlatform");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest osPlatform](self, "osPlatform"));
    v40[1] = v25;
    v39[2] = CFSTR("osVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest osVersion](self, "osVersion"));
    v40[2] = v26;
    v39[3] = CFSTR("osBuild");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest osBuild](self, "osBuild"));
    v40[3] = v27;
    v39[4] = CFSTR("storefront");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest storefront](self, "storefront"));
    v40[4] = v28;
    v39[5] = CFSTR("bundleId");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest daemonBundleId](self, "daemonBundleId"));
    v40[5] = v29;
    v39[6] = CFSTR("User-Agent");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest userAgent](self, "userAgent"));
    v40[6] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 7));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v31));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest mescalSignature](self, "mescalSignature"));
    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest mescalSignature](self, "mescalSignature"));
      v35 = CFSTR("X-Apple-ActionSignature");
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest fpdiSignature](self, "fpdiSignature"));

      if (!v36)
      {
LABEL_32:
        v22 = objc_msgSend(v32, "copy");

        return v22;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest fpdiSignature](self, "fpdiSignature"));
      v35 = CFSTR("X-Apple-ActionSignature2");
    }
    objc_msgSend(v32, "setObject:forKey:", v34, v35);

    goto LABEL_32;
  }
LABEL_19:
  v22 = 0;
  return v22;
}

- (NSDictionary)payloadForRequestHeaderABCLog
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v31;
  _QWORD v32[9];
  _QWORD v33[9];

  v32[0] = CFSTR("timestamp");
  v3 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest timestamp](self, "timestamp"));
  v31 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("ERROR This property is nil");
  v33[0] = v4;
  v32[1] = CFSTR("osPlatform");
  v5 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest osPlatform](self, "osPlatform"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("ERROR This property is nil");
  v33[1] = v7;
  v32[2] = CFSTR("osVersion");
  v8 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest osVersion](self, "osVersion"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("ERROR This property is nil");
  v33[2] = v10;
  v32[3] = CFSTR("osBuild");
  v11 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest osBuild](self, "osBuild"));
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("ERROR This property is nil");
  v33[3] = v13;
  v32[4] = CFSTR("storefront");
  v14 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest storefront](self, "storefront"));
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("ERROR This property is nil");
  v33[4] = v16;
  v32[5] = CFSTR("bundleId");
  v17 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest daemonBundleId](self, "daemonBundleId"));
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("ERROR This property is nil");
  v33[5] = v19;
  v32[6] = CFSTR("User-Agent");
  v20 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest userAgent](self, "userAgent"));
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = CFSTR("ERROR This property is nil");
  v33[6] = v22;
  v32[7] = CFSTR("X-Apple-ActionSignature");
  v23 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest mescalSignature](self, "mescalSignature"));
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = CFSTR("This property is nil");
  v33[7] = v25;
  v32[8] = CFSTR("X-Apple-ActionSignature2");
  v26 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest fpdiSignature](self, "fpdiSignature"));
  v27 = (void *)v26;
  if (v26)
    v28 = (const __CFString *)v26;
  else
    v28 = CFSTR("This property is nil");
  v33[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 9));

  return (NSDictionary *)v29;
}

- (id)requestBody
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest toroId](self, "toroId"));
  if (!v4)
    goto LABEL_22;
  v5 = (void *)v4;
  v6 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest anonymousDemandId](self, "anonymousDemandId"));
  if (!v6)
  {
LABEL_24:
    v38 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v7 = (void *)v6;
  v8 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](self, "bundleId"));
  if (!v8)
  {

    goto LABEL_24;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest attributionKey](self, "attributionKey"));

  if (v10)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apDefaultSharedFormatter](NSISO8601DateFormatter, "apDefaultSharedFormatter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest toroId](self, "toroId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("toroId"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest anonymousDemandId](self, "anonymousDemandId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("anonymousDemandId"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](self, "bundleId"));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("bundleId"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest attributionKey](self, "attributionKey"));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("attributionKey"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[APAttributionRequest attributionMetadataExistsOnDevice](self, "attributionMetadataExistsOnDevice")));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("attributionMetadataExistsOnDevice"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APAttributionRequest attributionDownloadType](self, "attributionDownloadType")));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("attributionDownloadType"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[APAttributionRequest developmentApp](self, "developmentApp")));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("developmentApp"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest purchaseTimestamp](self, "purchaseTimestamp"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest purchaseTimestamp](self, "purchaseTimestamp"));
      objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("purchaseTimestamp"));

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest adamId](self, "adamId"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest adamId](self, "adamId"));
      objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("adamId"));

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest adMetadata](self, "adMetadata"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionRequest adMetadata](self, "adMetadata"));
      objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("adMetadata"));

    }
    -[APAttributionRequest iAdConversionTimestamp](self, "iAdConversionTimestamp");
    if (v26 > 0.0)
    {
      -[APAttributionRequest iAdConversionTimestamp](self, "iAdConversionTimestamp");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v27));
      objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("iAdConversionTimestamp"));

    }
    -[APAttributionRequest iAdImpressionTimestamp](self, "iAdImpressionTimestamp");
    if (v29 > 0.0)
    {
      -[APAttributionRequest iAdImpressionTimestamp](self, "iAdImpressionTimestamp");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v30));
      objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("iAdImpressionTimestamp"));

    }
    -[APAttributionRequest searchAdClickTimestamp](self, "searchAdClickTimestamp");
    if (v32 > 0.0)
    {
      -[APAttributionRequest searchAdClickTimestamp](self, "searchAdClickTimestamp");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v33));
      objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("searchAdClickTimestamp"));

    }
    -[APAttributionRequest downloadClickTimestamp](self, "downloadClickTimestamp");
    if (v35 > 0.0)
    {
      -[APAttributionRequest downloadClickTimestamp](self, "downloadClickTimestamp");
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v36));
      objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("downloadClickTimestamp"));

    }
    if (-[APAttributionRequest developmentApp](self, "developmentApp"))
      objc_msgSend(v3, "setObject:forKey:", CFSTR("2020-10-17T05:08:49Z"), CFSTR("purchaseTimestamp"));
    v38 = v3;
    goto LABEL_25;
  }
LABEL_22:
  v38 = 0;
LABEL_26:

  return v38;
}

- (NSDictionary)payloadForRequestBodyABCLog
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[4];

  v17[0] = CFSTR("toroId");
  v3 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest toroId](self, "toroId"));
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("ERROR This property is nil");
  v18[0] = v5;
  v17[1] = CFSTR("anonymousDemandId");
  v6 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest anonymousDemandId](self, "anonymousDemandId"));
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("ERROR This property is nil");
  v18[1] = v8;
  v17[2] = CFSTR("osPlatform");
  v9 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest bundleId](self, "bundleId"));
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("ERROR This property is nil");
  v18[2] = v11;
  v17[3] = CFSTR("osVersion");
  v12 = objc_claimAutoreleasedReturnValue(-[APAttributionRequest attributionKey](self, "attributionKey"));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("ERROR This property is nil");
  v18[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));

  return (NSDictionary *)v15;
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)osPlatform
{
  return self->_osPlatform;
}

- (void)setOsPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_osPlatform, a3);
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setOsBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osBuild, a3);
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSString)daemonBundleId
{
  return self->_daemonBundleId;
}

- (void)setDaemonBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_daemonBundleId, a3);
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
  objc_storeStrong((id *)&self->_storefront, a3);
}

- (NSString)mescalSignature
{
  return self->_mescalSignature;
}

- (void)setMescalSignature:(id)a3
{
  objc_storeStrong((id *)&self->_mescalSignature, a3);
}

- (NSString)fpdiSignature
{
  return self->_fpdiSignature;
}

- (void)setFpdiSignature:(id)a3
{
  objc_storeStrong((id *)&self->_fpdiSignature, a3);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (NSUUID)toroId
{
  return self->_toroId;
}

- (void)setToroId:(id)a3
{
  objc_storeStrong((id *)&self->_toroId, a3);
}

- (NSUUID)anonymousDemandId
{
  return self->_anonymousDemandId;
}

- (void)setAnonymousDemandId:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousDemandId, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)attributionKey
{
  return self->_attributionKey;
}

- (void)setAttributionKey:(id)a3
{
  objc_storeStrong((id *)&self->_attributionKey, a3);
}

- (BOOL)attributionMetadataExistsOnDevice
{
  return self->_attributionMetadataExistsOnDevice;
}

- (void)setAttributionMetadataExistsOnDevice:(BOOL)a3
{
  self->_attributionMetadataExistsOnDevice = a3;
}

- (NSString)purchaseTimestamp
{
  return self->_purchaseTimestamp;
}

- (void)setPurchaseTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseTimestamp, a3);
}

- (int64_t)attributionDownloadType
{
  return self->_attributionDownloadType;
}

- (void)setAttributionDownloadType:(int64_t)a3
{
  self->_attributionDownloadType = a3;
}

- (NSNumber)adamId
{
  return self->adamId;
}

- (void)setAdamId:(id)a3
{
  objc_storeStrong((id *)&self->adamId, a3);
}

- (NSString)adMetadata
{
  return self->adMetadata;
}

- (void)setAdMetadata:(id)a3
{
  objc_storeStrong((id *)&self->adMetadata, a3);
}

- (double)downloadClickTimestamp
{
  return self->_downloadClickTimestamp;
}

- (void)setDownloadClickTimestamp:(double)a3
{
  self->_downloadClickTimestamp = a3;
}

- (double)searchAdClickTimestamp
{
  return self->_searchAdClickTimestamp;
}

- (void)setSearchAdClickTimestamp:(double)a3
{
  self->_searchAdClickTimestamp = a3;
}

- (double)iAdConversionTimestamp
{
  return self->_iAdConversionTimestamp;
}

- (void)setIAdConversionTimestamp:(double)a3
{
  self->_iAdConversionTimestamp = a3;
}

- (double)iAdImpressionTimestamp
{
  return self->_iAdImpressionTimestamp;
}

- (void)setIAdImpressionTimestamp:(double)a3
{
  self->_iAdImpressionTimestamp = a3;
}

- (BOOL)developmentApp
{
  return self->_developmentApp;
}

- (void)setDevelopmentApp:(BOOL)a3
{
  self->_developmentApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->adMetadata, 0);
  objc_storeStrong((id *)&self->adamId, 0);
  objc_storeStrong((id *)&self->_purchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_attributionKey, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_anonymousDemandId, 0);
  objc_storeStrong((id *)&self->_toroId, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_fpdiSignature, 0);
  objc_storeStrong((id *)&self->_mescalSignature, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_daemonBundleId, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_osPlatform, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
