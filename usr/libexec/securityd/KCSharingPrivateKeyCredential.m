@implementation KCSharingPrivateKeyCredential

- (KCSharingPrivateKeyCredential)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingPrivateKeyCredential *v6;
  id v7;
  const __CFSet *v8;
  const __CFDictionary *v9;
  void *v10;
  KCSharingPrivateKeyCredential *v11;

  v6 = self;
  v7 = objc_msgSend((id)objc_opt_class(self), "requiredAttributeKeys");
  v8 = (const __CFSet *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000A15C(a3, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v6 = -[KCSharingPrivateKeyCredential initWithAttributes:error:](v6, "initWithAttributes:error:", v10, a4);
    v11 = v6;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (KCSharingPrivateKeyCredential)initWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  KCSharingPrivateKeyCredential *v9;
  NSString *v10;
  NSString *sharingGroup;
  void *v12;
  NSString *v13;
  NSString *accessGroup;
  void *v15;
  NSData *v16;
  NSData *applicationTag;
  void *v18;
  NSString *v19;
  NSString *label;
  void *v21;
  NSData *v22;
  NSData *applicationLabel;
  void *v24;
  NSData *v25;
  NSData *keyMaterial;
  uint64_t v27;
  NSDate *creationDate;
  uint64_t v29;
  NSDate *modificationDate;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)KCSharingPrivateKeyCredential;
  v9 = -[KCSharingPrivateKeyCredential init](&v32, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    sharingGroup = v9->_sharingGroup;
    v9->_sharingGroup = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessGroup"));
    v13 = (NSString *)objc_msgSend(v12, "copy");
    accessGroup = v9->_accessGroup;
    v9->_accessGroup = v13;

    v9->_keyType = (int64_t)objc_msgSend(v7, "keyType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationTag"));
    v16 = (NSData *)objc_msgSend(v15, "copy");
    applicationTag = v9->_applicationTag;
    v9->_applicationTag = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "label"));
    v19 = (NSString *)objc_msgSend(v18, "copy");
    label = v9->_label;
    v9->_label = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationLabel"));
    v22 = (NSData *)objc_msgSend(v21, "copy");
    applicationLabel = v9->_applicationLabel;
    v9->_applicationLabel = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyMaterial"));
    v25 = (NSData *)objc_msgSend(v24, "copy");
    keyMaterial = v9->_keyMaterial;
    v9->_keyMaterial = v25;

    v9->_keySizeInBits = (int64_t)objc_msgSend(v7, "keySizeInBits");
    v9->_effectiveKeySize = (int64_t)objc_msgSend(v7, "effectiveKeySize");
    objc_msgSend(v7, "creationDate");
    v27 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v27;

    objc_msgSend(v7, "modificationDate");
    v29 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v29;

  }
  return v9;
}

- (KCSharingPrivateKeyCredential)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingPrivateKeyCredential *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  NSString *v27;
  NSString *sharingGroup;
  NSString *v29;
  NSString *accessGroup;
  NSData *v31;
  NSData *applicationTag;
  NSString *v33;
  NSString *label;
  NSData *v35;
  NSData *applicationLabel;
  NSData *v37;
  NSData *keyMaterial;
  NSDate *v39;
  NSDate *creationDate;
  NSDate *v41;
  int v42;
  NSDate *modificationDate;
  id v44;
  void *v45;
  void *v46;
  KCSharingPrivateKeyCredential *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  uint64_t v63;
  id *v64;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  objc_super v89;
  CFStringRef v90;
  NSDate *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  CFStringRef v95;
  CFStringRef v96;
  id v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  CFStringRef v101;
  CFStringRef v102;
  id v103;
  const __CFString *v104;
  void *v105;
  const __CFString *v106;
  CFStringRef v107;
  CFStringRef v108;
  id v109;
  const __CFString *v110;
  id v111;
  CFStringRef v112;
  id v113;
  const __CFString *v114;
  void *v115;
  const __CFString *v116;
  CFStringRef v117;
  CFStringRef v118;
  id v119;
  const __CFString *v120;
  void *v121;
  const __CFString *v122;
  CFStringRef v123;
  CFStringRef v124;
  id v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  CFStringRef v129;
  CFStringRef v130;
  id v131;
  const __CFString *v132;
  void *v133;
  const __CFString *v134;
  CFStringRef v135;
  CFStringRef v136;
  id v137;
  const __CFString *v138;
  void *v139;
  const __CFString *v140;
  CFStringRef v141;
  CFStringRef v142;
  id v143;
  const __CFString *v144;
  void *v145;
  const __CFString *v146;
  CFStringRef v147;
  uint64_t v148;
  id v149;
  const __CFString *v150;
  id v151;
  const __CFString *v152;
  uint64_t v153;

  v6 = a3;
  v89.receiver = self;
  v89.super_class = (Class)KCSharingPrivateKeyCredential;
  v7 = -[KCSharingPrivateKeyCredential init](&v89, "init");
  if (!v7)
    goto LABEL_51;
  v8 = kSecAttrSharingGroup;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrSharingGroup));
  v10 = (void *)v9;
  if (!v9)
  {
    v152 = CFSTR("KCSharingMissingAttribute");
    v153 = v8;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v12);
LABEL_36:

    goto LABEL_37;
  }
  if ((_NSIsNSString(v9) & 1) == 0)
  {
    v150 = CFSTR("KCSharingInvalidAttribute");
    v148 = v8;
    v12 = objc_msgSend(v10, "copy");
    v149 = v12;
    v44 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
    v151 = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v45);
LABEL_34:

    goto LABEL_35;
  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrAccessGroup));
  v12 = (id)v11;
  if (!v11)
  {
    v146 = CFSTR("KCSharingMissingAttribute");
    v147 = kSecAttrAccessGroup;
    v44 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v44);
LABEL_35:

    goto LABEL_36;
  }
  if ((_NSIsNSString(v11) & 1) == 0)
  {
    v144 = CFSTR("KCSharingInvalidAttribute");
    v142 = kSecAttrAccessGroup;
    v44 = objc_msgSend(v12, "copy");
    v143 = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1));
    v145 = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v46);

    goto LABEL_34;
  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrKeyType));
  v14 = (void *)v13;
  if (!v13)
  {
    v140 = CFSTR("KCSharingMissingAttribute");
    v141 = kSecAttrKeyType;
    v42 = 1;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
    sub_10004D4E8(a4, 22, (uint64_t)v16);
    goto LABEL_50;
  }
  if ((_NSIsNSString(v13) & 1) == 0 && (_NSIsNSNumber(v14) & 1) == 0)
  {
    v138 = CFSTR("KCSharingInvalidAttribute");
    v136 = kSecAttrKeyType;
    v16 = objc_msgSend(v14, "copy");
    v137 = v16;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1));
    v139 = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1));
    sub_10004D4E8(a4, 1, (uint64_t)v52);

    v42 = 1;
    goto LABEL_50;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrApplicationTag));
  v16 = (id)v15;
  if (v15)
  {
    if (_NSIsNSData(v15) && objc_msgSend(v16, "length"))
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrLabel));
      v18 = (void *)v17;
      if (v17)
      {
        if ((_NSIsNSString(v17) & 1) != 0)
        {
          v85 = v18;
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrApplicationLabel));
          v20 = (void *)v19;
          if (v19)
          {
            if (_NSIsNSData(v19) && objc_msgSend(v20, "length"))
            {
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecValueData));
              v82 = (void *)v21;
              if (v21)
              {
                v22 = (void *)v21;
                v83 = v20;
                if (_NSIsNSData(v21) && objc_msgSend(v22, "length"))
                {
                  v86 = v14;
                  v80 = v16;
                  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrKeySizeInBits));
                  if ((_NSIsNSNumber(v81) & 1) != 0 || (_NSIsNSString(v81) & 1) != 0)
                  {
                    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrEffectiveKeySize));
                    v24 = (id)v23;
                    if (v23)
                    {
                      if ((_NSIsNSNumber(v23) & 1) != 0 || (_NSIsNSString(v24) & 1) != 0)
                      {
                        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrCreationDate));
                        v26 = (id)v25;
                        if (v25)
                        {
                          if ((_NSIsNSDate(v25) & 1) != 0)
                          {
                            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kSecAttrModificationDate));
                            if (v77)
                            {
                              if ((_NSIsNSDate(v77) & 1) != 0)
                              {
                                v27 = (NSString *)objc_msgSend(v10, "copy");
                                sharingGroup = v7->_sharingGroup;
                                v7->_sharingGroup = v27;

                                v29 = (NSString *)objc_msgSend(v12, "copy");
                                accessGroup = v7->_accessGroup;
                                v7->_accessGroup = v29;

                                v7->_keyType = (int)objc_msgSend(v86, "intValue");
                                v31 = (NSData *)objc_msgSend(v80, "copy");
                                applicationTag = v7->_applicationTag;
                                v7->_applicationTag = v31;

                                v33 = (NSString *)objc_msgSend(v18, "copy");
                                label = v7->_label;
                                v7->_label = v33;

                                v35 = (NSData *)objc_msgSend(v20, "copy");
                                applicationLabel = v7->_applicationLabel;
                                v7->_applicationLabel = v35;

                                v37 = (NSData *)objc_msgSend(v82, "copy");
                                keyMaterial = v7->_keyMaterial;
                                v7->_keyMaterial = v37;

                                v7->_keySizeInBits = (int64_t)objc_msgSend(v81, "integerValue");
                                v7->_effectiveKeySize = (int64_t)objc_msgSend(v24, "integerValue");
                                v39 = (NSDate *)objc_msgSend(v26, "copy");
                                creationDate = v7->_creationDate;
                                v7->_creationDate = v39;

                                v41 = (NSDate *)objc_msgSend(v77, "copy");
                                v42 = 0;
                                modificationDate = v7->_modificationDate;
                                v7->_modificationDate = v41;
                              }
                              else
                              {
                                v92 = CFSTR("KCSharingInvalidAttribute");
                                v90 = kSecAttrModificationDate;
                                modificationDate = (NSDate *)objc_msgSend(v77, "copy");
                                v91 = modificationDate;
                                v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
                                v93 = v75;
                                v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));
                                sub_10004D4E8(a4, 1, (uint64_t)v76);

                                v42 = 1;
                              }
                            }
                            else
                            {
                              v94 = CFSTR("KCSharingMissingAttribute");
                              v95 = kSecAttrModificationDate;
                              v42 = 1;
                              modificationDate = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
                              sub_10004D4E8(a4, 22, (uint64_t)modificationDate);
                            }

                          }
                          else
                          {
                            v98 = CFSTR("KCSharingInvalidAttribute");
                            v96 = kSecAttrCreationDate;
                            v79 = objc_msgSend(v26, "copy");
                            v97 = v79;
                            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
                            v99 = v73;
                            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1));
                            sub_10004D4E8(a4, 1, (uint64_t)v74);

                            v42 = 1;
                          }
                        }
                        else
                        {
                          v100 = CFSTR("KCSharingMissingAttribute");
                          v101 = kSecAttrCreationDate;
                          v42 = 1;
                          v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
                          sub_10004D4E8(a4, 22, (uint64_t)v78);

                        }
                      }
                      else
                      {
                        v104 = CFSTR("KCSharingInvalidAttribute");
                        v102 = kSecAttrEffectiveKeySize;
                        v26 = objc_msgSend(v24, "copy");
                        v103 = v26;
                        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
                        v105 = v71;
                        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
                        sub_10004D4E8(a4, 1, (uint64_t)v72);

                        v42 = 1;
                      }
                    }
                    else
                    {
                      v106 = CFSTR("KCSharingMissingAttribute");
                      v107 = kSecAttrEffectiveKeySize;
                      v42 = 1;
                      v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
                      sub_10004D4E8(a4, 22, (uint64_t)v26);
                    }
                  }
                  else
                  {
                    v110 = CFSTR("KCSharingInvalidAttribute");
                    v108 = kSecAttrKeySizeInBits;
                    v24 = objc_msgSend(v81, "copy");
                    v109 = v24;
                    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1));
                    v111 = v26;
                    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1));
                    sub_10004D4E8(a4, 1, (uint64_t)v70);

                    v42 = 1;
                  }

                  v16 = v80;
                  v69 = v81;
                  v14 = v86;
                }
                else
                {
                  v114 = CFSTR("KCSharingInvalidAttribute");
                  v112 = kSecValueData;
                  v66 = objc_msgSend(v22, "copy");
                  v113 = v66;
                  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
                  v115 = v67;
                  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1));
                  sub_10004D4E8(a4, 1, (uint64_t)v68);

                  v69 = v66;
                  v42 = 1;
                }
                v20 = v83;
              }
              else
              {
                v116 = CFSTR("KCSharingMissingAttribute");
                v117 = kSecValueData;
                v42 = 1;
                v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
                sub_10004D4E8(a4, 22, (uint64_t)v69);
              }

              v18 = v85;
              v62 = v82;
              goto LABEL_47;
            }
            v120 = CFSTR("KCSharingInvalidAttribute");
            v118 = kSecAttrApplicationLabel;
            v58 = objc_msgSend(v20, "copy");
            v119 = v58;
            v84 = v20;
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
            v121 = v59;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));
            v61 = a4;
            v62 = v58;
            sub_10004D4E8(v61, 1, (uint64_t)v60);

            v20 = v84;
            v42 = 1;
          }
          else
          {
            v122 = CFSTR("KCSharingMissingAttribute");
            v123 = kSecAttrApplicationLabel;
            v42 = 1;
            v63 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1));
            v64 = a4;
            v62 = (void *)v63;
            sub_10004D4E8(v64, 22, v63);
          }
          v18 = v85;
LABEL_47:

          goto LABEL_48;
        }
        v126 = CFSTR("KCSharingInvalidAttribute");
        v124 = kSecAttrLabel;
        v53 = objc_msgSend(v18, "copy");
        v125 = v53;
        v88 = v14;
        v54 = v16;
        v55 = v18;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1));
        v127 = v56;
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
        sub_10004D4E8(a4, 1, (uint64_t)v57);

        v20 = v53;
        v18 = v55;
        v16 = v54;
        v14 = v88;
        v42 = 1;
      }
      else
      {
        v128 = CFSTR("KCSharingMissingAttribute");
        v129 = kSecAttrLabel;
        v42 = 1;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1));
        sub_10004D4E8(a4, 22, (uint64_t)v20);
      }
    }
    else
    {
      v132 = CFSTR("KCSharingInvalidAttribute");
      v130 = kSecAttrApplicationTag;
      v87 = v14;
      v48 = v16;
      v49 = objc_msgSend(v16, "copy");
      v131 = v49;
      v42 = 1;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
      v133 = v20;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
      sub_10004D4E8(a4, 1, (uint64_t)v50);

      v18 = v49;
      v16 = v48;
      v14 = v87;
    }
LABEL_48:

    goto LABEL_49;
  }
  v134 = CFSTR("KCSharingMissingAttribute");
  v135 = kSecAttrApplicationTag;
  v42 = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
  sub_10004D4E8(a4, 22, (uint64_t)v18);
LABEL_49:

LABEL_50:
  if (!v42)
  {
LABEL_51:
    v47 = v7;
    goto LABEL_52;
  }
LABEL_37:
  v47 = 0;
LABEL_52:

  return v47;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  char *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential sharingGroup](self, "sharingGroup"));
  v4 = objc_msgSend(v3, "hash");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential accessGroup](self, "accessGroup"));
  v6 = (_BYTE *)objc_msgSend(v5, "hash") - (_BYTE *)v4 + 32 * (_QWORD)v4;

  v7 = -[KCSharingPrivateKeyCredential keyType](self, "keyType") + 32 * v6 - v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationTag](self, "applicationTag"));
  v9 = (int64_t)objc_msgSend(v8, "hash") + 32 * v7 - v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential label](self, "label"));
  v11 = (int64_t)objc_msgSend(v10, "hash") + 32 * v9 - v9;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationLabel](self, "applicationLabel"));
  v13 = (int64_t)objc_msgSend(v12, "hash") + 32 * v11 - v11;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential keyMaterial](self, "keyMaterial"));
  v15 = (int64_t)objc_msgSend(v14, "hash") + 32 * v13 - v13;

  v16 = -[KCSharingPrivateKeyCredential keySizeInBits](self, "keySizeInBits") + 32 * v15 - v15;
  v17 = -[KCSharingPrivateKeyCredential effectiveKeySize](self, "effectiveKeySize") + 32 * v16 - v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential creationDate](self, "creationDate"));
  v19 = (int64_t)objc_msgSend(v18, "hash") + 32 * v17 - v17;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential modificationDate](self, "modificationDate"));
  v21 = (char *)objc_msgSend(v20, "hash") + 32 * v19 - v19;

  return (unint64_t)v21;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingPrivateKeyCredential *v4;
  KCSharingPrivateKeyCredential *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (KCSharingPrivateKeyCredential *)a3;
  if (v4 == self)
  {
    v19 = 1;
  }
  else if (-[KCSharingPrivateKeyCredential isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential sharingGroup](self, "sharingGroup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential sharingGroup](v5, "sharingGroup"));
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential accessGroup](self, "accessGroup"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential accessGroup](v5, "accessGroup"));
      if (objc_msgSend(v8, "isEqualToString:", v9)
        && (v10 = -[KCSharingPrivateKeyCredential keyType](self, "keyType"),
            v10 == (id)-[KCSharingPrivateKeyCredential keyType](v5, "keyType")))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationTag](self, "applicationTag"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationTag](v5, "applicationTag"));
        if (objc_msgSend(v11, "isEqualToData:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential label](self, "label"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential label](v5, "label"));
          v31 = v13;
          if (objc_msgSend(v13, "isEqualToString:", v30))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationLabel](self, "applicationLabel"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationLabel](v5, "applicationLabel"));
            v29 = v14;
            if (objc_msgSend(v14, "isEqualToData:", v28))
            {
              v15 = objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential keyMaterial](self, "keyMaterial"));
              v16 = objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential keyMaterial](v5, "keyMaterial"));
              v27 = (void *)v15;
              v17 = (void *)v15;
              v18 = (void *)v16;
              if (objc_msgSend(v17, "isEqualToData:", v16)
                && (v24 = -[KCSharingPrivateKeyCredential keySizeInBits](self, "keySizeInBits"),
                    v24 == (id)-[KCSharingPrivateKeyCredential keySizeInBits](v5, "keySizeInBits"))
                && (v25 = -[KCSharingPrivateKeyCredential effectiveKeySize](self, "effectiveKeySize"),
                    v25 == (id)-[KCSharingPrivateKeyCredential effectiveKeySize](v5, "effectiveKeySize")))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential creationDate](self, "creationDate"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential creationDate](v5, "creationDate"));
                if (objc_msgSend(v26, "isEqualToDate:"))
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential modificationDate](self, "modificationDate"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential modificationDate](v5, "modificationDate"));
                  v19 = objc_msgSend(v22, "isEqualToDate:", v21);

                }
                else
                {
                  v19 = 0;
                }

              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential sharingGroup](self, "sharingGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential accessGroup](self, "accessGroup"));
  v5 = -[KCSharingPrivateKeyCredential keyType](self, "keyType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationTag](self, "applicationTag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential label](self, "label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationLabel](self, "applicationLabel"));
  v9 = -[KCSharingPrivateKeyCredential keySizeInBits](self, "keySizeInBits");
  v10 = -[KCSharingPrivateKeyCredential effectiveKeySize](self, "effectiveKeySize");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential creationDate](self, "creationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential modificationDate](self, "modificationDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingPrivateKeyCredential(sharingGroup:%@ accessGroup:%@ keyType:%ld applicationTag:%@ label:%@ applicationLabel:%@ keySizeInBits:%ld effectiveKeySize:%ld creationDate:%@ modificationDate:%@)"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12));

  return (NSString *)v13;
}

- (id)proto
{
  KCSharingPBPrivateKeyCredential *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_new(KCSharingPBPrivateKeyCredential);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential accessGroup](self, "accessGroup"));
  -[KCSharingPBPrivateKeyCredential setAccessGroup:](v3, "setAccessGroup:", v4);

  -[KCSharingPBPrivateKeyCredential setKeyType:](v3, "setKeyType:", -[KCSharingPrivateKeyCredential keyType](self, "keyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationTag](self, "applicationTag"));
  -[KCSharingPBPrivateKeyCredential setApplicationTag:](v3, "setApplicationTag:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential label](self, "label"));
  -[KCSharingPBPrivateKeyCredential setLabel:](v3, "setLabel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationLabel](self, "applicationLabel"));
  -[KCSharingPBPrivateKeyCredential setApplicationLabel:](v3, "setApplicationLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential keyMaterial](self, "keyMaterial"));
  -[KCSharingPBPrivateKeyCredential setKeyMaterial:](v3, "setKeyMaterial:", v8);

  -[KCSharingPBPrivateKeyCredential setKeySizeInBits:](v3, "setKeySizeInBits:", -[KCSharingPrivateKeyCredential keySizeInBits](self, "keySizeInBits"));
  -[KCSharingPBPrivateKeyCredential setEffectiveKeySize:](v3, "setEffectiveKeySize:", -[KCSharingPrivateKeyCredential effectiveKeySize](self, "effectiveKeySize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential creationDate](self, "creationDate"));
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  -[KCSharingPBPrivateKeyCredential setCreationDate:](v3, "setCreationDate:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential modificationDate](self, "modificationDate"));
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  -[KCSharingPBPrivateKeyCredential setModificationDate:](v3, "setModificationDate:");

  return v3;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[30];
  _QWORD v19[30];

  v18[0] = kSecAttrSharingGroup;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential sharingGroup](self, "sharingGroup", a3, a4));
  v19[0] = v17;
  v18[1] = kSecAttrKeyType;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[KCSharingPrivateKeyCredential keyType](self, "keyType")));
  v19[1] = v16;
  v18[2] = kSecAttrApplicationTag;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationTag](self, "applicationTag"));
  v19[2] = v5;
  v18[3] = kSecAttrLabel;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential label](self, "label"));
  v19[3] = v6;
  v18[4] = kSecAttrApplicationLabel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential applicationLabel](self, "applicationLabel"));
  v19[4] = v7;
  v18[5] = kSecValueData;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential keyMaterial](self, "keyMaterial"));
  v19[5] = v8;
  v18[6] = kSecAttrKeySizeInBits;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[KCSharingPrivateKeyCredential keySizeInBits](self, "keySizeInBits")));
  v19[6] = v9;
  v18[7] = kSecAttrEffectiveKeySize;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[KCSharingPrivateKeyCredential effectiveKeySize](self, "effectiveKeySize")));
  v19[7] = v10;
  v18[8] = kSecAttrCreationDate;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential creationDate](self, "creationDate"));
  v19[8] = v11;
  v18[9] = kSecAttrModificationDate;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential modificationDate](self, "modificationDate"));
  v19[9] = v12;
  v19[10] = &__kCFBooleanFalse;
  v18[10] = kSecAttrSynchronizable;
  v18[11] = kSecAttrAccessible;
  v19[11] = kSecAttrAccessibleWhenUnlocked;
  v18[12] = kSecAttrAccessGroup;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPrivateKeyCredential accessGroup](self, "accessGroup"));
  v19[12] = v13;
  v19[13] = kSecAttrKeyClassPrivate;
  v18[13] = kSecAttrKeyClass;
  v18[14] = kSecAttrIsPermanent;
  v19[14] = &__kCFBooleanTrue;
  v19[15] = &__kCFBooleanTrue;
  v18[15] = kSecAttrIsPrivate;
  v18[16] = kSecAttrIsModifiable;
  v19[16] = &__kCFBooleanTrue;
  v19[17] = &__kCFBooleanFalse;
  v18[17] = kSecAttrIsSensitive;
  v18[18] = kSecAttrWasAlwaysSensitive;
  v19[18] = &__kCFBooleanFalse;
  v19[19] = &__kCFBooleanTrue;
  v18[19] = kSecAttrIsExtractable;
  v18[20] = kSecAttrWasNeverExtractable;
  v19[20] = &__kCFBooleanFalse;
  v19[21] = &__kCFBooleanFalse;
  v18[21] = kSecAttrCanEncrypt;
  v18[22] = kSecAttrCanDecrypt;
  v19[22] = &__kCFBooleanTrue;
  v19[23] = &__kCFBooleanTrue;
  v18[23] = kSecAttrCanDerive;
  v18[24] = kSecAttrCanSign;
  v19[24] = &__kCFBooleanTrue;
  v19[25] = &__kCFBooleanFalse;
  v18[25] = kSecAttrCanVerify;
  v18[26] = kSecAttrCanSignRecover;
  v19[26] = &__kCFBooleanFalse;
  v19[27] = &__kCFBooleanFalse;
  v18[27] = kSecAttrCanVerifyRecover;
  v18[28] = kSecAttrCanWrap;
  v18[29] = kSecAttrCanUnwrap;
  v19[28] = &__kCFBooleanFalse;
  v19[29] = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 30));

  return v14;
}

- (NSString)sharingGroup
{
  return self->_sharingGroup;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSData)applicationTag
{
  return self->_applicationTag;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)applicationLabel
{
  return self->_applicationLabel;
}

- (NSData)keyMaterial
{
  return self->_keyMaterial;
}

- (int64_t)keySizeInBits
{
  return self->_keySizeInBits;
}

- (int64_t)effectiveKeySize
{
  return self->_effectiveKeySize;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_applicationTag, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_sharingGroup, 0);
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_1000119B8((uint64_t)CFSTR("keys"), &qword_100341270, (uint64_t)&unk_100341268);
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_100341108 != -1)
    dispatch_once(&qword_100341108, &stru_1002DE550);
  return (NSSet *)(id)qword_100341100;
}

@end
