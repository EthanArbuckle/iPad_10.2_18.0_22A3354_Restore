@implementation SFPeopleSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)TTRPeopleSuggestion
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc((Class)a1);
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:displayName:transportBundleIdentifier:contacts:formattedHandles:donatedImage:placeholder:", v5, CFSTR("File radar"), CFSTR("com.apple.TapToRadar.shareextension"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, v8);

  return v6;
}

- (SFPeopleSuggestion)initWithIdentifier:(id)a3 displayName:(id)a4 transportBundleIdentifier:(id)a5 contacts:(id)a6 formattedHandles:(id)a7 donatedImage:(id)a8 placeholder:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SFPeopleSuggestion *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *displayName;
  uint64_t v26;
  NSString *transportBundleIdentifier;
  uint64_t v28;
  NSArray *contacts;
  uint64_t v30;
  NSArray *formattedHandles;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v33.receiver = self;
  v33.super_class = (Class)SFPeopleSuggestion;
  v21 = -[SFPeopleSuggestion init](&v33, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    transportBundleIdentifier = v21->_transportBundleIdentifier;
    v21->_transportBundleIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    contacts = v21->_contacts;
    v21->_contacts = (NSArray *)v28;

    v30 = objc_msgSend(v19, "copy");
    formattedHandles = v21->_formattedHandles;
    v21->_formattedHandles = (NSArray *)v30;

    objc_storeStrong((id *)&v21->_donatedImage, a8);
    v21->_isPlaceholder = a9;
  }

  return v21;
}

- (SFPeopleSuggestion)initWithIdentifier:(id)a3 displayName:(id)a4 transportBundleIdentifier:(id)a5 contact:(id)a6 deviceModelIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SFPeopleSuggestion *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  NSString *transportBundleIdentifier;
  uint64_t v24;
  NSString *deviceModelIdentifier;
  uint64_t v26;
  NSArray *contacts;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SFPeopleSuggestion;
  v17 = -[SFPeopleSuggestion init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    transportBundleIdentifier = v17->_transportBundleIdentifier;
    v17->_transportBundleIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    deviceModelIdentifier = v17->_deviceModelIdentifier;
    v17->_deviceModelIdentifier = (NSString *)v24;

    if (v15)
    {
      v30[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v26 = objc_claimAutoreleasedReturnValue();
      contacts = v17->_contacts;
      v17->_contacts = (NSArray *)v26;
    }
    else
    {
      contacts = v17->_contacts;
      v17->_contacts = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v17->_isPlaceholder = 0;
  }

  return v17;
}

- (SFPeopleSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  SFPeopleSuggestion *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  SFPeopleSuggestion *v26;
  uint64_t v27;
  NSString *deviceModelIdentifier;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("identifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transportBundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v12 = (void *)getCNContactClass_softClass;
  v40 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __getCNContactClass_block_invoke;
    v35 = &unk_1E482D680;
    v36 = &v37;
    __getCNContactClass_block_invoke((uint64_t)&v32);
    v12 = (void *)v38[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v37, 8);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v14 = (void *)getCNMutableContactClass_softClass;
  v40 = getCNMutableContactClass_softClass;
  if (!getCNMutableContactClass_softClass)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __getCNMutableContactClass_block_invoke;
    v35 = &unk_1E482D680;
    v36 = &v37;
    __getCNMutableContactClass_block_invoke((uint64_t)&v32);
    v14 = (void *)v38[3];
  }
  v15 = self;
  v16 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v10, "setWithObjects:", v11, v13, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("contacts"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("formattedHandles"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v23 = (void *)getINImageClass_softClass;
  v40 = getINImageClass_softClass;
  if (!getINImageClass_softClass)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __getINImageClass_block_invoke;
    v35 = &unk_1E482D680;
    v36 = &v37;
    __getINImageClass_block_invoke((uint64_t)&v32);
    v23 = (void *)v38[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("donatedImage"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlaceholder"));
  v26 = -[SFPeopleSuggestion initWithIdentifier:displayName:transportBundleIdentifier:contacts:formattedHandles:donatedImage:placeholder:](v15, "initWithIdentifier:displayName:transportBundleIdentifier:contacts:formattedHandles:donatedImage:placeholder:", v31, v6, v9, v18, v22, v25, v30);
  if (v26)
  {
    v26->_isRestricted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestricted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceModelIdentifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    deviceModelIdentifier = v26->_deviceModelIdentifier;
    v26->_deviceModelIdentifier = (NSString *)v27;

  }
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  id v5;

  displayName = self->_displayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transportBundleIdentifier, CFSTR("transportBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceModelIdentifier, CFSTR("deviceModelIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contacts, CFSTR("contacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedHandles, CFSTR("formattedHandles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_donatedImage, CFSTR("donatedImage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRestricted, CFSTR("isRestricted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPlaceholder, CFSTR("isPlaceholder"));

}

- (BOOL)isTapToRadar
{
  void *v2;
  char v3;

  -[SFPeopleSuggestion transportBundleIdentifier](self, "transportBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.TapToRadar.shareextension"));

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestion;
  -[SFPeopleSuggestion description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion transportBundleIdentifier](self, "transportBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion deviceModelIdentifier](self, "deviceModelIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion contacts](self, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion donatedImage](self, "donatedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion isRestricted](self, "isRestricted");
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeopleSuggestion isPlaceholder](self, "isPlaceholder");
  NSStringFromBOOL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ displayName:%@ identifier:%@ transportBundleIdentifier:%@ deviceModelIdentifier:%{private}@ contacts:%@ donatedImage:%@ isRestricted:%@ isPlaceholder:%@>"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[SFPeopleSuggestion identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SFPeopleSuggestion *v4;
  SFPeopleSuggestion *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  _BOOL4 v50;
  _BOOL4 v51;
  BOOL v52;
  _BOOL4 v53;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;

  v4 = (SFPeopleSuggestion *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFPeopleSuggestion identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestion identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v12) = 0;
          v17 = v9;
          v15 = v8;
          goto LABEL_54;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          LOBYTE(v12) = 0;
LABEL_55:

          goto LABEL_56;
        }
      }
      -[SFPeopleSuggestion displayName](self, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestion displayName](v5, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          LOBYTE(v12) = 0;
          v23 = v16;
          v21 = v15;
          goto LABEL_53;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
          LOBYTE(v12) = 0;
LABEL_54:

          goto LABEL_55;
        }
      }
      -[SFPeopleSuggestion transportBundleIdentifier](self, "transportBundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestion transportBundleIdentifier](v5, "transportBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {

        v61 = v21;
      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {
          LOBYTE(v12) = 0;
          v32 = v22;
          v28 = v21;
LABEL_52:

          goto LABEL_53;
        }
        v24 = v21;
        v25 = objc_msgSend(v21, "isEqual:", v22);

        v61 = v24;
        if (!v25)
        {
          LOBYTE(v12) = 0;
          v21 = v24;
LABEL_53:

          goto LABEL_54;
        }
      }
      v59 = v23;
      -[SFPeopleSuggestion deviceModelIdentifier](self, "deviceModelIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestion deviceModelIdentifier](v5, "deviceModelIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26;
      v29 = v27;
      v60 = v29;
      if (v28 == v29)
      {

      }
      else
      {
        v30 = v29;
        if ((v28 == 0) == (v29 != 0))
        {
          LOBYTE(v12) = 0;
          v40 = v29;
          v41 = v28;
          v23 = v59;
LABEL_50:

          goto LABEL_51;
        }
        v31 = objc_msgSend(v28, "isEqual:", v29);

        if (!v31)
        {
          LOBYTE(v12) = 0;
          v23 = v59;
LABEL_51:
          v32 = v60;
          v21 = v61;
          goto LABEL_52;
        }
      }
      v56 = v28;
      -[SFPeopleSuggestion contacts](self, "contacts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestion contacts](v5, "contacts");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v33;
      v36 = v34;
      v57 = v36;
      v58 = v35;
      if (v35 == v36)
      {

      }
      else
      {
        v37 = v36;
        if ((v35 == 0) == (v36 != 0))
        {
          LOBYTE(v12) = 0;
          v49 = v36;
          v46 = v35;
          goto LABEL_43;
        }
        v38 = v35;
        v39 = objc_msgSend(v35, "isEqual:", v36);

        if (!v39)
        {
          LOBYTE(v12) = 0;
          v23 = v59;
          v28 = v56;
LABEL_49:
          v40 = v57;
          v41 = v58;
          goto LABEL_50;
        }
      }
      -[SFPeopleSuggestion donatedImage](self, "donatedImage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeopleSuggestion donatedImage](v5, "donatedImage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v42;
      v45 = v43;
      v46 = v44;
      v47 = v45;
      if (v46 == v45)
      {
        v55 = v45;

        goto LABEL_40;
      }
      if ((v46 == 0) != (v45 != 0))
      {
        v48 = objc_msgSend(v46, "isEqual:", v45);
        v55 = v47;

        if (!v48)
        {
          LOBYTE(v12) = 0;
          v23 = v59;
          v28 = v56;
LABEL_47:
          v49 = v55;
          goto LABEL_48;
        }
LABEL_40:
        v50 = -[SFPeopleSuggestion isRestricted](self, "isRestricted");
        v28 = v56;
        if (v50 == -[SFPeopleSuggestion isRestricted](v5, "isRestricted"))
        {
          v51 = -[SFPeopleSuggestion isPlaceholder](self, "isPlaceholder");
          v52 = v51 == -[SFPeopleSuggestion isPlaceholder](v5, "isPlaceholder");
          v23 = v59;
          if (v52)
          {
            v53 = -[SFPeopleSuggestion isTapToRadar](self, "isTapToRadar");
            v12 = v53 ^ -[SFPeopleSuggestion isTapToRadar](v5, "isTapToRadar") ^ 1;
          }
          else
          {
            LOBYTE(v12) = 0;
          }
        }
        else
        {
          LOBYTE(v12) = 0;
          v23 = v59;
        }
        goto LABEL_47;
      }

      v49 = v47;
      LOBYTE(v12) = 0;
LABEL_43:
      v23 = v59;
      v28 = v56;
LABEL_48:

      goto LABEL_49;
    }
    LOBYTE(v12) = 0;
  }
LABEL_56:

  return v12;
}

- (BOOL)isGroup
{
  void *v2;
  BOOL v3;

  -[SFPeopleSuggestion contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)transportBundleIdentifier
{
  return self->_transportBundleIdentifier;
}

- (NSString)deviceModelIdentifier
{
  return self->_deviceModelIdentifier;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSArray)formattedHandles
{
  return self->_formattedHandles;
}

- (INImage)donatedImage
{
  return self->_donatedImage;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donatedImage, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_deviceModelIdentifier, 0);
  objc_storeStrong((id *)&self->_transportBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
