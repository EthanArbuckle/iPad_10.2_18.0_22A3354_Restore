@implementation _PSSuggestionTemplate

- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 reason:(id)a12 reasonType:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  id v25;
  id v26;
  id v27;
  void *v29;
  id v30;
  void *v32;
  _PSSuggestionTemplate *v34;

  v29 = (void *)MEMORY[0x1E0CB37E8];
  v30 = a13;
  v27 = a12;
  v26 = a11;
  v16 = a10;
  v17 = a9;
  v23 = a8;
  v18 = a7;
  v19 = a6;
  v25 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v29, "numberWithDouble:", -1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[_PSSuggestionTemplate initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:handleToDisplayNameMapping:reason:reasonType:modelScore:](self, "initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:handleToDisplayNameMapping:reason:reasonType:modelScore:", v21, v20, v25, v19, v18, v23, v17, v16, v26, 0, v27, v30, v32);

  return v34;
}

- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 reason:(id)a12 reasonType:(id)a13 modelScore:(id)a14
{
  return -[_PSSuggestionTemplate initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:handleToDisplayNameMapping:reason:reasonType:modelScore:](self, "initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:handleToDisplayNameMapping:reason:reasonType:modelScore:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12, a13, a14);
}

- (_PSSuggestionTemplate)initWithBundleID:(id)a3 interactionRecipients:(id)a4 image:(id)a5 groupName:(id)a6 recipientContactIDs:(id)a7 recipientEmailAddresses:(id)a8 recipientPhoneNumbers:(id)a9 recipientDisplayNames:(id)a10 contactIdToHandleMapping:(id)a11 handleToDisplayNameMapping:(id)a12 reason:(id)a13 reasonType:(id)a14 modelScore:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _PSSuggestionTemplate *v25;
  _PSSuggestionTemplate *v26;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a3;
  v29 = a4;
  v39 = a4;
  v30 = a5;
  v38 = a5;
  v31 = a6;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v33 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v41.receiver = self;
  v41.super_class = (Class)_PSSuggestionTemplate;
  v25 = -[_PSSuggestionTemplate init](&v41, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_bundleID, a3);
    objc_storeStrong((id *)&v26->_interactionRecipients, v29);
    objc_storeStrong((id *)&v26->_image, v30);
    objc_storeStrong((id *)&v26->_groupName, v31);
    objc_storeStrong((id *)&v26->_recipientContactIDs, a7);
    objc_storeStrong((id *)&v26->_recipientEmailAddresses, a8);
    objc_storeStrong((id *)&v26->_recipientPhoneNumbers, a9);
    objc_storeStrong((id *)&v26->_recipientDisplayNames, a10);
    objc_storeStrong((id *)&v26->_contactIdToHandleMapping, a11);
    objc_storeStrong((id *)&v26->_handleToDisplayNameMapping, a12);
    objc_storeStrong((id *)&v26->_reason, a13);
    objc_storeStrong((id *)&v26->_reasonType, a14);
    objc_storeStrong((id *)&v26->_modelScore, a15);
  }

  return v26;
}

- (id)suggestionWithContactIDMapping:(id)a3 phoneMapping:(id)a4 emailMapping:(id)a5 contactStore:(id)a6 contactKeysToFetch:(id)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _PSRecipient *v37;
  void *v38;
  _PSRecipient *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  _PSRecipient *v46;
  _PSRecipient *v47;
  void *v48;
  void *v49;
  _PSRecipient *v50;
  NSObject *v51;
  _PSRecipient *v52;
  _PSRecipient *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  uint64_t v60;
  void *v61;
  _PSRecipient *v62;
  _PSRecipient *v63;
  void *v64;
  void *v65;
  _PSRecipient *v66;
  NSObject *v67;
  _PSRecipient *v68;
  _PSRecipient *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  uint64_t v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *n;
  void *v80;
  void *v81;
  _PSRecipient *v82;
  void *v83;
  void *v84;
  _PSSuggestion *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  char v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  _PSSuggestion *v95;
  NSObject *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id obj;
  id obja;
  id objb;
  NSObject *v120;
  NSObject *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t buf[4];
  void *v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v115 = a4;
  v114 = a5;
  -[_PSSuggestionTemplate bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
      -[_PSSuggestionTemplate suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:].cold.1();
    v85 = 0;
    goto LABEL_82;
  }
  v121 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, 0);

  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, 0);

  v22 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants sharePlayBundleId](_PSConstants, "sharePlayBundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v13;
  +[_PSConstants collaborationSuggestionBundleId](_PSConstants, "collaborationSuggestionBundleId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (void *)objc_msgSend(v22, "initWithObjects:", v23, v25, 0);

  v112 = v17;
  v109 = (void *)v21;
  objc_msgSend(v17, "setByAddingObjectsFromSet:", v21);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v10;
  v120 = v13;
  if (objc_msgSend(v10, "count"))
  {
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    -[_PSSuggestionTemplate recipientContactIDs](self, "recipientContactIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v138, v148, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v139;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v139 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i);
          if ((objc_msgSend(v24, "containsObject:", v31) & 1) == 0)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v31);
            if (v32)
            {
              -[_PSSuggestionTemplate contactIdToHandleMapping](self, "contactIdToHandleMapping");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v34)
              {
                -[_PSSuggestionTemplate contactIdToHandleMapping](self, "contactIdToHandleMapping");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:", v36);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v37 = [_PSRecipient alloc];
              objc_msgSend(v32, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v37, "initWithIdentifier:handle:displayName:contact:", v38, v34, 0, v32);

              -[NSObject addObject:](v121, "addObject:", v39);
              v24 = v120;
              -[NSObject addObject:](v120, "addObject:", v31);
              if (v34)
                -[NSObject addObject:](v120, "addObject:", v34);

              v10 = v113;
            }

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v138, v148, 16);
      }
      while (v28);
    }

  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  -[_PSSuggestionTemplate recipientEmailAddresses](self, "recipientEmailAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v135;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v135 != v42)
          objc_enumerationMutation(obj);
        v44 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * j);
        if ((objc_msgSend(v24, "containsObject:", v44) & 1) == 0)
        {
          objc_msgSend(v114, "objectForKeyedSubscript:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "identifier");
          v46 = (_PSRecipient *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            if ((objc_msgSend(v24, "containsObject:", v46) & 1) == 0)
            {
              v47 = [_PSRecipient alloc];
              -[_PSSuggestionTemplate handleToDisplayNameMapping](self, "handleToDisplayNameMapping");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectForKeyedSubscript:", v44);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v47, "initWithIdentifier:handle:displayName:contact:", v46, v44, v49, v45);

              v24 = v120;
              -[NSObject addObject:](v121, "addObject:", v50);
              v51 = v120;
              v52 = v46;
              goto LABEL_29;
            }
          }
          else
          {
            v53 = [_PSRecipient alloc];
            -[_PSSuggestionTemplate handleToDisplayNameMapping](self, "handleToDisplayNameMapping");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v44);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v53, "initWithIdentifier:handle:displayName:contact:", &stru_1E4402490, v44, v55, 0);

            v24 = v120;
            v51 = v121;
            v52 = v50;
LABEL_29:
            -[NSObject addObject:](v51, "addObject:", v52);

          }
          objc_msgSend(v24, "addObject:", v44);

          continue;
        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
    }
    while (v41);
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  -[_PSSuggestionTemplate recipientPhoneNumbers](self, "recipientPhoneNumbers");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
  if (!v56)
    goto LABEL_47;
  v57 = v56;
  v58 = *(_QWORD *)v131;
  do
  {
    for (k = 0; k != v57; ++k)
    {
      if (*(_QWORD *)v131 != v58)
        objc_enumerationMutation(obja);
      v60 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * k);
      if ((objc_msgSend(v24, "containsObject:", v60) & 1) == 0)
      {
        objc_msgSend(v115, "objectForKeyedSubscript:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "identifier");
        v62 = (_PSRecipient *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          if ((objc_msgSend(v24, "containsObject:", v62) & 1) == 0)
          {
            v63 = [_PSRecipient alloc];
            -[_PSSuggestionTemplate handleToDisplayNameMapping](self, "handleToDisplayNameMapping");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectForKeyedSubscript:", v60);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v63, "initWithIdentifier:handle:displayName:contact:", v62, v60, v65, v61);

            v24 = v120;
            -[NSObject addObject:](v121, "addObject:", v66);
            v67 = v120;
            v68 = v62;
            goto LABEL_43;
          }
        }
        else
        {
          v69 = [_PSRecipient alloc];
          -[_PSSuggestionTemplate handleToDisplayNameMapping](self, "handleToDisplayNameMapping");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "objectForKeyedSubscript:", v60);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v69, "initWithIdentifier:handle:displayName:contact:", &stru_1E4402490, v60, v71, 0);

          v24 = v120;
          v67 = v121;
          v68 = v66;
LABEL_43:
          -[NSObject addObject:](v67, "addObject:", v68);

        }
        objc_msgSend(v24, "addObject:", v60);

        continue;
      }
    }
    v57 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
  }
  while (v57);
LABEL_47:

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[_PSSuggestionTemplate recipientDisplayNames](self, "recipientDisplayNames");
  v116 = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
  if (v72)
  {
    v73 = v72;
    objb = *(id *)v127;
    do
    {
      for (m = 0; m != v73; ++m)
      {
        if (*(id *)v127 != objb)
          objc_enumerationMutation(v116);
        v75 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * m);
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        -[NSDictionary allKeys](self->_handleToDisplayNameMapping, "allKeys");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (id)objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v122, v144, 16);
        if (v77)
        {
          v78 = *(_QWORD *)v123;
          while (2)
          {
            for (n = 0; n != v77; n = (char *)n + 1)
            {
              if (*(_QWORD *)v123 != v78)
                objc_enumerationMutation(v76);
              v80 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)n);
              -[NSDictionary objectForKeyedSubscript:](self->_handleToDisplayNameMapping, "objectForKeyedSubscript:", v80);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v81, "isEqualToString:", v75))
              {
                v77 = v80;

                goto LABEL_62;
              }

            }
            v77 = (id)objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v122, v144, 16);
            if (v77)
              continue;
            break;
          }
LABEL_62:
          v24 = v120;
        }

        v82 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:]([_PSRecipient alloc], "initWithIdentifier:handle:displayName:contact:", &stru_1E4402490, v77, v75, 0);
        -[NSObject addObject:](v121, "addObject:", v82);

      }
      v73 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
    }
    while (v73);
  }

  -[_PSSuggestionTemplate bundleID](self, "bundleID");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v112, "containsObject:", v83))
  {

    v10 = v113;
    v84 = v110;
    goto LABEL_71;
  }
  -[_PSSuggestionTemplate bundleID](self, "bundleID");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v109, "containsObject:", v86);

  v10 = v113;
  v84 = v110;
  if (v87)
  {
LABEL_71:
    -[_PSSuggestionTemplate interactionRecipients](self, "interactionRecipients");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_PSSuggestionTemplate bundleID](self, "bundleID");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v110, "containsObject:", v104);

    if (v105)
    {
      v106 = (void *)MEMORY[0x1E0CB3940];
      -[_PSSuggestionTemplate interactionRecipients](self, "interactionRecipients");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSSuggestionTemplate bundleID](self, "bundleID");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "stringWithFormat:", CFSTR("%@_%@"), v107, v108);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v88 = 0;
    }
  }
  -[_PSSuggestionTemplate bundleID](self, "bundleID");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v111, "containsObject:", v89);

  if ((v90 & 1) != 0)
  {
    v91 = 0;
  }
  else
  {
    -[_PSSuggestionTemplate interactionRecipients](self, "interactionRecipients");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_PSSuggestionTemplate groupName](self, "groupName");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {

    goto LABEL_78;
  }
  if (-[NSObject count](v121, "count"))
  {
LABEL_78:
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      -[_PSSuggestionTemplate description](self, "description");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v143 = v94;
      _os_log_impl(&dword_1A07F4000, v93, OS_LOG_TYPE_INFO, "templateToSuggestion: %@", buf, 0xCu);

    }
    v95 = [_PSSuggestion alloc];
    -[_PSSuggestionTemplate bundleID](self, "bundleID");
    v96 = objc_claimAutoreleasedReturnValue();
    -[_PSSuggestionTemplate groupName](self, "groupName");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = -[NSObject copy](v121, "copy");
    -[_PSSuggestionTemplate image](self, "image");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSuggestionTemplate reason](self, "reason");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSuggestionTemplate reasonType](self, "reasonType");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSuggestionTemplate modelScore](self, "modelScore");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:](v95, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:", v96, v88, v97, v98, v91, v99, v100, v101, v102);

    v10 = v113;
    v24 = v120;
    v84 = v110;
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      -[_PSSuggestionTemplate suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:].cold.2();
    v85 = 0;
  }

LABEL_82:
  return v85;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PSSuggestionTemplate groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestionTemplate bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestionTemplate reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestionTemplate reasonType](self, "reasonType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestionTemplate image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestionTemplate modelScore](self, "modelScore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> groupName: %@, bundleID: %@, reason: %@, reasonType: %@, image: %@ modelScore: %@"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)interactionRecipients
{
  return self->_interactionRecipients;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSArray)recipientContactIDs
{
  return self->_recipientContactIDs;
}

- (NSArray)recipientEmailAddresses
{
  return self->_recipientEmailAddresses;
}

- (NSArray)recipientPhoneNumbers
{
  return self->_recipientPhoneNumbers;
}

- (NSArray)recipientDisplayNames
{
  return self->_recipientDisplayNames;
}

- (NSDictionary)contactIdToHandleMapping
{
  return self->_contactIdToHandleMapping;
}

- (NSDictionary)handleToDisplayNameMapping
{
  return self->_handleToDisplayNameMapping;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (NSNumber)modelScore
{
  return self->_modelScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelScore, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_handleToDisplayNameMapping, 0);
  objc_storeStrong((id *)&self->_contactIdToHandleMapping, 0);
  objc_storeStrong((id *)&self->_recipientDisplayNames, 0);
  objc_storeStrong((id *)&self->_recipientPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_recipientEmailAddresses, 0);
  objc_storeStrong((id *)&self->_recipientContactIDs, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_interactionRecipients, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_FAULT, "Empty or nil bundleID on _PSSuggestion %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "No groupName and recipients in _PSSuggestion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
