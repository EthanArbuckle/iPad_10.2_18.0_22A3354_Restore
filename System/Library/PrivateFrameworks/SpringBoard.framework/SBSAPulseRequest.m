@implementation SBSAPulseRequest

- (SBSAPulseRequest)initWithParticipantIdentifier:(id)a3 pulseStyle:(int64_t)a4
{
  id v6;
  SBSAPulseRequest *v7;
  uint64_t v8;
  NSCopying *participantIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSAPulseRequest;
  v7 = -[SBSAPulseRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    participantIdentifier = v7->_participantIdentifier;
    v7->_participantIdentifier = (NSCopying *)v8;

    v7->_pulseStyle = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t pulseStyle;
  uint64_t v7;
  id v8;
  void *v9;
  NSCopying *participantIdentifier;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pulseStyle = self->_pulseStyle;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __28__SBSAPulseRequest_isEqual___block_invoke;
  v19[3] = &unk_1E8EA3AB0;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "appendInteger:counterpart:", pulseStyle, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  participantIdentifier = self->_participantIdentifier;
  v14 = v7;
  v15 = 3221225472;
  v16 = __28__SBSAPulseRequest_isEqual___block_invoke_2;
  v17 = &unk_1E8EA4320;
  v18 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendObject:counterpart:", participantIdentifier, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v12, "isEqual", v14, v15, v16, v17);

  return v7;
}

uint64_t __28__SBSAPulseRequest_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pulseStyle");
}

uint64_t __28__SBSAPulseRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "participantIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendInteger:", self->_pulseStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_participantIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; participantIdentifier: %@>"),
                       objc_opt_class(),
                       self,
                       self->_participantIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParticipantIdentifier:", self->_participantIdentifier);
}

- (NSCopying)participantIdentifier
{
  return self->_participantIdentifier;
}

- (int64_t)pulseStyle
{
  return self->_pulseStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
}

@end
