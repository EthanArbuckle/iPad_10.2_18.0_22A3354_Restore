@implementation PPContact

- (PPContact)initWithIdentifier:(id)a3 source:(unsigned __int8)a4 namePrefix:(id)a5 givenName:(id)a6 middleName:(id)a7 familyName:(id)a8 nameSuffix:(id)a9 nickname:(id)a10 localizedFullName:(id)a11 organizationName:(id)a12 jobTitle:(id)a13 birthday:(id)a14 nonGregorianBirthday:(id)a15 phoneNumbers:(id)a16 emailAddresses:(id)a17 socialProfiles:(id)a18 postalAddresses:(id)a19
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  PPContact *v28;
  PPContact *v29;
  void *v31;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v35 = a5;
  v47 = a5;
  v46 = a6;
  v45 = a7;
  v36 = a8;
  v44 = a8;
  v43 = a9;
  v42 = a10;
  v41 = a11;
  v38 = a12;
  v40 = a13;
  v39 = a14;
  v23 = a15;
  v24 = a16;
  v25 = a17;
  v26 = a18;
  v27 = a19;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPContact.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v49.receiver = self;
  v49.super_class = (Class)PPContact;
  v28 = -[PPContact init](&v49, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_identifier, a3);
    v29->_source = a4;
    objc_storeStrong((id *)&v29->_namePrefix, v35);
    objc_storeStrong((id *)&v29->_givenName, a6);
    objc_storeStrong((id *)&v29->_middleName, a7);
    objc_storeStrong((id *)&v29->_familyName, v36);
    objc_storeStrong((id *)&v29->_nameSuffix, a9);
    objc_storeStrong((id *)&v29->_nickname, a10);
    objc_storeStrong((id *)&v29->_organizationName, a12);
    objc_storeStrong((id *)&v29->_jobTitle, a13);
    objc_storeStrong((id *)&v29->_birthday, a14);
    objc_storeStrong((id *)&v29->_nonGregorianBirthday, a15);
    objc_storeStrong((id *)&v29->_phoneNumbers, a16);
    objc_storeStrong((id *)&v29->_emailAddresses, a17);
    objc_storeStrong((id *)&v29->_socialProfiles, a18);
    objc_storeStrong((id *)&v29->_postalAddresses, a19);
    objc_storeStrong((id *)&v29->_localizedFullName, a11);
    if (!v29->_localizedFullName)
      -[PPContact _generateLocalizedFullName](v29, "_generateLocalizedFullName");
  }

  return v29;
}

- (PPContact)initWithContactsContact:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  PPPostalAddress *v55;
  void *v56;
  PPPostalAddress *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  int v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  PPContact *v71;
  void *v73;
  void *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  PPContact *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPContact.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v93 = (void *)objc_opt_new();
  v86 = self;
  v88 = v5;
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    objc_msgSend(v5, "phoneNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v107 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x18D7805AC]();
          objc_msgSend(v11, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            objc_msgSend(v11, "label");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v16, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "addObject:", v19);

          }
          objc_autoreleasePoolPop(v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      }
      while (v8);
    }

    self = v86;
    v5 = v88;
  }
  v92 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
  {
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    objc_msgSend(v5, "emailAddresses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v103 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
          v26 = (void *)MEMORY[0x18D7805AC]();
          objc_msgSend(v25, "value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length");

          if (v28)
          {
            objc_msgSend(v25, "label");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "addObject:", v31);

          }
          objc_autoreleasePoolPop(v26);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
      }
      while (v22);
    }

    v5 = v88;
  }
  v91 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96868]))
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    objc_msgSend(v5, "socialProfiles");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v99;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v99 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
          v38 = (void *)MEMORY[0x18D7805AC]();
          objc_msgSend(v37, "value");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "username");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "length");

          if (v41)
          {
            objc_msgSend(v37, "value");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "service");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "value");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "username");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v43, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v46);

          }
          objc_autoreleasePoolPop(v38);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      }
      while (v34);
    }

    self = v86;
    v5 = v88;
  }
  v90 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C967F0]))
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v5, "postalAddresses");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v95;
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v95 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
          v53 = (void *)MEMORY[0x18D7805AC]();
          objc_msgSend(v52, "value");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            v55 = [PPPostalAddress alloc];
            objc_msgSend(v52, "value");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = -[PPPostalAddress initWithContactsPostalAddress:](v55, "initWithContactsPostalAddress:", v56);

            objc_msgSend(v52, "label");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v58, v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "addObject:", v59);

          }
          objc_autoreleasePoolPop(v53);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
      }
      while (v49);
    }

    self = v86;
    v5 = v88;
  }
  v60 = (void *)objc_opt_class();
  objc_msgSend(v5, "identifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sourceIdentifierWithSource:identifier:", 1, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96790]);
  if (v63)
  {
    objc_msgSend(v5, "namePrefix");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = 0;
  }
  v65 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C966D0]);
  if (v65)
  {
    objc_msgSend(v5, "givenName");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v87 = 0;
  }
  v79 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96780]);
  if (v79)
  {
    objc_msgSend(v5, "middleName");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v85 = 0;
  }
  v78 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C966C0]);
  if (v78)
  {
    objc_msgSend(v5, "familyName");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = 0;
  }
  v77 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96798]);
  if (v77)
  {
    objc_msgSend(v5, "nameSuffix");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
  }
  v76 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C967A0]);
  if (v76)
  {
    objc_msgSend(v5, "nickname");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C967B8]);
  if (v75)
  {
    objc_msgSend(v5, "organizationName");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v81 = 0;
  }
  v66 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96758]);
  if (v66)
  {
    objc_msgSend(v5, "jobTitle");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v80 = 0;
  }
  v67 = objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96670]);
  if (v67)
  {
    objc_msgSend(v5, "birthday");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v68 = 0;
  }
  if ((objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C967A8]) & 1) == 0)
  {
    v71 = objc_retain(-[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](self, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v62, 1, v64, v87, v85, v84, v83, v82, v89, v81, v80, v68, 0, v93, v92,
              v91,
              v90));
    if (!v67)
      goto LABEL_79;
    goto LABEL_78;
  }
  objc_msgSend(v5, "nonGregorianBirthday");
  v74 = v61;
  v69 = v64;
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_retain(-[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](self, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v62, 1, v69, v87, v85, v84, v83, v82, v89, v81, v80, v68, v70, v93, v92,
            v91,
            v90));

  v64 = v69;
  v61 = v74;
  if (v67)
LABEL_78:

LABEL_79:
  if (v66)

  if (v75)
  if (v76)

  if (v77)
  if (v78)

  if (!v79)
  {
    if (!v65)
      goto LABEL_91;
LABEL_95:

    if (!v63)
      goto LABEL_93;
    goto LABEL_92;
  }

  if (v65)
    goto LABEL_95;
LABEL_91:
  if (v63)
LABEL_92:

LABEL_93:
  return v71;
}

- (PPContact)initWithFoundInAppsContact:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  PPPostalAddress *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  PPContact *v62;
  PPContact *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPContact.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v62 = self;
  v6 = (void *)objc_opt_new();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v5, "phones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v77 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x18D7805AC]();
        objc_msgSend(v12, "phoneNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          objc_msgSend(v12, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "phoneNumber");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v18);

        }
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v9);
  }
  v67 = v6;

  v19 = (void *)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v5, "emailAddresses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v73 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
        v26 = (void *)MEMORY[0x18D7805AC]();
        objc_msgSend(v25, "emailAddress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "length");

        if (v28)
        {
          objc_msgSend(v25, "label");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "emailAddress");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v31);

        }
        objc_autoreleasePoolPop(v26);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v22);
  }

  v32 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v64 = v5;
  objc_msgSend(v5, "postalAddresses");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v69 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
        v39 = (void *)MEMORY[0x18D7805AC]();
        v40 = -[PPPostalAddress initWithFoundInAppsPostalAddress:]([PPPostalAddress alloc], "initWithFoundInAppsPostalAddress:", v38);
        objc_msgSend(v38, "label");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPLabeledValue labeledValueWithLabel:value:](PPLabeledValue, "labeledValueWithLabel:value:", v41, v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v42);

        objc_autoreleasePoolPop(v39);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    }
    while (v35);
  }

  v43 = (void *)objc_opt_class();
  v44 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v64, "recordId");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("%llu"), objc_msgSend(v61, "numericValue"));
  objc_msgSend(v43, "sourceIdentifierWithSource:identifier:", 2, v60);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "name");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "prefix");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "name");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "middleName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "lastName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "name");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "suffix");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "name");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "fullName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "birthday");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "dateComponents");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](v62, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v66, 2, v65, v45, v54, v46, v47, 0, v49, 0, 0, v51, 0, v67, v19, 0,
          v32);

  return v63;
}

- (int64_t)foundInAppsRecordIdentifierNumberWithError:(id *)a3
{
  void *v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  int source;
  NSString *identifier;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  int v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_source == 2)
    return +[PPContact foundInAppsRecordIdentifierNumberWithIdentifier:error:](PPContact, "foundInAppsRecordIdentifierNumberWithIdentifier:error:", self->_identifier, a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attempt to get FIA identifier for non-FIA contact: src:%d id:%@"), self->_source, self->_identifier);
  pp_contacts_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    source = self->_source;
    identifier = self->_identifier;
    *(_DWORD *)buf = 67109378;
    v17 = source;
    v18 = 2112;
    v19 = identifier;
    _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "attempt to get FIA identifier for non-FIA contact: src:%d id:%@", buf, 0x12u);
  }

  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14[0] = CFSTR("PPErrorInfoKey");
    v14[1] = CFSTR("identifier");
    v9 = self->_identifier;
    v15[0] = v6;
    v15[1] = v9;
    v14[2] = CFSTR("source");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_source);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 2, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)contactsContactIdentifierWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  int source;
  NSString *identifier;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_source == 1)
  {
    +[PPContact contactsContactIdentifierWithIdentifier:error:](PPContact, "contactsContactIdentifierWithIdentifier:error:", self->_identifier, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("attempt to get CN identifier for non-CN contact: src:%d id:%@"), self->_source, self->_identifier);
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      source = self->_source;
      identifier = self->_identifier;
      *(_DWORD *)buf = 67109378;
      v18 = source;
      v19 = 2112;
      v20 = identifier;
      _os_log_error_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_ERROR, "attempt to get CN identifier for non-CN contact: src:%d id:%@", buf, 0x12u);
    }

    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v15[0] = CFSTR("PPErrorInfoKey");
      v15[1] = CFSTR("identifier");
      v9 = self->_identifier;
      v16[0] = v6;
      v16[1] = v9;
      v15[2] = CFSTR("source");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_source);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 2, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = 0;
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPContact %@: '%@' src:%d>"), self->_identifier, self->_localizedFullName, self->_source);
}

- (void)_generateLocalizedFullName
{
  void *v3;
  NSString *v4;
  NSString *localizedFullName;
  id v6;

  v3 = (void *)objc_opt_new();
  v6 = v3;
  if (self->_namePrefix)
  {
    objc_msgSend(v3, "setNamePrefix:");
    v3 = v6;
  }
  if (self->_givenName)
  {
    objc_msgSend(v6, "setGivenName:");
    v3 = v6;
  }
  if (self->_middleName)
  {
    objc_msgSend(v6, "setMiddleName:");
    v3 = v6;
  }
  if (self->_familyName)
  {
    objc_msgSend(v6, "setFamilyName:");
    v3 = v6;
  }
  if (self->_nameSuffix)
  {
    objc_msgSend(v6, "setNameSuffix:");
    v3 = v6;
  }
  if (self->_nickname)
  {
    objc_msgSend(v6, "setNickname:");
    v3 = v6;
  }
  objc_msgSend(v3, "setContactType:", 0);
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v6, 0);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedFullName = self->_localizedFullName;
  self->_localizedFullName = v4;

}

- (void)setIdentifierForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setEmailAddressForTesting:(id)a3
{
  id v4;
  PPLabeledValue *v5;
  NSArray *v6;
  NSArray *emailAddresses;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PPLabeledValue initWithLabel:value:]([PPLabeledValue alloc], "initWithLabel:value:", CFSTR("email"), v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v6;

}

- (PPContact)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PPContact *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("idt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v25 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("src"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("npr"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("gnm"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("mnm"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fnm"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("nsf"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("nck"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("lfn"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("org"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("job"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bdy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ngb"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("phn"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("eml"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("soc"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("pos"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self = objc_retain(-[PPContact initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:](self, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v10, v25, v24, v23, v22, v21, v28, v27, v20, v26, v19, v18, v17, v16, v11,
               v12,
               v13));

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("idt"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_source, CFSTR("src"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_namePrefix, CFSTR("npr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_givenName, CFSTR("gnm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_middleName, CFSTR("mnm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyName, CFSTR("fnm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameSuffix, CFSTR("nsf"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nickname, CFSTR("nck"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedFullName, CFSTR("lfn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("org"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jobTitle, CFSTR("job"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthday, CFSTR("bdy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonGregorianBirthday, CFSTR("ngb"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("eml"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_socialProfiles, CFSTR("soc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalAddresses, CFSTR("pos"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = self->_source - v3 + 32 * v3;
  v5 = -[NSString hash](self->_namePrefix, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_givenName, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_middleName, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_familyName, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_nameSuffix, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_nickname, "hash") - v9 + 32 * v9;
  v11 = -[NSString hash](self->_localizedFullName, "hash") - v10 + 32 * v10;
  v12 = -[NSString hash](self->_organizationName, "hash") - v11 + 32 * v11;
  v13 = -[NSString hash](self->_jobTitle, "hash") - v12 + 32 * v12;
  v14 = -[NSDateComponents hash](self->_birthday, "hash") - v13 + 32 * v13;
  v15 = -[NSDateComponents hash](self->_nonGregorianBirthday, "hash") - v14 + 32 * v14;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = self->_phoneNumbers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v16);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v20++), "hash") - v15 + 32 * v15;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v18);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = self->_emailAddresses;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v25++), "hash") - v15 + 32 * v15;
      }
      while (v23 != v25);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v23);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = self->_socialProfiles;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v30++), "hash") - v15 + 32 * v15;
      }
      while (v28 != v30);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v28);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = self->_postalAddresses;
  v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v38;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v31);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v35++), "hash", (_QWORD)v37) - v15 + 32 * v15;
      }
      while (v33 != v35);
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v33);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int source;
  void *v22;
  void *v23;
  void *v24;

  v19 = (void *)objc_opt_class();
  v24 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  source = self->_source;
  v20 = (void *)-[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  v18 = (void *)-[NSString copyWithZone:](self->_givenName, "copyWithZone:", a3);
  v17 = (void *)-[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v16 = (void *)-[NSString copyWithZone:](self->_familyName, "copyWithZone:", a3);
  v23 = (void *)-[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  v14 = (void *)-[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v13 = (void *)-[NSString copyWithZone:](self->_localizedFullName, "copyWithZone:", a3);
  v12 = (void *)-[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v15 = (void *)-[NSString copyWithZone:](self->_jobTitle, "copyWithZone:", a3);
  v11 = (void *)-[NSDateComponents copyWithZone:](self->_birthday, "copyWithZone:", a3);
  v5 = (void *)-[NSDateComponents copyWithZone:](self->_nonGregorianBirthday, "copyWithZone:", a3);
  v6 = (void *)-[NSArray copyWithZone:](self->_phoneNumbers, "copyWithZone:", a3);
  v7 = (void *)-[NSArray copyWithZone:](self->_emailAddresses, "copyWithZone:", a3);
  v8 = (void *)-[NSArray copyWithZone:](self->_socialProfiles, "copyWithZone:", a3);
  v9 = (void *)-[NSArray copyWithZone:](self->_postalAddresses, "copyWithZone:", a3);
  objc_msgSend(v19, "contactWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v24, source, v20, v18, v17, v16, v23, v14, v13, v12, v15, v11, v5, v6, v7, v8,
    v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  PPContact *v4;
  PPContact *v5;
  BOOL v6;

  v4 = (PPContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPContact isEqualToContact:](self, "isEqualToContact:", v5);

  return v6;
}

- (BOOL)isEqualToContact:(id)a3
{
  id *v4;
  id *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *namePrefix;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *givenName;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *middleName;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSString *familyName;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  NSString *nameSuffix;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *nickname;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  NSString *localizedFullName;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  char v45;
  NSString *organizationName;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  char v50;
  NSString *jobTitle;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  char v55;
  NSDateComponents *birthday;
  NSDateComponents *v57;
  NSDateComponents *v58;
  NSDateComponents *v59;
  char v60;
  NSDateComponents *nonGregorianBirthday;
  NSDateComponents *v62;
  NSDateComponents *v63;
  NSDateComponents *v64;
  char v65;
  NSArray *phoneNumbers;
  NSArray *v67;
  NSArray *v68;
  NSArray *v69;
  char v70;
  NSArray *emailAddresses;
  NSArray *v72;
  NSArray *v73;
  NSArray *v74;
  char v75;
  NSArray *socialProfiles;
  NSArray *v77;
  NSArray *v78;
  NSArray *v79;
  char v80;
  char v81;
  NSArray *v83;
  NSArray *v84;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_61;
  identifier = self->_identifier;
  v7 = (NSString *)v4[2];
  if (identifier == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = identifier;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_61;
  }
  if (self->_source != *((unsigned __int8 *)v5 + 8))
  {
LABEL_61:
    v81 = 0;
    goto LABEL_62;
  }
  namePrefix = self->_namePrefix;
  v12 = (NSString *)v5[3];
  if (namePrefix == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = namePrefix;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_61;
  }
  givenName = self->_givenName;
  v17 = (NSString *)v5[4];
  if (givenName == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = givenName;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_61;
  }
  middleName = self->_middleName;
  v22 = (NSString *)v5[5];
  if (middleName == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = middleName;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_61;
  }
  familyName = self->_familyName;
  v27 = (NSString *)v5[6];
  if (familyName == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = familyName;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_61;
  }
  nameSuffix = self->_nameSuffix;
  v32 = (NSString *)v5[7];
  if (nameSuffix == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = nameSuffix;
    v35 = -[NSString isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_61;
  }
  nickname = self->_nickname;
  v37 = (NSString *)v5[8];
  if (nickname == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = nickname;
    v40 = -[NSString isEqual:](v39, "isEqual:", v38);

    if ((v40 & 1) == 0)
      goto LABEL_61;
  }
  localizedFullName = self->_localizedFullName;
  v42 = (NSString *)v5[9];
  if (localizedFullName == v42)
  {

  }
  else
  {
    v43 = v42;
    v44 = localizedFullName;
    v45 = -[NSString isEqual:](v44, "isEqual:", v43);

    if ((v45 & 1) == 0)
      goto LABEL_61;
  }
  organizationName = self->_organizationName;
  v47 = (NSString *)v5[10];
  if (organizationName == v47)
  {

  }
  else
  {
    v48 = v47;
    v49 = organizationName;
    v50 = -[NSString isEqual:](v49, "isEqual:", v48);

    if ((v50 & 1) == 0)
      goto LABEL_61;
  }
  jobTitle = self->_jobTitle;
  v52 = (NSString *)v5[11];
  if (jobTitle == v52)
  {

  }
  else
  {
    v53 = v52;
    v54 = jobTitle;
    v55 = -[NSString isEqual:](v54, "isEqual:", v53);

    if ((v55 & 1) == 0)
      goto LABEL_61;
  }
  birthday = self->_birthday;
  v57 = (NSDateComponents *)v5[12];
  if (birthday == v57)
  {

  }
  else
  {
    v58 = v57;
    v59 = birthday;
    v60 = -[NSDateComponents isEqual:](v59, "isEqual:", v58);

    if ((v60 & 1) == 0)
      goto LABEL_61;
  }
  nonGregorianBirthday = self->_nonGregorianBirthday;
  v62 = (NSDateComponents *)v5[13];
  if (nonGregorianBirthday == v62)
  {

  }
  else
  {
    v63 = v62;
    v64 = nonGregorianBirthday;
    v65 = -[NSDateComponents isEqual:](v64, "isEqual:", v63);

    if ((v65 & 1) == 0)
      goto LABEL_61;
  }
  phoneNumbers = self->_phoneNumbers;
  v67 = (NSArray *)v5[14];
  if (phoneNumbers == v67)
  {

  }
  else
  {
    v68 = v67;
    v69 = phoneNumbers;
    v70 = -[NSArray isEqual:](v69, "isEqual:", v68);

    if ((v70 & 1) == 0)
      goto LABEL_61;
  }
  emailAddresses = self->_emailAddresses;
  v72 = (NSArray *)v5[15];
  if (emailAddresses == v72)
  {

  }
  else
  {
    v73 = v72;
    v74 = emailAddresses;
    v75 = -[NSArray isEqual:](v74, "isEqual:", v73);

    if ((v75 & 1) == 0)
      goto LABEL_61;
  }
  socialProfiles = self->_socialProfiles;
  v77 = (NSArray *)v5[16];
  if (socialProfiles == v77)
  {

  }
  else
  {
    v78 = v77;
    v79 = socialProfiles;
    v80 = -[NSArray isEqual:](v79, "isEqual:", v78);

    if ((v80 & 1) == 0)
      goto LABEL_61;
  }
  v83 = self->_postalAddresses;
  v84 = v83;
  if (v83 == v5[17])
    v81 = 1;
  else
    v81 = -[NSArray isEqual:](v83, "isEqual:");

LABEL_62:
  return v81;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)source
{
  return self->_source;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSString)localizedFullName
{
  return self->_localizedFullName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSDateComponents)birthday
{
  return self->_birthday;
}

- (NSDateComponents)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_localizedFullName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (int64_t)foundInAppsRecordIdentifierNumberWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a1, "identifier:startsWithPrefix:", v6, CFSTR("FIA"));
  v8 = v6;
  if (v7)
  {
    v9 = (void *)MEMORY[0x18D7805AC]();
    v10 = objc_msgSend(CFSTR("FIA"), "length");
    v11 = objc_msgSend(CFSTR(":"), "length") + v10;
    objc_msgSend(v6, "substringWithRange:", v11, objc_msgSend(v6, "length") - v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "numberFromString:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "longLongValue");
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Number formatter failed to get FIA identifier from id: %@"), v6);
    pp_contacts_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_18BE3A000, v17, OS_LOG_TYPE_INFO, "Number formatter failed to get FIA identifier from id: %@", buf, 0xCu);
    }

    if (a4)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v21[0] = CFSTR("PPErrorInfoKey");
      v21[1] = CFSTR("identifier");
      v22[0] = v16;
      v22[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PPErrorDomain"), 2, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v15 = -1;
  }

  return v15;
}

+ (id)contactsContactIdentifierWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  if ((objc_msgSend(a1, "identifier:startsWithPrefix:", v5, CFSTR("CN")) & 1) != 0)
  {
    v6 = objc_msgSend(CFSTR("CN"), "length");
    v7 = objc_msgSend(CFSTR(":"), "length") + v6;
    v8 = objc_msgSend(v5, "length") - v7;
    v9 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v5, "substringWithRange:", v7, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (id)sourceIdentifierWithSource:(unsigned __int8)a3 identifier:(id)a4
{
  void *v4;
  int v5;
  id v7;
  const __CFString *v8;
  id v9;

  v5 = a3;
  v7 = a4;
  if (v5)
  {
    if (v5 == 2)
    {
      v8 = CFSTR("FIA");
    }
    else
    {
      if (v5 != 1)
        goto LABEL_11;
      v8 = CFSTR("CN");
    }
  }
  else
  {
    v8 = CFSTR("UNK");
  }
  if (objc_msgSend(a1, "identifier:startsWithPrefix:", v7, v8))
    v9 = v7;
  else
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@%@"), v8, CFSTR(":"), v7);
  v4 = v9;
LABEL_11:

  return v4;
}

+ (unsigned)sourceFromSourceIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR(":")))
  {
    v4 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("CN")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("FIA")))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)identifier:(id)a3 startsWithPrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  v9 = objc_msgSend(v8, "length");
  v10 = objc_msgSend(v5, "length");
  if (v10 <= objc_msgSend(v8, "length"))
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v5, "substringWithRange:", 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v11);
    v13 = objc_msgSend(v12, "isEqualToString:", v8);

  }
  return v13;
}

+ (PPContact)contactWithIdentifier:(id)a3 source:(unsigned __int8)a4 namePrefix:(id)a5 givenName:(id)a6 middleName:(id)a7 familyName:(id)a8 nameSuffix:(id)a9 nickname:(id)a10 localizedFullName:(id)a11 organizationName:(id)a12 jobTitle:(id)a13 birthday:(id)a14 nonGregorianBirthday:(id)a15 phoneNumbers:(id)a16 emailAddresses:(id)a17 socialProfiles:(id)a18 postalAddresses:(id)a19
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v32;
  unsigned int v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v37 = a4;
  v32 = a19;
  v30 = a18;
  v27 = a17;
  v26 = a16;
  v25 = a15;
  v43 = a14;
  v42 = a13;
  v41 = a12;
  v40 = a11;
  v39 = a10;
  v24 = a9;
  v29 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v38 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v22, v37, v21, v20, v19, v29, v24, v39, v40, v41, v42, v43, v25, v26, v27,
                  v30,
                  v32);

  return (PPContact *)v38;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
