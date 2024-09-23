@implementation WFLocationValue

- (WFLocationValue)initWithLocationName:(id)a3
{
  id v4;
  WFLocationValue *v5;
  uint64_t v6;
  NSString *locationName;
  WFLocationValue *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationValue;
  v5 = -[WFLocationValue init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    locationName = v5->_locationName;
    v5->_locationName = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFLocationValue)initWithPlacemark:(id)a3
{
  id v5;
  WFLocationValue *v6;
  WFLocationValue *v7;
  WFLocationValue *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationValue;
  v6 = -[WFLocationValue init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placemark, a3);
    v8 = v7;
  }

  return v7;
}

- (WFLocationValue)initWithLocationName:(id)a3 placemark:(id)a4
{
  id v6;
  id v7;
  WFLocationValue *v8;
  uint64_t v9;
  NSString *locationName;
  WFLocationValue *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFLocationValue;
  v8 = -[WFLocationValue init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    locationName = v8->_locationName;
    v8->_locationName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_placemark, a4);
    v11 = v8;
  }

  return v8;
}

- (WFLocationValue)initWithCurrentLocation
{
  WFLocationValue *v2;
  WFLocationValue *v3;
  WFLocationValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFLocationValue;
  v2 = -[WFLocationValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentLocation = 1;
    v4 = v2;
  }

  return v3;
}

- (NSString)displayString
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[WFLocationValue locationName](self, "locationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WFLocationValue placemark](self, "placemark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFLocationValue placemark](self, "placemark");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v5 = v8;
      }
      else
      {
        -[WFLocationValue placemark](self, "placemark");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postalAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "street");
        v5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (-[WFLocationValue isCurrentLocation](self, "isCurrentLocation"))
      {
        WFLocalizedString(CFSTR("Current Location"));
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      -[WFLocationValue legacyVariableString](self, "legacyVariableString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v5 = 0;
        return (NSString *)v5;
      }
      -[WFLocationValue legacyVariableString](self, "legacyVariableString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingVariablesWithNames");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

    return (NSString *)v5;
  }
  -[WFLocationValue locationName](self, "locationName");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v5 = (id)v4;
  return (NSString *)v5;
}

- (NSString)defaultSearchText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WFLocationValue locationName](self, "locationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFLocationValue locationName](self, "locationName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFLocationValue placemark](self, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFLocationValue placemark](self, "placemark");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v4 = v7;
      }
      else
      {
        -[WFLocationValue placemark](self, "placemark");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "postalAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "street");
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      -[WFLocationValue legacyVariableString](self, "legacyVariableString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v4 = 0;
        return (NSString *)v4;
      }
      -[WFLocationValue legacyVariableString](self, "legacyVariableString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByRemovingVariables");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return (NSString *)v4;
}

- (WFLocationValue)initWithLegacyVariableString:(id)a3
{
  id v5;
  WFLocationValue *v6;
  WFLocationValue *v7;
  WFLocationValue *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationValue;
  v6 = -[WFLocationValue init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_legacyVariableString, a3);
    v8 = v7;
  }

  return v7;
}

- (WFLocationValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  WFLocationValue *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  WFLocationValue *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  void *v28;
  WFVariableString *v29;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("isCurrentLocation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (!v16)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("placemark"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    WFEnforceClass(v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      WFCLPlacemarkFromSerializedPlacemark();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[WFLocationValue initWithPlacemark:](self, "initWithPlacemark:", v21);
    }
    else
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("locationName"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_class();
      WFEnforceClass(v23, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("legacyVariableString"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_class();
        WFEnforceClass(v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = -[WFVariableString initWithSerializedRepresentation:variableProvider:parameter:]([WFVariableString alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v28, v8, v9);
          self = -[WFLocationValue initWithLegacyVariableString:](self, "initWithLegacyVariableString:", v29);

          v17 = self;
        }
        else
        {
          v17 = 0;
        }

        v21 = 0;
        goto LABEL_10;
      }
      v22 = -[WFLocationValue initWithLocationName:](self, "initWithLocationName:", v21);
    }
    self = v22;
    v17 = self;
LABEL_10:

    goto LABEL_11;
  }
  self = -[WFLocationValue initWithCurrentLocation](self, "initWithCurrentLocation");
  v17 = self;
LABEL_11:

  return v17;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  if (-[WFLocationValue isCurrentLocation](self, "isCurrentLocation"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isCurrentLocation"));
  -[WFLocationValue locationName](self, "locationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("locationName"));

  -[WFLocationValue placemark](self, "placemark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFSerializedPlacemarkFromCLPlacemark();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("placemark"));

  -[WFLocationValue legacyVariableString](self, "legacyVariableString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("legacyVariableString"));

  return (WFPropertyListObject *)v3;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (BOOL)isCurrentLocation
{
  return self->_currentLocation;
}

- (WFVariableString)legacyVariableString
{
  return self->_legacyVariableString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyVariableString, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
}

@end
