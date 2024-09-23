@implementation WFWorkflowReference

- (unint64_t)hash
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int64_t v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  unint64_t v33;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)WFWorkflowReference;
  v3 = -[WFWorkflowDescriptor hash](&v36, sel_hash);
  -[WFWorkflowReference subtitle](self, "subtitle");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E7AFA810;
  v6 = -[__CFString hash](v4, "hash");
  -[WFWorkflowReference actionsDescription](self, "actionsDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 ^ objc_msgSend(v35, "hash");
  v8 = v7 ^ -[WFWorkflowReference actionCount](self, "actionCount") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[WFWorkflowReference syncHash](self, "syncHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[WFWorkflowReference icon](self, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[WFWorkflowReference creationDate](self, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[WFWorkflowReference modificationDate](self, "modificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  v17 = -[WFWorkflowReference isDeleted](self, "isDeleted");
  v18 = 3133065982;
  if (v17)
    v18 = 3203381950;
  v19 = v16 ^ v18;
  v20 = -[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync");
  v21 = 3405774846;
  if (v20)
    v21 = 3133079551;
  v22 = v19 ^ v21;
  v23 = -[WFWorkflowReference disabledOnLockScreen](self, "disabledOnLockScreen");
  v24 = 3133145087;
  if (!v23)
    v24 = 3404726270;
  v25 = v22 ^ v24;
  -[WFWorkflowReference lastRunDate](self, "lastRunDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v10 ^ v25 ^ objc_msgSend(v26, "hash");
  v28 = -[WFWorkflowReference remoteQuarantineStatus](self, "remoteQuarantineStatus");
  -[WFWorkflowReference remoteQuarantineHash](self, "remoteQuarantineHash");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 ^ objc_msgSend(v29, "hash");
  v31 = -[WFWorkflowReference hasShortcutInputVariables](self, "hasShortcutInputVariables");
  v32 = 1093271700;
  if (v31)
    v32 = 1437221162;
  v33 = v27 ^ v30 ^ v32;

  return v33;
}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (int64_t)syncHash
{
  return self->_syncHash;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)remoteQuarantineStatus
{
  return self->_remoteQuarantineStatus;
}

- (NSData)remoteQuarantineHash
{
  return self->_remoteQuarantineHash;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)lastRunDate
{
  return self->_lastRunDate;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (BOOL)hiddenFromLibraryAndSync
{
  return self->_hiddenFromLibraryAndSync;
}

- (BOOL)hasShortcutInputVariables
{
  return self->_hasShortcutInputVariables;
}

- (BOOL)disabledOnLockScreen
{
  return self->_disabledOnLockScreen;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)actionsDescription
{
  return self->_actionsDescription;
}

- (unint64_t)actionCount
{
  return self->_actionCount;
}

- (WFWorkflowReference)initWithIdentifier:(id)a3 name:(id)a4 color:(int64_t)a5 glyphCharacter:(unsigned __int16)a6 associatedAppBundleIdentifier:(id)a7 subtitle:(id)a8 actionsDescription:(id)a9 actionCount:(unint64_t)a10 syncHash:(int64_t)a11 isDeleted:(BOOL)a12 hiddenFromLibraryAndSync:(BOOL)a13 creationDate:(id)a14 modificationDate:(id)a15 lastRunDate:(id)a16 remoteQuarantineStatus:(int64_t)a17 remoteQuarantineHash:(id)a18 hasShortcutInputVariables:(BOOL)a19 disabledOnLockScreen:(BOOL)a20 source:(id)a21 runEventsCount:(id)a22
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  WFWorkflowReference *v31;
  uint64_t v32;
  NSString *subtitle;
  uint64_t v34;
  NSString *actionsDescription;
  uint64_t v36;
  WFWorkflowIcon *icon;
  WFWorkflowReference *v38;
  void *v40;
  id v44;
  id v45;
  unsigned int v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v46 = a6;
  v49 = a3;
  v25 = a4;
  v26 = a7;
  v48 = a8;
  v47 = a9;
  v44 = a14;
  v27 = a15;
  v45 = a16;
  v28 = a18;
  v29 = a21;
  v30 = a22;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowReference.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modificationDate"));

  }
  v50.receiver = self;
  v50.super_class = (Class)WFWorkflowReference;
  v31 = -[WFWorkflowDescriptor initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:](&v50, sel_initWithIdentifier_name_color_glyphCharacter_associatedAppBundleIdentifier_, v49, v25, a5, v46, v26);
  if (v31)
  {
    v32 = objc_msgSend(v48, "copy");
    subtitle = v31->_subtitle;
    v31->_subtitle = (NSString *)v32;

    v34 = objc_msgSend(v47, "copy");
    actionsDescription = v31->_actionsDescription;
    v31->_actionsDescription = (NSString *)v34;

    v31->_actionCount = a10;
    v31->_syncHash = a11;
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", a5, v46, 0);
    icon = v31->_icon;
    v31->_icon = (WFWorkflowIcon *)v36;

    v31->_isDeleted = a12;
    v31->_hiddenFromLibraryAndSync = a13;
    objc_storeStrong((id *)&v31->_creationDate, a14);
    objc_storeStrong((id *)&v31->_modificationDate, a15);
    objc_storeStrong((id *)&v31->_lastRunDate, a16);
    v31->_remoteQuarantineStatus = a17;
    objc_storeStrong((id *)&v31->_remoteQuarantineHash, a18);
    v31->_hasShortcutInputVariables = a19;
    v31->_disabledOnLockScreen = a20;
    objc_storeStrong((id *)&v31->_source, a21);
    objc_storeStrong((id *)&v31->_runEventsCount, a22);
    v38 = v31;
  }

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  WFWorkflowReference *v5;
  WFWorkflowReference *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  unint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  _BOOL4 v43;
  _BOOL4 v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  int64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  int v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v65;
  id v66;
  int v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  objc_super v79;

  v5 = (WFWorkflowReference *)a3;
  if (v5 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v79.receiver = self;
      v79.super_class = (Class)WFWorkflowReference;
      if (!-[WFWorkflowDescriptor isEqual:](&v79, sel_isEqual_, v6))
      {
        v13 = 0;
LABEL_93:

        goto LABEL_94;
      }
      -[WFWorkflowReference subtitle](self, "subtitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowReference subtitle](v6, "subtitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {

      }
      else
      {
        if (!v9 || !v10)
        {

LABEL_20:
          -[WFWorkflowReference subtitle](self, "subtitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
          {
            v21 = 0;
LABEL_91:

            v13 = v21;
            goto LABEL_92;
          }
          v77 = v20;
          -[WFWorkflowReference subtitle](v6, "subtitle");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "length"))
          {
            v21 = 0;
LABEL_90:

            v20 = v77;
            goto LABEL_91;
          }
          v78 = 1;
LABEL_14:
          -[WFWorkflowReference actionsDescription](self, "actionsDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowReference actionsDescription](v6, "actionsDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14;
          v17 = v15;
          v18 = v17;
          if (v16 == v17)
          {

          }
          else
          {
            if (!v16 || !v17)
            {

              goto LABEL_31;
            }
            v19 = objc_msgSend(v16, "isEqualToString:", v17);

            if (!v19)
            {
LABEL_31:

              v21 = 0;
              v13 = 0;
              if (!v78)
                goto LABEL_92;
              goto LABEL_90;
            }
          }
          v22 = -[WFWorkflowReference actionCount](self, "actionCount");
          if (v22 != -[WFWorkflowReference actionCount](v6, "actionCount"))
            goto LABEL_31;
          v23 = -[WFWorkflowReference syncHash](self, "syncHash");
          if (v23 != -[WFWorkflowReference syncHash](v6, "syncHash"))
            goto LABEL_31;
          v76 = v3;
          -[WFWorkflowReference icon](self, "icon");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowReference icon](v6, "icon");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v24;
          v27 = v25;
          v74 = v27;
          v75 = v26;
          if (v26 != v27)
          {
            v21 = 0;
            if (v26)
            {
              v28 = v27;
              v3 = v76;
              if (v27)
              {
                v29 = objc_msgSend(v26, "isEqual:", v27);

                if (!v29)
                {
                  v21 = 0;
                  v3 = v76;
                  goto LABEL_89;
                }
LABEL_37:
                -[WFWorkflowReference creationDate](self, "creationDate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWorkflowReference creationDate](v6, "creationDate");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v30;
                v33 = v31;
                v72 = v33;
                v73 = v32;
                if (v32 != v33)
                {
                  v21 = 0;
                  if (v32)
                  {
                    v34 = v33;
                    v3 = v76;
                    if (v33)
                    {
                      v35 = objc_msgSend(v32, "isEqual:", v33);

                      if (!v35)
                      {
                        v21 = 0;
                        v3 = v76;
LABEL_87:
                        v28 = v72;
                        v26 = v73;
                        goto LABEL_88;
                      }
LABEL_43:
                      -[WFWorkflowReference modificationDate](self, "modificationDate");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WFWorkflowReference modificationDate](v6, "modificationDate");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = v36;
                      v38 = v37;
                      v71 = v38;
                      if (v32 != v38)
                      {
                        v21 = 0;
                        if (v32)
                        {
                          v39 = v38;
                          v40 = v32;
                          v3 = v76;
                          if (v38)
                          {
                            v41 = v38;
                            v42 = objc_msgSend(v32, "isEqual:", v38);

                            if (!v42)
                            {
LABEL_53:
                              v21 = 0;
                              v3 = v76;
LABEL_85:
                              v34 = v71;
                              goto LABEL_86;
                            }
LABEL_50:
                            v43 = -[WFWorkflowReference isDeleted](self, "isDeleted");
                            if (v43 != -[WFWorkflowReference isDeleted](v6, "isDeleted"))
                              goto LABEL_53;
                            v44 = -[WFWorkflowReference disabledOnLockScreen](self, "disabledOnLockScreen");
                            if (v44 != -[WFWorkflowReference disabledOnLockScreen](v6, "disabledOnLockScreen"))
                              goto LABEL_53;
                            v45 = -[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync");
                            if (v45 != -[WFWorkflowReference hiddenFromLibraryAndSync](v6, "hiddenFromLibraryAndSync"))
                              goto LABEL_53;
                            -[WFWorkflowReference lastRunDate](self, "lastRunDate");
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            -[WFWorkflowReference lastRunDate](v6, "lastRunDate");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            v48 = v46;
                            v49 = v47;
                            v69 = v49;
                            v70 = v48;
                            if (v48 != v49)
                            {
                              v21 = 0;
                              if (v48)
                              {
                                v50 = v49;
                                if (v49)
                                {
                                  v67 = objc_msgSend(v48, "isEqual:", v49);

                                  if (!v67)
                                    goto LABEL_68;
LABEL_62:
                                  v51 = -[WFWorkflowReference remoteQuarantineStatus](self, "remoteQuarantineStatus");
                                  if (v51 != -[WFWorkflowReference remoteQuarantineStatus](v6, "remoteQuarantineStatus"))
                                  {
LABEL_68:
                                    v21 = 0;
LABEL_83:
                                    v3 = v76;
                                    v39 = v69;
                                    v40 = v70;
                                    goto LABEL_84;
                                  }
                                  v65 = v32;
                                  -[WFWorkflowReference remoteQuarantineHash](self, "remoteQuarantineHash");
                                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[WFWorkflowReference remoteQuarantineHash](v6, "remoteQuarantineHash");
                                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                                  v54 = v52;
                                  v66 = v53;
                                  v68 = v54;
                                  if (v54 == v66)
                                  {

                                  }
                                  else
                                  {
                                    v21 = 0;
                                    if (!v54)
                                    {
                                      v56 = v66;
                                      v55 = v68;
                                      goto LABEL_80;
                                    }
                                    v55 = v54;
                                    v56 = v66;
                                    if (!v66)
                                    {
LABEL_80:

                                      goto LABEL_81;
                                    }
                                    v57 = objc_msgSend(v68, "isEqual:", v66);

                                    if (!v57)
                                      goto LABEL_72;
                                  }
                                  v58 = -[WFWorkflowReference hasShortcutInputVariables](self, "hasShortcutInputVariables");
                                  if (v58 != -[WFWorkflowReference hasShortcutInputVariables](v6, "hasShortcutInputVariables"))
                                  {
LABEL_72:
                                    v21 = 0;
LABEL_81:
                                    v32 = v65;
                                    v50 = v66;
                                    v48 = v68;
                                    goto LABEL_82;
                                  }
                                  -[WFWorkflowReference runEventsCount](self, "runEventsCount");
                                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[WFWorkflowReference runEventsCount](v6, "runEventsCount");
                                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                                  v55 = v59;
                                  v61 = v60;
                                  v56 = v61;
                                  if (v55 == v61)
                                  {
                                    v21 = 1;
                                  }
                                  else
                                  {
                                    v21 = 0;
                                    if (v55 && v61)
                                      v21 = objc_msgSend(v55, "isEqual:", v61);
                                  }

                                  goto LABEL_80;
                                }
                              }
                              else
                              {
                                v50 = v49;
                              }
LABEL_82:

                              goto LABEL_83;
                            }

                            goto LABEL_62;
                          }
                        }
                        else
                        {
                          v39 = v38;
                          v40 = 0;
                          v3 = v76;
                        }
LABEL_84:
                        v62 = v32;
                        v63 = v40;

                        v32 = v62;
                        goto LABEL_85;
                      }

                      goto LABEL_50;
                    }
                  }
                  else
                  {
                    v34 = v33;
                    v3 = v76;
                  }
LABEL_86:

                  goto LABEL_87;
                }

                goto LABEL_43;
              }
            }
            else
            {
              v28 = v27;
              v3 = v76;
            }
LABEL_88:

LABEL_89:
            v13 = v21;
            if ((v78 & 1) == 0)
            {
LABEL_92:

              goto LABEL_93;
            }
            goto LABEL_90;
          }

          goto LABEL_37;
        }
        v12 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v12 & 1) == 0)
          goto LABEL_20;
      }
      v78 = 0;
      goto LABEL_14;
    }
    v13 = 0;
  }
LABEL_94:

  return v13;
}

- (WFWorkflowReference)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowReference *v5;
  uint64_t v6;
  WFWorkflowIcon *icon;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *actionsDescription;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *creationDate;
  uint64_t v16;
  NSDate *modificationDate;
  uint64_t v18;
  NSDate *lastRunDate;
  uint64_t v20;
  NSData *remoteQuarantineHash;
  uint64_t v22;
  NSString *source;
  uint64_t v24;
  NSNumber *runEventsCount;
  WFWorkflowReference *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WFWorkflowReference;
  v5 = -[WFWorkflowDescriptor initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v6 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (WFWorkflowIcon *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionsDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionsDescription = v5->_actionsDescription;
    v5->_actionsDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_actionCount = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncHash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_syncHash = objc_msgSend(v13, "longValue");

    v5->_isDeleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeleted"));
    v5->_hiddenFromLibraryAndSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hiddenFromLibraryAndSync"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastRunDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastRunDate = v5->_lastRunDate;
    v5->_lastRunDate = (NSDate *)v18;

    v5->_remoteQuarantineStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteQuarantineStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteQuarantineHash"));
    v20 = objc_claimAutoreleasedReturnValue();
    remoteQuarantineHash = v5->_remoteQuarantineHash;
    v5->_remoteQuarantineHash = (NSData *)v20;

    v5->_hasShortcutInputVariables = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasShortcutInputVariables"));
    v5->_disabledOnLockScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disabledOnLockScreen"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v22 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runEventsCount"));
    v24 = objc_claimAutoreleasedReturnValue();
    runEventsCount = v5->_runEventsCount;
    v5->_runEventsCount = (NSNumber *)v24;

    v26 = v5;
  }

  return v5;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFWorkflowReference;
  v4 = a3;
  -[WFWorkflowDescriptor encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  -[WFWorkflowReference icon](self, "icon", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("icon"));

  -[WFWorkflowReference subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[WFWorkflowReference actionsDescription](self, "actionsDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionsDescription"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFWorkflowReference actionCount](self, "actionCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("actionCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[WFWorkflowReference syncHash](self, "syncHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("syncHash"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference isDeleted](self, "isDeleted"), CFSTR("isDeleted"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"), CFSTR("hiddenFromLibraryAndSync"));
  -[WFWorkflowReference creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("creationDate"));

  -[WFWorkflowReference modificationDate](self, "modificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("modificationDate"));

  -[WFWorkflowReference lastRunDate](self, "lastRunDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("lastRunDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFWorkflowReference remoteQuarantineStatus](self, "remoteQuarantineStatus"), CFSTR("remoteQuarantineStatus"));
  -[WFWorkflowReference remoteQuarantineHash](self, "remoteQuarantineHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("remoteQuarantineHash"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference hasShortcutInputVariables](self, "hasShortcutInputVariables"), CFSTR("hasShortcutInputVariables"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference disabledOnLockScreen](self, "disabledOnLockScreen"), CFSTR("disabledOnLockScreen"));
  -[WFWorkflowReference source](self, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("source"));

  -[WFWorkflowReference runEventsCount](self, "runEventsCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("runEventsCount"));

}

- (id)externalURLForRunningWithSource:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
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

  if (a3)
  {
    objc_msgSend(CFSTR("&source="), "stringByAppendingString:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E7AFA810;
  }
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[WFWorkflowDescriptor name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowReference identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("shortcuts://x-callback-url/run-shortcut?name=%@&id=%@%@"), v11, v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)attributionTitle
{
  if (-[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"))
    WFLocalizedString(CFSTR("Shortcuts"));
  else
    -[WFWorkflowDescriptor name](self, "name");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (WFIcon)attributionIcon
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  if (-[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC7978]);
    v4 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
  }
  else
  {
    -[WFWorkflowDescriptor associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC7978]);
      -[WFWorkflowDescriptor associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:", v8);

    }
    else
    {
      -[WFWorkflowReference icon](self, "icon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "icon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (WFIcon *)v4;
}

- (id)attributionIconWithSize:(CGSize)a3 scale:(double)a4 rounded:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  if (-[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"))
  {
    objc_msgSend(MEMORY[0x1E0DC7B70], "applicationIconImageForBundleIdentifier:format:", *MEMORY[0x1E0DC7FA0], 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0DC7E40]);
    -[WFWorkflowReference icon](self, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithIcon:", v12);

    objc_msgSend(v13, "setRounded:", v5);
    objc_msgSend(v13, "imageWithSize:scale:", width, height, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, void *, id);
  void *v7;
  void *v8;
  id v9;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB36F8];
  v6 = (void (**)(id, void *, id))a4;
  v7 = (void *)-[WFWorkflowReference copy](self, "copy");
  v11 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  v6[2](v6, v8, v9);
  return 0;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)runEventsCount
{
  return self->_runEventsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runEventsCount, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_remoteQuarantineHash, 0);
  objc_storeStrong((id *)&self->_lastRunDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionsDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.shortcuts.workflow-reference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.shortcuts.workflow-reference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)speakableString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CBDC00]);
  -[WFWorkflowReference identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v4, v5, 0);

  return v6;
}

- (NSUserActivity)userActivityForViewing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t i;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("is.workflow.my.app.viewworkflow"));
  -[WFWorkflowDescriptor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v14[0] = CFSTR("workflowID");
  -[WFWorkflowReference identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("workflowName");
  v15[0] = v5;
  -[WFWorkflowDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v7);

  v8 = CFSTR("workflowID");
  v13[0] = CFSTR("workflowID");
  v9 = CFSTR("workflowName");
  v13[1] = CFSTR("workflowName");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v13, 2);
  for (i = 1; i != -1; --i)

  objc_msgSend(v3, "setRequiredUserInfoKeys:", v10);
  objc_msgSend(v3, "setEligibleForHandoff:", 0);
  objc_msgSend(v3, "setEligibleForSearch:", 0);
  return (NSUserActivity *)v3;
}

@end
