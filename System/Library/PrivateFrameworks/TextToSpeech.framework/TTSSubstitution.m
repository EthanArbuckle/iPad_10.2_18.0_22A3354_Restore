@implementation TTSSubstitution

- (TTSSubstitution)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TTSSubstitution *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  TTSSubstitution *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TTSSubstitution;
  v6 = -[TTSSubstitution init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUuid_(v6, v8, (uint64_t)v7, v9, v10);

    objc_msgSend_setIgnoreCase_(v6, v11, 1, v12, v13);
    objc_msgSend_setAppliesToAllApps_(v6, v14, 1, v15, v16);
    v17 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TTSSubstitution)initWithCoder:(id)a3
{
  id v4;
  TTSSubstitution *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  objc_super v106;

  v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)TTSSubstitution;
  v5 = -[TTSSubstitution init](&v106, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("originalString"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOriginalString_(v5, v10, (uint64_t)v9, v11, v12);

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("replacementString"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReplacementString_(v5, v17, (uint64_t)v16, v18, v19);

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("phonemes"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPhonemes_(v5, v24, (uint64_t)v23, v25, v26);

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend_setWithObjects_(v27, v30, v28, v31, v32, v29, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("languages"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguages_(v5, v37, (uint64_t)v36, v38, v39);

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    objc_msgSend_setWithObjects_(v40, v43, v41, v44, v45, v42, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v47, (uint64_t)v46, (uint64_t)CFSTR("voiceIds"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVoiceIds_(v5, v50, (uint64_t)v49, v51, v52);

    v53 = (void *)MEMORY[0x1E0C99E60];
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    objc_msgSend_setWithObjects_(v53, v56, v54, v57, v58, v55, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v59, (uint64_t)CFSTR("bundleIdentifiers"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBundleIdentifiers_(v5, v63, (uint64_t)v62, v64, v65);

    v69 = objc_msgSend_decodeBoolForKey_(v4, v66, (uint64_t)CFSTR("active"), v67, v68);
    objc_msgSend_setActive_(v5, v70, v69, v71, v72);
    v76 = objc_msgSend_decodeBoolForKey_(v4, v73, (uint64_t)CFSTR("ignoreCase"), v74, v75);
    objc_msgSend_setIgnoreCase_(v5, v77, v76, v78, v79);
    v83 = objc_msgSend_decodeBoolForKey_(v4, v80, (uint64_t)CFSTR("appliesToAllApps"), v81, v82);
    objc_msgSend_setAppliesToAllApps_(v5, v84, v83, v85, v86);
    v87 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, (uint64_t)CFSTR("uuid"), v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUuid_(v5, v91, (uint64_t)v90, v92, v93);

    v94 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, (uint64_t)CFSTR("replacementRange"), v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend_rangeValue(v97, v98, v99, v100, v101);
    objc_msgSend_setReplacementRange_(v5, v103, v102, (uint64_t)v103, v104);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  id v85;

  v4 = a3;
  objc_msgSend_originalString(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("originalString"), v11);

  objc_msgSend_replacementString(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("replacementString"), v18);

  objc_msgSend_phonemes(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("phonemes"), v25);

  objc_msgSend_languages(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("languages"), v32);

  objc_msgSend_voiceIds(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("voiceIds"), v39);

  objc_msgSend_bundleIdentifiers(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("bundleIdentifiers"), v46);

  v51 = objc_msgSend_active(self, v47, v48, v49, v50);
  objc_msgSend_encodeBool_forKey_(v4, v52, v51, (uint64_t)CFSTR("active"), v53);
  v58 = objc_msgSend_ignoreCase(self, v54, v55, v56, v57);
  objc_msgSend_encodeBool_forKey_(v4, v59, v58, (uint64_t)CFSTR("ignoreCase"), v60);
  v65 = objc_msgSend_appliesToAllApps(self, v61, v62, v63, v64);
  objc_msgSend_encodeBool_forKey_(v4, v66, v65, (uint64_t)CFSTR("appliesToAllApps"), v67);
  objc_msgSend_uuid(self, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v73, (uint64_t)v72, (uint64_t)CFSTR("uuid"), v74);

  v75 = (void *)MEMORY[0x1E0CB3B18];
  v80 = objc_msgSend_replacementRange(self, v76, v77, v78, v79);
  objc_msgSend_valueWithRange_(v75, v81, v80, (uint64_t)v81, v82);
  v85 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v83, (uint64_t)v85, (uint64_t)CFSTR("replacementRange"), v84);

}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  objc_super v25;

  objc_msgSend_setUuid_(self, a2, 0, v2, v3);
  objc_msgSend_setOriginalString_(self, v5, 0, v6, v7);
  objc_msgSend_setReplacementString_(self, v8, 0, v9, v10);
  objc_msgSend_setPhonemes_(self, v11, 0, v12, v13);
  objc_msgSend_setLanguages_(self, v14, 0, v15, v16);
  objc_msgSend_setVoiceIds_(self, v17, 0, v18, v19);
  objc_msgSend_setBundleIdentifiers_(self, v20, 0, v21, v22);
  objc_msgSend_setReplacementRange_(self, v23, 0x7FFFFFFFFFFFFFFFLL, 0, v24);
  v25.receiver = self;
  v25.super_class = (Class)TTSSubstitution;
  -[TTSSubstitution dealloc](&v25, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;

  v6 = (void *)objc_msgSend_allocWithZone_(TTSSubstitution, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_originalString(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOriginalString_(v11, v17, (uint64_t)v16, v18, v19);

  objc_msgSend_replacementString(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReplacementString_(v11, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_phonemes(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPhonemes_(v11, v33, (uint64_t)v32, v34, v35);

  objc_msgSend_languages(self, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLanguages_(v11, v41, (uint64_t)v40, v42, v43);

  v48 = objc_msgSend_ignoreCase(self, v44, v45, v46, v47);
  objc_msgSend_setIgnoreCase_(v11, v49, v48, v50, v51);
  v56 = objc_msgSend_active(self, v52, v53, v54, v55);
  objc_msgSend_setActive_(v11, v57, v56, v58, v59);
  objc_msgSend_bundleIdentifiers(self, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBundleIdentifiers_(v11, v65, (uint64_t)v64, v66, v67);

  v72 = objc_msgSend_appliesToAllApps(self, v68, v69, v70, v71);
  objc_msgSend_setAppliesToAllApps_(v11, v73, v72, v74, v75);
  objc_msgSend_voiceIds(self, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVoiceIds_(v11, v81, (uint64_t)v80, v82, v83);

  v88 = objc_msgSend_replacementRange(self, v84, v85, v86, v87);
  objc_msgSend_setReplacementRange_(v11, v89, v88, (uint64_t)v89, v90);
  return v11;
}

- (void)setReplacementString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString *v6;
  NSString *replacementString;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;

  v6 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  replacementString = self->_replacementString;
  self->_replacementString = v6;

  objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E0CB3500], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invertedSet(v12, v13, v14, v15, v16);
  v61 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByTrimmingCharactersInSet_(self->_replacementString, v17, (uint64_t)v61, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_length(v20, v21, v22, v23, v24);

  if (!v25)
    self->_isReplacementTextAllPunctuation = 1;
  if (objc_msgSend_length(self->_replacementString, v26, v27, v28, v29))
  {
    objc_msgSend_substringToIndex_(self->_replacementString, v30, 1, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->_replacementString;
    v39 = objc_msgSend_length(v34, v35, v36, v37, v38);
    objc_msgSend_substringFromIndex_(v34, v40, v39 - 1, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v33, v44, (uint64_t)v61, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v47, v48, v49, v50, v51))
    {

    }
    else
    {
      objc_msgSend_stringByTrimmingCharactersInSet_(v43, v52, (uint64_t)v61, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend_length(v55, v56, v57, v58, v59);

      if (!v60)
        self->_isReplacementTextSurroundedByPunctuation = 1;
    }

  }
  else
  {
    self->_isReplacementTextSurroundedByPunctuation = 0;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_uuid(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uuid(v4, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v9, v15, (uint64_t)v14, v16, v17);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend_uuid(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v30.receiver = self;
  v30.super_class = (Class)TTSSubstitution;
  -[TTSSubstitution description](&v30, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalString(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replacementString(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phonemes(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_languages(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v25, (uint64_t)CFSTR("%@: Original: %@, Replacement: %@, Phonemes: %@, Languages: %@"), v26, v27, v4, v9, v14, v19, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSString)originalString
{
  return self->_originalString;
}

- (void)setOriginalString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)replacementString
{
  return self->_replacementString;
}

- (NSString)phonemes
{
  return self->_phonemes;
}

- (void)setPhonemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)voiceIds
{
  return self->_voiceIds;
}

- (void)setVoiceIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)ignoreCase
{
  return self->_ignoreCase;
}

- (void)setIgnoreCase:(BOOL)a3
{
  self->_ignoreCase = a3;
}

- (_NSRange)replacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_replacementRange.length;
  location = self->_replacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setReplacementRange:(_NSRange)a3
{
  self->_replacementRange = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)appliesToAllApps
{
  return self->_appliesToAllApps;
}

- (void)setAppliesToAllApps:(BOOL)a3
{
  self->_appliesToAllApps = a3;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isReplacementTextAllPunctuation
{
  return self->_isReplacementTextAllPunctuation;
}

- (BOOL)isReplacementTextSurroundedByPunctuation
{
  return self->_isReplacementTextSurroundedByPunctuation;
}

- (BOOL)isUserSubstitution
{
  return self->_isUserSubstitution;
}

- (void)setIsUserSubstitution:(BOOL)a3
{
  self->_isUserSubstitution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_voiceIds, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_phonemes, 0);
  objc_storeStrong((id *)&self->_replacementString, 0);
  objc_storeStrong((id *)&self->_originalString, 0);
}

@end
