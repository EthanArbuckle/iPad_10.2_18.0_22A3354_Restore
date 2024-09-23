@implementation TUConversationParticipant

- (TUConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 senderCorrelationIdentifier:(id)a5
{
  id v9;
  id v10;
  TUConversationParticipant *v11;
  TUConversationParticipant *v12;
  TUConversationParticipantCapabilities *v13;
  TUConversationParticipantCapabilities *capabilities;
  uint64_t v15;
  NSString *senderCorrelationIdentifier;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationParticipant;
  v11 = -[TUConversationParticipant init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_identifier = a3;
    objc_storeStrong((id *)&v11->_handle, a4);
    v13 = objc_alloc_init(TUConversationParticipantCapabilities);
    capabilities = v12->_capabilities;
    v12->_capabilities = v13;

    v15 = objc_msgSend(v10, "copy");
    senderCorrelationIdentifier = v12->_senderCorrelationIdentifier;
    v12->_senderCorrelationIdentifier = (NSString *)v15;

  }
  return v12;
}

- (TUConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4
{
  return -[TUConversationParticipant initWithIdentifier:handle:senderCorrelationIdentifier:](self, "initWithIdentifier:handle:senderCorrelationIdentifier:", a3, a4, 0);
}

- (TUConversationParticipant)initWithConversationParticipant:(id)a3
{
  id v4;
  TUConversationParticipant *v5;
  TUConversationParticipant *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationParticipant;
  v5 = -[TUConversationParticipant init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_activeIDSDestination, *((id *)v4 + 13));
    v6->_audioEnabled = *((_BYTE *)v4 + 9);
    v6->_audioPriority = *((_QWORD *)v4 + 10);
    objc_storeStrong((id *)&v6->_avcIdentifier, *((id *)v4 + 12));
    objc_storeStrong((id *)&v6->_capabilities, *((id *)v4 + 6));
    objc_storeStrong((id *)&v6->_handle, *((id *)v4 + 4));
    v6->_identifier = *((_QWORD *)v4 + 3);
    v6->_muted = *((_BYTE *)v4 + 8);
    v6->_screenEnabled = *((_BYTE *)v4 + 11);
    v6->_screenToken = *((_QWORD *)v4 + 8);
    v6->_streamToken = *((_QWORD *)v4 + 7);
    v6->_captionsToken = *((_QWORD *)v4 + 9);
    v6->_videoEnabled = *((_BYTE *)v4 + 10);
    v6->_videoPriority = *((_QWORD *)v4 + 11);
    v6->_audioPaused = *((_BYTE *)v4 + 12);
    v6->_localAccountHandle = *((_BYTE *)v4 + 14);
    v6->_audioVideoMode = *((_QWORD *)v4 + 5);
    objc_storeStrong((id *)&v6->_association, *((id *)v4 + 14));
    v6->_lightweight = *((_BYTE *)v4 + 13);
    v6->_guestModeEnabled = *((_BYTE *)v4 + 15);
    v6->_spatialPersonaEnabled = *((_BYTE *)v4 + 16);
    v6->_cameraMixedWithScreen = *((_BYTE *)v4 + 17);
    objc_storeStrong((id *)&v6->_senderCorrelationIdentifier, *((id *)v4 + 15));
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipant)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  TUConversationParticipant *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *activeIDSDestination;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *avcIdentifier;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  TUConversationParticipantCapabilities *capabilities;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  TUConversationParticipantAssociation *association;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSString *senderCorrelationIdentifier;

  v4 = a3;
  NSStringFromSelector(sel_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  v7 = objc_opt_class();
  NSStringFromSelector(sel_handle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TUConversationParticipant initWithIdentifier:handle:](self, "initWithIdentifier:handle:", v6, v9);
  if (v10)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_activeIDSDestination);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    activeIDSDestination = v10->_activeIDSDestination;
    v10->_activeIDSDestination = (NSString *)v13;

    NSStringFromSelector(sel_isAudioEnabled);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_audioEnabled = objc_msgSend(v4, "decodeBoolForKey:", v15);

    NSStringFromSelector(sel_audioPriority);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_audioPriority = objc_msgSend(v4, "decodeIntegerForKey:", v16);

    v17 = objc_opt_class();
    NSStringFromSelector(sel_avcIdentifier);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    avcIdentifier = v10->_avcIdentifier;
    v10->_avcIdentifier = (NSString *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_capabilities);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    capabilities = v10->_capabilities;
    v10->_capabilities = (TUConversationParticipantCapabilities *)v23;

    NSStringFromSelector(sel_isMuted);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_muted = objc_msgSend(v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_isScreenEnabled);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_screenEnabled = objc_msgSend(v4, "decodeBoolForKey:", v26);

    NSStringFromSelector(sel_screenToken);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_screenToken = objc_msgSend(v4, "decodeIntegerForKey:", v27);

    NSStringFromSelector(sel_streamToken);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_streamToken = objc_msgSend(v4, "decodeIntegerForKey:", v28);

    NSStringFromSelector(sel_captionsToken);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_captionsToken = objc_msgSend(v4, "decodeIntegerForKey:", v29);

    NSStringFromSelector(sel_isVideoEnabled);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_videoEnabled = objc_msgSend(v4, "decodeBoolForKey:", v30);

    NSStringFromSelector(sel_videoPriority);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_videoPriority = objc_msgSend(v4, "decodeIntegerForKey:", v31);

    NSStringFromSelector(sel_isAudioPaused);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_audioPaused = objc_msgSend(v4, "decodeBoolForKey:", v32);

    NSStringFromSelector(sel_isLocalAccountHandle);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_localAccountHandle = objc_msgSend(v4, "decodeBoolForKey:", v33);

    NSStringFromSelector(sel_audioVideoMode);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_audioVideoMode = objc_msgSend(v4, "decodeIntegerForKey:", v34);

    v35 = objc_opt_class();
    NSStringFromSelector(sel_association);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    association = v10->_association;
    v10->_association = (TUConversationParticipantAssociation *)v37;

    NSStringFromSelector(sel_isLightweight);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_lightweight = objc_msgSend(v4, "decodeBoolForKey:", v39);

    NSStringFromSelector(sel_isGuestModeEnabled);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_guestModeEnabled = objc_msgSend(v4, "decodeBoolForKey:", v40);

    NSStringFromSelector(sel_isSpatialPersonaEnabled);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_spatialPersonaEnabled = objc_msgSend(v4, "decodeBoolForKey:", v41);

    NSStringFromSelector(sel_isCameraMixedWithScreen);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_cameraMixedWithScreen = objc_msgSend(v4, "decodeBoolForKey:", v42);

    v43 = objc_opt_class();
    NSStringFromSelector(sel_senderCorrelationIdentifier);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    senderCorrelationIdentifier = v10->_senderCorrelationIdentifier;
    v10->_senderCorrelationIdentifier = (NSString *)v45;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  int64_t v23;
  void *v24;
  int64_t v25;
  void *v26;
  int64_t v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  int64_t v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  _BOOL8 v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  id v50;

  v4 = a3;
  -[TUConversationParticipant activeIDSDestination](self, "activeIDSDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeIDSDestination);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[TUConversationParticipant isAudioEnabled](self, "isAudioEnabled");
  NSStringFromSelector(sel_isAudioEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[TUConversationParticipant audioPriority](self, "audioPriority");
  NSStringFromSelector(sel_audioPriority);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[TUConversationParticipant avcIdentifier](self, "avcIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avcIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUConversationParticipant capabilities](self, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_capabilities);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUConversationParticipant handle](self, "handle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[TUConversationParticipant identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v17, v18);

  v19 = -[TUConversationParticipant isMuted](self, "isMuted");
  NSStringFromSelector(sel_isMuted);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[TUConversationParticipant isScreenEnabled](self, "isScreenEnabled");
  NSStringFromSelector(sel_isScreenEnabled);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[TUConversationParticipant screenToken](self, "screenToken");
  NSStringFromSelector(sel_screenToken);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v23, v24);

  v25 = -[TUConversationParticipant streamToken](self, "streamToken");
  NSStringFromSelector(sel_streamToken);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v25, v26);

  v27 = -[TUConversationParticipant captionsToken](self, "captionsToken");
  NSStringFromSelector(sel_captionsToken);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v27, v28);

  v29 = -[TUConversationParticipant isVideoEnabled](self, "isVideoEnabled");
  NSStringFromSelector(sel_isVideoEnabled);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v29, v30);

  v31 = -[TUConversationParticipant videoPriority](self, "videoPriority");
  NSStringFromSelector(sel_videoPriority);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v31, v32);

  v33 = -[TUConversationParticipant isAudioPaused](self, "isAudioPaused");
  NSStringFromSelector(sel_isAudioPaused);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

  v35 = -[TUConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle");
  NSStringFromSelector(sel_isLocalAccountHandle);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v35, v36);

  v37 = -[TUConversationParticipant audioVideoMode](self, "audioVideoMode");
  NSStringFromSelector(sel_audioVideoMode);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v37, v38);

  -[TUConversationParticipant association](self, "association");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_association);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, v40);

  v41 = -[TUConversationParticipant isLightweight](self, "isLightweight");
  NSStringFromSelector(sel_isLightweight);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v41, v42);

  v43 = -[TUConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled");
  NSStringFromSelector(sel_isGuestModeEnabled);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v43, v44);

  v45 = -[TUConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled");
  NSStringFromSelector(sel_isSpatialPersonaEnabled);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v45, v46);

  v47 = -[TUConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen");
  NSStringFromSelector(sel_isCameraMixedWithScreen);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v47, v48);

  -[TUConversationParticipant senderCorrelationIdentifier](self, "senderCorrelationIdentifier");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_senderCorrelationIdentifier);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, v49);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationParticipant initWithConversationParticipant:](+[TUConversationParticipant allocWithZone:](TUConversationParticipant, "allocWithZone:", a3), "initWithConversationParticipant:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUConversationParticipant initWithConversationParticipant:](+[TUMutableConversationParticipant allocWithZone:](TUMutableConversationParticipant, "allocWithZone:", a3), "initWithConversationParticipant:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier=%lu"), -[TUConversationParticipant identifier](self, "identifier"));
  -[TUConversationParticipant handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handle=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" muted=%d"), -[TUConversationParticipant isMuted](self, "isMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioEnabled=%d"), -[TUConversationParticipant isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" videoEnabled=%d"), -[TUConversationParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenEnabled=%d"), -[TUConversationParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamToken=%ld"), -[TUConversationParticipant streamToken](self, "streamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenToken=%ld"), -[TUConversationParticipant screenToken](self, "screenToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" captionsToken=%ld"), -[TUConversationParticipant captionsToken](self, "captionsToken"));
  -[TUConversationParticipant capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" capabilities=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" audioPaused=%d"), -[TUConversationParticipant isAudioPaused](self, "isAudioPaused"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isLightweight=%d"), -[TUConversationParticipant isLightweight](self, "isLightweight"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isLocalAccountHandle=%d"), -[TUConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"));
  -[TUConversationParticipant association](self, "association");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversationParticipant association](self, "association");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" association=%@"), v7);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" isGuestModeEnabled=%d"), -[TUConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" avMode=%ld"), -[TUConversationParticipant audioVideoMode](self, "audioVideoMode"));
  -[TUConversationParticipant senderCorrelationIdentifier](self, "senderCorrelationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUConversationParticipant senderCorrelationIdentifier](self, "senderCorrelationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" senderCorrelationIdentifier=%@"), v9);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioPriority=%ld"), -[TUConversationParticipant audioPriority](self, "audioPriority"));
  if (-[TUConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isSpatialPersonaEnabled=%d"), -[TUConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  if (-[TUConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isCameraMixedWithScreen=%d"), -[TUConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;

  -[TUConversationParticipant activeIDSDestination](self, "activeIDSDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  if (-[TUConversationParticipant isAudioEnabled](self, "isAudioEnabled"))
    v5 = 1231;
  else
    v5 = 1237;
  -[TUConversationParticipant avcIdentifier](self, "avcIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v4 ^ objc_msgSend(v6, "hash");
  -[TUConversationParticipant capabilities](self, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[TUConversationParticipant handle](self, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v7 ^ v11 ^ -[TUConversationParticipant identifier](self, "identifier");
  if (-[TUConversationParticipant isMuted](self, "isMuted"))
    v13 = 1231;
  else
    v13 = 1237;
  if (-[TUConversationParticipant isScreenEnabled](self, "isScreenEnabled"))
    v14 = 1231;
  else
    v14 = 1237;
  v15 = v12 ^ v13 ^ v14 ^ -[TUConversationParticipant screenToken](self, "screenToken");
  v16 = -[TUConversationParticipant streamToken](self, "streamToken");
  v17 = v16 ^ -[TUConversationParticipant captionsToken](self, "captionsToken");
  if (-[TUConversationParticipant isVideoEnabled](self, "isVideoEnabled"))
    v18 = 1231;
  else
    v18 = 1237;
  v19 = v17 ^ v18;
  if (-[TUConversationParticipant isAudioPaused](self, "isAudioPaused"))
    v20 = 1231;
  else
    v20 = 1237;
  v21 = v19 ^ v20;
  if (-[TUConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"))
    v22 = 1231;
  else
    v22 = 1237;
  v23 = v15 ^ v21 ^ v22;
  if (-[TUConversationParticipant isLightweight](self, "isLightweight"))
    v24 = 1231;
  else
    v24 = 1237;
  -[TUConversationParticipant association](self, "association");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash");
  if (-[TUConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"))
    v27 = 1231;
  else
    v27 = 1237;
  v28 = v26 ^ v27 ^ -[TUConversationParticipant audioVideoMode](self, "audioVideoMode");
  if (-[TUConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"))
    v29 = 1231;
  else
    v29 = 1237;
  v30 = v23 ^ v28 ^ v29;
  if (-[TUConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"))
    v31 = 1231;
  else
    v31 = 1237;
  v32 = v30 ^ v31;

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationParticipant *v4;
  BOOL v5;

  v4 = (TUConversationParticipant *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationParticipant isEqualToParticipant:](self, "isEqualToParticipant:", v4);
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int v21;
  int v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  void *v31;
  int v32;
  unint64_t v33;
  int v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v7 = a3;
  -[TUConversationParticipant activeIDSDestination](self, "activeIDSDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeIDSDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    -[TUConversationParticipant activeIDSDestination](self, "activeIDSDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeIDSDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v4))
    {
      LOBYTE(v10) = 0;
LABEL_32:

      goto LABEL_33;
    }
  }
  v11 = -[TUConversationParticipant isAudioEnabled](self, "isAudioEnabled");
  if (v11 != objc_msgSend(v7, "isAudioEnabled"))
  {
    LOBYTE(v10) = 0;
    goto LABEL_31;
  }
  -[TUConversationParticipant avcIdentifier](self, "avcIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avcIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v42 = v12;
  }
  else
  {
    -[TUConversationParticipant avcIdentifier](self, "avcIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avcIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", v14))
    {
      LOBYTE(v10) = 0;
LABEL_29:

      goto LABEL_30;
    }
    v41 = v14;
    v42 = v12;
  }
  -[TUConversationParticipant capabilities](self, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToCapabilities:", v16))
  {

    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
  v39 = v15;
  v40 = v13;
  v38 = v16;
  -[TUConversationParticipant handle](self, "handle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handle");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToHandle:"))
  {
    LOBYTE(v10) = 0;
LABEL_26:
    v13 = v40;
    goto LABEL_27;
  }
  v37 = v5;
  v20 = -[TUConversationParticipant identifier](self, "identifier");
  v13 = v40;
  if (v20 == objc_msgSend(v7, "identifier"))
  {
    v21 = -[TUConversationParticipant isMuted](self, "isMuted");
    if (v21 == objc_msgSend(v7, "isMuted"))
    {
      v22 = -[TUConversationParticipant isScreenEnabled](self, "isScreenEnabled");
      if (v22 == objc_msgSend(v7, "isScreenEnabled"))
      {
        v23 = -[TUConversationParticipant screenToken](self, "screenToken");
        if (v23 == objc_msgSend(v7, "screenToken"))
        {
          v24 = -[TUConversationParticipant streamToken](self, "streamToken");
          if (v24 == objc_msgSend(v7, "streamToken"))
          {
            v25 = -[TUConversationParticipant captionsToken](self, "captionsToken");
            if (v25 == objc_msgSend(v7, "captionsToken"))
            {
              v26 = -[TUConversationParticipant isVideoEnabled](self, "isVideoEnabled");
              if (v26 == objc_msgSend(v7, "isVideoEnabled"))
              {
                v27 = -[TUConversationParticipant isAudioPaused](self, "isAudioPaused");
                if (v27 == objc_msgSend(v7, "isAudioPaused"))
                {
                  v28 = -[TUConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle");
                  if (v28 == objc_msgSend(v7, "isLocalAccountHandle"))
                  {
                    v29 = -[TUConversationParticipant isLightweight](self, "isLightweight");
                    if (v29 == objc_msgSend(v7, "isLightweight"))
                    {
                      -[TUConversationParticipant association](self, "association");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "association");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if (TUObjectsAreEqualOrNil((unint64_t)v31, (uint64_t)v36)
                        && (v32 = -[TUConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"),
                            v32 == objc_msgSend(v7, "isGuestModeEnabled"))
                        && (v33 = -[TUConversationParticipant audioVideoMode](self, "audioVideoMode"),
                            v33 == objc_msgSend(v7, "audioVideoMode"))
                        && (v34 = -[TUConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"),
                            v34 == objc_msgSend(v7, "isSpatialPersonaEnabled")))
                      {
                        v35 = -[TUConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen");
                        v10 = v35 ^ objc_msgSend(v7, "isCameraMixedWithScreen") ^ 1;
                      }
                      else
                      {
                        LOBYTE(v10) = 0;
                      }

                      v5 = v37;
                      goto LABEL_26;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v10) = 0;
  v5 = v37;
LABEL_27:

LABEL_28:
  v14 = v41;
  v12 = v42;
  if (v42 != v13)
    goto LABEL_29;
LABEL_30:

LABEL_31:
  if (v8 != v9)
    goto LABEL_32;
LABEL_33:

  return v10;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (unint64_t)audioVideoMode
{
  return self->_audioVideoMode;
}

- (void)setAudioVideoMode:(unint64_t)a3
{
  self->_audioVideoMode = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (BOOL)isAudioPaused
{
  return self->_audioPaused;
}

- (void)setAudioPaused:(BOOL)a3
{
  self->_audioPaused = a3;
}

- (BOOL)isLightweight
{
  return self->_lightweight;
}

- (void)setLightweight:(BOOL)a3
{
  self->_lightweight = a3;
}

- (TUConversationParticipantCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (int64_t)captionsToken
{
  return self->_captionsToken;
}

- (void)setCaptionsToken:(int64_t)a3
{
  self->_captionsToken = a3;
}

- (int64_t)audioPriority
{
  return self->_audioPriority;
}

- (void)setAudioPriority:(int64_t)a3
{
  self->_audioPriority = a3;
}

- (int64_t)videoPriority
{
  return self->_videoPriority;
}

- (void)setVideoPriority:(int64_t)a3
{
  self->_videoPriority = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)activeIDSDestination
{
  return self->_activeIDSDestination;
}

- (void)setActiveIDSDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isLocalAccountHandle
{
  return self->_localAccountHandle;
}

- (void)setLocalAccountHandle:(BOOL)a3
{
  self->_localAccountHandle = a3;
}

- (TUConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (BOOL)isGuestModeEnabled
{
  return self->_guestModeEnabled;
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  self->_guestModeEnabled = a3;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_association, 0);
  objc_storeStrong((id *)&self->_activeIDSDestination, 0);
  objc_storeStrong((id *)&self->_avcIdentifier, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
