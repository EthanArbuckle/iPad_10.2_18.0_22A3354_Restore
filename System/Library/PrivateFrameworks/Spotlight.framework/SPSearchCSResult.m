@implementation SPSearchCSResult

- (SPSearchCSResult)initWithRankingItem:(id)a3 clientData:(SPResultValueItem2_s *)a4
{
  SPSearchCSResult *result;
  unsigned int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SPSearchCSResult;
  result = -[SPSearchResult initWithRankingItem:](&v13, sel_initWithRankingItem_, a3, a4, a5, *(_QWORD *)&a7, a9, a10, a6);
  if (result)
  {
    do
      v12 = __ldaxr((unsigned int *)a4);
    while (__stlxr(v12 + 1, (unsigned int *)a4));
    result->_clientData = a4;
  }
  return result;
}

- (void)clearClientData
{
  SPResultValueItem2_s *clientData;

  clientData = self->_clientData;
  if (clientData)
  {
    sprvreleaseCallback((uint64_t)self, (uint64_t)clientData);
    self->_clientData = 0;
  }
}

- (SPResultValueItem2_s)clientData
{
  return self->_clientData;
}

- (void)dealloc
{
  SPResultValueItem2_s *clientData;
  objc_super v4;

  clientData = self->_clientData;
  if (clientData)
    sprvreleaseCallback((uint64_t)self, (uint64_t)clientData);
  v4.receiver = self;
  v4.super_class = (Class)SPSearchCSResult;
  -[SPSearchCSResult dealloc](&v4, sel_dealloc);
}

- (id)makeApplicationResult:(id)a3 dataclass:(id)a4 score:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint8_t buf[4];
  id v68;
  _QWORD v69[2];

  v65 = v5;
  v6 = v4;
  v69[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  SPFastApplicationsGetNoBuild();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "attributeDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = *MEMORY[0x24BDC22E8];
  objc_msgSend(v12, "objectForKey:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x24BE84958]);
    objc_msgSend(v14, "copyToSearchFoundationResult:", v15);
    objc_msgSend(v15, "compatibilityTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC1BE8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "title");
      v18 = v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v17);

      v8 = v18;
    }
    objc_msgSend(v14, "subtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC2238]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v21);
        v61 = v13;
        v22 = v10;
        v23 = v11;
        v24 = v8;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDescriptions:", v26);

        v8 = v24;
        v11 = v23;
        v10 = v22;
        v13 = v61;
      }

    }
    if (objc_msgSend(v14, "isWebClip"))
      objc_msgSend(v15, "setType:", 24);
    if (objc_msgSend(v14, "isAppClip"))
    {
      objc_msgSend(v15, "setSectionBundleIdentifier:", *MEMORY[0x24BEB0350]);
      objc_msgSend(v15, "setBundleID:", *MEMORY[0x24BE849A8]);
      objc_msgSend(v15, "setType:", 22);
      v27 = objc_alloc(MEMORY[0x24BE84D50]);
      objc_msgSend(v15, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBundleIdentifier:", v28);

      objc_msgSend(v15, "setThumbnail:", v27);
    }
    else
    {
      objc_msgSend(v15, "setSectionBundleIdentifier:", *MEMORY[0x24BEB0358]);
      if (objc_msgSend(v14, "isWebClip"))
        v45 = *MEMORY[0x24BDC1AE8];
      else
        v45 = v64;
      objc_msgSend(v12, "objectForKey:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setApplicationBundleIdentifier:", v46);

      objc_msgSend(v12, "objectForKey:", v64);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setExternalIdentifier:", v47);

      objc_msgSend(v15, "applicationBundleIdentifier");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBundleID:", v27);
    }

    objc_msgSend(v15, "setScore:", v6, v65);
    objc_msgSend(v15, "setProtectionClass:", v8);
    objc_msgSend(v15, "setIsLocalApplicationResult:", 1);
    objc_msgSend(v15, "applicationBundleIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v15;
        _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
      }
      v29 = 0;
LABEL_38:

      v15 = v29;
    }
  }
  else
  {
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.TVRemoteUIService")) & 1) != 0
      || !v10
      && (SPCopyVisibleApps(),
          v49 = (void *)objc_claimAutoreleasedReturnValue(),
          v50 = objc_msgSend(v49, "containsObject:", v13),
          v49,
          v50))
    {
      v62 = v6;
      v58 = *MEMORY[0x24BDC1AE8];
      objc_msgSend(v12, "objectForKey:");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc_init(MEMORY[0x24BE84958]);
      objc_msgSend(v29, "setIdentifier:", v13);
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC1BE8]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc_init(MEMORY[0x24BE85018]);
      v32 = v31;
      if (v30)
        objc_msgSend(v31, "setText:", v30);
      v60 = v32;
      objc_msgSend(v29, "setTitle:", v32);
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC2238]);
      v33 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)v33;
      if (v33)
      {
        objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v34;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
        v35 = v30;
        v36 = v12;
        v37 = v13;
        v38 = v10;
        v39 = v11;
        v40 = v8;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDescriptions:", v41);

        v8 = v40;
        v11 = v39;
        v10 = v38;
        v13 = v37;
        v12 = v36;
        v30 = v35;
        v14 = 0;

      }
      objc_msgSend(v29, "setSectionBundleIdentifier:", v15);
      v63 = v8;
      if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BEB0350]))
      {
        objc_msgSend(v29, "setBundleID:", *MEMORY[0x24BE849A8]);
        objc_msgSend(v29, "setType:", 22);
        v42 = objc_alloc(MEMORY[0x24BE84D50]);
        objc_msgSend(v29, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setBundleIdentifier:", v43);

        objc_msgSend(v29, "setThumbnail:", v42);
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC2160]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setApplicationBundleIdentifier:", v44);

      }
      else
      {
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC1EC0]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = v64;
        if (v51)
        {
          objc_msgSend(v29, "setType:", 24);
          v52 = v58;
        }
        objc_msgSend(v12, "objectForKey:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setApplicationBundleIdentifier:", v53);

        objc_msgSend(v12, "objectForKey:", v64);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setExternalIdentifier:", v54);

        objc_msgSend(v29, "applicationBundleIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setBundleID:", v55);

        objc_msgSend(v29, "externalIdentifier");
        v42 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setResultBundleId:", v42);
      }

      objc_msgSend(v29, "setScore:", v62, v65);
      v8 = v63;
      objc_msgSend(v29, "setProtectionClass:", v63);
      objc_msgSend(v29, "setIsLocalApplicationResult:", 1);
      objc_msgSend(v29, "applicationBundleIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v29;
          _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
        }

        v29 = 0;
      }

      goto LABEL_38;
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)doesQueryMatchContentForLowEngagementBundle:(id)a3 queryContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC1BE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC22D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "normalizedSearchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  v40 = v8;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v12 = v9;
    if ((unint64_t)objc_msgSend(v9, "length") >= 4)
    {
      objc_msgSend(v8, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SSNormalizedQueryString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v12;
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(" "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v14;
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(" "));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v16 = v15;
      v44 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v44)
      {
        v17 = 0;
        v18 = 0;
        v41 = 0;
        v42 = *(_QWORD *)v55;
        v43 = v16;
        v38 = v6;
        v39 = v5;
        v37 = v7;
        while (2)
        {
          v19 = 0;
          do
          {
            v48 = v17;
            if (*(_QWORD *)v55 != v42)
              objc_enumerationMutation(v16);
            v49 = v18;
            v47 = v19;
            v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v19);
            v46 = objc_msgSend(v20, "length");
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v21 = v45;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            if (v22)
            {
              v23 = v22;
              v24 = 0;
              v25 = *(_QWORD *)v51;
              v26 = 0x7FFFFFFFLL;
              while (2)
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v51 != v25)
                    objc_enumerationMutation(v21);
                  v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                  if (objc_msgSend(v28, "localizedStandardRangeOfString:", v20) != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v30 = v29;
                    v31 = objc_msgSend(v28, "length");
                    v32 = objc_msgSend(v28, "length");
                    v33 = v32;
                    if (v30 == v31)
                    {

                      v26 = v33;
                      v16 = v43;
                      goto LABEL_36;
                    }
                    if (v32 < v26)
                      v26 = objc_msgSend(v28, "length");
                    v24 = 1;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                if (v23)
                  continue;
                break;
              }
            }
            else
            {
              v24 = 0;
              v26 = 0x7FFFFFFFLL;
            }

            v16 = v43;
            if ((v24 & 1) == 0
              || v41 > 0
              || (unint64_t)objc_msgSend(v20, "length") <= 3 && 3 * v26 > 4 * objc_msgSend(v20, "length"))
            {

              v11 = 0;
              v6 = v38;
              v5 = v39;
              v7 = v37;
              goto LABEL_43;
            }
            v41 = 1;
LABEL_36:
            v18 = v46 + v49;
            v17 = v26 + v48;
            v19 = v47 + 1;
          }
          while (v47 + 1 != v44);
          v6 = v38;
          v5 = v39;
          v7 = v37;
          v44 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
          if (v44)
            continue;
          break;
        }

        if (v18 > 3)
        {
          v11 = 1;
          goto LABEL_43;
        }
      }
      else
      {

        v18 = 0;
        v17 = 0;
      }
      v11 = 3 * v17 <= 4 * v18;
LABEL_43:

      v9 = v36;
    }
    else
    {
      v11 = 0;
      v9 = v12;
    }
  }

  return v11;
}

- (SPSearchCSResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SPResultValueItem2_s *clientData;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  __CFString *v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  os_log_type_t v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v76;
  void *v77;
  void *v78;
  int v79;
  NSObject *v80;
  os_log_type_t v81;
  __CFString *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  uint8_t buf[4];
  const __CFString *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v7 = a5;
  v99 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "disabledApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "count");
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  clientData = self->_clientData;
  if (clientData)
  {
    v86 = v7;
    v89 = v13;
    v91 = v10;
    v92 = *(id *)&clientData[16].var0;
    objc_msgSend(v92, "attributeSet");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "attributeDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1AE8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC2160]);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = *MEMORY[0x24BDC1B90];
    objc_msgSend(v15, "objectForKey:");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC2060]);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = *MEMORY[0x24BDC1B58];
    objc_msgSend(v15, "objectForKey:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v19 = v18;
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1B78]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1A48]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v93 = v16;
    if ((v19 >= a3 || a3 - v19 >= 18000.0) && (v22 >= a3 || a3 - v22 >= 18000.0) && (v24 >= a3 || a3 - v24 >= 18000.0))
    {

      if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE849A8]) & 1) != 0
        || (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE849A0]) & 1) != 0
        || (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0)
      {
        v27 = 0;
      }
      else
      {
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1EF8]);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v77;
        v27 = (int)v91;
        if (v91)
        {
          if (objc_msgSend(v77, "hasPrefix:", v91))
          {
            if (objc_msgSend(v78, "isEqualToString:", v91))
              v27 = 2;
            else
              v27 = 1;
          }
          else
          {
            v27 = 0;
          }
        }

      }
    }
    else
    {
      SPLogForSPLogCategoryQuery();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412290;
        v96 = CFSTR("Very recently created/modified");
        _os_log_impl(&dword_2279CC000, v25, v26, "%@", buf, 0xCu);
      }

      v27 = 1;
      v16 = v93;
    }
    if (objc_msgSend(v94, "isEqualToString:", *MEMORY[0x24BE84AE0])
      && ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE849A8]) & 1) != 0
       || objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE849A0]))
      && (-[SPSearchCSResult makeApplicationResult:dataclass:score:](self, "makeApplicationResult:dataclass:score:", v92, *(_QWORD *)&self->_clientData[8].var0, *(_QWORD *)&self->_clientData[4].var0, *(_QWORD *)&self->_clientData[6].var0), (v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v29 = v28;
      -[NSObject applicationBundleIdentifier](v28, "applicationBundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v89, "containsObject:", v30);

      SPLogForSPLogCategoryDefault();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      v34 = os_log_type_enabled(v32, v33);
      if (v31)
      {
        if (v34)
        {
          -[NSObject applicationBundleIdentifier](v29, "applicationBundleIdentifier");
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v96 = v35;
          _os_log_impl(&dword_2279CC000, v32, v33, "disabledAppSet contains  %@", buf, 0xCu);

        }
        v36 = 0;
        v37 = v92;
        goto LABEL_75;
      }
      if (v34)
      {
        v70 = -[NSObject score](v29, "score");
        -[NSObject score](v29, "score");
        *(_DWORD *)buf = 134218240;
        v96 = (const __CFString *)v70;
        v97 = 2048;
        v98 = v71;
        _os_log_impl(&dword_2279CC000, v32, v33, "Result score: 0x%08llx 0x%08llx", buf, 0x16u);
      }
      v38 = 0;
    }
    else
    {
      SPLogForSPLogCategoryDefault();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v32, OS_LOG_TYPE_DEFAULT, "*warn* Couldn't determine score for nil result", buf, 2u);
      }
      v29 = 0;
      v38 = 1;
    }

    if (v27 > (int)-[NSObject topHit](v29, "topHit"))
      -[NSObject setTopHit:](v29, "setTopHit:", SSSetTopHitWithReasonString());
    v39 = v93;
    if (objc_msgSend(v94, "isEqualToString:", CFSTR("public.calendar-event")))
    {
      -[NSObject title](v29, "title");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "text");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCompletedQuery:](v29, "setCompletedQuery:", v41);

    }
    if (v38)
    {
      SPLogForSPLogCategoryDefault();
      v29 = objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x24BE84B00] ^ 1;
      if (os_log_type_enabled(v29, v42))
      {
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC22E8]);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v96 = v43;
        v97 = 2112;
        v98 = v93;
        _os_log_impl(&dword_2279CC000, v29, v42, "No result object for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);

      }
LABEL_31:
      v36 = 0;
      v37 = v92;
      v44 = v88;
LABEL_76:

      v10 = v91;
      v13 = v89;
      goto LABEL_77;
    }
    -[NSObject compatibilityTitle](v29, "compatibilityTitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      -[NSObject bundleID](v29, "bundleID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BEB05F0]) & 1) == 0)
      {
        -[NSObject sectionBundleIdentifier](v29, "sectionBundleIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((SSSectionIsSyndicatedPhotos() & 1) == 0)
        {
          v47 = objc_msgSend(v11, "queryKind");
          objc_msgSend(v11, "clientBundleID");
          v48 = (id)objc_claimAutoreleasedReturnValue();
          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            if ((objc_msgSend(v48, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
              || (objc_msgSend(v48, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
              || (v79 = objc_msgSend(v48, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v47 == 12)
              || v79)
            {
              v76 = _os_feature_enabled_impl();

              v39 = v93;
              if ((v76 & 1) != 0)
              {
LABEL_40:
                -[NSObject setUserInput:](v29, "setUserInput:", v91);
                if (!-[NSObject type](v29, "type"))
                {
                  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC2310]);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v49)
                    v50 = 4;
                  else
                    v50 = 2;
                  -[NSObject setType:](v29, "setType:", v50);

                }
                objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1EF8]);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setLaunchString:](v29, "setLaunchString:", v51);

                -[NSObject setRelatedBundleID:](v29, "setRelatedBundleID:", v90);
                -[NSObject setRelatedAppIdentifier:](v29, "setRelatedAppIdentifier:", v90);
                objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC2128]);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setLaunchDates:](v29, "setLaunchDates:", v52);

                objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC2110]);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setItemProviderDataTypes:](v29, "setItemProviderDataTypes:", v53);

                objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC2118]);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setItemProviderFileTypes:](v29, "setItemProviderFileTypes:", v54);

                if (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEB0748])
                  || (objc_msgSend(v39, "hasPrefix:", CFSTR("com.apple")) & 1) == 0
                  && objc_msgSend(MEMORY[0x24BEB02B8], "isLowEngagementBundle:", v39))
                {
                  -[NSObject setHasTextContentMatch:](v29, "setHasTextContentMatch:", -[SPSearchCSResult doesQueryMatchContentForLowEngagementBundle:queryContext:](self, "doesQueryMatchContentForLowEngagementBundle:queryContext:", v92, v11));
                }
                else if ((objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEB05E8]) & 1) == 0
                       && (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEB0548]) & 1) == 0)
                {
                  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDC23A8]);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setHasTextContentMatch:](v29, "setHasTextContentMatch:", BOOLValueForAttr(v55));

                }
                -[NSObject contentType](v29, "contentType");
                v56 = objc_claimAutoreleasedReturnValue();
                if (!v56
                  || (v57 = (void *)v56,
                      -[NSObject contentTypeTree](v29, "contentTypeTree"),
                      v58 = (void *)objc_claimAutoreleasedReturnValue(),
                      v58,
                      v57,
                      !v58))
                {
                  objc_msgSend(v15, "objectForKey:", v85);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setContentType:](v29, "setContentType:", v59);

                  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1B98]);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setContentTypeTree:](v29, "setContentTypeTree:", v60);

                }
                objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1BD8]);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setDataOwnerType:](v29, "setDataOwnerType:", objc_msgSend(v61, "integerValue"));
                -[NSObject contentCreationDate](v29, "contentCreationDate");
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v62)
                {
                  objc_msgSend(v15, "objectForKey:", v84);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setContentCreationDate:](v29, "setContentCreationDate:", v63);

                }
                if (v86)
                {
                  objc_msgSend(v11, "searchString");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setCorrectedQuery:](v29, "setCorrectedQuery:", v64);

                }
                -[SPSearchResult rankingItem](self, "rankingItem");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setQueryId:](v29, "setQueryId:", objc_msgSend(v11, "queryIdent"));
                -[NSObject sectionBundleIdentifier](v29, "sectionBundleIdentifier");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v66, "isEqualToString:", *MEMORY[0x24BEB0358]))
                {

                }
                else
                {
                  -[NSObject sectionBundleIdentifier](v29, "sectionBundleIdentifier");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = objc_msgSend(v67, "isEqualToString:", *MEMORY[0x24BEB0350]);

                  if (!v68)
                  {
LABEL_74:
                    -[NSObject setRankingItem:](v29, "setRankingItem:", v65);
                    objc_msgSend(v65, "score");
                    -[NSObject setL2score:](v29, "setL2score:");
                    objc_msgSend(v11, "answerAttributes");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = (void *)objc_msgSend(v72, "copy");
                    -[NSObject setAnswerAttributes:](v29, "setAnswerAttributes:", v73);

                    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDC1DC8]);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setHasAppTopHitShortcut:](v29, "setHasAppTopHitShortcut:", BOOLValueForAttr(v74));

                    v37 = v92;
                    -[SPSearchCSResult populateAttributesForResult:withValues:](self, "populateAttributesForResult:withValues:", v29, v92);
                    v29 = v29;

                    v36 = v29;
LABEL_75:
                    v44 = v88;
                    v39 = v93;
                    goto LABEL_76;
                  }
                }
                if ((objc_msgSend(v65, "didMatchRankingDescriptor:", *MEMORY[0x24BEB03B0]) & 1) != 0
                  || (objc_msgSend(v65, "didMatchRankingDescriptor:", *MEMORY[0x24BEB04E8]) & 1) != 0)
                {
                  v69 = 0;
                }
                else
                {
                  v69 = objc_msgSend(v65, "didMatchRankingDescriptor:", *MEMORY[0x24BEB0390]);
                }
                -[NSObject setIsStaticCorrection:](v29, "setIsStaticCorrection:", v69);
                goto LABEL_74;
              }
            }
            else
            {

              v39 = v93;
            }
            SPLogForSPLogCategoryDefault();
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = *MEMORY[0x24BE84B00] ^ 1;
            if (os_log_type_enabled(v80, v81))
            {
              -[NSObject identifier](v29, "identifier");
              v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
              -[NSObject bundleID](v29, "bundleID");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v96 = v82;
              v97 = 2112;
              v98 = v83;
              _os_log_impl(&dword_2279CC000, v80, v81, "No title for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);

            }
            goto LABEL_31;
          }

          v39 = v93;
        }

      }
    }

    goto LABEL_40;
  }
  v36 = 0;
LABEL_77:

  return (SPSearchCSResult *)v36;
}

- (void)populateAttributesForResult:(id)a3 withValues:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  unsigned int v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unsigned int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  _QWORD v276[3];

  v276[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "attributeSet");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "attributeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = *MEMORY[0x24BDC1E70];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = BOOLValueForAttr(v8);

  v172 = *MEMORY[0x24BDC1AE0];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = BOOLValueForAttr(v9);

  v155 = *MEMORY[0x24BDC1D78];
  objc_msgSend(v7, "objectForKey:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v12, "numberWithDouble:", v13 * 1000000.0);
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v143 = *MEMORY[0x24BDC19E0];
  objc_msgSend(v7, "objectForKey:");
  v15 = objc_claimAutoreleasedReturnValue();
  v140 = *MEMORY[0x24BDC19F8];
  objc_msgSend(v7, "objectForKey:");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = *MEMORY[0x24BDC1A28];
  objc_msgSend(v7, "objectForKey:");
  v16 = objc_claimAutoreleasedReturnValue();
  v150 = *MEMORY[0x24BDC1A60];
  objc_msgSend(v7, "objectForKey:");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = *MEMORY[0x24BDC1A68];
  objc_msgSend(v7, "objectForKey:");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = *MEMORY[0x24BDC1A80];
  objc_msgSend(v7, "objectForKey:");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = *MEMORY[0x24BDC1A88];
  objc_msgSend(v7, "objectForKey:");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = *MEMORY[0x24BDC1A90];
  objc_msgSend(v7, "objectForKey:");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = *MEMORY[0x24BDC1AB0];
  objc_msgSend(v7, "objectForKey:");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = *MEMORY[0x24BDC1AA0];
  objc_msgSend(v7, "objectForKey:");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = *MEMORY[0x24BDC1AA8];
  objc_msgSend(v7, "objectForKey:");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = *MEMORY[0x24BDC1AB8];
  objc_msgSend(v7, "objectForKey:");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = *MEMORY[0x24BDC1AD0];
  objc_msgSend(v7, "objectForKey:");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = *MEMORY[0x24BDC2048];
  objc_msgSend(v7, "objectForKey:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = *MEMORY[0x24BDC2270];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = BOOLValueForAttr(v18);

  v170 = *MEMORY[0x24BDC2090];
  objc_msgSend(v7, "objectForKey:");
  v19 = objc_claimAutoreleasedReturnValue();
  v169 = *MEMORY[0x24BDC2098];
  objc_msgSend(v7, "objectForKey:");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = *MEMORY[0x24BDC20A0];
  objc_msgSend(v7, "objectForKey:");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = *MEMORY[0x24BDC20A8];
  objc_msgSend(v7, "objectForKey:");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = *MEMORY[0x24BDC20D0];
  objc_msgSend(v7, "objectForKey:");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = *MEMORY[0x24BDC20C8];
  objc_msgSend(v7, "objectForKey:");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = *MEMORY[0x24BDC20C0];
  objc_msgSend(v7, "objectForKey:");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = *MEMORY[0x24BDC20B8];
  objc_msgSend(v7, "objectForKey:");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = *MEMORY[0x24BDC1C10];
  objc_msgSend(v7, "objectForKey:");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = *MEMORY[0x24BDC20E8];
  objc_msgSend(v7, "objectForKey:");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = *MEMORY[0x24BDC2158];
  objc_msgSend(v7, "objectForKey:");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = *MEMORY[0x24BDC2148];
  objc_msgSend(v7, "objectForKey:");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = *MEMORY[0x24BDC2168];
  objc_msgSend(v7, "objectForKey:");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "attributeDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x24BDC23B0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v273 = (void *)v15;
  v271 = (void *)v16;
  v260 = (void *)v19;
  v275 = v5;
  if (!v22)
  {
    v247 = 0;
    goto LABEL_25;
  }
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v23, "objectAtIndex:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("kMDItemTextContent")) & 1) != 0
          || (unint64_t)objc_msgSend(v23, "count") <= 1)
        {
          goto LABEL_18;
        }
      }
      else if ((unint64_t)objc_msgSend(v23, "count") < 2)
      {
        goto LABEL_18;
      }
      objc_msgSend(v23, "objectAtIndex:", 1);
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v26;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v247 = 0;
            goto LABEL_23;
          }
          v276[0] = v26;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v276, 1);
          v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        v247 = v27;
LABEL_23:

        goto LABEL_24;
      }
LABEL_18:
      v247 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    v24 = 0;
  }
  v247 = 0;
LABEL_24:

LABEL_25:
  v274 = (void *)v14;

  v138 = *MEMORY[0x24BDC2190];
  objc_msgSend(v7, "objectForKey:");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = *MEMORY[0x24BDC21B8];
  objc_msgSend(v7, "objectForKey:");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = *MEMORY[0x24BDC21B0];
  objc_msgSend(v7, "objectForKey:");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = *MEMORY[0x24BDC2300];
  objc_msgSend(v7, "objectForKey:");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = *MEMORY[0x24BDC21C8];
  objc_msgSend(v7, "objectForKey:");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = *MEMORY[0x24BDC21A0];
  objc_msgSend(v7, "objectForKey:");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = *MEMORY[0x24BDC21C0];
  objc_msgSend(v7, "objectForKey:");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = *MEMORY[0x24BDC2198];
  objc_msgSend(v7, "objectForKey:");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = *MEMORY[0x24BDC21D0];
  objc_msgSend(v7, "objectForKey:");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = *MEMORY[0x24BDC21E0];
  objc_msgSend(v7, "objectForKey:");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = *MEMORY[0x24BDC21D8];
  objc_msgSend(v7, "objectForKey:");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = *MEMORY[0x24BDC21A8];
  objc_msgSend(v7, "objectForKey:");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = *MEMORY[0x24BDC1B28];
  objc_msgSend(v7, "objectForKey:");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = *MEMORY[0x24BDC1B58];
  objc_msgSend(v7, "objectForKey:");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = *MEMORY[0x24BDC1C00];
  objc_msgSend(v7, "objectForKey:");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = *MEMORY[0x24BDC1C20];
  objc_msgSend(v7, "objectForKey:");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = *MEMORY[0x24BDC1D40];
  objc_msgSend(v7, "objectForKey:");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC1EE8]);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = *MEMORY[0x24BDC1B78];
  objc_msgSend(v7, "objectForKey:");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC21F8]);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = *MEMORY[0x24BDC2220];
  objc_msgSend(v7, "objectForKey:");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = *MEMORY[0x24BDC1A58];
  objc_msgSend(v7, "objectForKey:");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = *MEMORY[0x24BDC1A50];
  objc_msgSend(v7, "objectForKey:");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = *MEMORY[0x24BDC1AD8];
  objc_msgSend(v7, "objectForKey:");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = *MEMORY[0x24BDC1C08];
  objc_msgSend(v7, "objectForKey:");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = *MEMORY[0x24BDC1EF0];
  objc_msgSend(v7, "objectForKey:");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = *MEMORY[0x24BDC1F00];
  objc_msgSend(v7, "objectForKey:");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = *MEMORY[0x24BDC2268];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = BOOLValueForAttr(v28);

  v126 = *MEMORY[0x24BDC2218];
  objc_msgSend(v7, "objectForKey:");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x24BDC1A18];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC1A18]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = *MEMORY[0x24BDC1A70];
  objc_msgSend(v7, "objectForKey:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = *MEMORY[0x24BDC1B00];
  objc_msgSend(v7, "objectForKey:");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = *MEMORY[0x24BDC1B38];
  objc_msgSend(v7, "objectForKey:");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = *MEMORY[0x24BDC1B48];
  objc_msgSend(v7, "objectForKey:");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = *MEMORY[0x24BDC1BA0];
  objc_msgSend(v7, "objectForKey:");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *MEMORY[0x24BDC1BE0];
  objc_msgSend(v7, "objectForKey:");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = *MEMORY[0x24BDC1BE8];
  objc_msgSend(v7, "objectForKey:");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = *MEMORY[0x24BDC1DE8];
  objc_msgSend(v7, "objectForKey:");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = *MEMORY[0x24BDC1ED8];
  objc_msgSend(v7, "objectForKey:");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = *MEMORY[0x24BDC2360];
  objc_msgSend(v7, "objectForKey:");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = *MEMORY[0x24BDC1F70];
  objc_msgSend(v7, "objectForKey:");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = *MEMORY[0x24BDC2018];
  objc_msgSend(v7, "objectForKey:");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *MEMORY[0x24BDC2120];
  objc_msgSend(v7, "objectForKey:");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = *MEMORY[0x24BDC2138];
  objc_msgSend(v7, "objectForKey:");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = *MEMORY[0x24BDC2160];
  objc_msgSend(v7, "objectForKey:");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC1B88]);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = *MEMORY[0x24BDC21F0];
  objc_msgSend(v7, "objectForKey:");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = *MEMORY[0x24BDC2230];
  objc_msgSend(v7, "objectForKey:");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = *MEMORY[0x24BDC22B0];
  objc_msgSend(v7, "objectForKey:");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = *MEMORY[0x24BDC22B8];
  objc_msgSend(v7, "objectForKey:");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = *MEMORY[0x24BDC22C0];
  objc_msgSend(v7, "objectForKey:");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = *MEMORY[0x24BDC22C8];
  objc_msgSend(v7, "objectForKey:");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = *MEMORY[0x24BDC22D0];
  objc_msgSend(v7, "objectForKey:");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = *MEMORY[0x24BDC1BD0];
  objc_msgSend(v7, "objectForKey:");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = *MEMORY[0x24BDC22D8];
  objc_msgSend(v7, "objectForKey:");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = *MEMORY[0x24BDC22E8];
  objc_msgSend(v7, "objectForKey:");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = *MEMORY[0x24BDC22E0];
  objc_msgSend(v7, "objectForKey:");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = *MEMORY[0x24BDC2310];
  objc_msgSend(v7, "objectForKey:");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = *MEMORY[0x24BDC2318];
  objc_msgSend(v7, "objectForKey:");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *MEMORY[0x24BDC1B90];
  objc_msgSend(v7, "objectForKey:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x24BDC1FA8];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC1FA8]);
  v34 = objc_claimAutoreleasedReturnValue();
  v101 = *MEMORY[0x24BDC1DC0];
  objc_msgSend(v7, "objectForKey:");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = *MEMORY[0x24BDC1EE0];
  objc_msgSend(v7, "objectForKey:");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = *MEMORY[0x24BDC1DA0];
  objc_msgSend(v7, "objectForKey:");
  v35 = objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC2358]);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v190 = (void *)v35;
  v95 = *MEMORY[0x24BDC2280];
  objc_msgSend(v7, "objectForKey:");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = *MEMORY[0x24BDC2278];
  objc_msgSend(v7, "objectForKey:");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = *MEMORY[0x24BDC1AF8];
  objc_msgSend(v7, "objectForKey:");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = *MEMORY[0x24BDC2070];
  objc_msgSend(v7, "objectForKey:");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = *MEMORY[0x24BDC2080];
  objc_msgSend(v7, "objectForKey:");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = *MEMORY[0x24BDC1BF8];
  objc_msgSend(v7, "objectForKey:");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = *MEMORY[0x24BDC1B80];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = BOOLValueForAttr(v36);

  v81 = *MEMORY[0x24BDC1B20];
  objc_msgSend(v7, "objectForKey:");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = *MEMORY[0x24BDC1DD0];
  objc_msgSend(v7, "objectForKey:");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = *MEMORY[0x24BDC2178];
  objc_msgSend(v7, "objectForKey:");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = *MEMORY[0x24BDC2180];
  objc_msgSend(v7, "objectForKey:");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = *MEMORY[0x24BDC1F90];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = BOOLValueForAttr(v37);

  v87 = *MEMORY[0x24BDC1F88];
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = BOOLValueForAttr(v38);

  v73 = *MEMORY[0x24BDC1F80];
  objc_msgSend(v7, "objectForKey:");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = *MEMORY[0x24BDC1F78];
  objc_msgSend(v7, "objectForKey:");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (v39)
    v41 = (void *)v39;
  else
    v41 = v32;
  v42 = v41;

  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "beginDictionary");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v154);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v44, v176);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v153);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v45, v172);

  objc_msgSend(v43, "encodeObject:withKey:", v274, v155);
  v156 = (void *)v34;
  objc_msgSend(v43, "encodeObject:withKey:", v34, v33);
  objc_msgSend(v43, "encodeObject:withKey:", v273, v143);
  objc_msgSend(v43, "encodeObject:withKey:", v272, v140);
  objc_msgSend(v43, "encodeObject:withKey:", v30, v29);
  objc_msgSend(v43, "encodeObject:withKey:", v271, v145);
  objc_msgSend(v43, "encodeObject:withKey:", v228, v65);
  objc_msgSend(v43, "encodeObject:withKey:", v229, v69);
  objc_msgSend(v43, "encodeObject:withKey:", v270, v150);
  objc_msgSend(v43, "encodeObject:withKey:", v269, v148);
  objc_msgSend(v43, "encodeObject:withKey:", v31, v58);
  objc_msgSend(v43, "encodeObject:withKey:", v268, v152);
  objc_msgSend(v43, "encodeObject:withKey:", v267, v149);
  objc_msgSend(v43, "encodeObject:withKey:", v266, v147);
  objc_msgSend(v43, "encodeObject:withKey:", v264, v142);
  objc_msgSend(v43, "encodeObject:withKey:", v265, v151);
  objc_msgSend(v43, "encodeObject:withKey:", v263, v146);
  objc_msgSend(v43, "encodeObject:withKey:", v262, v144);
  objc_msgSend(v43, "encodeObject:withKey:", v261, v141);
  objc_msgSend(v43, "encodeObject:withKey:", v227, v82);
  objc_msgSend(v43, "encodeObject:withKey:", v222, v60);
  objc_msgSend(v43, "encodeObject:withKey:", v236, v122);
  objc_msgSend(v43, "encodeObject:withKey:", v219, v59);
  objc_msgSend(v43, "encodeObject:withKey:", v233, v119);
  objc_msgSend(v43, "encodeObject:withKey:", v232, v117);
  objc_msgSend(v43, "encodeObject:withKey:", v221, v67);
  objc_msgSend(v43, "encodeObject:withKey:", v220, v66);
  objc_msgSend(v43, "encodeObject:withKey:", v235, v123);
  objc_msgSend(v43, "encodeObject:withKey:", v218, v62);
  objc_msgSend(v43, "encodeObject:withKey:", v217, v61);
  objc_msgSend(v43, "encodeObject:withKey:", v234, v124);
  objc_msgSend(v43, "encodeObject:withKey:", v226, v102);
  objc_msgSend(v43, "encodeObject:withKey:", v216, v64);
  objc_msgSend(v43, "encodeObject:withKey:", v215, v63);
  objc_msgSend(v43, "encodeObject:withKey:", v225, v105);
  objc_msgSend(v43, "encodeObject:withKey:", v224, v103);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v98);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v46, v104);

  objc_msgSend(v43, "encodeObject:withKey:", v231, v125);
  objc_msgSend(v43, "encodeObject:withKey:", v214, v71);
  objc_msgSend(v43, "encodeObject:withKey:", v213, v70);
  objc_msgSend(v43, "encodeObject:withKey:", v212, v68);
  objc_msgSend(v43, "encodeObject:withKey:", v17, v171);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v163);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v47, v173);

  objc_msgSend(v43, "encodeObject:withKey:", v260, v170);
  objc_msgSend(v43, "encodeObject:withKey:", v259, v169);
  objc_msgSend(v43, "encodeObject:withKey:", v258, v167);
  objc_msgSend(v43, "encodeObject:withKey:", v253, v159);
  objc_msgSend(v43, "encodeObject:withKey:", v254, v160);
  objc_msgSend(v43, "encodeObject:withKey:", v255, v164);
  objc_msgSend(v43, "encodeObject:withKey:", v257, v175);
  objc_msgSend(v43, "encodeObject:withKey:", v256, v174);
  objc_msgSend(v43, "encodeObject:withKey:", v252, v161);
  objc_msgSend(v43, "encodeObject:withKey:", v211, v90);
  objc_msgSend(v43, "encodeObject:withKey:", v251, v162);
  objc_msgSend(v43, "encodeObject:withKey:", v210, v92);
  objc_msgSend(v43, "encodeObject:withKey:", v223, v126);
  objc_msgSend(v43, "encodeObject:withKey:", v250, v168);
  objc_msgSend(v43, "encodeObject:withKey:", v249, v166);
  objc_msgSend(v43, "encodeObject:withKey:", v248, v165);
  objc_msgSend(v43, "encodeObject:withKey:", v207, v97);
  objc_msgSend(v43, "encodeObject:withKey:", v245, v136);
  objc_msgSend(v43, "encodeObject:withKey:", v246, v138);
  objc_msgSend(v43, "encodeObject:withKey:", v244, v137);
  objc_msgSend(v43, "encodeObject:withKey:", v243, v135);
  objc_msgSend(v43, "encodeObject:withKey:", v242, v134);
  objc_msgSend(v43, "encodeObject:withKey:", v241, v133);
  objc_msgSend(v43, "encodeObject:withKey:", v240, v132);
  objc_msgSend(v43, "encodeObject:withKey:", v239, v131);
  objc_msgSend(v43, "encodeObject:withKey:", v238, v130);
  objc_msgSend(v43, "encodeObject:withKey:", v237, v129);
  objc_msgSend(v43, "encodeObject:withKey:", v230, v128);
  objc_msgSend(v43, "encodeObject:withKey:", v206, v116);
  objc_msgSend(v43, "encodeObject:withKey:", v205, *MEMORY[0x24BDC2210]);
  objc_msgSend(v43, "encodeObject:withKey:", v208, v127);
  objc_msgSend(v43, "encodeObject:withKey:", v204, v121);
  objc_msgSend(v43, "encodeObject:withKey:", v203, v120);
  objc_msgSend(v43, "encodeObject:withKey:", v202, v118);
  objc_msgSend(v43, "encodeObject:withKey:", v201, v115);
  objc_msgSend(v43, "encodeObject:withKey:", v200, v114);
  objc_msgSend(v43, "encodeObject:withKey:", v199, v111);
  objc_msgSend(v43, "encodeObject:withKey:", v209, v139);
  objc_msgSend(v43, "encodeObject:withKey:", v198, v113);
  objc_msgSend(v43, "encodeObject:withKey:", v197, v110);
  objc_msgSend(v43, "encodeObject:withKey:", v247, CFSTR("SSAttributeTopMatchedStrings"));
  objc_msgSend(v43, "encodeObject:withKey:", v196, v112);
  objc_msgSend(v43, "encodeObject:withKey:", v195, v109);
  objc_msgSend(v43, "encodeObject:withKey:", v194, v108);
  objc_msgSend(v43, "encodeObject:withKey:", v193, v107);
  objc_msgSend(v43, "encodeObject:withKey:", v42, v106);

  objc_msgSend(v43, "encodeObject:withKey:", v192, v101);
  objc_msgSend(v43, "encodeObject:withKey:", v191, v100);
  objc_msgSend(v43, "encodeObject:withKey:", v190, v99);
  objc_msgSend(v43, "encodeObject:withKey:", v189, v95);
  objc_msgSend(v43, "encodeObject:withKey:", v188, v93);
  objc_msgSend(v43, "encodeObject:withKey:", v187, v91);
  objc_msgSend(v43, "encodeObject:withKey:", v186, v89);
  objc_msgSend(v43, "encodeObject:withKey:", v185, v86);
  objc_msgSend(v43, "encodeObject:withKey:", v184, v85);
  objc_msgSend(v43, "encodeObject:withKey:", v183, v81);
  objc_msgSend(v43, "encodeObject:withKey:", v182, v80);
  objc_msgSend(v43, "encodeObject:withKey:", v181, v78);
  objc_msgSend(v43, "encodeObject:withKey:", v180, v76);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v94);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v48, v96);

  objc_msgSend(v43, "encodeObject:withKey:", v179, v73);
  objc_msgSend(v43, "encodeObject:withKey:", v178, v72);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v84);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v49, v88);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v83);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "encodeObject:withKey:", v50, v87);

  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "endDictionary");
  objc_msgSend(v43, "data");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v275, "setAttributeData:", v52);

  objc_msgSend(v275, "lastUsedDate");
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v157)
    v55 = (uint64_t)v157;
  else
    v55 = (uint64_t)v158;
  if (v53)
    v56 = v53;
  else
    v56 = v55;
  objc_msgSend(v275, "setLastUsedDate:", v56);

  if (v157 && v158)
  {
    objc_msgSend(v157, "laterDate:", v158);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v275, "setLastUsedDate:", v57);

  }
}

@end
