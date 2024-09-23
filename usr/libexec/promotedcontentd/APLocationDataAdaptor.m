@implementation APLocationDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.location");
}

- (void)_run:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  APLocationInfo *v6;
  APLocationInfo *location;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSErrorUserInfoKey v46;
  void *v47;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLocationManager sharedInstance](APLocationManager, "sharedInstance"));
  v6 = (APLocationInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationInfo"));
  location = self->_location;
  self->_location = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("country")));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("country")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "isoCountryCode"));
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_12;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("postalCode")));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("postalCode")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "postalCode"));
      v22 = objc_msgSend(v19, "isEqualToString:", v21);

      if (!v22)
        goto LABEL_12;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("adminArea")));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("adminArea")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor adminArea](self, "adminArea"));
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (!v28)
        goto LABEL_12;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("locality")));

    if (!v30)
      goto LABEL_10;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("locality")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor locality](self, "locality"));
    v34 = objc_msgSend(v32, "isEqualToString:", v33);

    if (!v34)
    {
LABEL_12:
      v40 = 0;
    }
    else
    {
LABEL_10:
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("subAdminArea")));

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("subAdminArea")));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor subAdminArea](self, "subAdminArea"));
        v40 = (uint64_t)objc_msgSend(v38, "isEqualToString:", v39);

      }
      else
      {
        v40 = 1;
      }
    }
    v45 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v40));
    v4[2](v4);

  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor identifier](self, "identifier"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@': Location Services disabled on this device"), v41));

    v46 = NSLocalizedDescriptionKey;
    v47 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5208, v43));

    ((void (*)(void (**)(_QWORD), void *, _QWORD, void *))v4[2])(v4, &__kCFBooleanFalse, 0, v44);
  }
}

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)APLocationDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v17, "_validateParameters:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("country")));
  if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v6, CFSTR("country"), objc_opt_class(NSString), a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("adminArea")));
    if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v8, CFSTR("adminArea"), objc_opt_class(NSString), a3))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subAdminArea")));
      if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v10, CFSTR("subAdminArea"), objc_opt_class(NSString), a3))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("postalCode")));
        if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v15, CFSTR("postalCode"), objc_opt_class(NSString), a3))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("locality")));
          v12 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v11, CFSTR("locality"), objc_opt_class(NSString), a3);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)adminArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isoCountryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "administrativeArea"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@"), v4, v6));

  return (NSString *)v7;
}

- (NSString)subAdminArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isoCountryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "administrativeArea"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subAdministrativeArea"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@|%@"), v4, v6, v8));

  return (NSString *)v9;
}

- (NSString)locality
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isoCountryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "administrativeArea"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APLocationDataAdaptor location](self, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locality"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@|%@"), v4, v6, v8));

  return (NSString *)v9;
}

- (APLocationInfo)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
