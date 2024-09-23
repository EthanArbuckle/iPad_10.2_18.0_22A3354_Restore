@implementation SFCollaborationCloudSharingMailResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollaborationCloudSharingMailResult)initWithSubject:(id)a3 body:(id)a4 containerID:(id)a5 canEdit:(id)a6 allowOthersToInvite:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SFCollaborationCloudSharingMailResult *v19;
  uint64_t v20;
  NSString *subject;
  uint64_t v22;
  NSString *body;
  id v25;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SFCollaborationCloudSharingMailResult;
  v19 = -[SFCollaborationCloudSharingMailResult init](&v26, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    subject = v19->_subject;
    v19->_subject = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    body = v19->_body;
    v19->_body = (NSString *)v22;

    objc_storeStrong((id *)&v19->_containerID, a5);
    objc_storeStrong((id *)&v19->_canEdit, a6);
    objc_storeStrong((id *)&v19->_allowOthersToInvite, a7);
    objc_storeStrong((id *)&v19->_error, a8);
  }

  return v19;
}

- (SFCollaborationCloudSharingMailResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SFCollaborationCloudSharingMailResult *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v7 = (void *)getCKContainerIDClass_softClass;
  v19 = getCKContainerIDClass_softClass;
  if (!getCKContainerIDClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getCKContainerIDClass_block_invoke;
    v15[3] = &unk_1E482D680;
    v15[4] = &v16;
    __getCKContainerIDClass_block_invoke((uint64_t)v15);
    v7 = (void *)v17[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("containerID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canEdit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowOthersToInvite"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SFCollaborationCloudSharingMailResult initWithSubject:body:containerID:canEdit:allowOthersToInvite:error:](self, "initWithSubject:body:containerID:canEdit:allowOthersToInvite:error:", v5, v6, v9, v10, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subject;
  id v5;

  subject = self->_subject;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subject, CFSTR("subject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerID, CFSTR("containerID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_canEdit, CFSTR("canEdit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowOthersToInvite, CFSTR("allowOthersToInvite"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSNumber)canEdit
{
  return self->_canEdit;
}

- (NSNumber)allowOthersToInvite
{
  return self->_allowOthersToInvite;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_allowOthersToInvite, 0);
  objc_storeStrong((id *)&self->_canEdit, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end
