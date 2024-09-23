@implementation WFShortcutConcerningReport

- (WFShortcutConcerningReport)initWithReason:(id)a3 shortcutContent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFShortcutConcerningReport *v10;
  uint64_t v11;
  NSString *reportReason;
  NSString *status;
  WFShortcutConcerningReport *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGalleryPage.m"), 711, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGalleryPage.m"), 712, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutContent"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)WFShortcutConcerningReport;
  v10 = -[WFShortcutConcerningReport init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    reportReason = v10->_reportReason;
    v10->_reportReason = (NSString *)v11;

    objc_storeStrong((id *)&v10->_shortcutContent, a4);
    status = v10->_status;
    v10->_status = (NSString *)CFSTR("screen");

    v14 = v10;
  }

  return v10;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSString)reportReason
{
  return self->_reportReason;
}

- (void)setReportReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)reportMessage
{
  return self->_reportMessage;
}

- (void)setReportMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKRecordID)shortcut
{
  return self->_shortcut;
}

- (void)setShortcut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WFFileRepresentation)shortcutContent
{
  return self->_shortcutContent;
}

- (void)setShortcutContent:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutContent, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_shortcutContent, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_reportMessage, 0);
  objc_storeStrong((id *)&self->_reportReason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("ShortcutConcerningReport");
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
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("reportMessage");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("reportReason");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("shortcut");
  +[WFCloudKitItemProperty itemReferencePropertyWithName:itemClass:](WFCloudKitItemProperty, "itemReferencePropertyWithName:itemClass:", CFSTR("shortcut"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("shortcutContent");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcuts.workflow-file"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("shortcutContent"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("status");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

@end
