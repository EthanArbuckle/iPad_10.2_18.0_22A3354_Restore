@implementation NSUUID

+ (id)uuidFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint8_t buf[4];
  id v11;
  _DWORD v12[3];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0xC)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@"), v3, v3, v3, v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
  }
  if ((unint64_t)objc_msgSend(v4, "length") < 0xC)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      LOWORD(v12[0]) = 2112;
      *(_QWORD *)((char *)v12 + 2) = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Input string is not valid, string, %@, UUID, %@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(v4, "getBytes:range:", buf, 0, 12);
    v12[0] = objc_msgSend(v3, "hash");
    v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", buf);
  }

  return v6;
}

@end
