@implementation SFCollaborationCloudSharingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingResult)initWithCollaborationItemIdentifier:(id)a3 sharingURL:(id)a4 share:(id)a5 error:(id)a6 mailResult:(id)a7
{
  return -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](self, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", a3, a4, a5, 0, a6, a7);
}

- (SFCollaborationCloudSharingResult)initWithCollaborationItemIdentifier:(id)a3 sharingURL:(id)a4 share:(id)a5 existingShare:(BOOL)a6 error:(id)a7 mailResult:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SFCollaborationCloudSharingResult *v18;
  uint64_t v19;
  NSUUID *collaborationItemIdentifier;
  void *v22;
  id v24;
  objc_super v25;

  v14 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFCollaborationCloudSharingRequest.m"), 51, CFSTR("collaborationItemIdentifier is nil."));

  }
  v25.receiver = self;
  v25.super_class = (Class)SFCollaborationCloudSharingResult;
  v18 = -[SFCollaborationCloudSharingResult init](&v25, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    collaborationItemIdentifier = v18->_collaborationItemIdentifier;
    v18->_collaborationItemIdentifier = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_sharingURL, a4);
    objc_storeStrong((id *)&v18->_share, a5);
    v18->_existingShare = a6;
    objc_storeStrong((id *)&v18->_error, a7);
    objc_storeStrong((id *)&v18->_mailResult, a8);
  }

  return v18;
}

- (SFCollaborationCloudSharingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SFCollaborationCloudSharingResult *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborationItemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", getCKShareClass(), CFSTR("share"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("existingShare"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mailResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](self, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *collaborationItemIdentifier;
  id v5;

  collaborationItemIdentifier = self->_collaborationItemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", collaborationItemIdentifier, CFSTR("collaborationItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingURL, CFSTR("sharingURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_share, CFSTR("share"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_existingShare, CFSTR("existingShare"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mailResult, CFSTR("mailResult"));

}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (CKShare)share
{
  return self->_share;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)existingShare
{
  return self->_existingShare;
}

- (SFCollaborationCloudSharingMailResult)mailResult
{
  return self->_mailResult;
}

- (void)setMailResult:(id)a3
{
  objc_storeStrong((id *)&self->_mailResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
}

@end
