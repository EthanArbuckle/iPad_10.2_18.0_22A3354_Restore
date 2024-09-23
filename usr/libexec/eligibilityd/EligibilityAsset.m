@implementation EligibilityAsset

- (id)_policiesForRawArray:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  NSMutableDictionary *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const __CFString *v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  if (v3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9);
          v11 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = v10;
            v13 = objc_opt_new(NSMutableDictionary);
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_100017140;
            v19[3] = &unk_100030DE8;
            v14 = v13;
            v20 = v14;
            -[NSObject enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v19);
            if (-[NSMutableDictionary count](v14, "count"))
            {
              v15 = -[NSMutableDictionary copy](v14, "copy");
              -[NSMutableArray addObject:](v4, "addObject:", v15);

            }
          }
          else
          {
            v16 = sub_10000C5FC();
            v12 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v26 = "-[EligibilityAsset _policiesForRawArray:]";
              v27 = 2112;
              v28 = CFSTR("Policies");
              _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: Mobile Asset has a policy in \"%@\" that is not of NSDictionary type", buf, 0x16u);
            }
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v7);
    }

    v17 = -[NSMutableArray copy](v4, "copy");
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_initEnabledKeyWithDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("Enabled")));
  if (v4)
  {
    v7 = v4;
    v5 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
      v6 = objc_msgSend(v7, "BOOLValue");
    else
      v6 = 1;
    v4 = v7;
  }
  else
  {
    v6 = 1;
  }
  self->_isEnabled = v6;

}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  __CFString *v7;
  id v8;
  EligibilityAsset *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  EligibilityAsset *v18;
  uint64_t v19;
  EligibilityAsset *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  EligibilityAsset *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  EligibilityAsset *v36;
  NSObject *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  EligibilityAsset *v44;
  NSObject *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  EligibilityAsset *v51;
  void *v52;
  objc_super v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  const __CFString *v58;

  v7 = (__CFString *)a3;
  v8 = a4;
  v54.receiver = self;
  v54.super_class = (Class)EligibilityAsset;
  v9 = -[EligibilityAsset init](&v54, "init");
  if (!v9)
  {
LABEL_52:
    v18 = v9;
    goto LABEL_53;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  if (v10)
  {
    v11 = (void *)v10;
    objc_storeStrong((id *)&v9->_name, a3);
    -[EligibilityAsset _initEnabledKeyWithDictionary:](v9, "_initEnabledKeyWithDictionary:", v11);
    if (-[EligibilityAsset conformsToProtocol:](v9, "conformsToProtocol:", &OBJC_PROTOCOL___LocatedCountryAssetProtocol_private))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Country Codes")));
      v13 = objc_opt_class(NSArray);
      v14 = v12;
      if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      if (v15 && (v19 = objc_opt_class(NSString), sub_100016424(v15, v19)))
      {
        v20 = v9;
        v21 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));
        -[EligibilityAsset setCountryCodes:](v20, "setCountryCodes:", v21);

      }
      else
      {
        v22 = sub_10000C5FC();
        v21 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          v57 = 2112;
          v58 = CFSTR("Country Codes");
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSArray type", buf, 0x16u);
        }
      }

    }
    if (-[EligibilityAsset conformsToProtocol:](v9, "conformsToProtocol:", &OBJC_PROTOCOL___GracePeriodAssetProtocol_private))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Grace Period")));
      v24 = objc_opt_class(NSNumber);
      v25 = v23;
      if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0)
        v26 = v25;
      else
        v26 = 0;

      v27 = v9;
      if (v26)
      {
        v28 = objc_msgSend(v26, "unsignedIntegerValue");
      }
      else
      {
        v29 = sub_10000C5FC();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          v57 = 2112;
          v58 = CFSTR("Grace Period");
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSNumber type", buf, 0x16u);
        }

        v28 = 0;
      }
      -[EligibilityAsset setGracePeriodInSeconds:](v27, "setGracePeriodInSeconds:", v28);

    }
    if (-[EligibilityAsset conformsToProtocol:](v9, "conformsToProtocol:", &OBJC_PROTOCOL___BillingCountryAssetProtocol_private))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Billing Countries")));
      v32 = objc_opt_class(NSArray);
      v33 = v31;
      if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0)
        v34 = v33;
      else
        v34 = 0;

      if (v34 && (v35 = objc_opt_class(NSString), sub_100016424(v34, v35)))
      {
        v36 = v9;
        v37 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v34));
        -[EligibilityAsset setBillingCountryCodes:](v36, "setBillingCountryCodes:", v37);

      }
      else
      {
        v38 = sub_10000C5FC();
        v37 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          v57 = 2112;
          v58 = CFSTR("Billing Countries");
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSArray type", buf, 0x16u);
        }
      }

    }
    if (-[EligibilityAsset conformsToProtocol:](v9, "conformsToProtocol:", &OBJC_PROTOCOL___RegionSKUAssetProtocol_private))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Region SKUs")));
      v40 = objc_opt_class(NSArray);
      v41 = v39;
      if ((objc_opt_isKindOfClass(v41, v40) & 1) != 0)
        v42 = v41;
      else
        v42 = 0;

      if (v42 && (v43 = objc_opt_class(NSString), sub_100016424(v42, v43)))
      {
        v44 = v9;
        v45 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v42));
        -[EligibilityAsset setRegionSKUs:](v44, "setRegionSKUs:", v45);

      }
      else
      {
        v46 = sub_10000C5FC();
        v45 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          v57 = 2112;
          v58 = CFSTR("Region SKUs");
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s: Mobile Asset is missing key \"%@\" of NSArray type", buf, 0x16u);
        }
      }

    }
    if (-[EligibilityAsset conformsToProtocol:](v9, "conformsToProtocol:", &OBJC_PROTOCOL___PolicyAssetProtocol_private))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Policies")));
      v48 = objc_opt_class(NSArray);
      v49 = v47;
      if ((objc_opt_isKindOfClass(v49, v48) & 1) != 0)
        v50 = v49;
      else
        v50 = 0;

      v51 = v9;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset _policiesForRawArray:](v51, "_policiesForRawArray:", v50));
      -[EligibilityAsset setPolicies:](v51, "setPolicies:", v52);

    }
    goto LABEL_52;
  }
  v16 = sub_10000C5FC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
    v57 = 2112;
    v58 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Mobile Asset does not contain the %@ domain", buf, 0x16u);
  }

  v18 = 0;
LABEL_53:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setName:", v7);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  EligibilityAsset *v4;
  uint64_t v5;
  EligibilityAsset *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = (EligibilityAsset *)a3;
  v13.receiver = self;
  v13.super_class = (Class)EligibilityAsset;
  if (!-[EligibilityAsset isEqual:](&v13, "isEqual:", v4))
    goto LABEL_9;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_11;
  }
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](v6, "name"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[EligibilityAsset isEqual:]";
        v16 = 2080;
        v17 = "name";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }

    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Eligibility Asset name:%@]"), v2));

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
