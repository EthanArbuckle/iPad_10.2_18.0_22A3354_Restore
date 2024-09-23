@implementation HAPAccessoryInfo

- (HAPAccessoryInfo)initWithName:(id)a3 manufacturer:(id)a4 modelName:(id)a5 category:(id)a6 certificationStatus:(id)a7 denylisted:(id)a8 ppid:(id)a9
{
  __CFString *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  HAPAccessoryInfo *v23;
  HAPAccessoryInfo *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;

  v15 = (__CFString *)a3;
  v16 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v18 = a9;
  if (!v15)
  {
    v19 = sub_10007CCE4(0, v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = sub_10007CD2C(0);
      v26 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Accessory name is Unknown", buf, 0xCu);

      v16 = v26;
    }

    v15 = CFSTR("Unknown");
  }
  v31.receiver = self;
  v31.super_class = (Class)HAPAccessoryInfo;
  v23 = -[HAPAccessoryInfo init](&v31, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_name, v15);
    objc_storeStrong((id *)&v24->_manufacturer, a4);
    objc_storeStrong((id *)&v24->_modelName, a5);
    objc_storeStrong((id *)&v24->_category, a6);
    objc_storeStrong((id *)&v24->_certificationStatus, a7);
    objc_storeStrong((id *)&v24->_denylisted, a8);
    objc_storeStrong((id *)&v24->_ppid, a9);
    v24->_authenticated = 0;
  }

  return v24;
}

- (BOOL)isCertified
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo certificationStatus](self, "certificationStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uppercaseString"));
  v4 = objc_msgSend(CFSTR("CERTIFIED"), "isEqualToString:", v3);

  return v4;
}

- (BOOL)isDenylisted
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo denylisted](self, "denylisted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uppercaseString"));
  v4 = objc_msgSend(CFSTR("YES"), "isEqualToString:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo manufacturer](self, "manufacturer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo modelName](self, "modelName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo category](self, "category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo certificationStatus](self, "certificationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo denylisted](self, "denylisted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryInfo ppid](self, "ppid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name: %@, Manufacturer: %@, Model: %@, Category: %@, Certification Status: %@, denylisted: %@, ppid: %@"), v3, v4, v5, v6, v7, v8, v9));

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSNumber)category
{
  return self->_category;
}

- (NSString)certificationStatus
{
  return self->_certificationStatus;
}

- (NSString)denylisted
{
  return self->_denylisted;
}

- (NSString)ppid
{
  return self->_ppid;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_denylisted, 0);
  objc_storeStrong((id *)&self->_certificationStatus, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
