@implementation GEOConfigKeysDebugController

- (GEOConfigKeysDebugController)initWithName:(id)a3 geoConfigDebugClass:(Class)a4
{
  id v6;
  GEOConfigKeysDebugController *v7;
  GEOConfigKeysDebugController *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOConfigKeysDebugController;
  v7 = -[MapsDebugValuesViewController init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_configClass = a4;
    objc_initWeak(&location, v7);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100682428;
    v10[3] = &unk_1011BF940;
    v11 = v6;
    objc_copyWeak(&v12, &location);
    -[MapsDebugValuesViewController setPrepareContentBlock:](v8, "setPrepareContentBlock:", v10);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)addGEOConfigRowsInSection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class configKeyInfos](self->_configClass, "configKeyInfos"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006825C0;
  v7[3] = &unk_1011BF990;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (id)addSelectionRowFor:(id)a3 withName:(id)a4 keyType:(unint64_t)a5 defaultValue:(id)a6 inSection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t DecodedValueWithSource;
  void *v21;
  void *v22;
  unsigned int v23;
  const char *v24;
  NSString *v25;
  void *v26;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_10068296C;
  v31 = &unk_1011BFA08;
  v14 = v12;
  v32 = v14;
  v15 = v11;
  v33 = v15;
  v16 = v13;
  v34 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a7, "addNavigationRowWithTitle:viewControllerContent:", v14, &v28));
  v18 = objc_msgSend(v15, "key");
  DecodedValueWithSource = _GEOConfigGetDecodedValueWithSource(v18, v19, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(DecodedValueWithSource);
  v22 = v21;
  if (a5 == 2)
  {
    v23 = objc_msgSend(v21, "BOOLValue");
    v24 = "NO";
    if (v23)
      v24 = "YES";
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("current: %s"), v24, v28, v29, v30, v31);
  }
  else
  {
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("current: %@"), v21, v28, v29, v30, v31);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  objc_msgSend(v17, "setSubtitle:", v26);

  return v17;
}

- (id)addSliderRowFor:(id)a3 withName:(id)a4 keyType:(unint64_t)a5 defaultValue:(id)a6 inSection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  double v30;
  double v31;
  double v32;
  void *v33;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = a3;
  v15 = objc_msgSend(v14, "key");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugControlOptions"));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("subtitle_format")));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugControlOptions"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("min")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugControlOptions"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("max")));

  switch(a5)
  {
    case 3uLL:
      if (v19)
        v24 = v19;
      else
        v24 = CFSTR("%.0f");
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addSliderRowWithTitle:subtitleStringFormat:min:max:geoConfigKeyInteger:changeHandler:", v11, v24, objc_msgSend(v21, "integerValue"), objc_msgSend(v23, "integerValue"), v15, v17, 0));
      goto LABEL_19;
    case 4uLL:
      if (v19)
        v27 = v19;
      else
        v27 = CFSTR("%.0f");
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addSliderRowWithTitle:subtitleStringFormat:min:max:geoConfigKeyUInteger:changeHandler:", v11, v27, objc_msgSend(v21, "unsignedIntegerValue"), objc_msgSend(v23, "unsignedIntegerValue"), v15, v17, 0));
      goto LABEL_19;
    case 5uLL:
      if (v19)
        v28 = v19;
      else
        v28 = CFSTR("%.0f");
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addSliderRowWithTitle:subtitleStringFormat:min:max:geoConfigKeyUint64:changeHandler:", v11, v28, objc_msgSend(v21, "unsignedLongLongValue"), objc_msgSend(v23, "unsignedLongLongValue"), v15, v17, 0));
      goto LABEL_19;
    case 6uLL:
      if (v19)
        v29 = v19;
      else
        v29 = CFSTR("%.2f");
      objc_msgSend(v21, "doubleValue");
      v31 = v30;
      objc_msgSend(v23, "doubleValue");
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addSliderRowWithTitle:subtitleStringFormat:min:max:geoConfigKeyDouble:changeHandler:", v11, v29, v15, v17, 0, v31, v32));
LABEL_19:
      v26 = (void *)v25;
      break;
    default:
      v26 = 0;
      break;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(default: %@)"), v12));
  objc_msgSend(v26, "setSubtitle:", v33);

  return v26;
}

- (id)addGenericRowFor:(id)a3 withName:(id)a4 keyStr:(id)a5 keyType:(unint64_t)a6 defaultValue:(id)a7 configOptions:(unint64_t)a8 inSection:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t Array;
  void *v27;
  uint64_t v28;
  uint64_t Set;
  uint64_t Dictionary;
  void *v31;

  v13 = a4;
  v14 = a7;
  v15 = a9;
  v16 = objc_msgSend(a3, "key");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
  if (v14)
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
  else
    v20 = CFSTR("(nil)");
  switch(a6)
  {
    case 1uLL:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addGEOTextFieldRowWithTitle:placeholderText:inputType:geoConfigKeyString:", v13, v19, 3, v16, v18));
      goto LABEL_17;
    case 2uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addSwitchRowWithTitle:geoConfigKey:", v13, v16, v18));
      v23 = objc_msgSend(v14, "BOOLValue");
      v24 = CFSTR("NO");
      if (v23)
        v24 = CFSTR("YES");
      v25 = v24;

      v20 = v25;
      break;
    case 3uLL:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addGEOTextFieldRowWithTitle:placeholderText:inputType:geoConfigKeyInteger:", v13, v19, 1, v16, v18));
      goto LABEL_17;
    case 4uLL:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addGEOTextFieldRowWithTitle:placeholderText:inputType:geoConfigKeyUInteger:", v13, v19, 1, v16, v18));
      goto LABEL_17;
    case 5uLL:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addGEOTextFieldRowWithTitle:placeholderText:inputType:geoConfigKeyUint64:", v13, v19, 1, v16, v18));
      goto LABEL_17;
    case 6uLL:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addGEOTextFieldRowWithTitle:placeholderText:inputType:geoConfigKeyDouble:", v13, v19, 2, v16, v18));
      goto LABEL_17;
    case 7uLL:
      Array = GEOConfigGetArray(v16, v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue(Array);
      v28 = objc_claimAutoreleasedReturnValue(-[GEOConfigKeysDebugController addRowForArray:withName:inSection:](self, "addRowForArray:withName:inSection:", v27, v13, v15));
      goto LABEL_19;
    case 8uLL:
      Set = GEOConfigGetSet(v16, v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue(Set);
      v28 = objc_claimAutoreleasedReturnValue(-[GEOConfigKeysDebugController addRowForSet:withName:inSection:](self, "addRowForSet:withName:inSection:", v27, v13, v15));
      goto LABEL_19;
    case 9uLL:
      Dictionary = GEOConfigGetDictionary(v16, v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue(Dictionary);
      v28 = objc_claimAutoreleasedReturnValue(-[GEOConfigKeysDebugController addRowForDictionary:withName:inSection:](self, "addRowForDictionary:withName:inSection:", v27, v13, v15));
LABEL_19:
      v22 = (void *)v28;

      break;
    case 0xAuLL:
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addGEODateFieldRowWithTitle:placeholderText:geoConfigKeyDate:", v13, v19, v16, v18));
LABEL_17:
      v22 = (void *)v21;
      break;
    default:
      v22 = 0;
      break;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(default: %@)"), v20));
  objc_msgSend(v22, "setSubtitle:", v31);

  return v22;
}

- (id)addRowNamed:(id)a3 forValue:(id)a4 inSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[GEOConfigKeysDebugController addRowForArray:withName:inSection:](self, "addRowForArray:withName:inSection:", v9, v8, v10));
LABEL_7:
    v15 = (void *)v12;
    goto LABEL_8;
  }
  v13 = objc_opt_class(NSSet);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[GEOConfigKeysDebugController addRowForSet:withName:inSection:](self, "addRowForSet:withName:inSection:", v9, v8, v10));
    goto LABEL_7;
  }
  v14 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v14) & 1) != 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[GEOConfigKeysDebugController addRowForDictionary:withName:inSection:](self, "addRowForDictionary:withName:inSection:", v9, v8, v10));
    goto LABEL_7;
  }
  v17 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v17) & 1) != 0)
  {
    v18 = v9;
  }
  else
  {
    v19 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v9, v19) & 1) == 0)
    {
      v20 = objc_opt_class(NSDate);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) == 0)
      {
        v21 = objc_opt_class(NSData);
        objc_opt_isKindOfClass(v9, v21);
      }
    }
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
  }
  v22 = v18;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addReadOnlyRowWithTitle:value:", v8, v18));

LABEL_8:
  return v15;
}

- (id)addRowForArray:(id)a3 withName:(id)a4 inSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  GEOConfigKeysDebugController *v16;

  v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10068342C;
  v13[3] = &unk_1011BFA08;
  v14 = a4;
  v15 = v8;
  v16 = self;
  v9 = v8;
  v10 = v14;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "addNavigationRowWithTitle:viewControllerContent:", v10, v13));

  return v11;
}

- (id)addRowForSet:(id)a3 withName:(id)a4 inSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  GEOConfigKeysDebugController *v16;

  v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100683678;
  v13[3] = &unk_1011BFA08;
  v14 = a4;
  v15 = v8;
  v16 = self;
  v9 = v8;
  v10 = v14;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "addNavigationRowWithTitle:viewControllerContent:", v10, v13));

  return v11;
}

- (id)addRowForDictionary:(id)a3 withName:(id)a4 inSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  GEOConfigKeysDebugController *v16;

  v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10068388C;
  v13[3] = &unk_1011BFA08;
  v14 = a4;
  v15 = v8;
  v16 = self;
  v9 = v8;
  v10 = v14;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "addNavigationRowWithTitle:viewControllerContent:", v10, v13));

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOConfigKeysDebugController;
  v4 = -[GEOConfigKeysDebugController tableView:cellForRowAtIndexPath:](&v9, "tableView:cellForRowAtIndexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v7, "setLineBreakMode:", 0);

  return v5;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  Class configClass;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  void *v24;

  v6 = a3;
  configClass = self->_configClass;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class configKeyInfos](configClass, "configKeyInfos"));
  v10 = objc_msgSend(v8, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100683BCC;
  v21 = &unk_1011AE3F8;
  v22 = v11;
  v23 = v6;
  v12 = v6;
  v13 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, CFSTR("Reset"), &v18));
  v24 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1, v18, v19, v20, v21));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v15));

  return v16;
}

@end
