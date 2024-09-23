@implementation AMSUIMessageRequest

+ (id)bk_fromJSONURL:(id)a3 localizedTexts:(id)a4 localizedActionTitles:(id)a5
{
  id v7;
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *i;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  _UNKNOWN **v76;
  void *v77;
  id v78;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  id obj;
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];

  v7 = a3;
  v8 = a4;
  v90 = a5;
  v9 = BCMutableCloudSyncVersions_ptr;
  v10 = objc_opt_class(NSDictionary);
  v87 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v11, 0, 0));
  v13 = BUDynamicCast(v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v86 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title")));
  v16 = v15;
  v17 = BCMutableCloudSyncVersions_ptr;
  if (v15)
  {
    v85 = v15;
  }
  else
  {
    v18 = objc_opt_class(NSString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("title")));
    v20 = BUDynamicCast(v18, v19);
    v85 = (id)objc_claimAutoreleasedReturnValue(v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("message")));
  v22 = v21;
  if (v21)
  {
    v84 = v21;
  }
  else
  {
    v23 = objc_opt_class(NSString);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("message")));
    v25 = BUDynamicCast(v23, v24);
    v84 = (id)objc_claimAutoreleasedReturnValue(v25);

  }
  v26 = objc_opt_class(NSString);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("icon")));
  v28 = BUDynamicCast(v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);

  v30 = objc_opt_class(NSNumber);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("style")));
  v32 = BUDynamicCast(v30, v31);
  v83 = (void *)objc_claimAutoreleasedReturnValue(v32);

  v33 = objc_opt_class(NSDictionary);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("appearance")));
  v35 = BUDynamicCast(v33, v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);

  v82 = (void *)v29;
  if (v29)
    v37 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v29, v87));
  else
    v37 = 0;
  v81 = (void *)v36;
  v38 = objc_msgSend(objc_alloc((Class)AMSUIMessageRequest), "initWithTitle:message:appearanceInfo:", v85, v84, v36);
  v80 = (void *)v37;
  objc_msgSend(v38, "setIconURL:", v37);
  v89 = v38;
  objc_msgSend(v38, "setStyle:", objc_msgSend(v83, "integerValue"));
  v39 = objc_opt_class(NSArray);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("actions")));
  v41 = BUDynamicCast(v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v42;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  if (v92)
  {
    v91 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v92; i = (char *)i + 1)
      {
        if (*(_QWORD *)v96 != v91)
          objc_enumerationMutation(obj);
        v44 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
        v45 = objc_opt_class(v9[312]);
        v46 = BUDynamicCast(v45, v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (v47)
        {
          v48 = objc_opt_class(v17[357]);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("identifier")));
          v50 = BUDynamicCast(v48, v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", v51));
          v53 = v52;
          if (v52)
          {
            v54 = v52;
          }
          else
          {
            v55 = objc_opt_class(v17[357]);
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("title")));
            v57 = BUDynamicCast(v55, v56);
            v54 = (id)objc_claimAutoreleasedReturnValue(v57);

          }
          v58 = objc_opt_class(v17[357]);
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("icon")));
          v60 = BUDynamicCast(v58, v59);
          v61 = objc_claimAutoreleasedReturnValue(v60);

          v62 = (void *)v61;
          v63 = objc_opt_class(v17[357]);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("style")));
          v65 = BUDynamicCast(v63, v64);
          v93 = (void *)objc_claimAutoreleasedReturnValue(v65);

          v66 = objc_opt_class(v17[357]);
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("value")));
          v68 = BUDynamicCast(v66, v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

          if (v62)
            v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v62, v87));
          else
            v94 = 0;
          v70 = v93;
          if ((objc_msgSend(v93, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
            v71 = 2;
          else
            v71 = objc_msgSend(v93, "isEqualToString:", CFSTR("destructive"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDialogAction actionWithTitle:style:](AMSDialogAction, "actionWithTitle:style:", v54, v71));
          objc_msgSend(v72, "setIdentifier:", v51);
          objc_msgSend(v72, "setIconURL:", v94);
          if (v69)
          {
            v73 = v62;
            v74 = v54;
            v75 = v51;
            v76 = v9;
            v77 = v14;
            v78 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v69);
            objc_msgSend(v72, "setDeepLink:", v78);

            v14 = v77;
            v9 = v76;
            v51 = v75;
            v54 = v74;
            v62 = v73;
            v70 = v93;
          }
          objc_msgSend(v89, "addButtonAction:", v72);

          v17 = BCMutableCloudSyncVersions_ptr;
        }

      }
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    }
    while (v92);
  }

  return v89;
}

@end
