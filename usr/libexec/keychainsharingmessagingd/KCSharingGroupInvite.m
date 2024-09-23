@implementation KCSharingGroupInvite

- (KCSharingGroupInvite)initWithGroupID:(id)a3 shareURL:(id)a4 senderHandle:(id)a5 inviteeHandle:(id)a6 inviteToken:(id)a7 sentTime:(id)a8 displayName:(id)a9
{
  id v16;
  id v17;
  KCSharingGroupInvite *v18;
  KCSharingGroupInvite *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)KCSharingGroupInvite;
  v18 = -[KCSharingGroupInvite init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupID, a3);
    objc_storeStrong((id *)&v19->_shareURL, a4);
    objc_storeStrong((id *)&v19->_senderHandle, a5);
    objc_storeStrong((id *)&v19->_inviteeHandle, a6);
    objc_storeStrong((id *)&v19->_inviteToken, a7);
    objc_storeStrong((id *)&v19->_sentTime, a8);
    objc_storeStrong((id *)&v19->_displayName, a9);
  }

  return v19;
}

- (KCSharingGroupInvite)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroupInvite *v5;
  id v6;
  uint64_t v7;
  NSString *groupID;
  id v9;
  uint64_t v10;
  NSURL *shareURL;
  id v12;
  uint64_t v13;
  NSString *senderHandle;
  id v15;
  uint64_t v16;
  NSString *inviteeHandle;
  id v18;
  uint64_t v19;
  NSData *inviteToken;
  id v21;
  uint64_t v22;
  NSDate *sentTime;
  id v24;
  uint64_t v25;
  NSString *displayName;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)KCSharingGroupInvite;
  v5 = -[KCSharingGroupInvite init](&v28, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("groupID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("shareURL"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("senderHandle"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    senderHandle = v5->_senderHandle;
    v5->_senderHandle = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("inviteeHandle"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    inviteeHandle = v5->_inviteeHandle;
    v5->_inviteeHandle = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("inviteToken"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    inviteToken = v5->_inviteToken;
    v5->_inviteToken = (NSData *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("sentTime"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    sentTime = v5->_sentTime;
    v5->_sentTime = (NSDate *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("displayName"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite groupID](self, "groupID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite shareURL](self, "shareURL"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("shareURL"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite senderHandle](self, "senderHandle"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("senderHandle"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite inviteeHandle](self, "inviteeHandle"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("inviteeHandle"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite inviteToken](self, "inviteToken"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("inviteToken"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite sentTime](self, "sentTime"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sentTime"));

  v11 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingGroupInvite displayName](self, "displayName"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("displayName"));

}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSData)inviteToken
{
  return self->_inviteToken;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSString)inviteeHandle
{
  return self->_inviteeHandle;
}

- (NSDate)sentTime
{
  return self->_sentTime;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_sentTime, 0);
  objc_storeStrong((id *)&self->_inviteeHandle, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_inviteToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
