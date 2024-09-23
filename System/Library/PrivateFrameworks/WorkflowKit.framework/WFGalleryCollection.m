@implementation WFGalleryCollection

- (unint64_t)referenceActionForKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("base"));
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  objc_storeStrong((id *)&self->_modifiedAt, a4);
}

- (BOOL)isEqual:(id)a3
{
  WFGalleryCollection *v4;
  WFGalleryCollection *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  int64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;

  v4 = (WFGalleryCollection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFGalleryCollection identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryCollection identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_78;
        v14 = objc_msgSend(v8, "isEqual:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      -[WFGalleryCollection name](self, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryCollection name](v5, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
          goto LABEL_77;
        v20 = objc_msgSend(v13, "isEqualToString:", v17);

        if (!v20)
        {
          LOBYTE(v11) = 0;
LABEL_78:

          goto LABEL_79;
        }
      }
      -[WFGalleryCollection collectionDescription](self, "collectionDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryCollection collectionDescription](v5, "collectionDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v23 = v22;
      v18 = v23;
      v81 = v19;
      if (v19 == v23)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v24 = v23;
        if (!v19 || !v23)
          goto LABEL_76;
        v11 = objc_msgSend(v19, "isEqualToString:", v23);

        if (!v11)
          goto LABEL_77;
      }
      v80 = v18;
      -[WFGalleryCollection workflows](self, "workflows");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryCollection workflows](v5, "workflows");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      v28 = v26;
      v78 = v28;
      v79 = v27;
      if (v27 == v28)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        if (!v27)
        {
          v29 = v28;
          v18 = v80;
          goto LABEL_74;
        }
        v29 = v28;
        v18 = v80;
        if (!v28)
        {
LABEL_74:

          goto LABEL_75;
        }
        v30 = objc_msgSend(v27, "isEqualToArray:", v28);

        if (!v30)
        {
          LOBYTE(v11) = 0;
          v18 = v80;
LABEL_75:
          v24 = v78;
          v19 = v79;
LABEL_76:

          v19 = v81;
LABEL_77:

          goto LABEL_78;
        }
      }
      -[WFGalleryCollection modifiedAt](self, "modifiedAt");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryCollection modifiedAt](v5, "modifiedAt");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v31;
      v33 = v32;
      v34 = v33;
      if (v27 != v33)
      {
        LOBYTE(v11) = 0;
        v77 = v27;
        v35 = v33;
        if (v27)
        {
          v18 = v80;
          if (v33)
          {
            v36 = v33;
            v37 = objc_msgSend(v27, "isEqual:", v33);
            v76 = v36;

            if (!v37)
              goto LABEL_41;
LABEL_35:
            v38 = -[WFGalleryCollection minVersion](self, "minVersion");
            if (v38 != -[WFGalleryCollection minVersion](v5, "minVersion"))
            {
LABEL_41:
              LOBYTE(v11) = 0;
              v18 = v80;
              v29 = v76;
              goto LABEL_74;
            }
            -[WFGalleryCollection language](self, "language");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFGalleryCollection language](v5, "language");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v39;
            v42 = v40;
            v74 = v42;
            v75 = v41;
            v77 = v27;
            if (v41 != v42)
            {
              LOBYTE(v11) = 0;
              if (v41)
              {
                v43 = v42;
                v44 = v41;
                v18 = v80;
                if (v42)
                {
                  v45 = objc_msgSend(v75, "isEqualToString:", v42);

                  if (!v45)
                  {
                    LOBYTE(v11) = 0;
                    v18 = v80;
LABEL_72:
                    v27 = v75;
                    v34 = v76;
                    v35 = v74;
                    goto LABEL_73;
                  }
LABEL_45:
                  -[WFGalleryCollection base](self, "base");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFGalleryCollection base](v5, "base");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = v46;
                  v49 = v47;
                  v72 = v49;
                  v73 = v48;
                  if (v48 != v49)
                  {
                    LOBYTE(v11) = 0;
                    if (v48)
                    {
                      v50 = v49;
                      v51 = v48;
                      v18 = v80;
                      if (v49)
                      {
                        v70 = objc_msgSend(v73, "isEqual:", v49);

                        if (!v70)
                        {
                          LOBYTE(v11) = 0;
                          v18 = v80;
LABEL_70:
                          v43 = v72;
                          v44 = v73;
                          goto LABEL_71;
                        }
LABEL_51:
                        -[WFGalleryCollection persistentIdentifier](self, "persistentIdentifier");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        -[WFGalleryCollection persistentIdentifier](v5, "persistentIdentifier");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        v54 = v52;
                        v55 = v53;
                        v69 = v55;
                        v71 = v54;
                        if (v54 == v55)
                        {

                        }
                        else
                        {
                          LOBYTE(v11) = 0;
                          if (!v54)
                          {
                            v56 = v55;
                            v57 = 0;
                            v18 = v80;
                            goto LABEL_67;
                          }
                          v56 = v55;
                          v57 = v54;
                          v18 = v80;
                          if (!v55)
                          {
LABEL_67:
                            v63 = v57;

                            goto LABEL_68;
                          }
                          v67 = objc_msgSend(v71, "isEqualToString:", v55);

                          if (!v67)
                          {
                            LOBYTE(v11) = 0;
                            v18 = v80;
LABEL_68:
                            v50 = v69;
                            v51 = v71;
                            goto LABEL_69;
                          }
                        }
                        -[WFGalleryCollection supportedIdioms](self, "supportedIdioms");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        -[WFGalleryCollection supportedIdioms](v5, "supportedIdioms");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        v60 = v58;
                        v61 = v59;
                        v62 = v60;
                        v68 = v61;
                        if (v60 == v61)
                        {
                          LOBYTE(v11) = 1;
                        }
                        else
                        {
                          LOBYTE(v11) = 0;
                          if (v60)
                          {
                            v18 = v80;
                            if (v61)
                              LOBYTE(v11) = objc_msgSend(v62, "isEqualToArray:", v61);
                            goto LABEL_65;
                          }
                        }
                        v18 = v80;
LABEL_65:

                        v56 = v68;
                        v57 = v62;
                        goto LABEL_67;
                      }
                    }
                    else
                    {
                      v50 = v49;
                      v51 = 0;
                      v18 = v80;
                    }
LABEL_69:
                    v64 = v51;

                    goto LABEL_70;
                  }

                  goto LABEL_51;
                }
              }
              else
              {
                v43 = v42;
                v44 = 0;
                v18 = v80;
              }
LABEL_71:

              goto LABEL_72;
            }

            goto LABEL_45;
          }
        }
        else
        {
          v18 = v80;
        }
LABEL_73:
        v65 = v34;

        v29 = v65;
        v27 = v77;
        goto LABEL_74;
      }
      v76 = v33;

      goto LABEL_35;
    }
    LOBYTE(v11) = 0;
  }
LABEL_80:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFGalleryCollection *v5;
  void *v6;
  uint64_t v7;
  CKRecordID *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *collectionDescription;
  void *v15;
  uint64_t v16;
  NSArray *workflows;
  void *v18;
  uint64_t v19;
  NSDate *modifiedAt;
  void *v21;
  uint64_t v22;
  NSString *language;
  void *v24;
  uint64_t v25;
  CKRecordID *base;
  void *v27;
  uint64_t v28;
  NSString *persistentIdentifier;
  void *v30;
  uint64_t v31;
  NSArray *supportedIdioms;

  v5 = -[WFGalleryCollection init](+[WFGalleryCollection allocWithZone:](WFGalleryCollection, "allocWithZone:"), "init");
  -[WFGalleryCollection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  -[WFGalleryCollection name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v10;

  -[WFGalleryCollection collectionDescription](self, "collectionDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  collectionDescription = v5->_collectionDescription;
  v5->_collectionDescription = (NSString *)v13;

  -[WFGalleryCollection workflows](self, "workflows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  workflows = v5->_workflows;
  v5->_workflows = (NSArray *)v16;

  -[WFGalleryCollection modifiedAt](self, "modifiedAt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  modifiedAt = v5->_modifiedAt;
  v5->_modifiedAt = (NSDate *)v19;

  v5->_minVersion = -[WFGalleryCollection minVersion](self, "minVersion");
  -[WFGalleryCollection language](self, "language");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copyWithZone:", a3);
  language = v5->_language;
  v5->_language = (NSString *)v22;

  -[WFGalleryCollection base](self, "base");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copyWithZone:", a3);
  base = v5->_base;
  v5->_base = (CKRecordID *)v25;

  -[WFGalleryCollection persistentIdentifier](self, "persistentIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copyWithZone:", a3);
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v28;

  -[WFGalleryCollection supportedIdioms](self, "supportedIdioms");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copyWithZone:", a3);
  supportedIdioms = v5->_supportedIdioms;
  v5->_supportedIdioms = (NSArray *)v31;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WFMutableGalleryCollection *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = -[WFMutableGalleryCollection init](+[WFMutableGalleryCollection allocWithZone:](WFMutableGalleryCollection, "allocWithZone:"), "init");
  -[WFGalleryCollection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setIdentifier:](v5, "setIdentifier:", v7);

  -[WFGalleryCollection name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setName:](v5, "setName:", v9);

  -[WFGalleryCollection collectionDescription](self, "collectionDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setCollectionDescription:](v5, "setCollectionDescription:", v11);

  -[WFGalleryCollection modifiedAt](self, "modifiedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setModifiedAt:](v5, "setModifiedAt:", v13);

  -[WFGalleryCollection workflows](self, "workflows");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setWorkflows:](v5, "setWorkflows:", v15);

  -[WFMutableGalleryCollection setMinVersion:](v5, "setMinVersion:", -[WFGalleryCollection minVersion](self, "minVersion"));
  -[WFGalleryCollection language](self, "language");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setLanguage:](v5, "setLanguage:", v17);

  -[WFGalleryCollection base](self, "base");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setBase:](v5, "setBase:", v19);

  -[WFGalleryCollection persistentIdentifier](self, "persistentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setPersistentIdentifier:](v5, "setPersistentIdentifier:", v21);

  -[WFGalleryCollection supportedIdioms](self, "supportedIdioms");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  -[WFMutableGalleryCollection setSupportedIdioms:](v5, "setSupportedIdioms:", v23);

  return v5;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (NSArray)workflows
{
  return self->_workflows;
}

- (int64_t)minVersion
{
  return self->_minVersion;
}

- (NSArray)supportedIdioms
{
  return self->_supportedIdioms;
}

- (void)setSupportedIdioms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)modifiedAt
{
  return self->_modifiedAt;
}

- (NSString)language
{
  return self->_language;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modifiedAt, 0);
  objc_storeStrong((id *)&self->_supportedIdioms, 0);
  objc_storeStrong((id *)&self->_workflows, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("GalleryCollection");
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("name");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("description");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("collectionDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("shortcuts");
  +[WFCloudKitItemProperty itemPropertyWithName:itemClass:](WFCloudKitItemProperty, "itemPropertyWithName:itemClass:", CFSTR("workflows"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("minVersion");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = CFSTR("language");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  v12[5] = CFSTR("base");
  +[WFCloudKitItemProperty itemReferencePropertyWithName:itemClass:](WFCloudKitItemProperty, "itemReferencePropertyWithName:itemClass:", CFSTR("base"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  v12[6] = CFSTR("persistentIdentifier");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  v12[7] = CFSTR("supportedIdioms");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

@end
