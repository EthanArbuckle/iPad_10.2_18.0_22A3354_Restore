@implementation VCVoiceShortcut

- (VCVoiceShortcut)initWithIdentifier:(id)a3 phrase:(id)a4 shortcutName:(id)a5 shortcutDescription:(id)a6 associatedAppBundleIdentifier:(id)a7 dateCreated:(id)a8 dateLastModified:(id)a9 lastRunDate:(id)a10 runEventsCount:(id)a11 shortcut:(id)a12 keyImageData:(id)a13 error:(id *)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  VCVoiceShortcut *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSString *identifier;
  uint64_t v36;
  NSString *phrase;
  uint64_t v38;
  NSString *shortcutName;
  void *v40;
  uint64_t v41;
  NSString *shortcutDescription;
  uint64_t v43;
  NSString *associatedAppBundleIdentifier;
  uint64_t v45;
  INShortcut *shortcut;
  void *v47;
  uint64_t v48;
  INImage *keyImage;
  VCVoiceShortcut *v50;
  void *v51;
  NSObject *v52;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  objc_super v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  const __CFString *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v64 = a6;
  v23 = a7;
  obj = a8;
  v24 = a8;
  v25 = v20;
  v26 = v24;
  v71 = a9;
  v27 = self;
  v67 = a10;
  v66 = a11;
  v28 = a12;
  v65 = a13;
  v69 = v28;
  if (!objc_msgSend(v25, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = v26;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcut.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length"));

    v26 = v54;
    v28 = v69;
  }
  if (!objc_msgSend(v21, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = v26;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcut.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phrase.length"));

    v26 = v56;
    v28 = v69;
  }
  v70 = v22;
  if (!objc_msgSend(v22, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = v26;
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcut.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutName.length"));

    v26 = v58;
  }
  v68 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcut.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateCreated"));

  }
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcut.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateLastModified"));

  }
  v29 = v25;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v29);
  if (v30)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1001, CFSTR("(%@) is not a valid UUID string."), v29);
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }

  v32 = v31;
  if (v30)
  {
    if (!objc_msgSend(v23, "length"))
    {
      objc_msgSend(v28, "_associatedAppBundleIdentifier");
      v33 = objc_claimAutoreleasedReturnValue();

      v23 = (id)v33;
    }
    if (!objc_msgSend(v23, "length"))
    {
      getWFVoiceShortcutClientLogObject();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v74 = "-[VCVoiceShortcut initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier"
              ":dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:]";
        v75 = 2114;
        v76 = v69;
        v77 = 2114;
        v78 = CFSTR("an associatedAppBundleIdentifier is required on the shortcut");
        _os_log_impl(&dword_1AF681000, v52, OS_LOG_TYPE_ERROR, "%s Failed to init VCVoiceShortcut with shortcut=%{public}@ because %{public}@", buf, 0x20u);
      }

      v47 = v65;
      if (a14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1009, CFSTR("%@"), CFSTR("an associatedAppBundleIdentifier is required on the shortcut"));
        v50 = 0;
        *a14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = 0;
      }
      v40 = v64;
      goto LABEL_33;
    }
    v72.receiver = self;
    v72.super_class = (Class)VCVoiceShortcut;
    v27 = -[VCVoiceShortcut init](&v72, sel_init);
    if (v27)
    {
      v34 = objc_msgSend(v29, "copy");
      identifier = v27->_identifier;
      v27->_identifier = (NSString *)v34;

      v36 = objc_msgSend(v21, "copy");
      phrase = v27->_phrase;
      v27->_phrase = (NSString *)v36;

      v38 = objc_msgSend(v70, "copy");
      shortcutName = v27->_shortcutName;
      v27->_shortcutName = (NSString *)v38;

      v40 = v64;
      v41 = objc_msgSend(v64, "copy");
      shortcutDescription = v27->_shortcutDescription;
      v27->_shortcutDescription = (NSString *)v41;

      v43 = objc_msgSend(v23, "copy");
      associatedAppBundleIdentifier = v27->_associatedAppBundleIdentifier;
      v27->_associatedAppBundleIdentifier = (NSString *)v43;

      objc_storeStrong((id *)&v27->_dateCreated, obj);
      objc_storeStrong((id *)&v27->_dateLastModified, a9);
      objc_storeStrong((id *)&v27->_lastRunDate, a10);
      objc_storeStrong((id *)&v27->_runEventsCount, a11);
      v45 = objc_msgSend(v28, "copy");
      shortcut = v27->_shortcut;
      v27->_shortcut = (INShortcut *)v45;

      v47 = v65;
      if (objc_msgSend(v65, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", v65);
        v48 = objc_claimAutoreleasedReturnValue();
        keyImage = v27->_keyImage;
        v27->_keyImage = (INImage *)v48;
      }
      else
      {
        keyImage = v27->_keyImage;
        v27->_keyImage = 0;
      }

      v27 = v27;
      v50 = v27;
LABEL_33:
      v51 = v70;
      goto LABEL_34;
    }
    goto LABEL_23;
  }
  if (!a14)
  {
LABEL_23:
    v50 = 0;
    goto LABEL_24;
  }
  v50 = 0;
  *a14 = objc_retainAutorelease(v32);
LABEL_24:
  v40 = v64;
  v51 = v70;
  v47 = v65;
LABEL_34:

  return v50;
}

- (BOOL)hasBeenModified
{
  void *v3;
  void *v4;
  BOOL v5;

  -[VCVoiceShortcut dateCreated](self, "dateCreated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut dateLastModified](self, "dateLastModified");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4) == -1;

  return v5;
}

- (WFWorkflow)workflow
{
  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[VCVoiceShortcut identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VCVoiceShortcut shortcut](self, "shortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[VCVoiceShortcut dateLastModified](self, "dateLastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VCVoiceShortcut *v4;
  VCVoiceShortcut *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = (VCVoiceShortcut *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VCVoiceShortcut identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", v7))
      {
        v14 = 0;
LABEL_44:

        goto LABEL_45;
      }
      -[VCVoiceShortcut phrase](self, "phrase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut phrase](v5, "phrase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v9))
      {
        v14 = 0;
LABEL_43:

        goto LABEL_44;
      }
      -[VCVoiceShortcut shortcutName](self, "shortcutName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut shortcutName](v5, "shortcutName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqual:", v11))
      {
        v14 = 0;
LABEL_42:

        goto LABEL_43;
      }
      -[VCVoiceShortcut shortcutDescription](self, "shortcutDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut shortcutDescription](v5, "shortcutDescription");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)v12;
      if ((void *)v12 == v47)
      {
        v46 = v10;
      }
      else
      {
        -[VCVoiceShortcut shortcutDescription](self, "shortcutDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCVoiceShortcut shortcutDescription](v5, "shortcutDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v13;
        if (!objc_msgSend(v13, "isEqual:", v44))
        {
          v14 = 0;
          goto LABEL_40;
        }
        v46 = v10;
      }
      -[VCVoiceShortcut associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut associatedAppBundleIdentifier](v5, "associatedAppBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "isEqual:", v16))
      {

        v14 = 0;
        goto LABEL_39;
      }
      v41 = v11;
      v42 = v16;
      v43 = v15;
      -[VCVoiceShortcut dateCreated](self, "dateCreated");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut dateCreated](v5, "dateCreated");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isEqual:"))
      {
        v14 = 0;
        v11 = v41;
LABEL_38:

LABEL_39:
        v10 = v46;
        if (v48 == v47)
        {
LABEL_41:

          goto LABEL_42;
        }
LABEL_40:

        goto LABEL_41;
      }
      -[VCVoiceShortcut dateLastModified](self, "dateLastModified");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut dateLastModified](v5, "dateLastModified");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v20;
      if (!objc_msgSend(v20, "isEqual:"))
      {
        v14 = 0;
        v11 = v41;
LABEL_37:

        goto LABEL_38;
      }
      -[VCVoiceShortcut lastRunDate](self, "lastRunDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut lastRunDate](v5, "lastRunDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        v14 = 0;
        v11 = v41;
LABEL_36:

        goto LABEL_37;
      }
      -[VCVoiceShortcut runEventsCount](self, "runEventsCount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut runEventsCount](v5, "runEventsCount");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v22;
      if (!objc_msgSend(v22, "isEqual:"))
      {
        v14 = 0;
        v11 = v41;
LABEL_35:

        goto LABEL_36;
      }
      -[VCVoiceShortcut shortcut](self, "shortcut");
      v23 = objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcut shortcut](v5, "shortcut");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v23;
      v24 = v23 == (_QWORD)v33;
      v11 = v41;
      if (v24
        || (-[VCVoiceShortcut shortcut](self, "shortcut"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VCVoiceShortcut shortcut](v5, "shortcut"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v31, "isEqual:")))
      {
        -[VCVoiceShortcut keyImage](self, "keyImage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCVoiceShortcut keyImage](v5, "keyImage");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v32 == (void *)v25)
        {

          v14 = 1;
        }
        else
        {
          v29 = (void *)v25;
          -[VCVoiceShortcut keyImage](self, "keyImage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCVoiceShortcut keyImage](v5, "keyImage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v28, "isEqual:", v27);

        }
        if (v34 == v33)
          goto LABEL_34;
      }
      else
      {
        v14 = 0;
      }

LABEL_34:
      goto LABEL_35;
    }
    v14 = 0;
  }
LABEL_45:

  return v14;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut phrase](self, "phrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut shortcutName](self, "shortcutName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut shortcutDescription](self, "shortcutDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut dateCreated](self, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut dateLastModified](self, "dateLastModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut lastRunDate](self, "lastRunDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcut runEventsCount](self, "runEventsCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %p\nidentifier: %@\nphrase: %@\nshortcutName: %@\nshortcutDescription: %@\nassociatedAppBundleIdentifier: %@\ndateCreated: %@\ndateLastModified: %@\nlastRunDate: %@\nrunEventsCount: %@>"), v15, self, v14, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (VCVoiceShortcut)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VCVoiceShortcut *v14;
  VCVoiceShortcut *v15;
  id v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutDescription"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAppBundleIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateLastModified"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastRunDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runEventsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyImageData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v7 && v6 && v22 && v8 && v9)
  {
    v23 = 0;
    v15 = -[VCVoiceShortcut initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier:dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:](self, "initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier:dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:", v7, v9, v10, v11, v12, v13, &v23);
    v16 = v23;
    if (v16)
    {
      v19 = v7;
      getWFVoiceShortcutClientLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCVoiceShortcut initWithCoder:]";
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1AF681000, v17, OS_LOG_TYPE_ERROR, "%s Failed to construct a valid VoiceShortcut from coder: %@", buf, 0x16u);
      }

      v7 = v19;
    }
    self = v15;

    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v15;
  id v16;

  v4 = a3;
  -[VCVoiceShortcut identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[VCVoiceShortcut phrase](self, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phrase"));

  -[VCVoiceShortcut shortcutName](self, "shortcutName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("shortcutName"));

  -[VCVoiceShortcut shortcutDescription](self, "shortcutDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("shortcutDescription"));

  -[VCVoiceShortcut associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("associatedAppBundleIdentifier"));

  -[VCVoiceShortcut dateCreated](self, "dateCreated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dateCreated"));

  -[VCVoiceShortcut dateLastModified](self, "dateLastModified");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("dateLastModified"));

  -[VCVoiceShortcut lastRunDate](self, "lastRunDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("lastRunDate"));

  -[VCVoiceShortcut runEventsCount](self, "runEventsCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("runEventsCount"));

  -[VCVoiceShortcut keyImage](self, "keyImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_imageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("keyImageData"));

  -[VCVoiceShortcut shortcut](self, "shortcut");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("shortcut"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (NSString)shortcutDescription
{
  return self->_shortcutDescription;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (INImage)keyImage
{
  return self->_keyImage;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (NSNumber)runEventsCount
{
  return self->_runEventsCount;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (NSDate)lastRunDate
{
  return self->_lastRunDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRunDate, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_runEventsCount, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_keyImage, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutDescription, 0);
  objc_storeStrong((id *)&self->_shortcutName, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
