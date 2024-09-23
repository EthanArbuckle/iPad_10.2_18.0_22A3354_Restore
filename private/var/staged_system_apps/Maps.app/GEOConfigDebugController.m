@implementation GEOConfigDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Config Keys & Values");
}

- (void)prepareContent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOConfigDebugController debugClasses](self, "debugClasses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100681A64;
  v9[3] = &unk_1011BF8F0;
  v6 = v5;
  v10 = v6;
  v7 = v3;
  v11 = v7;
  objc_copyWeak(&v12, &location);
  v8 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Namespaces"), v9);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (NSDictionary)debugClasses
{
  NSDictionary *debugClasses;
  id v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSDictionary *v32;
  GEOConfigDebugController *v34;
  id obj;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  NSDictionary *v44;
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

  debugClasses = self->_debugClasses;
  if (!debugClasses)
  {
    v34 = self;
    v44 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v4 = sub_1006820D0();
    obj = (id)objc_claimAutoreleasedReturnValue(v4);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (!v37)
      goto LABEL_44;
    v5 = MKPlaceCollectionsLogicController_ptr;
    v36 = *(_QWORD *)v54;
    v6 = MKPlaceCollectionsLogicController_ptr;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v54 != v36)
          objc_enumerationMutation(obj);
        v38 = v7;
        v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v40 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v8, 0));

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v42 = v10;
        v11 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v50;
          v39 = *(_QWORD *)v50;
          do
          {
            v14 = 0;
            v41 = v12;
            do
            {
              if (*(_QWORD *)v50 != v13)
                objc_enumerationMutation(v42);
              v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v14);
              if (objc_msgSend(v15, "hasSuffix:", CFSTR(".bundle")))
              {
                v43 = v14;
                v16 = v5[307];
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByAppendingPathComponent:", v15));
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleWithPath:", v17));

                if (v18)
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "infoDictionary"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("GeoConfigDebugClasses")));

                  v21 = objc_opt_class(v6[304]);
                  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0 && objc_msgSend(v20, "count"))
                  {
                    if ((objc_msgSend(v18, "load") & 1) != 0)
                    {
                      v47 = 0u;
                      v48 = 0u;
                      v45 = 0u;
                      v46 = 0u;
                      v22 = v20;
                      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                      if (v23)
                      {
                        v24 = v23;
                        v25 = *(_QWORD *)v46;
                        do
                        {
                          for (i = 0; i != v24; i = (char *)i + 1)
                          {
                            if (*(_QWORD *)v46 != v25)
                              objc_enumerationMutation(v22);
                            v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                            v28 = objc_msgSend(v18, "classNamed:", v27);
                            v29 = v28;
                            if (v28
                              && objc_msgSend(v28, "conformsToProtocol:", &OBJC_PROTOCOL___GEOConfigDebugBundle)&& (objc_opt_respondsToSelector(v29, "GEOConfigNamespaceName") & 1) != 0&& (objc_opt_respondsToSelector(v29, "configKeyInfos") & 1) != 0)
                            {
                              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "GEOConfigNamespaceName"));
                              if (!-[NSDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v30))
                                -[NSDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v29, v30);

                            }
                            else
                            {
                              NSLog(CFSTR("Class %@/%@ in %@ does not conform to GEOConfigDebugBundle"), v27, v29, v15);
                            }
                          }
                          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                        }
                        while (v24);
                      }

                      v5 = MKPlaceCollectionsLogicController_ptr;
                      v6 = MKPlaceCollectionsLogicController_ptr;
                      v13 = v39;
LABEL_35:

LABEL_37:
                      v12 = v41;
                      v14 = v43;
                      goto LABEL_38;
                    }
                    NSLog(CFSTR("Unable to load bundle %@"), v15);
                  }
                  else
                  {
                    NSLog(CFSTR("Info.plist for %@ does not contain a valid GeoConfigDebugClasses entry"), v15);
                  }
                  v13 = v39;
                  goto LABEL_35;
                }
                NSLog(CFSTR("%@ is not a valid bundle?"), v15);
                v13 = v39;
                goto LABEL_37;
              }
LABEL_38:
              v14 = (char *)v14 + 1;
            }
            while (v14 != v12);
            v31 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            v12 = v31;
          }
          while (v31);
        }

        v7 = v38 + 1;
      }
      while ((id)(v38 + 1) != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (!v37)
      {
LABEL_44:

        v32 = v34->_debugClasses;
        v34->_debugClasses = v44;

        debugClasses = v34->_debugClasses;
        return debugClasses;
      }
    }
  }
  return debugClasses;
}

- (BOOL)debugTableSection:(id)a3 matches:(id)a4
{
  return 0;
}

- (BOOL)debugTableRow:(id)a3 matches:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSDictionary *debugClasses;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEOConfigDebugController;
  if (-[MapsDebugValuesViewController debugTableRow:matches:](&v19, "debugTableRow:matches:", v6, v7))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    debugClasses = self->_debugClasses;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v8 = -[NSDictionary objectForKeyedSubscript:](debugClasses, "objectForKeyedSubscript:", v10);

    if (v8)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configKeyInfos"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100682270;
      v12[3] = &unk_1011BF918;
      v13 = v7;
      v14 = &v15;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

      LOBYTE(v8) = *((_BYTE *)v16 + 24) != 0;
      _Block_object_dispose(&v15, 8);
    }
  }

  return (char)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugClasses, 0);
}

@end
