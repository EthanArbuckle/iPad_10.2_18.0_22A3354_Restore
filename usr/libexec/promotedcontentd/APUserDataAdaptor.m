@implementation APUserDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.user");
}

- (void)_run:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  signed int v27;
  void *v28;
  void *v29;
  signed int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  signed int v35;
  void *v36;
  void *v37;
  signed int v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  uint64_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storefront")));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("storefront")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider userAccount](APIDAccountProvider, "userAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storefront"));
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("iTunesLoggedIn")));

  if (v14)
  {
    if (!objc_msgSend(v5, "isiTunesLoggedIn"))
      goto LABEL_18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("iCloudLoggedIn")));

  if (v16)
  {
    if (!objc_msgSend(v5, "isiCloudLoggedIn"))
      goto LABEL_18;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("isChild")));

  if (v18)
  {
    if (!objc_msgSend(v5, "isChild"))
      goto LABEL_18;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("isAdolescent")));

  if (v20)
  {
    if (!objc_msgSend(v5, "isAdolescent"))
      goto LABEL_18;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("isAdult")));

  if (v22 && !objc_msgSend(v5, "isAdult"))
  {
LABEL_18:
    v39 = 0;
  }
  else
  {
    v64 = v5;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("minAge")));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("minAge")));
      v27 = objc_msgSend(v26, "intValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[APUserDataAdaptor ageGenderData](self, "ageGenderData"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("age")));
      v30 = objc_msgSend(v29, "intValue");

      if (v27 > v30)
        goto LABEL_17;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("maxAge")));

    if (!v32)
      goto LABEL_20;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("maxAge")));
    v35 = objc_msgSend(v34, "intValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[APUserDataAdaptor ageGenderData](self, "ageGenderData"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("age")));
    v38 = objc_msgSend(v37, "intValue");

    if (v35 < v38)
    {
LABEL_17:
      v39 = 0;
      v5 = v64;
    }
    else
    {
LABEL_20:
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ageBand")));

      v5 = v64;
      if (v42)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ageBand")));

        obj = v44;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        if (v45)
        {
          v46 = v45;
          v63 = *(_QWORD *)v66;
LABEL_23:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v66 != v63)
              objc_enumerationMutation(obj);
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268760, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v47)));
            v49 = objc_msgSend(v48, "intValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[APUserDataAdaptor ageGenderData](self, "ageGenderData"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("ageGroup")));
            v52 = objc_msgSend(v51, "intValue");

            v5 = v64;
            if (v49 == v52)
              break;
            if (v46 == (id)++v47)
            {
              v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
              if (v46)
                goto LABEL_23;
              v39 = 0;
              v53 = obj;
              goto LABEL_33;
            }
          }
        }

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("gender")));

      if (v55)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[APUserDataAdaptor ageGenderData](self, "ageGenderData"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("gender")));
        v57 = objc_msgSend(v56, "intValue");
        v58 = (void *)qword_100268768;
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("gender")));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v60));
        v39 = v57 == objc_msgSend(v61, "intValue");

LABEL_33:
      }
      else
      {
        v39 = 1;
      }
    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v39));
  (*((void (**)(id, void *, _QWORD, _QWORD))v4 + 2))(v4, v40, 0, 0);

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
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  NSErrorUserInfoKey v58;
  void *v59;
  NSErrorUserInfoKey v60;
  void *v61;
  _BYTE v62[128];

  v57.receiver = self;
  v57.super_class = (Class)APUserDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v57, "_validateParameters:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storefront")));
  if (!-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v6, CFSTR("storefront"), objc_opt_class(NSString), a3))goto LABEL_52;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iTunesLoggedIn")));
  if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v8, CFSTR("iTunesLoggedIn"), objc_opt_class(NSNumber), a3))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iCloudLoggedIn")));
    if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v10, CFSTR("iCloudLoggedIn"), objc_opt_class(NSNumber), a3))
    {
      v50 = v9;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("isChild")));
      if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v51, CFSTR("isChild"), objc_opt_class(NSNumber), a3))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("isAdolescent")));
        if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v48, CFSTR("isAdolescent"), objc_opt_class(NSNumber), a3))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("isAdult")));
          if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v46, CFSTR("isAdult"), objc_opt_class(NSNumber), a3))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("minAge")));
            if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v44, CFSTR("minAge"), objc_opt_class(NSNumber), a3))
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("maxAge")));
              v13 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v12, CFSTR("maxAge"), objc_opt_class(NSNumber), a3);

            }
            else
            {
              v13 = 0;
            }
            v9 = v50;

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ageBand")));

    if (v15)
    {
      if (qword_100268770 != -1)
        dispatch_once(&qword_100268770, &stru_100213000);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ageBand")));
      v18 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v17, CFSTR("ageBand"), objc_opt_class(NSArray), a3);

      if (!v18)
        return 0;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ageBand")));

      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v23)
              objc_enumerationMutation(v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268760, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i)));

            if (!v25)
            {
              if (a3)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ageBand")));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268760, "allKeys"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid ageBand argument '%@'. Must be one of %@"), v27, v28));

                v60 = NSLocalizedDescriptionKey;
                v61 = v29;
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
                *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5201, v30));

              }
              v13 = 0;
              goto LABEL_40;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          if (v22)
            continue;
          break;
        }
        v13 = 1;
      }
      else
      {
        v13 = 1;
      }
LABEL_40:

    }
  }
  if (!v13)
    return 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("gender")));

  if (!v32)
    return 1;
  if (qword_100268778 != -1)
    dispatch_once(&qword_100268778, &stru_100213020);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("gender")));
  if (-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v34, CFSTR("gender"), objc_opt_class(NSString), a3))
  {
    v35 = (void *)qword_100268768;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("gender")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v37));
    v39 = v38 != 0;

  }
  else
  {
    v39 = 0;
  }

  if (a3 && !v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("gender")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268768, "allKeys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid gender argument '%@'. Must be one of %@"), v41, v42));

    v58 = NSLocalizedDescriptionKey;
    v59 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5201, v6));
LABEL_52:

    return 0;
  }
  return v39;
}

- (id)ageGenderData
{
  if (qword_100268788 != -1)
    dispatch_once(&qword_100268788, &stru_100213040);
  return (id)qword_100268780;
}

@end
