@implementation SEMCascadeEntityInfo

- (SEMCascadeEntityInfo)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMCascadeEntityInfo)initWithContent:(id)a3 allMetaContent:(id)a4 sourceIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SEMCascadeEntityInfo *v12;
  SEMCascadeEntityInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SEMCascadeEntityInfo;
  v12 = -[SEMCascadeEntityInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_content, a3);
    objc_storeStrong((id *)&v13->_allMetaContent, a4);
    objc_storeStrong((id *)&v13->_sourceIdentifier, a5);
  }

  return v13;
}

- (unsigned)entityType
{
  return 1;
}

- (id)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (id)sourceIdentifierOrConstant
{
  uint64_t v2;
  NSString *sourceIdentifier;
  NSString *v4;
  int v7;
  const char *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sourceIdentifier = self->_sourceIdentifier;
  if (!sourceIdentifier)
  {
    v7 = objc_msgSend_itemType(self, a2, v2);
    if (v7 <= 42183)
    {
      if (v7 <= 18539)
      {
        switch(v7)
        {
          case 7690:
            return CFSTR("HomeKit");
          case 12996:
            return CFSTR("Health");
          case 15757:
            return CFSTR("CoreRoutine");
        }
      }
      else if (v7 > 27121)
      {
        if (v7 == 27122)
          return CFSTR("FindMy");
        if (v7 == 36434)
          return CFSTR("Applications");
      }
      else
      {
        if (v7 == 18540)
          return CFSTR("MediaPlayer");
        if (v7 == 19668)
          return CFSTR("Contacts");
      }
      goto LABEL_38;
    }
    if (v7 <= 53613)
    {
      if (v7 == 42184)
        return CFSTR("Podcasts");
      if (v7 == 49066)
        return CFSTR("CarPlay");
      v10 = 53601;
    }
    else
    {
      if (v7 <= 61508)
      {
        if (v7 == 53614)
          return CFSTR("Fitness");
        if (v7 == 54385)
          return CFSTR("Calendar");
        goto LABEL_38;
      }
      if (v7 == 61509)
        return CFSTR("UserAccount");
      v10 = 62158;
    }
    if (v7 == v10)
      return CFSTR("UserFeedbackLearning");
LABEL_38:
    v11 = (void *)MEMORY[0x24BE5B238];
    v12 = objc_msgSend_itemType(self, v8, v9);
    objc_msgSend_descriptionForTypeIdentifier_(v11, v13, v12);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[SEMCascadeEntityInfo sourceIdentifierOrConstant]";
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s Missing expected sourceIdentifier for itemType: %@", (uint8_t *)&v15, 0x16u);
    }
    return v4;
  }
  v4 = sourceIdentifier;
  return v4;
}

- (unsigned)itemType
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  return objc_msgSend_itemType(v2, v3, v4);
}

- (id)content
{
  return self->_content;
}

- (id)allMetaContent
{
  return self->_allMetaContent;
}

- (id)toKVItem:(id *)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_toKVItems_(self, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)toKVItems:(id *)a3
{
  NSArray *convertedInstances;
  NSArray *v4;
  unint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  NSArray *v26;

  convertedInstances = self->_convertedInstances;
  if (convertedInstances)
  {
LABEL_2:
    v4 = convertedInstances;
  }
  else
  {
    v7 = objc_msgSend_count(self->_allMetaContent, a2, (uint64_t)a3);
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    if (v7 <= 1)
    {
      v10 = 1;
      v11 = objc_msgSend_initWithCapacity_(v8, v9, 1);
    }
    else
    {
      v10 = v7;
      v11 = objc_msgSend_initWithCapacity_(v8, v9, v7);
    }
    v13 = (NSArray *)v11;
    v14 = 0;
    while (1)
    {
      if (v7
        && (objc_msgSend_objectAtIndex_(self->_allMetaContent, v12, v14),
            (v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = (void *)v15;
        v17 = objc_alloc(MEMORY[0x24BE15678]);
        v20 = (void *)objc_msgSend_initWithContent_metaContent_error_(v17, v18, (uint64_t)self->_content, v16, a3);
        if (!v20)
          goto LABEL_16;
      }
      else
      {
        v21 = objc_alloc(MEMORY[0x24BE15708]);
        v20 = (void *)objc_msgSend_initWithContent_error_(v21, v22, (uint64_t)self->_content, a3);
        v16 = 0;
        if (!v20)
          goto LABEL_16;
      }
      objc_msgSend_itemFromCascadeItem_error_(MEMORY[0x24BE5E8E0], v19, (uint64_t)v20, a3);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
        break;
      v25 = (void *)v23;
      objc_msgSend_addObject_(v13, v24, v23);

      if (v10 == ++v14)
      {
        v26 = self->_convertedInstances;
        self->_convertedInstances = v13;

        convertedInstances = self->_convertedInstances;
        goto LABEL_2;
      }
    }

LABEL_16:
    v4 = 0;
  }
  return v4;
}

- (id)toINPersons:(id *)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  id v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  SEMCascadeEntityInfo *v106;
  NSArray *allMetaContent;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  id v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  const char *v120;
  void *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  id v126;
  void *v128;
  NSObject *v129;
  objc_class *v130;
  void *v131;
  objc_class *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  SEMCascadeEntityInfo *v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint8_t v154[128];
  uint8_t buf[4];
  const char *v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  void *v160;
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_content(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v138 = self;
    v10 = (void *)objc_opt_new();
    objc_msgSend_givenName(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v10, v14, (uint64_t)v13);

    objc_msgSend_middleName(v9, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMiddleName_(v10, v18, (uint64_t)v17);

    objc_msgSend_familyName(v9, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v10, v22, (uint64_t)v21);

    objc_msgSend_nickname(v9, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNickname_(v10, v26, (uint64_t)v25);

    objc_msgSend_namePrefix(v9, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNamePrefix_(v10, v30, (uint64_t)v29);

    objc_msgSend_nameSuffix(v9, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNameSuffix_(v10, v34, (uint64_t)v33);

    objc_msgSend_phoneticGivenName(v9, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneticMiddleName(v9, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneticFamilyName(v9, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v37, v44, v45) || objc_msgSend_length(v40, v46, v47) || objc_msgSend_length(v43, v48, v49))
    {
      v52 = (void *)objc_opt_new();
      objc_msgSend_setGivenName_(v52, v53, (uint64_t)v37);
      objc_msgSend_setMiddleName_(v52, v54, (uint64_t)v40);
      objc_msgSend_setFamilyName_(v52, v55, (uint64_t)v43);
      objc_msgSend_setPhoneticRepresentation_(v10, v56, (uint64_t)v52);

    }
    v135 = v40;
    v136 = v37;
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v50, v51, v43);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v137 = v9;
    objc_msgSend_phoneNumbers(v9, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v148, v154, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v149;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v149 != v64)
            objc_enumerationMutation(v60);
          v66 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v65);
          v67 = objc_alloc(MEMORY[0x24BDD9F38]);
          objc_msgSend_stringValue(v66, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_label(v66, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (void *)objc_msgSend_initWithValue_type_label_(v67, v74, (uint64_t)v70, 2, v73);

          objc_msgSend_addObject_(v57, v76, (uint64_t)v75);
          ++v65;
        }
        while (v63 != v65);
        v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v77, (uint64_t)&v148, v154, 16);
      }
      while (v63);
    }

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    objc_msgSend_emailAddresses(v137, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v144, v153, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v145;
      do
      {
        v85 = 0;
        do
        {
          if (*(_QWORD *)v145 != v84)
            objc_enumerationMutation(v80);
          v86 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v85);
          v87 = objc_alloc(MEMORY[0x24BDD9F38]);
          objc_msgSend_email(v86, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_label(v86, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = (void *)objc_msgSend_initWithValue_type_label_(v87, v94, (uint64_t)v90, 1, v93);

          objc_msgSend_addObject_(v57, v96, (uint64_t)v95);
          ++v85;
        }
        while (v83 != v85);
        v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v97, (uint64_t)&v144, v153, 16);
      }
      while (v83);
    }

    if (!objc_msgSend_count(v57, v98, v99))
    {
      v101 = objc_alloc(MEMORY[0x24BDD9F38]);
      v103 = (void *)objc_msgSend_initWithValue_type_(v101, v102, 0, 0);
      objc_msgSend_addObject_(v57, v104, (uint64_t)v103);

    }
    v105 = 0;
    v106 = v138;
    do
    {
      allMetaContent = v106->_allMetaContent;
      v139 = v105;
      if (allMetaContent)
      {
        objc_msgSend_objectAtIndex_(allMetaContent, v100, v105);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sourceItemIdentifier(v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v111 = 0;
      }
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v112 = v57;
      v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v113, (uint64_t)&v140, v152, 16);
      if (v114)
      {
        v115 = v114;
        v116 = *(_QWORD *)v141;
        do
        {
          v117 = 0;
          do
          {
            if (*(_QWORD *)v141 != v116)
              objc_enumerationMutation(v112);
            v118 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v117);
            v119 = objc_alloc(MEMORY[0x24BDD9F30]);
            v121 = (void *)objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_(v119, v120, v118, v10, 0, 0, v111, 0);
            objc_msgSend_addObject_(v6, v122, (uint64_t)v121);

            ++v117;
          }
          while (v115 != v117);
          v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v123, (uint64_t)&v140, v152, 16);
        }
        while (v115);
      }

      v106 = v138;
      v105 = v139 + 1;
    }
    while (v139 + 1 < (unint64_t)objc_msgSend_count(v138->_allMetaContent, v124, v125));
    v126 = v6;

    v9 = v137;
  }
  else
  {
    v128 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v129 = v128;
      v130 = (objc_class *)objc_opt_class();
      NSStringFromClass(v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = (objc_class *)objc_opt_class();
      NSStringFromClass(v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v156 = "-[SEMCascadeEntityInfo toINPersons:]";
      v157 = 2112;
      v158 = v131;
      v159 = 2112;
      v160 = v133;
      _os_log_error_impl(&dword_2462C4000, v129, OS_LOG_TYPE_ERROR, "%s Unexpected converted content class: %@ expected: %@", buf, 0x20u);

    }
    v126 = 0;
  }

  return v126;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSString *sourceIdentifier;
  __CFString *v12;
  const char *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SEMCascadeEntityInfo;
  -[SEMCascadeEntityInfo description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE5B238];
  v7 = objc_msgSend_itemType(self, v5, v6);
  objc_msgSend_descriptionForTypeIdentifier_(v4, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("sourceIdentifier: %@, "), self->_sourceIdentifier);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v3, v13, (uint64_t)CFSTR(" itemType: %@, %@content: %@, allMetaContent: %@"), v10, v12, self->_content, self->_allMetaContent);
  }
  else
  {
    v12 = &stru_251783AF0;
    objc_msgSend_stringByAppendingFormat_(v3, v9, (uint64_t)CFSTR(" itemType: %@, %@content: %@, allMetaContent: %@"), v10, &stru_251783AF0, self->_content, self->_allMetaContent);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (sourceIdentifier)

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  id *v7;

  v5 = (void *)objc_opt_class();
  v7 = (id *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_storeStrong(v7 + 1, self->_content);
  objc_storeStrong(v7 + 2, self->_allMetaContent);
  objc_storeStrong(v7 + 3, self->_sourceIdentifier);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMCascadeEntityInfo *v4;
  SEMCascadeEntityInfo *v5;
  const char *v6;
  char isEqualToCascadeEntityInfo;

  v4 = (SEMCascadeEntityInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToCascadeEntityInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToCascadeEntityInfo = objc_msgSend_isEqualToCascadeEntityInfo_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToCascadeEntityInfo = 0;
  }

  return isEqualToCascadeEntityInfo;
}

- (BOOL)isEqualToCascadeEntityInfo:(id)a3
{
  void *v3;
  id v5;
  CCItemContent *content;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSArray *allMetaContent;
  void *v14;
  uint64_t v15;
  const char *v16;
  int v17;
  char isEqual;
  NSString *sourceIdentifier;
  NSString *v20;
  void *v21;
  const char *v22;
  void *v24;

  v5 = a3;
  content = self->_content;
  objc_msgSend_content(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqual_(content, v10, (uint64_t)v9))
  {
    isEqual = 0;
    goto LABEL_18;
  }
  allMetaContent = self->_allMetaContent;
  v14 = allMetaContent;
  if (!allMetaContent)
  {
    objc_msgSend_allMetaContent(v5, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v24 = 0;
      v17 = 0;
      goto LABEL_10;
    }
    v24 = (void *)v15;
    v14 = self->_allMetaContent;
  }
  objc_msgSend_allMetaContent(v5, v11, v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v14, v16, (uint64_t)v3) & 1) == 0)
  {

    isEqual = 0;
    goto LABEL_16;
  }
  v17 = 1;
LABEL_10:
  sourceIdentifier = self->_sourceIdentifier;
  v20 = sourceIdentifier;
  if (!sourceIdentifier)
  {
    objc_msgSend_sourceIdentifier(v5, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      isEqual = 1;
      goto LABEL_20;
    }
    v20 = self->_sourceIdentifier;
  }
  objc_msgSend_sourceIdentifier(v5, v11, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v20, v22, (uint64_t)v21);

  if (sourceIdentifier)
  {
    if (!v17)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:

  if ((v17 & 1) != 0)
LABEL_15:

LABEL_16:
  if (!allMetaContent)

LABEL_18:
  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_content, a2, v2);
  v7 = objc_msgSend_hash(self->_allMetaContent, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_sourceIdentifier, v8, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMCascadeEntityInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  SEMCascadeEntityInfo *v6;
  unsigned __int16 v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  CCItemContent *content;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *allMetaContent;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSString *sourceIdentifier;
  SEMCascadeEntityInfo *v47;
  NSObject *v48;
  NSObject *v49;
  void *v51;
  void *v52;
  SEMCascadeEntityInfo *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  objc_super v61;
  uint8_t v62[128];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)SEMCascadeEntityInfo;
  v6 = -[SEMCascadeEntityInfo init](&v61, sel_init);
  if (!v6)
  {
LABEL_14:
    v47 = v6;
    goto LABEL_21;
  }
  v7 = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("itemType"));
  v8 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, CFSTR("content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend_contentMessageForItemType_data_error_(MEMORY[0x24BE15680], v11, v7, v10, &v60);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v60;
  content = v6->_content;
  v6->_content = (CCItemContent *)v12;

  if (v6->_content)
  {
    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend_setWithObjects_(v15, v18, v16, v17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v19, CFSTR("allMetaContent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v52 = v10;
      v53 = v6;
      v54 = v4;
      v22 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v25 = objc_msgSend_count(v21, v23, v24);
      v27 = (void *)objc_msgSend_initWithCapacity_(v22, v26, v25);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v51 = v21;
      v28 = v21;
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v56, v62, 16);
      if (v30)
      {
        v32 = v30;
        v33 = *(_QWORD *)v57;
        while (2)
        {
          v34 = 0;
          v35 = v13;
          do
          {
            if (*(_QWORD *)v57 != v33)
              objc_enumerationMutation(v28);
            v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v34);
            v55 = v35;
            objc_msgSend_metaContentMessageForItemType_data_error_(MEMORY[0x24BE15680], v31, v7, v36, &v55);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v55;

            if (!v37)
            {
              v49 = qword_25441F970;
              if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v64 = "-[SEMCascadeEntityInfo initWithCoder:]";
                v65 = 2112;
                v66 = v36;
                v67 = 2112;
                v68 = v13;
                _os_log_error_impl(&dword_2462C4000, v49, OS_LOG_TYPE_ERROR, "%s Failed to decode metacontent from data (%@): %@", buf, 0x20u);
              }

              v47 = 0;
              v6 = v53;
              v4 = v54;
              goto LABEL_21;
            }
            objc_msgSend_addObject_(v27, v38, (uint64_t)v37);

            ++v34;
            v35 = v13;
          }
          while (v32 != v34);
          v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v56, v62, 16);
          if (v32)
            continue;
          break;
        }
      }

      v41 = objc_msgSend_copy(v27, v39, v40);
      v6 = v53;
      allMetaContent = v53->_allMetaContent;
      v53->_allMetaContent = (NSArray *)v41;

      v4 = v54;
      v21 = v51;
      v10 = v52;
    }
    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, CFSTR("sourceIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v6->_sourceIdentifier;
    v6->_sourceIdentifier = (NSString *)v45;

    goto LABEL_14;
  }
  v48 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v64 = "-[SEMCascadeEntityInfo initWithCoder:]";
    v65 = 2112;
    v66 = v10;
    v67 = 2112;
    v68 = v13;
    _os_log_error_impl(&dword_2462C4000, v48, OS_LOG_TYPE_ERROR, "%s Failed to decode content from data (%@): %@", buf, 0x20u);
  }

  v47 = 0;
LABEL_21:

  return v47;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  NSArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = objc_msgSend_itemType(self, v5, v6);
  objc_msgSend_encodeInteger_forKey_(v4, v8, v7, CFSTR("itemType"));
  objc_msgSend_data(self->_content, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, CFSTR("content"));

  if (self->_allMetaContent)
  {
    v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v17 = objc_msgSend_count(self->_allMetaContent, v15, v16);
    v19 = (void *)objc_msgSend_initWithCapacity_(v14, v18, v17);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = self->_allMetaContent;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v31, v35, 16);
    if (v22)
    {
      v25 = v22;
      v26 = *(_QWORD *)v32;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v20);
          objc_msgSend_data(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v27), v23, v24, (_QWORD)v31);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v19, v29, (uint64_t)v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v31, v35, 16);
      }
      while (v25);
    }

    objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v19, CFSTR("allMetaContent"));
  }
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_sourceIdentifier, CFSTR("sourceIdentifier"), (_QWORD)v31);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedInstances, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_allMetaContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
