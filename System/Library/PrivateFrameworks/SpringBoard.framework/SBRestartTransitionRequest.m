@implementation SBRestartTransitionRequest

- (SBRestartTransitionRequest)init
{
  return -[SBRestartTransitionRequest initWithRequester:reason:](self, "initWithRequester:reason:", 0, 0);
}

- (SBRestartTransitionRequest)initWithRequester:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SBRestartTransitionRequest *v10;
  uint64_t v11;
  NSString *requester;
  uint64_t v13;
  NSString *reason;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartTransitionRequest.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requester"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartTransitionRequest.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBRestartTransitionRequest;
  v10 = -[SBRestartTransitionRequest init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    requester = v10->_requester;
    v10->_requester = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v13;

  }
  return v10;
}

- (void)setWantsPersistentSnapshot:(BOOL)a3
{
  BKSDisplayRenderOverlayDescriptor *customOverlayDescriptor;

  if (self->_wantsPersistentSnapshot != a3)
  {
    self->_wantsPersistentSnapshot = a3;
    if (a3)
    {
      customOverlayDescriptor = self->_customOverlayDescriptor;
      self->_customOverlayDescriptor = 0;

    }
  }
}

- (void)setCustomOverlayDescriptor:(id)a3
{
  BKSDisplayRenderOverlayDescriptor *v5;
  BKSDisplayRenderOverlayDescriptor *v6;

  v5 = (BKSDisplayRenderOverlayDescriptor *)a3;
  if (self->_customOverlayDescriptor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customOverlayDescriptor, a3);
    v5 = v6;
    self->_wantsPersistentSnapshot = 0;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  SBRestartTransitionRequest *v4;

  v4 = -[SBRestartTransitionRequest initWithRequester:reason:]([SBRestartTransitionRequest alloc], "initWithRequester:reason:", self->_requester, self->_reason);
  v4->_restartType = self->_restartType;
  v4->_delay = self->_delay;
  v4->_wantsPersistentSnapshot = self->_wantsPersistentSnapshot;
  objc_storeStrong((id *)&v4->_customOverlayDescriptor, self->_customOverlayDescriptor);
  objc_storeStrong((id *)&v4->_applicationLaunchURL, self->_applicationLaunchURL);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBRestartTransitionRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBRestartTransitionRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_requester, CFSTR("requester"));
  objc_msgSend(v3, "appendString:withName:", self->_reason, CFSTR("reason"));
  NSStringFromSBRestartType(self->_restartType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("restartType"));

  if (self->_delay > 0.0)
    v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("delay"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBRestartTransitionRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  SBRestartTransitionRequest *v10;

  v4 = a3;
  -[SBRestartTransitionRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_wantsPersistentSnapshot || self->_applicationLaunchURL || self->_customOverlayDescriptor)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__SBRestartTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E8E9E820;
    v9 = v5;
    v10 = self;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  }
  return v6;
}

id __68__SBRestartTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("wantsPersistentSnapshot"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("applicationLaunchURL"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("customOverlayLDescriptor"), 1);
}

- (NSString)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)restartType
{
  return self->_restartType;
}

- (void)setRestartType:(int)a3
{
  self->_restartType = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)wantsPersistentSnapshot
{
  return self->_wantsPersistentSnapshot;
}

- (BKSDisplayRenderOverlayDescriptor)customOverlayDescriptor
{
  return self->_customOverlayDescriptor;
}

- (NSURL)applicationLaunchURL
{
  return self->_applicationLaunchURL;
}

- (void)setApplicationLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationLaunchURL, 0);
  objc_storeStrong((id *)&self->_customOverlayDescriptor, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_requester, 0);
}

@end
