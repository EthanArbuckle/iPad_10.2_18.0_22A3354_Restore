@implementation WFSharedShortcut

+ (NSString)recordType
{
  return (NSString *)CFSTR("SharedShortcut");
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
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("name");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v13;
  v14[1] = CFSTR("icon_color");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("iconColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v2;
  v14[2] = CFSTR("icon_glyph");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("iconGlyph"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v3;
  v14[3] = CFSTR("icon");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC520]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("iconFile"), v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = CFSTR("shortcut");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcuts.workflow-file"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("shortcutFile"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("signedShortcut");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("signedShortcutFile"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v9;
  v14[6] = CFSTR("signingStatus");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (WFWorkflowIcon)icon
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[WFSharedShortcut iconGlyph](self, "iconGlyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSharedShortcut iconColor](self, "iconColor");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(MEMORY[0x1E0DC7E38], "defaultGlyphCharacter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v4)
    v5 = (void *)v4;
  else
    v5 = &unk_1E7B8B5A8;
  v6 = objc_alloc(MEMORY[0x1E0DC7E38]);
  -[WFSharedShortcut iconColor](self, "iconColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  -[WFSharedShortcut iconGlyph](self, "iconGlyph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithBackgroundColorValue:glyphCharacter:customImageData:", v8, (unsigned __int16)objc_msgSend(v9, "unsignedIntegerValue"), 0);

  return (WFWorkflowIcon *)v10;
}

- (WFWorkflowRecord)workflowRecord
{
  void *v4;
  void *v5;
  WFShortcutPackageFile *v6;
  void *v7;
  void *v8;
  void *v9;
  WFShortcutPackageFile *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  WFWorkflowFileDescriptor *v15;
  void *v16;
  NSObject *v17;
  WFWorkflowFile *v18;
  id v19;
  void *v20;
  id v21;
  WFWorkflowRecord *v22;
  int v23;
  NSObject *p_super;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_workflowRecord)
  {
    -[WFSharedShortcut signedShortcutFile](self, "signedShortcutFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[WFSharedShortcut signedShortcutFile](self, "signedShortcutFile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        getWFGeneralLogObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "-[WFSharedShortcut workflowRecord]";
          _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut doesn't have signed shortcut file", buf, 0xCu);
        }

        return (WFWorkflowRecord *)0;
      }
      v6 = [WFShortcutPackageFile alloc];
      -[WFSharedShortcut signedShortcutFile](self, "signedShortcutFile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSharedShortcut name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WFShortcutPackageFile initWithSignedShortcutData:shortcutName:](v6, "initWithSignedShortcutData:shortcutName:", v8, v9);

      v28 = 0;
      -[WFShortcutPackageFile extractShortcutFileRepresentationWithError:](v10, "extractShortcutFileRepresentationWithError:", &v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v28;
      if (v11
        && (-[WFSharedShortcut signingStatus](self, "signingStatus"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("APPROVED")),
            v13,
            (v14 & 1) != 0))
      {
        v15 = [WFWorkflowFileDescriptor alloc];
        -[WFSharedShortcut name](self, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[WFWorkflowFileDescriptor initWithFile:name:](v15, "initWithFile:name:", v11, v16);

        v27 = 0;
        v18 = -[WFWorkflowFile initWithDescriptor:error:]([WFWorkflowFile alloc], "initWithDescriptor:error:", v17, &v27);
        v19 = v27;
        v26 = v19;
        -[WFWorkflowFile recordRepresentationWithError:](v18, "recordRepresentationWithError:", &v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v26;

        objc_msgSend(v20, "setSource:", CFSTR("ShortcutSourceCloudLink"));
        if (v20)
        {
          v22 = v20;
          v23 = 0;
          p_super = &self->_workflowRecord->super.super;
          self->_workflowRecord = v22;
        }
        else
        {
          getWFGeneralLogObject();
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v30 = "-[WFSharedShortcut workflowRecord]";
            v31 = 2114;
            v32 = v21;
            _os_log_impl(&dword_1C15B3000, p_super, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut was unable to load record from shortcut file: %{public}@", buf, 0x16u);
          }
          v23 = 1;
        }

      }
      else
      {
        getWFGeneralLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[WFSharedShortcut workflowRecord]";
          v31 = 2114;
          v32 = v12;
          _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut was unable to verify signed shortcut: %{public}@", buf, 0x16u);
        }
        v23 = 1;
      }

      if (v23)
        return (WFWorkflowRecord *)0;
    }
  }
  return self->_workflowRecord;
}

- (void)setIcon:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "backgroundColorValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSharedShortcut setIconColor:](self, "setIconColor:", v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "glyphCharacter");

  objc_msgSend(v7, "numberWithUnsignedShort:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSharedShortcut setIconGlyph:](self, "setIconGlyph:", v9);

}

- (id)ensureFileAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (self->_workflowRecord)
  {
    -[WFSharedShortcut workflowRecord](self, "workflowRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFSharedShortcut identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v6);

    objc_msgSend(v4, "writeToDiskWithError:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSharedShortcut setShortcutFile:](self, "setShortcutFile:", v7);

  }
  -[WFSharedShortcut icon](self, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0DC7E40]);
    -[WFSharedShortcut icon](self, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithIcon:", v10);

    objc_msgSend(v11, "setCornerRadius:", 8.0);
    objc_msgSend(v11, "imageWithSize:", 150.0, 150.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(v12, "PNGRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC580]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileWithData:ofType:proposedFilename:", v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSharedShortcut setIconFile:](self, "setIconFile:", v16);

  }
  else
  {
    -[WFSharedShortcut setIconFile:](self, "setIconFile:", 0);
  }
  return 0;
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  id v8;
  NSString *v9;
  NSString *createdBy;
  id v11;

  objc_storeStrong((id *)&self->_createdAt, a3);
  v11 = a3;
  v8 = a5;
  v9 = (NSString *)objc_msgSend(v8, "copy");

  createdBy = self->_createdBy;
  self->_createdBy = v9;

}

- (id)sharingURL
{
  void *v2;
  void *v3;
  void *v4;

  -[WFSharedShortcut identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFGallerySharingURLForIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)propertiesForEventLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("workflow_identifier");
  -[WFSharedShortcut identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("workflow_name");
  -[WFSharedShortcut name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("workflow_record_type");
  objc_msgSend((id)objc_opt_class(), "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setWorkflowRecord:(id)a3
{
  objc_storeStrong((id *)&self->_workflowRecord, a3);
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSString)createdBy
{
  return self->_createdBy;
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (void)setSignedShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->_signedShortcutFile, a3);
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

- (WFFileRepresentation)shortcutFile
{
  return self->_shortcutFile;
}

- (void)setShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutFile, a3);
}

- (NSString)signingStatus
{
  return self->_signingStatus;
}

- (void)setSigningStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (WFFileRepresentation)iconFile
{
  return self->_iconFile;
}

- (void)setIconFile:(id)a3
{
  objc_storeStrong((id *)&self->_iconFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFile, 0);
  objc_storeStrong((id *)&self->_signingStatus, 0);
  objc_storeStrong((id *)&self->_shortcutFile, 0);
  objc_storeStrong((id *)&self->_iconGlyph, 0);
  objc_storeStrong((id *)&self->_iconColor, 0);
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_workflowRecord, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
