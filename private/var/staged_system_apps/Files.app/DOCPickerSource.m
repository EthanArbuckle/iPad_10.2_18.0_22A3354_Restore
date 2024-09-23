@implementation DOCPickerSource

- (DOCPickerSource)initWithPicker:(id)a3 providerDomain:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  DOCPickerSource *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)LSApplicationExtensionRecord);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = objc_msgSend(v8, "initWithBundleIdentifier:error:", v9, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributes"));
  v13 = objc_msgSend(v6, "optedIn");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));

  if (v14)
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v15 = -[DOCPickerSource initWithTitle:attributes:optedIn:identifier:providerDomain:pickerExtension:](self, "initWithTitle:attributes:optedIn:identifier:providerDomain:pickerExtension:", v11, v12, v13, v14, v7, v6);

  return v15;
}

- (DOCPickerSource)initWithTitle:(id)a3 attributes:(id)a4 optedIn:(BOOL)a5 identifier:(id)a6 providerDomain:(id)a7 pickerExtension:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  DOCPickerSource *v19;
  DOCPickerSource *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  unsigned __int8 v30;
  _UNKNOWN **v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  unsigned int v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _QWORD v49[2];
  _BYTE v50[128];

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v48.receiver = self;
  v48.super_class = (Class)DOCPickerSource;
  v19 = -[DOCPickerSource init](&v48, "init");
  v20 = v19;
  if (v19)
  {
    -[DOCPickerSource setProviderDomain:](v19, "setProviderDomain:", v17);
    -[DOCPickerSource setPickerExtension:](v20, "setPickerExtension:", v18);
    -[DOCPickerSource setDisplayName:](v20, "setDisplayName:", v14);
    -[DOCPickerSource setProviderName:](v20, "setProviderName:", v14);
    -[DOCPickerSource setIdentifier:](v20, "setIdentifier:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UIDocumentPickerModes")));
    v22 = v21;
    if (v21)
    {
      v40 = v11;
      v41 = v16;
      v42 = v15;
      v43 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v21, "count")));
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v39 = v22;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("UIDocumentPickerModeImport"), v39);
            v31 = &off_1005F4F28;
            if ((v30 & 1) == 0)
            {
              v32 = objc_msgSend(v29, "isEqualToString:", CFSTR("UIDocumentPickerModeOpen"));
              v31 = &off_1005F4F40;
              if ((v32 & 1) == 0)
              {
                v33 = objc_msgSend(v29, "isEqualToString:", CFSTR("UIDocumentPickerModeExportToService"));
                v31 = &off_1005F4F58;
                if ((v33 & 1) == 0)
                {
                  v34 = objc_msgSend(v29, "isEqualToString:", CFSTR("UIDocumentPickerModeMoveToService"));
                  v31 = &off_1005F4F70;
                  if (!v34)
                    continue;
                }
              }
            }
            objc_msgSend(v23, "addObject:", v31);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        }
        while (v26);
      }

      -[DOCPickerSource setSupportedInteractionModes:](v20, "setSupportedInteractionModes:", v23);
      v15 = v42;
      v14 = v43;
      v16 = v41;
      v11 = v40;
      v22 = v39;
    }
    else
    {
      -[DOCPickerSource setSupportedInteractionModes:](v20, "setSupportedInteractionModes:", &__NSArray0__struct);
    }
    -[DOCPickerSource setIsExtensionOptedIn:](v20, "setIsExtensionOptedIn:", v11, v39);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UIDocumentPickerSupportedFileTypes")));
    if (!v35
      || (v36 = objc_claimAutoreleasedReturnValue(+[UTType doc_contentTypesForIdentifiers:](UTType, "doc_contentTypesForIdentifiers:", v35))) == 0)
    {
      v49[0] = UTTypeContent;
      v49[1] = UTTypeItem;
      v36 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
    }
    v37 = (void *)v36;
    -[DOCPickerSource setDocumentContentTypes:](v20, "setDocumentContentTypes:", v36);

  }
  return v20;
}

- (NSString)hostApplicationBundleIdentifier
{
  NSString *hostApplicationBundleIdentifier;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *v9;
  NSString *v10;

  hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  if (!hostApplicationBundleIdentifier)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCPickerSource pickerExtension](self, "pickerExtension"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

    v6 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containingBundleRecord"));
    v8 = objc_opt_class(LSApplicationRecord);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
      v10 = self->_hostApplicationBundleIdentifier;
      self->_hostApplicationBundleIdentifier = v9;

    }
    hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  }
  return hostApplicationBundleIdentifier;
}

- (NSString)fileProviderDocumentGroup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSString *v8;
  NSString *fileProviderDocumentGroup;

  if (!self->_loadedFileProviderDocumentGroup)
  {
    self->_loadedFileProviderDocumentGroup = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCPickerSource providerDomain](self, "providerDomain"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extensionBundleIdentifier"));

    v5 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoDictionary"));
    v7 = objc_msgSend(v6, "objectForKey:ofClass:", CFSTR("NSExtensionFileProviderDocumentGroup"), objc_opt_class(NSString));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
    fileProviderDocumentGroup = self->_fileProviderDocumentGroup;
    self->_fileProviderDocumentGroup = v8;

  }
  return self->_fileProviderDocumentGroup;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCPickerSource;
  if (-[DOCPickerSource isEqual:](&v8, "isEqual:", v4))
  {
    v5 = objc_msgSend(v4, "isExtensionOptedIn");
    v6 = v5 ^ -[DOCPickerSource isExtensionOptedIn](self, "isExtensionOptedIn") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)useEnumeration
{
  return 0;
}

- (id)loadIconForSize:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCPickerSource hostApplicationBundleIdentifier](self, "hostApplicationBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationIconForBundleIdentifier:size:", v6, a3));

  return v7;
}

- (BOOL)isValidForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension attributes](self->_pickerExtension, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("UIDocumentPickerVisibilityUserManageable")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCPickerSource pickerExtension](self, "pickerExtension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", _UIDocumentPickerDefaultIdentifier);

  if ((v9 & 1) != 0
    || objc_msgSend(v4, "forPickingDocuments")
    && !-[DOCPickerSource supportsInteractionMode:](self, "supportsInteractionMode:", objc_msgSend(v4, "interactionMode")))
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DOCPickerSource;
    v10 = -[DOCPickerSource isValidForConfiguration:](&v12, "isValidForConfiguration:", v4);
  }

  return v10;
}

- (BOOL)supportsInteractionMode:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCPickerSource supportedInteractionModes](self, "supportedInteractionModes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue") == (id)a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)status
{
  return -[DOCPickerSource isExtensionOptedIn](self, "isExtensionOptedIn") ^ 1;
}

- (NSExtension)pickerExtension
{
  return (NSExtension *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPickerExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isExtensionOptedIn
{
  return self->_isExtensionOptedIn;
}

- (void)setIsExtensionOptedIn:(BOOL)a3
{
  self->_isExtensionOptedIn = a3;
}

- (FPProviderDomain)providerDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProviderDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)supportedInteractionModes
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSupportedInteractionModes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedInteractionModes, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_pickerExtension, 0);
  objc_storeStrong((id *)&self->_fileProviderDocumentGroup, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
}

@end
