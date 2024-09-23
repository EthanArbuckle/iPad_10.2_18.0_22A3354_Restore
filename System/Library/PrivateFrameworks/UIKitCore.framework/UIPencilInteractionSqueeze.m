@implementation UIPencilInteractionSqueeze

- (uint64_t)_initWithTimestamp:(void *)a3 eventPhase:(double)a4 normalizedForceVelocity:(double)a5 hoverPose:
{
  id *v9;
  id *v10;
  uint64_t result;
  objc_super v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)UIPencilInteractionSqueeze;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (!v9)
    return (uint64_t)v10;
  *((double *)v9 + 2) = a4;
  if ((unint64_t)(a2 - 1) < 4)
  {
    v9[3] = (id)(a2 - 1);
    *((double *)v9 + 1) = a5;
    objc_storeStrong(v9 + 4, a3);
    return (uint64_t)v10;
  }
  v13 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v14 = 134217984;
  v15 = a2;
  _os_log_send_and_compose_impl();
  result = _os_crash_msg();
  __break(1u);
  return result;
}

- (UIPencilInteractionSqueeze)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPencilInteraction.m"), 526, CFSTR("%s: init is not allowed on %@"), "-[UIPencilInteractionSqueeze init]", objc_opt_class());

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[UIPencilInteractionSqueeze debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIPencilInteractionSqueeze succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t phase;
  const __CFString *v6;
  id v7;
  UIPencilHoverPose *hoverPose;
  __CFString *v9;
  id v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  phase = self->_phase;
  if (phase > 3)
    v6 = &stru_1E16EDF20;
  else
    v6 = off_1E16DFB70[phase];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("phase"));
  if (os_variant_has_internal_diagnostics())
    v12 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForceVelocity"), 1, self->_normalizedForceVelocity);
  hoverPose = self->_hoverPose;
  if (hoverPose)
  {
    -[UIPencilHoverPose succinctDescription](hoverPose, "succinctDescription");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("hoverPose"));

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilInteractionSqueeze descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIPencilInteractionSqueeze descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  UIPencilInteractionSqueeze *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

void __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

id __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  const __CFString *v6;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  if (v3 > 3)
    v4 = &stru_1E16EDF20;
  else
    v4 = off_1E16DFB70[v3];
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("phase"));
  if (os_variant_has_internal_diagnostics())
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForceVelocity"), 1, *(double *)(*(_QWORD *)(a1 + 40) + 8));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
    v6 = *(const __CFString **)(*(_QWORD *)(a1 + 40) + 32);
  else
    v6 = CFSTR("(nil)");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v6, CFSTR("hoverPose"));
}

- (double)_normalizedForceVelocity
{
  return self->_normalizedForceVelocity;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)phase
{
  return self->_phase;
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
