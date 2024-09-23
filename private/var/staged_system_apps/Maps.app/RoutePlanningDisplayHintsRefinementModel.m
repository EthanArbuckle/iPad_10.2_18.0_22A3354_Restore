@implementation RoutePlanningDisplayHintsRefinementModel

+ (id)requirementFieldsForDisplayHints:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableIndexSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "surchargeOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "surchargeTypes"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(v4, "addIndex:", 2);
  if (objc_msgSend(v3, "availablePaymentTypesCount") && objc_msgSend(v3, "availablePaymentTypesCount"))
  {
    v8 = 0;
    while (objc_msgSend(v3, "availablePaymentTypeAtIndex:", v8) != 1)
    {
      if (++v8 >= (unint64_t)objc_msgSend(v3, "availablePaymentTypesCount"))
        goto LABEL_10;
    }
    objc_msgSend(v4, "addIndex:", 1);
  }
LABEL_10:
  if (objc_msgSend(v3, "availablePrioritizationsCount"))
    objc_msgSend(v4, "addIndex:", 0);
  v9 = objc_msgSend(v4, "copy");

  return v9;
}

- (RoutePlanningDisplayHintsRefinementModel)initWithDelegate:(id)a3 transitPreferences:(id)a4 displayHints:(id)a5 refinementField:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  RoutePlanningDisplayHintsRefinementModel *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;

  v10 = a3;
  v11 = a5;
  v12 = objc_msgSend(a4, "mutableCopy");
  v28.receiver = self;
  v28.super_class = (Class)RoutePlanningDisplayHintsRefinementModel;
  v13 = -[RoutePlanningRefinementModel initWithDelegate:value:](&v28, "initWithDelegate:value:", v10, v12);

  if (!v13)
    goto LABEL_17;
  v13->_refinementField = a6;
  objc_storeStrong((id *)&v13->_displayHints, a5);
  if (!a6)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "prioritizationOptions"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](v13, "preferences"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v22, "sortOption")));
    v24 = objc_msgSend(v21, "containsObject:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_17;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "prioritizationOptions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v19, "firstObject"));
    v25 = objc_msgSend(v20, "integerValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](v13, "preferences"));
    objc_msgSend(v26, "setSortOption:", v25);

    goto LABEL_15;
  }
  if (a6 != 1)
    goto LABEL_17;
  if (!objc_msgSend(v11, "availablePaymentTypesCount"))
  {
LABEL_8:
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trying to display IC Fares refinement but no such option in display hints")));
      *(_DWORD *)buf = 136316162;
      v30 = "-[RoutePlanningDisplayHintsRefinementModel initWithDelegate:transitPreferences:displayHints:refinementField:]";
      v31 = 2080;
      v32 = "RoutePlanningDisplayHintsRefinementModel.m";
      v33 = 1024;
      v34 = 82;
      v35 = 2080;
      v36 = "foundICFareOption";
      v37 = 2112;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (!sub_100A70734())
      goto LABEL_17;
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

      goto LABEL_17;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    v30 = (const char *)v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_15:

    goto LABEL_16;
  }
  v14 = 0;
  while (objc_msgSend(v11, "availablePaymentTypeAtIndex:", v14) != 1)
  {
    if (++v14 >= (unint64_t)objc_msgSend(v11, "availablePaymentTypesCount"))
      goto LABEL_8;
  }
LABEL_17:

  return v13;
}

- (id)titleText
{
  unint64_t refinementField;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  _BYTE v38[128];

  refinementField = self->_refinementField;
  switch(refinementField)
  {
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORouteDisplayHints surchargeOptions](self->_displayHints, "surchargeOptions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedSurchargeType"));
      v7 = objc_msgSend(v6, "value");

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "surchargeOption"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "surchargeOption"));
        v7 = objc_msgSend(v11, "intValue");

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "surchargeTypes", 0));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v17, "value") == v7)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "formattedName"));
              v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v27));

              goto LABEL_26;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v14)
            continue;
          break;
        }
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Transit Filter Picker] Surcharge"), CFSTR("localized string not found"), 0));
LABEL_26:

      goto LABEL_27;
    case 1uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
      v19 = objc_msgSend(v18, "showICFares");

      if (v19)
        v20 = objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel _localizedICFaresLabel](self, "_localizedICFaresLabel"));
      else
        v20 = objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel _localizedCashFaresLabel](self, "_localizedCashFaresLabel"));
      v5 = (void *)v20;
      return v5;
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel _localizedNameForPrioritizationOption:](self, "_localizedNameForPrioritizationOption:", objc_msgSend(v4, "sortOption")));
LABEL_27:

      return v5;
  }
  v21 = sub_1004318FC();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[RoutePlanningDisplayHintsRefinementModel titleText]";
    v34 = 2080;
    v35 = "RoutePlanningDisplayHintsRefinementModel.m";
    v36 = 1024;
    v37 = 118;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  return 0;
}

- (void)_assertValidValue
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  char *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel value](self, "value"));
  v4 = objc_opt_class(TransitPreferences);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel value](self, "value"));
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Tried to set bad object for value: %@"), objc_opt_class(v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 136316162;
      v15 = "-[RoutePlanningDisplayHintsRefinementModel _assertValidValue]";
      v16 = 2080;
      v17 = "RoutePlanningDisplayHintsRefinementModel.m";
      v18 = 1024;
      v19 = 124;
      v20 = 2080;
      v21 = "[self.value isKindOfClass:TransitPreferences.class]";
      v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
}

- (id)value
{
  return objc_msgSend(self->super._value, "copy");
}

- (void)setValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class(TransitPreferences);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "mutableCopy");
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningDisplayHintsRefinementModel;
  -[RoutePlanningRefinementModel setValue:](&v9, "setValue:", v8);

}

- (TransitMutablePreferences)preferences
{
  return (TransitMutablePreferences *)self->super._value;
}

- (BOOL)shouldShowHighlighted
{
  unint64_t refinementField;
  void *v3;
  unsigned int v4;
  void *v5;

  refinementField = self->_refinementField;
  if (refinementField == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "surchargeOption"));
    LOBYTE(v4) = v5 != 0;

  }
  else if (refinementField == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
    v4 = objc_msgSend(v3, "showICFares") ^ 1;
  }
  else
  {
    if (refinementField)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
    LOBYTE(v4) = objc_msgSend(v3, "sortOption") != 0;
  }

  return v4;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (id)menu
{
  id v3;
  void *v4;
  unint64_t refinementField;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  char *i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *j;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  NSObject *v45;
  char *v46;
  id obj;
  id obja;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id location;
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  void *v74;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = v3;
  refinementField = self->_refinementField;
  if (refinementField)
  {
    if (refinementField == 1)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel _localizedICFaresLabel](self, "_localizedICFaresLabel"));
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10094884C;
      v54[3] = &unk_1011AF8A0;
      objc_copyWeak(&v55, &location);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v25, 0, 0, v54));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
      objc_msgSend(v26, "setState:", objc_msgSend(v27, "showICFares"));

      objc_msgSend(v4, "addObject:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel _localizedCashFaresLabel](self, "_localizedCashFaresLabel"));
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1009488C0;
      v52[3] = &unk_1011AF8A0;
      objc_copyWeak(&v53, &location);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v28, 0, 0, v52));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
      objc_msgSend(v29, "setState:", objc_msgSend(v30, "showICFares") ^ 1);

      objc_msgSend(v4, "addObject:", v29);
      objc_destroyWeak(&v53);

      objc_destroyWeak(&v55);
    }
    else if (refinementField == 2)
    {
      obj = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEORouteDisplayHints surchargeOptions](self->_displayHints, "surchargeOptions"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedSurchargeType"));
      v8 = objc_msgSend(v7, "value");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "surchargeOption"));
      v11 = v10 == 0;

      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "surchargeOption"));
        v8 = objc_msgSend(v13, "intValue");

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "surchargeTypes"));
      v15 = (char *)objc_msgSend(v14, "count");

      if (v15)
      {
        for (i = 0; i != v15; ++i)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "surchargeTypes"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", i));

          v19 = objc_msgSend(v18, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "formattedName"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v21));

          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_100948934;
          v49[3] = &unk_1011ACEC0;
          objc_copyWeak(&v51, &location);
          v23 = v20;
          v50 = v23;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v22, 0, 0, v49));
          objc_msgSend(v24, "setState:", (_DWORD)v19 == v8);
          objc_msgSend(obj, "addObject:", v24);

          objc_destroyWeak(&v51);
        }
      }

      v4 = obj;
    }
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GEORouteDisplayHints prioritizationOptions](self->_displayHints, "prioritizationOptions"));
    if (!objc_msgSend(v31, "count"))
    {
      v41 = sub_1004318FC();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Should not be trying to display prioritization options if there are none.")));
        *(_DWORD *)buf = 136316162;
        v66 = "-[RoutePlanningDisplayHintsRefinementModel menu]";
        v67 = 2080;
        v68 = "RoutePlanningDisplayHintsRefinementModel.m";
        v69 = 1024;
        v70 = 170;
        v71 = 2080;
        v72 = "prioritizationOptions.count > 0";
        v73 = 2112;
        v74 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v44 = sub_1004318FC();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v66 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obja = v31;
    v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v33)
            objc_enumerationMutation(obja);
          v35 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j), "intValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel _localizedNameForPrioritizationOption:](self, "_localizedNameForPrioritizationOption:", v35));
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_1009487DC;
          v56[3] = &unk_1011DC780;
          objc_copyWeak(&v57, &location);
          v58 = (int)v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v36, 0, 0, v56));

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDisplayHintsRefinementModel preferences](self, "preferences"));
          objc_msgSend(v37, "setState:", objc_msgSend(v38, "sortOption") == (_DWORD)v35);

          objc_msgSend(v4, "addObject:", v37);
          objc_destroyWeak(&v57);
        }
        v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v32);
    }

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v4));

  objc_destroyWeak(&location);
  return v39;
}

- (int)menuPressUsageAction
{
  unint64_t refinementField;
  objc_super v4;

  refinementField = self->_refinementField;
  if (refinementField < 3)
    return dword_100E3CA84[refinementField];
  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningDisplayHintsRefinementModel;
  return -[RoutePlanningRefinementModel menuPressUsageAction](&v4, "menuPressUsageAction");
}

- (id)_localizedNameForPrioritizationOption:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Transit Filter Picker, Prioritization] Recommended Routes");
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Transit Filter Picker, Prioritization] Faster Trips");
      goto LABEL_7;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Transit Filter Picker, Prioritization] Fewer Transfers");
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Transit Filter Picker, Prioritization] Less Walking");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)_localizedICFaresLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Transit Filter Picker, Fares] Transit Card Fares"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_localizedCashFaresLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Transit Filter Picker, Fares] Cash Fares"), CFSTR("localized string not found"), 0));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayHints, 0);
}

@end
