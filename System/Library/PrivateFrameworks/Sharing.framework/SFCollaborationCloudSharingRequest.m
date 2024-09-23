@implementation SFCollaborationCloudSharingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingRequest)initWithCollaborationItemIdentifier:(id)a3 options:(id)a4 fileOrFolderURL:(id)a5 share:(id)a6 setupInfo:(id)a7 phoneNumbers:(id)a8 emailAddresses:(id)a9 activityType:(id)a10 appName:(id)a11 appIconData:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SFCollaborationCloudSharingRequest *v23;
  uint64_t v24;
  NSUUID *collaborationItemIdentifier;
  uint64_t v26;
  NSArray *options;
  uint64_t v28;
  NSArray *phoneNumbers;
  uint64_t v30;
  NSArray *emailAddresses;
  uint64_t v32;
  NSString *activityType;
  uint64_t v34;
  NSString *appName;
  NSNumber *v36;
  NSNumber *v37;
  NSNumber *v38;
  NSNumber *accessType;
  NSNumber *v40;
  NSNumber *permissionType;
  NSNumber *v42;
  NSNumber *allowOthersToInvite;
  id v45;
  id v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  v48 = a3;
  v18 = a4;
  *((_QWORD *)&v47 + 1) = a5;
  *(_QWORD *)&v47 = a6;
  v46 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v45 = a12;
  v52.receiver = self;
  v52.super_class = (Class)SFCollaborationCloudSharingRequest;
  v23 = -[SFCollaborationCloudSharingRequest init](&v52, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v48, "copy");
    collaborationItemIdentifier = v23->_collaborationItemIdentifier;
    v23->_collaborationItemIdentifier = (NSUUID *)v24;

    v26 = objc_msgSend(v18, "copy");
    options = v23->_options;
    v23->_options = (NSArray *)v26;

    objc_storeStrong((id *)&v23->_fileOrFolderURL, a5);
    objc_storeStrong((id *)&v23->_share, a6);
    objc_storeStrong((id *)&v23->_setupInfo, a7);
    v28 = objc_msgSend(v19, "copy");
    phoneNumbers = v23->_phoneNumbers;
    v23->_phoneNumbers = (NSArray *)v28;

    v30 = objc_msgSend(v20, "copy");
    emailAddresses = v23->_emailAddresses;
    v23->_emailAddresses = (NSArray *)v30;

    v32 = objc_msgSend(v21, "copy");
    activityType = v23->_activityType;
    v23->_activityType = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    appName = v23->_appName;
    v23->_appName = (NSString *)v34;

    objc_storeStrong((id *)&v23->_appIconData, a12);
    if (v47 != 0)
    {
      v50 = 0;
      v51 = 0;
      v49 = 0;
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:](SFCollaborationUtilities, "getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:", v18, &v51, &v50, &v49);
      v36 = (NSNumber *)v51;
      v37 = (NSNumber *)v50;
      v38 = (NSNumber *)v49;
      accessType = v23->_accessType;
      v23->_accessType = v36;
      v40 = v36;

      permissionType = v23->_permissionType;
      v23->_permissionType = v37;
      v42 = v37;

      allowOthersToInvite = v23->_allowOthersToInvite;
      v23->_allowOthersToInvite = v38;

    }
  }

  return v23;
}

- (SFCollaborationCloudSharingRequest)initWithCollaborationItemIdentifier:(id)a3 options:(id)a4 fileOrFolderURL:(id)a5 share:(id)a6 setupInfo:(id)a7 activityType:(id)a8
{
  return -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](self, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", a3, a4, a5, a6, a7, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a8, 0, 0);
}

- (SFCollaborationCloudSharingRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SFCollaborationCloudSharingRequest *v29;
  SFCollaborationCloudSharingRequest *v30;
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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborationItemIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v8 = (void *)get_SWCollaborationOptionsGroupClass_softClass;
  v40 = get_SWCollaborationOptionsGroupClass_softClass;
  if (!get_SWCollaborationOptionsGroupClass_softClass)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __get_SWCollaborationOptionsGroupClass_block_invoke;
    v35 = &unk_1E482D680;
    v36 = &v37;
    __get_SWCollaborationOptionsGroupClass_block_invoke((uint64_t)&v32);
    v8 = (void *)v38[3];
  }
  v29 = self;
  v31 = (void *)v5;
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v6, "setWithObjects:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("options"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileOrFolderURL"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", getCKShareClass(), CFSTR("share"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v11 = (void *)getCKContainerSetupInfoClass_softClass_1;
  v40 = getCKContainerSetupInfoClass_softClass_1;
  if (!getCKContainerSetupInfoClass_softClass_1)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __getCKContainerSetupInfoClass_block_invoke_1;
    v35 = &unk_1E482D680;
    v36 = &v37;
    __getCKContainerSetupInfoClass_block_invoke_1((uint64_t)&v32);
    v11 = (void *)v38[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("setupInfo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("phoneNumbers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("emailAddresses"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIconData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v29, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v31, v28, v27, v26, v25, v24, v19, v20, v21, v22);

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *collaborationItemIdentifier;
  id v5;

  collaborationItemIdentifier = self->_collaborationItemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", collaborationItemIdentifier, CFSTR("collaborationItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileOrFolderURL, CFSTR("fileOrFolderURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_share, CFSTR("share"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_setupInfo, CFSTR("setupInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessType, CFSTR("accessType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_permissionType, CFSTR("permissionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowOthersToInvite, CFSTR("allowOthersToInvite"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityType, CFSTR("activityType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appName, CFSTR("appName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appIconData, CFSTR("appIconData"));

}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (NSArray)options
{
  return self->_options;
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

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
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

- (NSString)activityType
{
  return self->_activityType;
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
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_allowOthersToInvite, 0);
  objc_storeStrong((id *)&self->_permissionType, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_setupInfo, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_fileOrFolderURL, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
}

@end
