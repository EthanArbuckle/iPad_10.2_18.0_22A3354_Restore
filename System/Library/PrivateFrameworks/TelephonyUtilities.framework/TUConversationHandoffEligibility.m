@implementation TUConversationHandoffEligibility

- (TUConversationHandoffEligibility)initWithHandoffEligibility:(id)a3
{
  id v4;
  TUConversationHandoffEligibility *v5;
  uint64_t v6;
  NSUUID *conversationGroupUUID;
  uint64_t v8;
  TUConversationParticipantAssociation *association;
  uint64_t v10;
  NSString *originatingDeviceType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUConversationHandoffEligibility;
  v5 = -[TUConversationHandoffEligibility init](&v13, sel_init);
  if (v5)
  {
    v5->_eligible = objc_msgSend(v4, "isEligible");
    v5->_uplinkMuted = objc_msgSend(v4, "isUplinkMuted");
    v5->_sendingVideo = objc_msgSend(v4, "isSendingVideo");
    objc_msgSend(v4, "conversationGroupUUID");
    v6 = objc_claimAutoreleasedReturnValue();
    conversationGroupUUID = v5->_conversationGroupUUID;
    v5->_conversationGroupUUID = (NSUUID *)v6;

    objc_msgSend(v4, "association");
    v8 = objc_claimAutoreleasedReturnValue();
    association = v5->_association;
    v5->_association = (TUConversationParticipantAssociation *)v8;

    objc_msgSend(v4, "originatingDeviceType");
    v10 = objc_claimAutoreleasedReturnValue();
    originatingDeviceType = v5->_originatingDeviceType;
    v5->_originatingDeviceType = (NSString *)v10;

  }
  return v5;
}

- (NSString)localizedDeviceCategory
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;

  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsString:", CFSTR("com.apple.iphone")))
  {

LABEL_4:
    TUBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("IPHONE");
    goto LABEL_9;
  }
  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("com.apple.homebuttonless-iphone"));

  if (v5)
    goto LABEL_4;
  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsString:", CFSTR("com.apple.ipad")))
  {

LABEL_8:
    TUBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("IPAD");
    goto LABEL_9;
  }
  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsString:", CFSTR("com.apple.homebuttonless-ipad"));

  if (v11)
    goto LABEL_8;
  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsString:", CFSTR("com.apple.ipod"));

  if (v15)
  {
    TUBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("IPOD");
  }
  else
  {
    -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsString:", CFSTR("com.apple.mac"));

    if (v17)
    {
      TUBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("MAC");
    }
    else
    {
      -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsString:", CFSTR("com.apple.visionpro"));

      if (!v19)
      {
        v12 = 0;
        return (NSString *)v12;
      }
      TUBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("VISIONPRO");
    }
  }
LABEL_9:
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationHandoffEligibility)initWithCoder:(id)a3
{
  id v4;
  TUConversationHandoffEligibility *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUUID *conversationGroupUUID;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  TUConversationParticipantAssociation *association;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *originatingDeviceType;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TUConversationHandoffEligibility;
  v5 = -[TUConversationHandoffEligibility init](&v22, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_isEligible);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eligible = objc_msgSend(v4, "decodeBoolForKey:", v6);

    NSStringFromSelector(sel_isUplinkMuted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uplinkMuted = objc_msgSend(v4, "decodeBoolForKey:", v7);

    NSStringFromSelector(sel_isSendingVideo);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sendingVideo = objc_msgSend(v4, "decodeBoolForKey:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_conversationGroupUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    conversationGroupUUID = v5->_conversationGroupUUID;
    v5->_conversationGroupUUID = (NSUUID *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_association);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    association = v5->_association;
    v5->_association = (TUConversationParticipantAssociation *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_originatingDeviceType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    originatingDeviceType = v5->_originatingDeviceType;
    v5->_originatingDeviceType = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = -[TUConversationHandoffEligibility isEligible](self, "isEligible");
  NSStringFromSelector(sel_isEligible);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  v7 = -[TUConversationHandoffEligibility isUplinkMuted](self, "isUplinkMuted");
  NSStringFromSelector(sel_isUplinkMuted);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[TUConversationHandoffEligibility isSendingVideo](self, "isSendingVideo");
  NSStringFromSelector(sel_isSendingVideo);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  -[TUConversationHandoffEligibility conversationGroupUUID](self, "conversationGroupUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_conversationGroupUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationHandoffEligibility association](self, "association");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_association);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_originatingDeviceType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationHandoffEligibility initWithHandoffEligibility:](+[TUConversationHandoffEligibility allocWithZone:](TUConversationHandoffEligibility, "allocWithZone:", a3), "initWithHandoffEligibility:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" isEligible=%d"), -[TUConversationHandoffEligibility isEligible](self, "isEligible"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isUplinkMuted=%d"), -[TUConversationHandoffEligibility isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isSendingVideo=%d"), -[TUConversationHandoffEligibility isSendingVideo](self, "isSendingVideo"));
  -[TUConversationHandoffEligibility conversationGroupUUID](self, "conversationGroupUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" conversationGroupUUID=%@"), v4);

  -[TUConversationHandoffEligibility association](self, "association");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" association=%@"), v5);

  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" originatingDeviceType=%@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = 1231;
  if (-[TUConversationHandoffEligibility isEligible](self, "isEligible"))
    v4 = 1231;
  else
    v4 = 1237;
  if (-[TUConversationHandoffEligibility isUplinkMuted](self, "isUplinkMuted"))
    v5 = 1231;
  else
    v5 = 1237;
  v6 = v5 ^ v4;
  if (!-[TUConversationHandoffEligibility isSendingVideo](self, "isSendingVideo"))
    v3 = 1237;
  -[TUConversationHandoffEligibility conversationGroupUUID](self, "conversationGroupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v3 ^ objc_msgSend(v7, "hash");
  -[TUConversationHandoffEligibility association](self, "association");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationHandoffEligibility *v4;
  BOOL v5;

  v4 = (TUConversationHandoffEligibility *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationHandoffEligibility isEqualToHandoffEligibility:](self, "isEqualToHandoffEligibility:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHandoffEligibility:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = -[TUConversationHandoffEligibility isEligible](self, "isEligible");
  if (v5 == objc_msgSend(v4, "isEligible")
    && (v6 = -[TUConversationHandoffEligibility isUplinkMuted](self, "isUplinkMuted"),
        v6 == objc_msgSend(v4, "isUplinkMuted"))
    && (v7 = -[TUConversationHandoffEligibility isSendingVideo](self, "isSendingVideo"),
        v7 == objc_msgSend(v4, "isSendingVideo")))
  {
    -[TUConversationHandoffEligibility conversationGroupUUID](self, "conversationGroupUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationGroupUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      -[TUConversationHandoffEligibility association](self, "association");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "association");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v13))
      {
        -[TUConversationHandoffEligibility originatingDeviceType](self, "originatingDeviceType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "originatingDeviceType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = TUObjectsAreEqualOrNil((unint64_t)v14, (uint64_t)v15);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (void)setEligible:(BOOL)a3
{
  self->_eligible = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (void)setSendingVideo:(BOOL)a3
{
  self->_sendingVideo = a3;
}

- (NSUUID)conversationGroupUUID
{
  return self->_conversationGroupUUID;
}

- (void)setConversationGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationGroupUUID, a3);
}

- (TUConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
  objc_storeStrong((id *)&self->_association, a3);
}

- (NSString)originatingDeviceType
{
  return self->_originatingDeviceType;
}

- (void)setOriginatingDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_originatingDeviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDeviceType, 0);
  objc_storeStrong((id *)&self->_association, 0);
  objc_storeStrong((id *)&self->_conversationGroupUUID, 0);
}

@end
