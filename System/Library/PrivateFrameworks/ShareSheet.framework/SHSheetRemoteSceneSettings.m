@implementation SHSheetRemoteSceneSettings

+ (id)settingsWithConfigurationBlock:(id)a3
{
  void (**v3)(id, SHSheetRemoteSceneSettings *);
  SHSheetRemoteSceneSettings *v4;

  v3 = (void (**)(id, SHSheetRemoteSceneSettings *))a3;
  v4 = objc_alloc_init(SHSheetRemoteSceneSettings);
  v3[2](v3, v4);

  return v4;
}

+ (id)settingsWithSessionContext:(id)a3 presnetationStyle:(int64_t)a4 hostProcessType:(int64_t)a5 customizationGroups:(id)a6 collaborationOptions:(id)a7 cloudShareRequest:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  v18 = objc_alloc_init((Class)a1);
  objc_msgSend(v18, "setSessionContext:", v17);

  objc_msgSend(v18, "setPresentationStyle:", a4);
  objc_msgSend(v18, "setHostProcessType:", a5);
  objc_msgSend(v18, "setCollaborationOptions:", v15);

  objc_msgSend(v18, "setCloudShareRequest:", v14);
  objc_msgSend(v18, "setCustomizationGroups:", v16);

  return v18;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SHSheetRemoteSceneSettings sessionContext](self, "sessionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionContext"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[SHSheetRemoteSceneSettings hostProcessType](self, "hostProcessType"), CFSTR("hostProcessType"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SHSheetRemoteSceneSettings presentationStyle](self, "presentationStyle"), CFSTR("presentationStyle"));
  -[SHSheetRemoteSceneSettings collaborationOptions](self, "collaborationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("collaborationOptions"));

  -[SHSheetRemoteSceneSettings cloudShareRequest](self, "cloudShareRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cloudShareRequest"));

  -[SHSheetRemoteSceneSettings customizationGroups](self, "customizationGroups");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v8, CFSTR("customizationGroups"));

}

- (SHSheetRemoteSceneSettings)initWithBSXPCCoder:(id)a3
{
  id v4;
  SHSheetRemoteSceneSettings *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = -[SHSheetRemoteSceneSettings init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteSceneSettings setSessionContext:](v5, "setSessionContext:", v6);

  -[SHSheetRemoteSceneSettings setHostProcessType:](v5, "setHostProcessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hostProcessType")));
  -[SHSheetRemoteSceneSettings setPresentationStyle:](v5, "setPresentationStyle:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("presentationStyle")));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)get_SWCollaborationShareOptionsClass_softClass;
  v18 = get_SWCollaborationShareOptionsClass_softClass;
  if (!get_SWCollaborationShareOptionsClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __get_SWCollaborationShareOptionsClass_block_invoke;
    v14[3] = &unk_1E4001370;
    v14[4] = &v15;
    __get_SWCollaborationShareOptionsClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("collaborationOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteSceneSettings setCollaborationOptions:](v5, "setCollaborationOptions:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudShareRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteSceneSettings setCloudShareRequest:](v5, "setCloudShareRequest:", v10);

  v11 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v11, objc_opt_class(), CFSTR("customizationGroups"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRemoteSceneSettings setCustomizationGroups:](v5, "setCustomizationGroups:", v12);

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SHSheetUIServiceClientContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionContext, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (void)setHostProcessType:(int64_t)a3
{
  self->_hostProcessType = a3;
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_customizationGroups, a3);
}

- (_SWCollaborationShareOptions)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationOptions, a3);
}

- (SFCollaborationCloudSharingRequest)cloudShareRequest
{
  return self->_cloudShareRequest;
}

- (void)setCloudShareRequest:(id)a3
{
  objc_storeStrong((id *)&self->_cloudShareRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudShareRequest, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
}

@end
