@implementation TUSenderIdentityCapabilitiesState

- (TUSenderIdentityCapabilitiesState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUSenderIdentityCapabilitiesState *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TUCTCapabilitiesState *csCallingCapabilitiesState;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  TUCTCapabilitiesState *voLTECallingCapabilitiesState;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  TUCTCapabilitiesState *wiFiCallingCapabilitiesState;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  TUThumperCTCapabilitiesState *thumperCallingCapabilitiesState;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_senderIdentityUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TUSenderIdentityCapabilitiesState initWithSenderIdentityUUID:](self, "initWithSenderIdentityUUID:", v7);
  if (v8)
  {
    NSStringFromSelector(sel_supportsSimultaneousVoiceAndData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportsSimultaneousVoiceAndData = objc_msgSend(v4, "decodeBoolForKey:", v9);

    v10 = objc_opt_class();
    NSStringFromSelector(sel_csCallingCapabilitiesState);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    csCallingCapabilitiesState = v8->_csCallingCapabilitiesState;
    v8->_csCallingCapabilitiesState = (TUCTCapabilitiesState *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_voLTECallingCapabilitiesState);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    voLTECallingCapabilitiesState = v8->_voLTECallingCapabilitiesState;
    v8->_voLTECallingCapabilitiesState = (TUCTCapabilitiesState *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_wiFiCallingCapabilitiesState);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    wiFiCallingCapabilitiesState = v8->_wiFiCallingCapabilitiesState;
    v8->_wiFiCallingCapabilitiesState = (TUCTCapabilitiesState *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_thumperCallingCapabilitiesState);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    thumperCallingCapabilitiesState = v8->_thumperCallingCapabilitiesState;
    v8->_thumperCallingCapabilitiesState = (TUThumperCTCapabilitiesState *)v24;

  }
  return v8;
}

- (TUSenderIdentityCapabilitiesState)initWithSenderIdentityUUID:(id)a3
{
  id v5;
  TUSenderIdentityCapabilitiesState *v6;
  TUSenderIdentityCapabilitiesState *v7;
  TUCTCapabilitiesState *v8;
  TUCTCapabilitiesState *csCallingCapabilitiesState;
  TUCTCapabilitiesState *v10;
  TUCTCapabilitiesState *voLTECallingCapabilitiesState;
  TUCTCapabilitiesState *v12;
  TUCTCapabilitiesState *wiFiCallingCapabilitiesState;
  TUThumperCTCapabilitiesState *v14;
  TUThumperCTCapabilitiesState *thumperCallingCapabilitiesState;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUSenderIdentityCapabilitiesState;
  v6 = -[TUSenderIdentityCapabilitiesState init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderIdentityUUID, a3);
    v8 = objc_alloc_init(TUCTCapabilitiesState);
    csCallingCapabilitiesState = v7->_csCallingCapabilitiesState;
    v7->_csCallingCapabilitiesState = v8;

    v10 = objc_alloc_init(TUCTCapabilitiesState);
    voLTECallingCapabilitiesState = v7->_voLTECallingCapabilitiesState;
    v7->_voLTECallingCapabilitiesState = v10;

    v12 = objc_alloc_init(TUCTCapabilitiesState);
    wiFiCallingCapabilitiesState = v7->_wiFiCallingCapabilitiesState;
    v7->_wiFiCallingCapabilitiesState = v12;

    v14 = objc_alloc_init(TUThumperCTCapabilitiesState);
    thumperCallingCapabilitiesState = v7->_thumperCallingCapabilitiesState;
    v7->_thumperCallingCapabilitiesState = v14;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[TUSenderIdentityCapabilitiesState senderIdentityUUID](self, "senderIdentityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_senderIdentityUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[TUSenderIdentityCapabilitiesState supportsSimultaneousVoiceAndData](self, "supportsSimultaneousVoiceAndData");
  NSStringFromSelector(sel_supportsSimultaneousVoiceAndData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  -[TUSenderIdentityCapabilitiesState csCallingCapabilitiesState](self, "csCallingCapabilitiesState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_csCallingCapabilitiesState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUSenderIdentityCapabilitiesState voLTECallingCapabilitiesState](self, "voLTECallingCapabilitiesState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_voLTECallingCapabilitiesState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUSenderIdentityCapabilitiesState wiFiCallingCapabilitiesState](self, "wiFiCallingCapabilitiesState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wiFiCallingCapabilitiesState);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUSenderIdentityCapabilitiesState thumperCallingCapabilitiesState](self, "thumperCallingCapabilitiesState");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_thumperCallingCapabilitiesState);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (TUCTCapabilitiesState)wiFiCallingCapabilitiesState
{
  return self->_wiFiCallingCapabilitiesState;
}

- (TUCTCapabilitiesState)voLTECallingCapabilitiesState
{
  return self->_voLTECallingCapabilitiesState;
}

- (TUThumperCTCapabilitiesState)thumperCallingCapabilitiesState
{
  return self->_thumperCallingCapabilitiesState;
}

- (BOOL)supportsSimultaneousVoiceAndData
{
  return self->_supportsSimultaneousVoiceAndData;
}

- (NSUUID)senderIdentityUUID
{
  return self->_senderIdentityUUID;
}

- (TUCTCapabilitiesState)csCallingCapabilitiesState
{
  return self->_csCallingCapabilitiesState;
}

- (NSString)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("CDMA:\n"));
  v4 = -[TUSenderIdentityCapabilitiesState supportsSimultaneousVoiceAndData](self, "supportsSimultaneousVoiceAndData");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsSimultaneousVoiceAndData: %@\n"), v5);
  objc_msgSend(v3, "appendString:", CFSTR("CT Capabilities State:\n"));
  -[TUSenderIdentityCapabilitiesState csCallingCapabilitiesState](self, "csCallingCapabilitiesState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    csCallingCapabilitiesState: %@\n"), v6);

  -[TUSenderIdentityCapabilitiesState voLTECallingCapabilitiesState](self, "voLTECallingCapabilitiesState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    voLTECallingCapabilitiesState: %@\n"), v7);

  -[TUSenderIdentityCapabilitiesState wiFiCallingCapabilitiesState](self, "wiFiCallingCapabilitiesState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    wiFiCallingCapabilitiesState: %@\n"), v8);

  -[TUSenderIdentityCapabilitiesState thumperCallingCapabilitiesState](self, "thumperCallingCapabilitiesState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    thumperCallingCapabilitiesState: %@\n"), v9);

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[TUSenderIdentityCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentityCapabilitiesState csCallingCapabilitiesState](self, "csCallingCapabilitiesState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCsCallingCapabilitiesState:", v7);

  -[TUSenderIdentityCapabilitiesState voLTECallingCapabilitiesState](self, "voLTECallingCapabilitiesState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setVoLTECallingCapabilitiesState:", v9);

  -[TUSenderIdentityCapabilitiesState wiFiCallingCapabilitiesState](self, "wiFiCallingCapabilitiesState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setWiFiCallingCapabilitiesState:", v11);

  -[TUSenderIdentityCapabilitiesState thumperCallingCapabilitiesState](self, "thumperCallingCapabilitiesState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setThumperCallingCapabilitiesState:", v13);

  return v5;
}

- (id)publiclyAccessibleCopy
{
  return -[TUSenderIdentityCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", 0);
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TUSenderIdentityCapabilitiesState senderIdentityUUID](self, "senderIdentityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v7;

  *(_BYTE *)(v5 + 8) = -[TUSenderIdentityCapabilitiesState supportsSimultaneousVoiceAndData](self, "supportsSimultaneousVoiceAndData");
  -[TUSenderIdentityCapabilitiesState csCallingCapabilitiesState](self, "csCallingCapabilitiesState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publiclyAccessibleCopyWithZone:", a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  -[TUSenderIdentityCapabilitiesState voLTECallingCapabilitiesState](self, "voLTECallingCapabilitiesState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publiclyAccessibleCopyWithZone:", a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  -[TUSenderIdentityCapabilitiesState wiFiCallingCapabilitiesState](self, "wiFiCallingCapabilitiesState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "publiclyAccessibleCopyWithZone:", a3);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  -[TUSenderIdentityCapabilitiesState thumperCallingCapabilitiesState](self, "thumperCallingCapabilitiesState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "publiclyAccessibleCopyWithZone:", a3);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  return (id)v5;
}

- (void)setSupportsSimultaneousVoiceAndData:(BOOL)a3
{
  self->_supportsSimultaneousVoiceAndData = a3;
}

- (void)setCsCallingCapabilitiesState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setVoLTECallingCapabilitiesState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setWiFiCallingCapabilitiesState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setThumperCallingCapabilitiesState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumperCallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_wiFiCallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_voLTECallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_csCallingCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_senderIdentityUUID, 0);
}

@end
