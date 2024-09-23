@implementation WFLinkActionConfirmationAlertSession

- (WFLinkActionConfirmationAlertSession)initWithAppBundleIdentifier:(id)a3 actionMetadata:(id)a4 shouldShowPrompt:(BOOL)a5 dialog:(id)a6 dialogString:(id)a7 viewSnippet:(id)a8 confirmationActionName:(id)a9
{
  id v15;
  id v16;
  id v17;
  WFLinkActionConfirmationAlertSession *v18;
  WFLinkActionConfirmationAlertSession *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)WFLinkActionConfirmationAlertSession;
  v18 = -[WFLinkActionConfirmationAlertSession init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_appBundleIdentifier, a3);
    objc_storeStrong((id *)&v19->_actionMetadata, a4);
    v19->_shouldShowPrompt = a5;
    objc_storeStrong((id *)&v19->_dialog, a6);
    objc_storeStrong((id *)&v19->_dialogString, a7);
    objc_storeStrong((id *)&v19->_viewSnippet, a8);
    objc_storeStrong((id *)&v19->_confirmationActionName, a9);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_appBundleIdentifier);
  objc_storeStrong((id *)(v4 + 24), self->_actionMetadata);
  *(_BYTE *)(v4 + 8) = self->_shouldShowPrompt;
  objc_storeStrong((id *)(v4 + 32), self->_dialog);
  objc_storeStrong((id *)(v4 + 40), self->_dialogString);
  objc_storeStrong((id *)(v4 + 48), self->_viewSnippet);
  objc_storeStrong((id *)(v4 + 56), self->_confirmationActionName);
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFLinkActionConfirmationAlertSession appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appBundleIdentifier"));

  -[WFLinkActionConfirmationAlertSession actionMetadata](self, "actionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionMetadata"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFLinkActionConfirmationAlertSession shouldShowPrompt](self, "shouldShowPrompt"), CFSTR("shouldShowPrompt"));
  -[WFLinkActionConfirmationAlertSession dialog](self, "dialog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dialog"));

  -[WFLinkActionConfirmationAlertSession dialogString](self, "dialogString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dialogString"));

  -[WFLinkActionConfirmationAlertSession viewSnippet](self, "viewSnippet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("viewSnippet"));

  -[WFLinkActionConfirmationAlertSession confirmationActionName](self, "confirmationActionName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("confirmationActionName"));

}

- (WFLinkActionConfirmationAlertSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFLinkActionConfirmationAlertSession *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowPrompt"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dialog")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialog"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dialogString")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialogString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("viewSnippet")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewSnippet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("confirmationActionName")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationActionName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[WFLinkActionConfirmationAlertSession initWithAppBundleIdentifier:actionMetadata:shouldShowPrompt:dialog:dialogString:viewSnippet:confirmationActionName:](self, "initWithAppBundleIdentifier:actionMetadata:shouldShowPrompt:dialog:dialogString:viewSnippet:confirmationActionName:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (WFLinkActionConfirmationAlertSession)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  const void *data;
  const void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  const void *v14;
  id v15;
  void *v16;
  WFLinkActionConfirmationAlertSession *v17;
  void *v18;
  void *v19;
  WFLinkActionConfirmationAlertSession *v20;
  uint64_t v21;
  NSXPCListenerEndpoint *endpoint;
  size_t length;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D018A0], "coderWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  length = 0;
  data = xpc_dictionary_get_data(v4, (const char *)objc_msgSend(CFSTR("appBundleIdentifier"), "UTF8String"), &length);
  if (length)
  {
    v7 = data;
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = (void *)objc_msgSend(v8, "initWithBytes:length:encoding:", v7, length, 4);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", NSClassFromString((NSString *)CFSTR("LNActionMetadata")), CFSTR("actionMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("shouldShowPrompt"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", NSClassFromString((NSString *)CFSTR("LNDialog")), CFSTR("dialog"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    length = 0;
    v13 = xpc_dictionary_get_data(v4, (const char *)objc_msgSend(CFSTR("dialogString"), "UTF8String"), &length);
    if (length)
    {
      v14 = v13;
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v16 = (void *)objc_msgSend(v15, "initWithBytes:length:encoding:", v14, length, 4);
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", NSClassFromString((NSString *)CFSTR("LNViewSnippet")), CFSTR("viewSnippet"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", NSClassFromString((NSString *)CFSTR("LNConfirmationActionName")), CFSTR("confirmationActionName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WFLinkActionConfirmationAlertSession initWithAppBundleIdentifier:actionMetadata:shouldShowPrompt:dialog:dialogString:viewSnippet:confirmationActionName:](self, "initWithAppBundleIdentifier:actionMetadata:shouldShowPrompt:dialog:dialogString:viewSnippet:confirmationActionName:", v9, v10, v11, v12, v16, v18, v19);
    if (v20)
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", NSClassFromString((NSString *)CFSTR("NSXPCListenerEndpoint")), CFSTR("endpoint"));
      v21 = objc_claimAutoreleasedReturnValue();
      endpoint = v20->_endpoint;
      v20->_endpoint = (NSXPCListenerEndpoint *)v21;

    }
    self = v20;

    v17 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFLinkActionConfirmationAlertSession initWithXPCDictionary:]";
      _os_log_error_impl(&dword_1AF681000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: appBundleIdentifier is empty.", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  void *v5;
  const char *v6;
  id v7;
  LNActionMetadata *actionMetadata;
  LNDialog *dialog;
  NSString *dialogString;
  void *v11;
  const char *v12;
  LNViewSnippet *viewSnippet;
  LNConfirmationActionName *confirmationActionName;
  NSXPCListenerEndpoint *endpoint;
  xpc_object_t xdict;

  xdict = a3;
  objc_msgSend(MEMORY[0x1E0D018A0], "coderWithMessage:", xdict);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString dataUsingEncoding:](self->_appBundleIdentifier, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const char *)objc_msgSend(CFSTR("appBundleIdentifier"), "UTF8String");
  v7 = objc_retainAutorelease(v5);
  xpc_dictionary_set_data(xdict, v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldShowPrompt, CFSTR("shouldShowPrompt"));
  actionMetadata = self->_actionMetadata;
  if (actionMetadata)
    objc_msgSend(v4, "encodeObject:forKey:", actionMetadata, CFSTR("actionMetadata"));
  dialog = self->_dialog;
  if (dialog)
    objc_msgSend(v4, "encodeObject:forKey:", dialog, CFSTR("dialog"));
  dialogString = self->_dialogString;
  if (dialogString)
  {
    -[NSString dataUsingEncoding:](dialogString, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (const char *)objc_msgSend(CFSTR("dialogString"), "UTF8String");
    v7 = objc_retainAutorelease(v11);
    xpc_dictionary_set_data(xdict, v12, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }
  viewSnippet = self->_viewSnippet;
  if (viewSnippet)
    objc_msgSend(v4, "encodeObject:forKey:", viewSnippet, CFSTR("viewSnippet"));
  confirmationActionName = self->_confirmationActionName;
  if (confirmationActionName)
    objc_msgSend(v4, "encodeObject:forKey:", confirmationActionName, CFSTR("confirmationActionName"));
  endpoint = self->_endpoint;
  if (endpoint)
    objc_msgSend(v4, "encodeObject:forKey:", endpoint, CFSTR("endpoint"));

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (BOOL)shouldShowPrompt
{
  return self->_shouldShowPrompt;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (NSString)dialogString
{
  return self->_dialogString;
}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (LNConfirmationActionName)confirmationActionName
{
  return self->_confirmationActionName;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_confirmationActionName, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialogString, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
