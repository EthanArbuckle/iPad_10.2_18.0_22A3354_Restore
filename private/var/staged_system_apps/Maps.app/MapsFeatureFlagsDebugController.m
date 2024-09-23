@implementation MapsFeatureFlagsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Feature Flags");
}

- (MapsFeatureFlagsDebugController)init
{
  MapsFeatureFlagsDebugController *v2;
  objc_class *v3;
  MapsFeatureFlagsDebugController *v4;
  objc_super v6;

  v2 = self;
  v3 = -[MapsFeatureFlagsDebugController findDebugClass](self, "findDebugClass");
  if (v3)
  {
    v6.receiver = v2;
    v6.super_class = (Class)MapsFeatureFlagsDebugController;
    v2 = -[GEOConfigKeysDebugController initWithName:geoConfigDebugClass:](&v6, "initWithName:geoConfigDebugClass:", CFSTR("Feature Flags"), v3);
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)addGenericRowFor:(id)a3 withName:(id)a4 keyStr:(id)a5 keyType:(unint64_t)a6 defaultValue:(id)a7 configOptions:(unint64_t)a8 inSection:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  unsigned int v20;
  const char *v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[6];

  v12 = a4;
  v13 = a9;
  if (a6 == 2)
  {
    v14 = a7;
    v15 = objc_msgSend(a3, "key");
    v17 = v16;
    if (MapsFeature_IsAvailable())
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100683E3C;
      v25[3] = &unk_1011BFA50;
      v25[4] = v15;
      v25[5] = v17;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100683E48;
      v24[3] = &unk_1011BFA70;
      v24[4] = v15;
      v24[5] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addSwitchRowWithTitle:get:set:", v12, v25, v24));
      v19 = "YES";
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addReadOnlyRowWithTitle:value:", v12, 0));
      v19 = "NO";
    }
    v20 = objc_msgSend(v14, "BOOLValue");

    v21 = "YES";
    if (!v20)
      v21 = "NO";
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(default: %s) (available: %s)"), v21, v19));
    objc_msgSend(v18, "setSubtitle:", v22);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (Class)findDebugClass
{
  id v2;
  void *v3;
  _UNKNOWN **v4;
  _UNKNOWN **v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char isKindOfClass;
  __CFString *v24;
  unsigned int v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  const __CFString *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];

  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v2 = sub_1006820D0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v38 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v38)
  {
    v4 = MKPlaceCollectionsLogicController_ptr;
    v5 = MKPlaceCollectionsLogicController_ptr;
    v6 = *(_QWORD *)v54;
    v7 = CFSTR("_MapsFeaturesConfigDebug");
    v40 = v3;
    v37 = *(_QWORD *)v54;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v54 != v6)
          objc_enumerationMutation(v3);
        v39 = v8;
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[337], "defaultManager"));
        v43 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v9, 0));

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        obj = v11;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v50;
          v41 = *(_QWORD *)v50;
          do
          {
            v15 = 0;
            v42 = v13;
            do
            {
              if (*(_QWORD *)v50 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v15);
              if (objc_msgSend(v16, "hasSuffix:", CFSTR(".bundle")))
              {
                v17 = v5[307];
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingPathComponent:", v16));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleWithPath:", v18));

                if (v19)
                {
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "infoDictionary"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("GeoConfigDebugClasses")));

                  v22 = objc_opt_class(NSArray);
                  isKindOfClass = objc_opt_isKindOfClass(v21, v22);
                  v24 = CFSTR("Info.plist for %@ does not contain a valid GeoConfigDebugClasses entry");
                  if ((isKindOfClass & 1) != 0)
                  {
                    if (objc_msgSend(v21, "count"))
                    {
                      v25 = objc_msgSend(v19, "load");
                      v24 = CFSTR("Unable to load bundle %@");
                      if (v25)
                      {
                        v47 = 0u;
                        v48 = 0u;
                        v45 = 0u;
                        v46 = 0u;
                        v26 = v21;
                        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                        if (v27)
                        {
                          v28 = v27;
                          v29 = *(_QWORD *)v46;
                          while (2)
                          {
                            for (i = 0; i != v28; i = (char *)i + 1)
                            {
                              if (*(_QWORD *)v46 != v29)
                                objc_enumerationMutation(v26);
                              v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                              if (objc_msgSend(v31, "isEqualToString:", v7))
                              {
                                v32 = v7;
                                v33 = objc_msgSend(v19, "classNamed:", v31);
                                v34 = v33;
                                if (v33
                                  && objc_msgSend(v33, "conformsToProtocol:", &OBJC_PROTOCOL___GEOConfigDebugBundle)&& (objc_opt_respondsToSelector(v34, "GEOConfigNamespaceName") & 1) != 0&& (objc_opt_respondsToSelector(v34, "configKeyInfos") & 1) != 0)
                                {
                                  v35 = v34;

                                  v3 = v40;
                                  goto LABEL_41;
                                }
                                NSLog(CFSTR("Class %@/%@ in %@ does not conform to GEOConfigDebugBundle"), v31, v34, v16);
                                v7 = v32;
                              }
                            }
                            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                            if (v28)
                              continue;
                            break;
                          }
                        }

                        v5 = MKPlaceCollectionsLogicController_ptr;
                        goto LABEL_33;
                      }
                    }
                    else
                    {
                      v24 = CFSTR("Info.plist for %@ does not contain a valid GeoConfigDebugClasses entry");
                    }
                  }
                  NSLog(&v24->isa, v16);

                }
                else
                {
                  NSLog(CFSTR("%@ is not a valid bundle?"), v16);
                }
LABEL_33:
                v14 = v41;
                v13 = v42;
              }
              v15 = (char *)v15 + 1;
            }
            while (v15 != v13);
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          }
          while (v13);
        }

        v8 = v39 + 1;
        v3 = v40;
        v4 = MKPlaceCollectionsLogicController_ptr;
        v6 = v37;
      }
      while ((id)(v39 + 1) != v38);
      v35 = 0;
      v38 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (!v38)
        goto LABEL_41;
    }
  }
  v35 = 0;
LABEL_41:

  return (Class)v35;
}

@end
