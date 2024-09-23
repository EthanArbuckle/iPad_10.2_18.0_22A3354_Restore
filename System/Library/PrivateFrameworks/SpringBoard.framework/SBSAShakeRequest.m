@implementation SBSAShakeRequest

- (SBSAShakeRequest)initWithParticipantIdentifier:(id)a3
{
  id v4;
  SBSAShakeRequest *v5;
  uint64_t v6;
  id participantIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAShakeRequest;
  v5 = -[SBSAShakeRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    participantIdentifier = v5->_participantIdentifier;
    v5->_participantIdentifier = (id)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id participantIdentifier;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  participantIdentifier = self->_participantIdentifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __28__SBSAShakeRequest_isEqual___block_invoke;
  v11[3] = &unk_1E8EA4320;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v5, "appendObject:counterpart:", participantIdentifier, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual");

  return v9;
}

uint64_t __28__SBSAShakeRequest_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "participantIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_participantIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
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

- (id)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_participantIdentifier, 0);
}

@end
