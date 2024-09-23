@implementation TUJoinContinuityConversationRequest

+ (id)requestForStagingAreaWithUUID:(id)a3
{
  id v3;
  TUJoinContinuityConversationRequest *v4;

  v3 = a3;
  v4 = -[TUJoinContinuityConversationRequest initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:]([TUJoinContinuityConversationRequest alloc], "initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:", v3, 1, 1, 1);

  return v4;
}

+ (id)requestForJoinWithUUID:(id)a3 isAudioEnabled:(BOOL)a4 isVideoEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  TUJoinContinuityConversationRequest *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[TUJoinContinuityConversationRequest initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:]([TUJoinContinuityConversationRequest alloc], "initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:", v7, v6, v5, 0);

  return v8;
}

- (TUJoinContinuityConversationRequest)initWithUUID:(id)a3 isAudioEnabled:(BOOL)a4 isVideoEnabled:(BOOL)a5 wantsStagingArea:(BOOL)a6
{
  id v10;
  TUJoinContinuityConversationRequest *v11;
  uint64_t v12;
  NSUUID *uuid;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUJoinContinuityConversationRequest;
  v11 = -[TUJoinContinuityConversationRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    v11->_isAudioEnabled = a4;
    v11->_isVideoEnabled = a5;
    v11->_wantsStagingArea = a6;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" uuid=%@"), self->_uuid);
  objc_msgSend(v6, "appendFormat:", CFSTR(" isAudioEnabled=%d"), self->_isAudioEnabled);
  objc_msgSend(v6, "appendFormat:", CFSTR(" isVideoEnabled=%d"), self->_isVideoEnabled);
  objc_msgSend(v6, "appendFormat:", CFSTR(" wantsStagingArea=%d"), self->_wantsStagingArea);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUJoinContinuityConversationRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  TUJoinContinuityConversationRequest *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isAudioEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", v8);
  NSStringFromSelector(sel_isVideoEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeBoolForKey:", v10);
  NSStringFromSelector(sel_wantsStagingArea);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "decodeBoolForKey:", v12);

  v14 = -[TUJoinContinuityConversationRequest initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:](self, "initWithUUID:isAudioEnabled:isVideoEnabled:wantsStagingArea:", v7, v9, v11, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;
  void *v6;
  _BOOL8 isAudioEnabled;
  void *v8;
  _BOOL8 isVideoEnabled;
  void *v10;
  _BOOL8 wantsStagingArea;
  id v12;

  uuid = self->_uuid;
  v5 = a3;
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v6);

  isAudioEnabled = self->_isAudioEnabled;
  NSStringFromSelector(sel_isAudioEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isAudioEnabled, v8);

  isVideoEnabled = self->_isVideoEnabled;
  NSStringFromSelector(sel_isVideoEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", isVideoEnabled, v10);

  wantsStagingArea = self->_wantsStagingArea;
  NSStringFromSelector(sel_wantsStagingArea);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", wantsStagingArea, v12);

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isAudioEnabled
{
  return self->_isAudioEnabled;
}

- (BOOL)isVideoEnabled
{
  return self->_isVideoEnabled;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
