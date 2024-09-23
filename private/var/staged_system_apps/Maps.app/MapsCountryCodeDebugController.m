@implementation MapsCountryCodeDebugController

- (MapsCountryCodeDebugController)init
{
  MapsCountryCodeDebugController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *actualCountry;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsCountryCodeDebugController;
  v2 = -[MapsDebugValuesViewController init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_countryChanged:", GEOCountryConfigurationCountryCodeDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCode"));
    actualCountry = v2->_actualCountry;
    v2->_actualCountry = (NSString *)v5;

  }
  return v2;
}

- (void)_countryChanged:(id)a3
{
  NSString *v4;
  NSString *actualCountry;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", GEODeviceCountryCodeKey));
  actualCountry = self->_actualCountry;
  self->_actualCountry = v4;

  -[MapsDebugValuesViewController rebuildSections](self, "rebuildSections");
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Country Code");
}

+ (id)_knownCountryCodes
{
  return &off_1012741D8;
}

+ (id)_namesOfCountriesWithKnownCodes
{
  return &off_1012741F0;
}

- (id)_countryCode
{
  uint64_t String;
  void *v3;

  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldOverrideCountryCode[0], GeoServicesConfig_ShouldOverrideCountryCode[1]))
  {
    String = GEOConfigGetString(GeoServicesConfig_OverrideCountryCode[0], GeoServicesConfig_OverrideCountryCode[1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue(String);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setCountryCode:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale ISOCountryCodes](NSLocale, "ISOCountryCodes")),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        (v6 & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\" Is not a valid ISO Country Code"), v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Oops"), v8, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
    objc_msgSend(v9, "addAction:", v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A128AC;
    v12[3] = &unk_1011AC860;
    v12[4] = self;
    -[MapsCountryCodeDebugController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v12);

  }
  else
  {
    GEOConfigSetBOOL(GeoServicesConfig_ShouldOverrideCountryCode[0], GeoServicesConfig_ShouldOverrideCountryCode[1], v4 != 0);
    v7 = GeoServicesConfig_OverrideCountryCode[1];
    if (v4)
      GEOConfigSetString(GeoServicesConfig_OverrideCountryCode[0], v7, v4);
    else
      _GEOConfigRemoveValue(GeoServicesConfig_OverrideCountryCode[0], v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    objc_msgSend(v11, "updateProvidersForCurrentCountry");

    -[MapsDebugValuesViewController reloadData](self, "reloadData");
  }

}

- (void)prepareContent
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_msgSend((id)objc_opt_class(self), "_knownCountryCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(self), "_namesOfCountriesWithKnownCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100A12BD0;
  v30[4] = sub_100A12BE0;
  v31 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100A12BE8;
  v25[3] = &unk_1011DF9F0;
  v29 = v30;
  v25[4] = self;
  v8 = v4;
  v26 = v8;
  v9 = v6;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A12DD8;
  v23[3] = &unk_1011B4E90;
  objc_copyWeak(&v24, &location);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A12E10;
  v21[3] = &unk_1011B4EB8;
  objc_copyWeak(&v22, &location);
  v11 = +[MapsDebugCheckmarkRowsGroup rowsGroupContainingRows:withContent:get:set:](MapsDebugCheckmarkRowsGroup, "rowsGroupContainingRows:withContent:get:set:", 0, v25, v23, v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100A12E58;
  v20[3] = &unk_1011DFA18;
  v20[4] = v30;
  v12 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A12E6C;
  v18[3] = &unk_1011B4BC0;
  v13 = v10;
  v19 = v13;
  v14 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A12F68;
  v16[3] = &unk_1011AEAC8;
  objc_copyWeak(&v17, &location);
  v15 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  _Block_object_dispose(v30, 8);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualCountry, 0);
}

@end
