@implementation WFGalleryWorkflow

- (id)sharingURL
{
  void *v2;
  void *v3;
  void *v4;

  -[WFGalleryWorkflow identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFGallerySharingURLForIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)referenceActionForKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("base"));
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  NSDate *v7;
  NSDate *v8;
  NSDate *createdAt;
  NSDate *modifiedAt;
  NSDate *v11;

  v7 = (NSDate *)a3;
  v8 = (NSDate *)a4;
  createdAt = self->_createdAt;
  self->_createdAt = v7;
  v11 = v7;

  modifiedAt = self->_modifiedAt;
  self->_modifiedAt = v8;

}

- (WFWorkflowIcon)icon
{
  void *v3;
  void *v4;
  void *v5;

  -[WFGalleryWorkflow iconGlyph](self, "iconGlyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGalleryWorkflow iconColor](self, "iconColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(MEMORY[0x1E0DC7E38], "defaultGlyphCharacter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v4)
    v4 = &unk_1E7B8B5A8;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v4, "integerValue"), (unsigned __int16)objc_msgSend(v3, "unsignedIntegerValue"), 0);

  return (WFWorkflowIcon *)v5;
}

- (WFWorkflowRecord)workflowRecord
{
  void *v4;
  void *v5;
  void *v6;
  WFShortcutPackageFile *v7;
  void *v8;
  void *v9;
  void *v10;
  WFShortcutPackageFile *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  WFWorkflowFileDescriptor *v17;
  void *v18;
  WFWorkflowFileDescriptor *v19;
  WFWorkflowFile *v20;
  WFWorkflowFile *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  WFWorkflowRecord *v26;
  NSObject *p_super;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->_workflowRecord)
    return self->_workflowRecord;
  -[WFGalleryWorkflow shortcutFile](self, "shortcutFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[WFGalleryWorkflow signedShortcutFile](self, "signedShortcutFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return self->_workflowRecord;
  }
  -[WFGalleryWorkflow signedShortcutFile](self, "signedShortcutFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [WFShortcutPackageFile alloc];
    -[WFGalleryWorkflow signedShortcutFile](self, "signedShortcutFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGalleryWorkflow name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFShortcutPackageFile initWithSignedShortcutData:shortcutName:](v7, "initWithSignedShortcutData:shortcutName:", v9, v10);

    v30 = 0;
    -[WFShortcutPackageFile extractShortcutFileRepresentationWithError:](v11, "extractShortcutFileRepresentationWithError:", &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (!v12
      || (-[WFGalleryWorkflow signingStatus](self, "signingStatus"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("APPROVED")),
          v14,
          (v15 & 1) == 0))
    {
      getWFGeneralLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[WFGalleryWorkflow workflowRecord]";
        v33 = 2114;
        v34 = v13;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut was unable to verify signed shortcut: %{public}@", buf, 0x16u);
      }

      return (WFWorkflowRecord *)0;
    }

  }
  else
  {
    -[WFGalleryWorkflow shortcutFile](self, "shortcutFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[WFGalleryWorkflow shortcutFile](self, "shortcutFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v17 = [WFWorkflowFileDescriptor alloc];
  -[WFGalleryWorkflow name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WFWorkflowFileDescriptor initWithFile:name:](v17, "initWithFile:name:", v12, v18);

  v20 = [WFWorkflowFile alloc];
  v29 = 0;
  v21 = -[WFWorkflowFile initWithDescriptor:error:](v20, "initWithDescriptor:error:", v19, &v29);
  v22 = v29;
  v28 = v22;
  -[WFWorkflowFile recordRepresentationWithError:](v21, "recordRepresentationWithError:", &v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v28;

  -[WFGalleryWorkflow persistentIdentifier](self, "persistentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setGalleryIdentifier:", v25);

  objc_msgSend(v23, "setSource:", CFSTR("ShortcutSourceGallery"));
  if (v23)
  {
    v26 = v23;
    p_super = &self->_workflowRecord->super.super;
    self->_workflowRecord = v26;
  }
  else
  {
    getWFGeneralLogObject();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFGalleryWorkflow workflowRecord]";
      v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_1C15B3000, p_super, OS_LOG_TYPE_ERROR, "%s WFGalleryWorkflow was unable to load record from shortcut file: %{public}@", buf, 0x16u);
    }
  }

  if (v23)
    return self->_workflowRecord;
  return (WFWorkflowRecord *)0;
}

- (id)ensureFileAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WFFileRepresentation *v7;
  WFFileRepresentation *shortcutFile;
  void *v9;
  id v10;
  void *v11;
  WFFileRepresentation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFFileRepresentation *v17;
  WFFileRepresentation *iconFile;

  if (self->_workflowRecord)
  {
    -[WFGalleryWorkflow workflowRecord](self, "workflowRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFGalleryWorkflow identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v6);

    objc_msgSend(v4, "writeToDiskWithError:", 0);
    v7 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    shortcutFile = self->_shortcutFile;
    self->_shortcutFile = v7;

  }
  -[WFGalleryWorkflow icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC7E40]);
    -[WFGalleryWorkflow icon](self, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (WFFileRepresentation *)objc_msgSend(v10, "initWithIcon:", v11);

    -[WFFileRepresentation setCornerRadius:](v12, "setCornerRadius:", 8.0);
    -[WFFileRepresentation imageWithSize:](v12, "imageWithSize:", 60.0, 60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(v13, "PNGRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC580]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileWithData:ofType:proposedFilename:", v15, v16, 0);
    v17 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    iconFile = self->_iconFile;
    self->_iconFile = v17;

  }
  else
  {
    v12 = self->_iconFile;
    self->_iconFile = 0;
  }

  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  -[WFGalleryWorkflow identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFGalleryWorkflow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFGalleryWorkflow createdAt](self, "createdAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[WFGalleryWorkflow minVersion](self, "minVersion");
  -[WFGalleryWorkflow modifiedAt](self, "modifiedAt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[WFGalleryWorkflow shortDescription](self, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[WFGalleryWorkflow longDescription](self, "longDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  -[WFGalleryWorkflow workflowRecord](self, "workflowRecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  WFGalleryWorkflow *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  int v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  id v79;
  void *v80;
  id v81;

  v4 = (WFGalleryWorkflow *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFGalleryWorkflow identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryWorkflow identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        v10 = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
          goto LABEL_78;
        v13 = objc_msgSend(v7, "isEqual:", v8);

        if (!v13)
        {
          v10 = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      -[WFGalleryWorkflow name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryWorkflow name](v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v16 = v15;
      v11 = v16;
      if (v12 == v16)
      {

      }
      else
      {
        v10 = 0;
        v17 = v16;
        v18 = v12;
        if (!v12 || !v16)
          goto LABEL_77;
        v19 = objc_msgSend(v12, "isEqualToString:", v16);

        if (!v19)
        {
          v10 = 0;
LABEL_78:

          goto LABEL_79;
        }
      }
      -[WFGalleryWorkflow createdAt](self, "createdAt");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryWorkflow createdAt](v4, "createdAt");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v22 = v21;
      v17 = v22;
      if (v18 == v22)
      {

        v81 = v18;
      }
      else
      {
        v10 = 0;
        v23 = v22;
        v24 = v18;
        if (!v18 || !v22)
          goto LABEL_76;
        v25 = v18;
        v26 = objc_msgSend(v18, "isEqual:", v22);

        v81 = v25;
        if (!v26)
        {
          v10 = 0;
          v18 = v25;
LABEL_77:

          goto LABEL_78;
        }
      }
      -[WFGalleryWorkflow modifiedAt](self, "modifiedAt");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGalleryWorkflow modifiedAt](v4, "modifiedAt");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v27;
      v29 = v28;
      v80 = v29;
      if (v24 != v29)
      {
        v10 = 0;
        if (v24)
        {
          v30 = v29;
          v31 = v24;
          if (v29)
          {
            v78 = objc_msgSend(v24, "isEqual:", v29);

            v18 = v81;
            if (!v78)
              goto LABEL_35;
LABEL_29:
            v32 = -[WFGalleryWorkflow minVersion](self, "minVersion");
            if (v32 != -[WFGalleryWorkflow minVersion](v4, "minVersion"))
            {
LABEL_35:
              v10 = 0;
              v23 = v80;
LABEL_76:

              goto LABEL_77;
            }
            v81 = v18;
            v79 = v24;
            -[WFGalleryWorkflow hiddenRegions](self, "hiddenRegions");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFGalleryWorkflow hiddenRegions](v4, "hiddenRegions");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v33;
            v36 = v34;
            v76 = v36;
            v77 = v35;
            if (v35 != v36)
            {
              v10 = 0;
              if (v35)
              {
                v37 = v36;
                v38 = v35;
                v24 = v79;
                if (v36)
                {
                  v39 = objc_msgSend(v77, "isEqualToArray:", v36);

                  if (!v39)
                  {
                    v10 = 0;
                    v24 = v79;
LABEL_74:
                    v30 = v76;
                    v31 = v77;
                    goto LABEL_75;
                  }
LABEL_38:
                  -[WFGalleryWorkflow supportedIdioms](self, "supportedIdioms");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFGalleryWorkflow supportedIdioms](v4, "supportedIdioms");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = v40;
                  v42 = v41;
                  v75 = v42;
                  if (v38 != v42)
                  {
                    v10 = 0;
                    if (v38)
                    {
                      v43 = v42;
                      v44 = v38;
                      v24 = v79;
                      if (v42)
                      {
                        v45 = v38;
                        v46 = objc_msgSend(v38, "isEqualToArray:", v42);

                        v74 = v45;
                        if (!v46)
                        {
                          v10 = 0;
                          v24 = v79;
                          v38 = v74;
LABEL_72:
                          v37 = v75;
                          goto LABEL_73;
                        }
LABEL_44:
                        -[WFGalleryWorkflow shortDescription](self, "shortDescription");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        -[WFGalleryWorkflow shortDescription](v4, "shortDescription");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        v49 = v47;
                        v50 = v48;
                        v72 = v50;
                        v73 = v49;
                        if (v49 != v50)
                        {
                          v10 = 0;
                          if (v49)
                          {
                            v51 = v50;
                            v52 = v49;
                            v24 = v79;
                            v38 = v74;
                            if (v50)
                            {
                              v53 = objc_msgSend(v73, "isEqualToString:", v50);

                              if (!v53)
                              {
                                v10 = 0;
                                v24 = v79;
                                v38 = v74;
LABEL_70:
                                v43 = v72;
                                v44 = v73;
                                goto LABEL_71;
                              }
LABEL_51:
                              -[WFGalleryWorkflow longDescription](self, "longDescription");
                              v54 = (void *)objc_claimAutoreleasedReturnValue();
                              -[WFGalleryWorkflow longDescription](v4, "longDescription");
                              v55 = (void *)objc_claimAutoreleasedReturnValue();
                              v56 = v54;
                              v57 = v55;
                              v70 = v56;
                              v71 = v57;
                              if (v56 == v57)
                              {

                              }
                              else
                              {
                                v10 = 0;
                                if (!v56)
                                {
                                  v58 = v57;
                                  v59 = 0;
                                  v24 = v79;
                                  v38 = v74;
                                  goto LABEL_67;
                                }
                                v58 = v57;
                                v59 = v56;
                                v24 = v79;
                                v38 = v74;
                                if (!v57)
                                {
LABEL_67:
                                  v65 = v59;

                                  v52 = v70;
                                  goto LABEL_68;
                                }
                                v60 = objc_msgSend(v70, "isEqualToString:", v57);

                                if (!v60)
                                {
                                  v10 = 0;
                                  v52 = v70;
                                  v24 = v79;
                                  v38 = v74;
LABEL_68:
                                  v51 = v71;
                                  goto LABEL_69;
                                }
                              }
                              -[WFGalleryWorkflow workflowRecord](self, "workflowRecord");
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              -[WFGalleryWorkflow workflowRecord](v4, "workflowRecord");
                              v62 = (void *)objc_claimAutoreleasedReturnValue();
                              v63 = v61;
                              v64 = v62;
                              v69 = v64;
                              if (v63 == v64)
                              {
                                v10 = 1;
                              }
                              else
                              {
                                v10 = 0;
                                if (v63)
                                {
                                  v24 = v79;
                                  v38 = v74;
                                  if (v64)
                                    v10 = objc_msgSend(v63, "isEqual:", v64);
                                  goto LABEL_65;
                                }
                              }
                              v24 = v79;
                              v38 = v74;
LABEL_65:

                              v58 = v69;
                              v59 = v63;
                              goto LABEL_67;
                            }
                          }
                          else
                          {
                            v51 = v50;
                            v52 = 0;
                            v24 = v79;
                            v38 = v74;
                          }
LABEL_69:
                          v66 = v52;

                          goto LABEL_70;
                        }

                        goto LABEL_51;
                      }
                    }
                    else
                    {
                      v43 = v42;
                      v44 = 0;
                      v24 = v79;
                    }
LABEL_71:
                    v67 = v44;

                    goto LABEL_72;
                  }

                  v74 = v38;
                  goto LABEL_44;
                }
              }
              else
              {
                v37 = v36;
                v38 = 0;
                v24 = v79;
              }
LABEL_73:

              goto LABEL_74;
            }

            goto LABEL_38;
          }
        }
        else
        {
          v30 = v29;
          v31 = 0;
        }
LABEL_75:

        v23 = v80;
        v18 = v81;
        goto LABEL_76;
      }

      v18 = v81;
      goto LABEL_29;
    }
    v10 = 0;
  }
LABEL_80:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFGalleryWorkflow *v5;
  void *v6;
  uint64_t v7;
  CKRecordID *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *shortDescription;
  void *v15;
  uint64_t v16;
  NSString *longDescription;
  void *v18;
  uint64_t v19;
  NSDate *createdAt;
  void *v21;
  uint64_t v22;
  NSDate *modifiedAt;
  void *v24;
  uint64_t v25;
  NSNumber *searchable;
  void *v27;
  uint64_t v28;
  NSArray *hiddenRegions;
  void *v30;
  uint64_t v31;
  NSArray *supportedIdioms;
  void *v33;
  uint64_t v34;
  NSString *language;
  uint64_t v36;
  CKRecordID *base;
  void *v38;
  uint64_t v39;
  NSString *persistentIdentifier;
  void *v41;
  uint64_t v42;
  WFFileRepresentation *iconFile;
  void *v44;
  uint64_t v45;
  NSNumber *iconColor;
  void *v47;
  uint64_t v48;
  NSNumber *iconGlyph;
  void *v50;
  uint64_t v51;
  WFWorkflowRecord *workflowRecord;
  void *v53;
  uint64_t v54;
  WFFileRepresentation *shortcutFile;

  v5 = -[WFGalleryWorkflow init](+[WFGalleryWorkflow allocWithZone:](WFGalleryWorkflow, "allocWithZone:"), "init");
  -[WFGalleryWorkflow identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  -[WFGalleryWorkflow name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v10;

  -[WFGalleryWorkflow shortDescription](self, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  shortDescription = v5->_shortDescription;
  v5->_shortDescription = (NSString *)v13;

  -[WFGalleryWorkflow longDescription](self, "longDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  longDescription = v5->_longDescription;
  v5->_longDescription = (NSString *)v16;

  -[WFGalleryWorkflow createdAt](self, "createdAt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  createdAt = v5->_createdAt;
  v5->_createdAt = (NSDate *)v19;

  -[WFGalleryWorkflow modifiedAt](self, "modifiedAt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copyWithZone:", a3);
  modifiedAt = v5->_modifiedAt;
  v5->_modifiedAt = (NSDate *)v22;

  -[WFGalleryWorkflow searchable](self, "searchable");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copyWithZone:", a3);
  searchable = v5->_searchable;
  v5->_searchable = (NSNumber *)v25;

  v5->_minVersion = -[WFGalleryWorkflow minVersion](self, "minVersion");
  -[WFGalleryWorkflow hiddenRegions](self, "hiddenRegions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copyWithZone:", a3);
  hiddenRegions = v5->_hiddenRegions;
  v5->_hiddenRegions = (NSArray *)v28;

  -[WFGalleryWorkflow supportedIdioms](self, "supportedIdioms");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copyWithZone:", a3);
  supportedIdioms = v5->_supportedIdioms;
  v5->_supportedIdioms = (NSArray *)v31;

  -[WFGalleryWorkflow language](self, "language");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "copyWithZone:", a3);
  language = v5->_language;
  v5->_language = (NSString *)v34;

  -[WFGalleryWorkflow base](self, "base");
  v36 = objc_claimAutoreleasedReturnValue();
  base = v5->_base;
  v5->_base = (CKRecordID *)v36;

  -[WFGalleryWorkflow persistentIdentifier](self, "persistentIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "copyWithZone:", a3);
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v39;

  -[WFGalleryWorkflow iconFile](self, "iconFile");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "copyWithZone:", a3);
  iconFile = v5->_iconFile;
  v5->_iconFile = (WFFileRepresentation *)v42;

  -[WFGalleryWorkflow iconColor](self, "iconColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "copyWithZone:", a3);
  iconColor = v5->_iconColor;
  v5->_iconColor = (NSNumber *)v45;

  -[WFGalleryWorkflow iconGlyph](self, "iconGlyph");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "copyWithZone:", a3);
  iconGlyph = v5->_iconGlyph;
  v5->_iconGlyph = (NSNumber *)v48;

  -[WFGalleryWorkflow workflowRecord](self, "workflowRecord");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "copyWithZone:", a3);
  workflowRecord = v5->_workflowRecord;
  v5->_workflowRecord = (WFWorkflowRecord *)v51;

  -[WFGalleryWorkflow shortcutFile](self, "shortcutFile");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "copyWithZone:", a3);
  shortcutFile = v5->_shortcutFile;
  v5->_shortcutFile = (WFFileRepresentation *)v54;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WFMutableGalleryWorkflow *v5;
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
  void *v24;
  void *v25;
  void *v26;
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

  v5 = -[WFMutableGalleryWorkflow init](+[WFMutableGalleryWorkflow allocWithZone:](WFMutableGalleryWorkflow, "allocWithZone:"), "init");
  -[WFGalleryWorkflow identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setIdentifier:](v5, "setIdentifier:", v7);

  -[WFGalleryWorkflow language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setLanguage:](v5, "setLanguage:", v9);

  -[WFGalleryWorkflow name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setName:](v5, "setName:", v11);

  -[WFGalleryWorkflow shortDescription](self, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setShortDescription:](v5, "setShortDescription:", v13);

  -[WFGalleryWorkflow longDescription](self, "longDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setLongDescription:](v5, "setLongDescription:", v15);

  -[WFGalleryWorkflow createdAt](self, "createdAt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setCreatedAt:](v5, "setCreatedAt:", v17);

  -[WFGalleryWorkflow modifiedAt](self, "modifiedAt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setModifiedAt:](v5, "setModifiedAt:", v19);

  -[WFGalleryWorkflow searchable](self, "searchable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setSearchable:](v5, "setSearchable:", v21);

  -[WFMutableGalleryWorkflow setMinVersion:](v5, "setMinVersion:", -[WFGalleryWorkflow minVersion](self, "minVersion"));
  -[WFGalleryWorkflow hiddenRegions](self, "hiddenRegions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setHiddenRegions:](v5, "setHiddenRegions:", v23);

  -[WFGalleryWorkflow supportedIdioms](self, "supportedIdioms");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setSupportedIdioms:](v5, "setSupportedIdioms:", v25);

  -[WFGalleryWorkflow language](self, "language");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setLanguage:](v5, "setLanguage:", v27);

  -[WFGalleryWorkflow base](self, "base");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableGalleryWorkflow setBase:](v5, "setBase:", v28);

  -[WFGalleryWorkflow persistentIdentifier](self, "persistentIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setPersistentIdentifier:](v5, "setPersistentIdentifier:", v30);

  -[WFGalleryWorkflow iconFile](self, "iconFile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setIconFile:](v5, "setIconFile:", v32);

  -[WFGalleryWorkflow iconColor](self, "iconColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copyWithZone:", a3);
  -[WFGalleryWorkflow setIconColor:](v5, "setIconColor:", v34);

  -[WFGalleryWorkflow iconGlyph](self, "iconGlyph");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copyWithZone:", a3);
  -[WFGalleryWorkflow setIconGlyph:](v5, "setIconGlyph:", v36);

  -[WFGalleryWorkflow workflowRecord](self, "workflowRecord");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setWorkflowRecord:](v5, "setWorkflowRecord:", v38);

  -[WFGalleryWorkflow shortcutFile](self, "shortcutFile");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copyWithZone:", a3);
  -[WFMutableGalleryWorkflow setShortcutFile:](v5, "setShortcutFile:", v40);

  return v5;
}

- (id)propertiesForEventLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("workflow_identifier");
  -[WFGalleryWorkflow persistentIdentifier](self, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("workflow_name");
  -[WFGalleryWorkflow name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("workflow_record_type");
  objc_msgSend((id)objc_opt_class(), "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (NSNumber)searchable
{
  return self->_searchable;
}

- (int64_t)minVersion
{
  return self->_minVersion;
}

- (NSArray)hiddenRegions
{
  return self->_hiddenRegions;
}

- (NSArray)supportedIdioms
{
  return self->_supportedIdioms;
}

- (NSDate)createdAt
{
  return self->_createdAt;
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

- (WFFileRepresentation)shortcutFile
{
  return self->_shortcutFile;
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (void)setSignedShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->_signedShortcutFile, a3);
}

- (WFFileRepresentation)iconFile
{
  return self->_iconFile;
}

- (NSNumber)iconColor
{
  return self->_iconColor;
}

- (void)setIconColor:(id)a3
{
  objc_storeStrong((id *)&self->_iconColor, a3);
}

- (NSNumber)iconGlyph
{
  return self->_iconGlyph;
}

- (void)setIconGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_iconGlyph, a3);
}

- (NSString)signingStatus
{
  return self->_signingStatus;
}

- (void)setSigningStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingStatus, 0);
  objc_storeStrong((id *)&self->_iconGlyph, 0);
  objc_storeStrong((id *)&self->_iconColor, 0);
  objc_storeStrong((id *)&self->_iconFile, 0);
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
  objc_storeStrong((id *)&self->_shortcutFile, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modifiedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_supportedIdioms, 0);
  objc_storeStrong((id *)&self->_hiddenRegions, 0);
  objc_storeStrong((id *)&self->_searchable, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workflowRecord, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("GalleryShortcut");
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
  void *v11;
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
  _QWORD v23[16];
  _QWORD v24[18];

  v24[16] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("name");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("shortDescription");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("longDescription");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("icon_color");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("iconColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("icon_glyph");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("iconGlyph"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("icon");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC520]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("iconFile"), v17, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v16;
  v23[6] = CFSTR("shortcut");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcuts.workflow-file"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("shortcutFile"), v15, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  v23[7] = CFSTR("searchable");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v13;
  v23[8] = CFSTR("minVersion");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v2;
  v23[9] = CFSTR("hiddenRegions");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v3;
  v23[10] = CFSTR("supportedIdioms");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v4;
  v23[11] = CFSTR("language");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v5;
  v23[12] = CFSTR("base");
  +[WFCloudKitItemProperty itemReferencePropertyWithName:itemClass:](WFCloudKitItemProperty, "itemReferencePropertyWithName:itemClass:", CFSTR("base"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v6;
  v23[13] = CFSTR("persistentIdentifier");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v7;
  v23[14] = CFSTR("signedShortcut");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("signedShortcutFile"), v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v9;
  v23[15] = CFSTR("signingStatus");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

@end
