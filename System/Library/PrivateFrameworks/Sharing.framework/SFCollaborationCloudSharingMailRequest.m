@implementation SFCollaborationCloudSharingMailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingMailRequest)initWithCollaborationItemIdentifier:(id)a3 fileOrFolderURL:(id)a4 share:(id)a5 setupInfo:(id)a6 sharingURL:(id)a7 accessType:(id)a8 permissionType:(id)a9 allowOthersToInvite:(id)a10 appName:(id)a11 appIconData:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  SFCollaborationCloudSharingMailRequest *v22;
  SFCollaborationCloudSharingMailRequest *v23;
  uint64_t v24;
  NSString *appName;
  id obj;
  id v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  obj = a4;
  v35 = a4;
  v28 = a5;
  v34 = a5;
  v33 = a6;
  v29 = a7;
  v32 = a7;
  v31 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)SFCollaborationCloudSharingMailRequest;
  v22 = -[SFCollaborationCloudSharingMailRequest init](&v37, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_collaborationItemIdentifier, a3);
    objc_storeStrong((id *)&v23->_fileOrFolderURL, obj);
    objc_storeStrong((id *)&v23->_share, v28);
    objc_storeStrong((id *)&v23->_setupInfo, a6);
    objc_storeStrong((id *)&v23->_sharingURL, v29);
    objc_storeStrong((id *)&v23->_accessType, a8);
    objc_storeStrong((id *)&v23->_permissionType, a9);
    objc_storeStrong((id *)&v23->_allowOthersToInvite, a10);
    v24 = objc_msgSend(v20, "copy");
    appName = v23->_appName;
    v23->_appName = (NSString *)v24;

    objc_storeStrong((id *)&v23->_appIconData, a12);
  }

  return v23;
}

- (SFCollaborationCloudSharingMailRequest)initWithCloudSharingRequest:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SFCollaborationCloudSharingMailRequest *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "collaborationItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileOrFolderURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "share");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accessType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "permissionType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowOthersToInvite");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appIconData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[SFCollaborationCloudSharingMailRequest initWithCollaborationItemIdentifier:fileOrFolderURL:share:setupInfo:sharingURL:accessType:permissionType:allowOthersToInvite:appName:appIconData:](self, "initWithCollaborationItemIdentifier:fileOrFolderURL:share:setupInfo:sharingURL:accessType:permissionType:allowOthersToInvite:appName:appIconData:", v8, v19, v9, v18, v10, v11, v12, v13, v14, v15);
  return v17;
}

- (SFCollaborationCloudSharingMailRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  SFCollaborationCloudSharingMailRequest *v20;
  SFCollaborationCloudSharingMailRequest *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborationItemIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileOrFolderURL"));
  v6 = objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v7 = (void *)getCKShareClass_softClass;
  v32 = getCKShareClass_softClass;
  if (!getCKShareClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getCKShareClass_block_invoke;
    v27 = &unk_1E482D680;
    v28 = &v29;
    __getCKShareClass_block_invoke((uint64_t)&v24);
    v7 = (void *)v30[3];
  }
  v20 = self;
  v22 = (void *)v6;
  v23 = (void *)v5;
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("share"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v9 = (void *)getCKContainerSetupInfoClass_softClass;
  v32 = getCKContainerSetupInfoClass_softClass;
  if (!getCKContainerSetupInfoClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getCKContainerSetupInfoClass_block_invoke;
    v27 = &unk_1E482D680;
    v28 = &v29;
    __getCKContainerSetupInfoClass_block_invoke((uint64_t)&v24);
    v9 = (void *)v30[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("setupInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permissionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowOthersToInvite"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIconData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SFCollaborationCloudSharingMailRequest initWithCollaborationItemIdentifier:fileOrFolderURL:share:setupInfo:sharingURL:accessType:permissionType:allowOthersToInvite:appName:appIconData:](v20, "initWithCollaborationItemIdentifier:fileOrFolderURL:share:setupInfo:sharingURL:accessType:permissionType:allowOthersToInvite:appName:appIconData:", v23, v22, v19, v11, v12, v13, v14, v15, v16, v17);

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *collaborationItemIdentifier;
  id v5;

  collaborationItemIdentifier = self->_collaborationItemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", collaborationItemIdentifier, CFSTR("collaborationItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileOrFolderURL, CFSTR("fileOrFolderURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_share, CFSTR("share"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_setupInfo, CFSTR("setupInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingURL, CFSTR("sharingURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessType, CFSTR("accessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_permissionType, CFSTR("permissionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowOthersToInvite, CFSTR("allowOthersToInvite"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appName, CFSTR("appName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appIconData, CFSTR("appIconData"));

}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (NSURL)fileOrFolderURL
{
  return self->_fileOrFolderURL;
}

- (CKShare)share
{
  return self->_share;
}

- (CKContainerSetupInfo)setupInfo
{
  return self->_setupInfo;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (NSNumber)accessType
{
  return self->_accessType;
}

- (NSNumber)permissionType
{
  return self->_permissionType;
}

- (NSNumber)allowOthersToInvite
{
  return self->_allowOthersToInvite;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconData, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_allowOthersToInvite, 0);
  objc_storeStrong((id *)&self->_permissionType, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_setupInfo, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_fileOrFolderURL, 0);
  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
}

@end
