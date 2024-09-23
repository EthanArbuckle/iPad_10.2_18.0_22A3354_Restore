@implementation UIPencilInteractionTap

- (id)_initWithTimestamp:(double)a3 hoverPose:
{
  id *v5;
  id *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)UIPencilInteractionTap;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    *((double *)v5 + 1) = a3;
    objc_storeStrong(v5 + 2, a2);
  }
  return v6;
}

- (UIPencilInteractionTap)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPencilInteraction.m"), 413, CFSTR("%s: init is not allowed on %@"), "-[UIPencilInteractionTap init]", objc_opt_class());

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[UIPencilInteractionTap debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIPencilInteractionTap succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  UIPencilHoverPose *hoverPose;
  __CFString *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  hoverPose = self->_hoverPose;
  if (hoverPose)
  {
    -[UIPencilHoverPose succinctDescription](hoverPose, "succinctDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("(nil)");
  }
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("hoverPose"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilInteractionTap descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilInteractionTap descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  UIPencilInteractionTap *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

void __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

id __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(const __CFString **)(v2 + 16);
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("(nil)");
  return (id)objc_msgSend(v1, "appendObject:withName:", v4, CFSTR("hoverPose"));
}

- (double)timestamp
{
  return self->_timestamp;
}

- (UIPencilHoverPose)hoverPose
{
  return self->_hoverPose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverPose, 0);
}

@end
