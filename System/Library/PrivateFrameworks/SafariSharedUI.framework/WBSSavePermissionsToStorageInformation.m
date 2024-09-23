@implementation WBSSavePermissionsToStorageInformation

- (WBSSavePermissionsToStorageInformation)initWithWebExtension:(id)a3 permissionsWereUpdatedDueToAnExternalChange:(BOOL)a4
{
  id v7;
  WBSSavePermissionsToStorageInformation *v8;
  WBSSavePermissionsToStorageInformation *v9;
  WBSSavePermissionsToStorageInformation *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSSavePermissionsToStorageInformation;
  v8 = -[WBSSavePermissionsToStorageInformation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_webExtension, a3);
    v9->_permissionsWereUpdatedDueToAnExternalChange = a4;
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WBSSavePermissionsToStorageInformation *v4;
  WBSSavePermissionsToStorageInformation *v5;
  WBSSavePermissionsToStorageInformation *v6;
  WBSSavePermissionsToStorageInformation *v7;
  WBSSavePermissionsToStorageInformation *v8;
  _BOOL4 permissionsWereUpdatedDueToAnExternalChange;
  WBSWebExtensionData *webExtension;
  void *v11;
  char v12;

  v4 = (WBSSavePermissionsToStorageInformation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8
      && (permissionsWereUpdatedDueToAnExternalChange = self->_permissionsWereUpdatedDueToAnExternalChange,
          permissionsWereUpdatedDueToAnExternalChange == -[WBSSavePermissionsToStorageInformation permissionsWereUpdatedDueToAnExternalChange](v8, "permissionsWereUpdatedDueToAnExternalChange")))
    {
      webExtension = self->_webExtension;
      -[WBSSavePermissionsToStorageInformation webExtension](v8, "webExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WBSWebExtensionData isEqual:](webExtension, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (WBSWebExtensionData)webExtension
{
  return self->_webExtension;
}

- (BOOL)permissionsWereUpdatedDueToAnExternalChange
{
  return self->_permissionsWereUpdatedDueToAnExternalChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webExtension, 0);
}

@end
