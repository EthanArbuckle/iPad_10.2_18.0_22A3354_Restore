@implementation SBSAElementDescription

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *interfaceElementIdentifier;
  uint64_t v6;
  id v7;
  SAElementIdentifying *associatedSystemApertureElementIdentity;
  id v9;
  uint64_t appearState;
  id v11;
  double sensorObscuringShadowProgress;
  id v13;
  double leadingViewBlurProgress;
  id v15;
  double leadingViewAlpha;
  id v17;
  double leadingViewSquishProgress;
  id v19;
  id v20;
  double trailingViewBlurProgress;
  id v22;
  double trailingViewAlpha;
  id v24;
  double trailingViewSquishProgress;
  id v26;
  id v27;
  double minimalViewBlurProgress;
  id v29;
  double minimalViewAlpha;
  id v31;
  void *v32;
  double minimalViewSquishProgress;
  id v34;
  void *v35;
  id v36;
  void *v37;
  double customContentBlurProgress;
  id v39;
  void *v40;
  double customContentAlpha;
  id v42;
  void *v43;
  double snapshotViewBlurProgress;
  id v45;
  void *v46;
  double snapshotViewAlpha;
  id v48;
  void *v49;
  NSString *snapshotReason;
  id v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __34__SBSAElementDescription_isEqual___block_invoke;
  v108[3] = &unk_1E8EA4320;
  v7 = v4;
  v109 = v7;
  objc_msgSend(v67, "appendObject:counterpart:", interfaceElementIdentifier, v108);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  associatedSystemApertureElementIdentity = self->_associatedSystemApertureElementIdentity;
  v106[0] = v6;
  v106[1] = 3221225472;
  v106[2] = __34__SBSAElementDescription_isEqual___block_invoke_2;
  v106[3] = &unk_1E8EA4320;
  v9 = v7;
  v107 = v9;
  objc_msgSend(v66, "appendObject:counterpart:", associatedSystemApertureElementIdentity, v106);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  appearState = self->_appearState;
  v104[0] = v6;
  v104[1] = 3221225472;
  v104[2] = __34__SBSAElementDescription_isEqual___block_invoke_3;
  v104[3] = &unk_1E8EA3AB0;
  v11 = v9;
  v105 = v11;
  objc_msgSend(v65, "appendInteger:counterpart:", appearState, v104);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  sensorObscuringShadowProgress = self->_sensorObscuringShadowProgress;
  v102[0] = v6;
  v102[1] = 3221225472;
  v102[2] = __34__SBSAElementDescription_isEqual___block_invoke_4;
  v102[3] = &unk_1E8EA8460;
  v13 = v11;
  v103 = v13;
  objc_msgSend(v64, "appendCGFloat:counterpart:", v102, sensorObscuringShadowProgress);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  leadingViewBlurProgress = self->_leadingViewBlurProgress;
  v100[0] = v6;
  v100[1] = 3221225472;
  v100[2] = __34__SBSAElementDescription_isEqual___block_invoke_5;
  v100[3] = &unk_1E8EA8460;
  v15 = v13;
  v101 = v15;
  objc_msgSend(v63, "appendCGFloat:counterpart:", v100, leadingViewBlurProgress);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  leadingViewAlpha = self->_leadingViewAlpha;
  v98[0] = v6;
  v98[1] = 3221225472;
  v98[2] = __34__SBSAElementDescription_isEqual___block_invoke_6;
  v98[3] = &unk_1E8EA8460;
  v17 = v15;
  v99 = v17;
  objc_msgSend(v62, "appendCGFloat:counterpart:", v98, leadingViewAlpha);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  leadingViewSquishProgress = self->_leadingViewSquishProgress;
  v96[0] = v6;
  v96[1] = 3221225472;
  v96[2] = __34__SBSAElementDescription_isEqual___block_invoke_7;
  v96[3] = &unk_1E8EA8460;
  v19 = v17;
  v97 = v19;
  objc_msgSend(v61, "appendCGFloat:counterpart:", v96, leadingViewSquishProgress);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v6;
  v94[1] = 3221225472;
  v94[2] = __34__SBSAElementDescription_isEqual___block_invoke_8;
  v94[3] = &unk_1E8EB5E60;
  v20 = v19;
  v95 = v20;
  objc_msgSend(v60, "appendCGSize:counterpart:", v94, self->_leadingViewScale.width, self->_leadingViewScale.height);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  trailingViewBlurProgress = self->_trailingViewBlurProgress;
  v92[0] = v6;
  v92[1] = 3221225472;
  v92[2] = __34__SBSAElementDescription_isEqual___block_invoke_9;
  v92[3] = &unk_1E8EA8460;
  v22 = v20;
  v93 = v22;
  objc_msgSend(v59, "appendCGFloat:counterpart:", v92, trailingViewBlurProgress);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  trailingViewAlpha = self->_trailingViewAlpha;
  v90[0] = v6;
  v90[1] = 3221225472;
  v90[2] = __34__SBSAElementDescription_isEqual___block_invoke_10;
  v90[3] = &unk_1E8EA8460;
  v24 = v22;
  v91 = v24;
  objc_msgSend(v58, "appendCGFloat:counterpart:", v90, trailingViewAlpha);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  trailingViewSquishProgress = self->_trailingViewSquishProgress;
  v88[0] = v6;
  v88[1] = 3221225472;
  v88[2] = __34__SBSAElementDescription_isEqual___block_invoke_11;
  v88[3] = &unk_1E8EA8460;
  v26 = v24;
  v89 = v26;
  objc_msgSend(v57, "appendCGFloat:counterpart:", v88, trailingViewSquishProgress);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v6;
  v86[1] = 3221225472;
  v86[2] = __34__SBSAElementDescription_isEqual___block_invoke_12;
  v86[3] = &unk_1E8EB5E60;
  v27 = v26;
  v87 = v27;
  objc_msgSend(v56, "appendCGSize:counterpart:", v86, self->_trailingViewScale.width, self->_trailingViewScale.height);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  minimalViewBlurProgress = self->_minimalViewBlurProgress;
  v84[0] = v6;
  v84[1] = 3221225472;
  v84[2] = __34__SBSAElementDescription_isEqual___block_invoke_13;
  v84[3] = &unk_1E8EA8460;
  v29 = v27;
  v85 = v29;
  objc_msgSend(v55, "appendCGFloat:counterpart:", v84, minimalViewBlurProgress);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  minimalViewAlpha = self->_minimalViewAlpha;
  v82[0] = v6;
  v82[1] = 3221225472;
  v82[2] = __34__SBSAElementDescription_isEqual___block_invoke_14;
  v82[3] = &unk_1E8EA8460;
  v31 = v29;
  v83 = v31;
  objc_msgSend(v54, "appendCGFloat:counterpart:", v82, minimalViewAlpha);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  minimalViewSquishProgress = self->_minimalViewSquishProgress;
  v80[0] = v6;
  v80[1] = 3221225472;
  v80[2] = __34__SBSAElementDescription_isEqual___block_invoke_15;
  v80[3] = &unk_1E8EA8460;
  v34 = v31;
  v81 = v34;
  objc_msgSend(v32, "appendCGFloat:counterpart:", v80, minimalViewSquishProgress);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v6;
  v78[1] = 3221225472;
  v78[2] = __34__SBSAElementDescription_isEqual___block_invoke_16;
  v78[3] = &unk_1E8EB5E60;
  v36 = v34;
  v79 = v36;
  objc_msgSend(v35, "appendCGSize:counterpart:", v78, self->_minimalViewScale.width, self->_minimalViewScale.height);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  customContentBlurProgress = self->_customContentBlurProgress;
  v76[0] = v6;
  v76[1] = 3221225472;
  v76[2] = __34__SBSAElementDescription_isEqual___block_invoke_17;
  v76[3] = &unk_1E8EA8460;
  v39 = v36;
  v77 = v39;
  objc_msgSend(v37, "appendCGFloat:counterpart:", v76, customContentBlurProgress);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  customContentAlpha = self->_customContentAlpha;
  v74[0] = v6;
  v74[1] = 3221225472;
  v74[2] = __34__SBSAElementDescription_isEqual___block_invoke_18;
  v74[3] = &unk_1E8EA8460;
  v42 = v39;
  v75 = v42;
  objc_msgSend(v40, "appendCGFloat:counterpart:", v74, customContentAlpha);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotViewBlurProgress = self->_snapshotViewBlurProgress;
  v72[0] = v6;
  v72[1] = 3221225472;
  v72[2] = __34__SBSAElementDescription_isEqual___block_invoke_19;
  v72[3] = &unk_1E8EA8460;
  v45 = v42;
  v73 = v45;
  objc_msgSend(v43, "appendCGFloat:counterpart:", v72, snapshotViewBlurProgress);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotViewAlpha = self->_snapshotViewAlpha;
  v70[0] = v6;
  v70[1] = 3221225472;
  v70[2] = __34__SBSAElementDescription_isEqual___block_invoke_20;
  v70[3] = &unk_1E8EA8460;
  v48 = v45;
  v71 = v48;
  objc_msgSend(v46, "appendCGFloat:counterpart:", v70, snapshotViewAlpha);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotReason = self->_snapshotReason;
  v68[0] = v6;
  v68[1] = 3221225472;
  v68[2] = __34__SBSAElementDescription_isEqual___block_invoke_21;
  v68[3] = &unk_1E8EA89D0;
  v69 = v48;
  v51 = v48;
  objc_msgSend(v49, "appendString:counterpart:", snapshotReason, v68);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(snapshotReason) = objc_msgSend(v52, "isEqual");

  return (char)snapshotReason;
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interfaceElementIdentifier");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "associatedSystemApertureElementIdentity");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appearState");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sensorObscuringShadowProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "leadingViewBlurProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "leadingViewAlpha");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "leadingViewSquishProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "leadingViewScale");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trailingViewBlurProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trailingViewAlpha");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trailingViewSquishProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trailingViewScale");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minimalViewBlurProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minimalViewAlpha");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minimalViewSquishProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minimalViewScale");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "customContentBlurProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "customContentAlpha");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotViewBlurProgress");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotViewAlpha");
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotReason");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendObject:", self->_interfaceElementIdentifier);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendObject:", self->_associatedSystemApertureElementIdentity);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendInteger:", self->_appearState);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendCGFloat:", self->_sensorObscuringShadowProgress);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendCGFloat:", self->_leadingViewBlurProgress);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendCGFloat:", self->_leadingViewAlpha);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendCGFloat:", self->_leadingViewSquishProgress);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendCGSize:", self->_leadingViewScale.width, self->_leadingViewScale.height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendCGFloat:", self->_trailingViewBlurProgress);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendCGFloat:", self->_trailingViewAlpha);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendCGFloat:", self->_trailingViewSquishProgress);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendCGSize:", self->_trailingViewScale.width, self->_trailingViewScale.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGFloat:", self->_minimalViewBlurProgress);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGFloat:", self->_minimalViewAlpha);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGFloat:", self->_minimalViewSquishProgress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCGSize:", self->_minimalViewScale.width, self->_minimalViewScale.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendCGFloat:", self->_customContentBlurProgress);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendCGFloat:", self->_customContentAlpha);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendCGFloat:", self->_snapshotViewBlurProgress);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendCGFloat:", self->_snapshotViewAlpha);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", self->_snapshotReason);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "hash");

  return v14;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUUID *interfaceElementIdentifier;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  SAElementIdentityDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAStringFromUIViewControllerAppearState(self->_appearState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; interfaceElementIdentifier: %@; associatedSystemApertureElementID: %@; appearState: %@; sensorObscuringShadowProgress: %f; leadingViewBlurProgress: %f; leadingViewAlpha: %f; leadingViewSquishProgress: %f; leadingViewScale: (%f, %f); trailingViewBlurProgress: %f; trailingViewAlpha: %f; trailingViewSquishProgress: %f; trailingViewScale: (%f, %f); minimalViewBlurProgress: %f; minimalViewAlpha: %f; minimalViewSquishProgress: %f; minimalViewScale: (%f, %f); customContentBlurProgress: %f; customContentAlpha: %f; snapshotViewBlurProgress: %f; snapshotViewAlpha: %f; snapshotReason: %@>"),
    v5,
    self,
    interfaceElementIdentifier,
    v7,
    v8,
    *(_QWORD *)&self->_sensorObscuringShadowProgress,
    *(_QWORD *)&self->_leadingViewBlurProgress,
    *(_QWORD *)&self->_leadingViewAlpha,
    *(_QWORD *)&self->_leadingViewSquishProgress,
    *(_QWORD *)&self->_leadingViewScale.width,
    *(_QWORD *)&self->_leadingViewScale.height,
    *(_QWORD *)&self->_trailingViewBlurProgress,
    *(_QWORD *)&self->_trailingViewAlpha,
    *(_QWORD *)&self->_trailingViewSquishProgress,
    *(_QWORD *)&self->_trailingViewScale.width,
    *(_QWORD *)&self->_trailingViewScale.height,
    *(_QWORD *)&self->_minimalViewBlurProgress,
    *(_QWORD *)&self->_minimalViewAlpha,
    *(_QWORD *)&self->_minimalViewSquishProgress,
    *(_QWORD *)&self->_minimalViewScale.width,
    *(_QWORD *)&self->_minimalViewScale.height,
    *(_QWORD *)&self->_customContentBlurProgress,
    *(_QWORD *)&self->_customContentAlpha,
    *(_QWORD *)&self->_snapshotViewBlurProgress,
    *(_QWORD *)&self->_snapshotViewAlpha,
    self->_snapshotReason);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  SBSAElementIdentification *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSUUID copy](self->_interfaceElementIdentifier, "copy");
  v6 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v5;

  if (self->_associatedSystemApertureElementIdentity)
  {
    v7 = [SBSAElementIdentification alloc];
    -[SAElementIdentifying clientIdentifier](self->_associatedSystemApertureElementIdentity, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAElementIdentifying elementIdentifier](self->_associatedSystemApertureElementIdentity, "elementIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v7, "initWithClientIdentifier:elementIdentifier:", v8, v9);
    v11 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v10;

  }
  *((_DWORD *)v4 + 2) = self->_appearState;
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_sensorObscuringShadowProgress;
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_leadingViewBlurProgress;
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_leadingViewAlpha;
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_leadingViewSquishProgress;
  *(CGSize *)(v4 + 152) = self->_leadingViewScale;
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_trailingViewBlurProgress;
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_trailingViewAlpha;
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_trailingViewSquishProgress;
  *(CGSize *)(v4 + 168) = self->_trailingViewScale;
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_minimalViewBlurProgress;
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_minimalViewAlpha;
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_minimalViewSquishProgress;
  *(CGSize *)(v4 + 184) = self->_minimalViewScale;
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_customContentBlurProgress;
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_customContentAlpha;
  *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_snapshotViewBlurProgress;
  *((_QWORD *)v4 + 17) = *(_QWORD *)&self->_snapshotViewAlpha;
  v12 = -[NSString copy](self->_snapshotReason, "copy");
  v13 = (void *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v12;

  return v4;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAElementDescription copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithElementDescription:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (NSUUID)interfaceElementIdentifier
{
  return self->_interfaceElementIdentifier;
}

- (void)_setInterfaceElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  return self->_associatedSystemApertureElementIdentity;
}

- (void)_setAssociatedSystemApertureElementIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)appearState
{
  return self->_appearState;
}

- (void)_setAppearState:(int)a3
{
  self->_appearState = a3;
}

- (double)sensorObscuringShadowProgress
{
  return self->_sensorObscuringShadowProgress;
}

- (void)_setSensorObscuringShadowProgress:(double)a3
{
  self->_sensorObscuringShadowProgress = a3;
}

- (double)leadingViewBlurProgress
{
  return self->_leadingViewBlurProgress;
}

- (void)_setLeadingViewBlurProgress:(double)a3
{
  self->_leadingViewBlurProgress = a3;
}

- (double)leadingViewAlpha
{
  return self->_leadingViewAlpha;
}

- (void)_setLeadingViewAlpha:(double)a3
{
  self->_leadingViewAlpha = a3;
}

- (double)leadingViewSquishProgress
{
  return self->_leadingViewSquishProgress;
}

- (void)_setLeadingViewSquishProgress:(double)a3
{
  self->_leadingViewSquishProgress = a3;
}

- (CGSize)leadingViewScale
{
  double width;
  double height;
  CGSize result;

  width = self->_leadingViewScale.width;
  height = self->_leadingViewScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setLeadingViewScale:(CGSize)a3
{
  self->_leadingViewScale = a3;
}

- (double)trailingViewBlurProgress
{
  return self->_trailingViewBlurProgress;
}

- (void)_setTrailingViewBlurProgress:(double)a3
{
  self->_trailingViewBlurProgress = a3;
}

- (double)trailingViewAlpha
{
  return self->_trailingViewAlpha;
}

- (void)_setTrailingViewAlpha:(double)a3
{
  self->_trailingViewAlpha = a3;
}

- (double)trailingViewSquishProgress
{
  return self->_trailingViewSquishProgress;
}

- (void)_setTrailingViewSquishProgress:(double)a3
{
  self->_trailingViewSquishProgress = a3;
}

- (CGSize)trailingViewScale
{
  double width;
  double height;
  CGSize result;

  width = self->_trailingViewScale.width;
  height = self->_trailingViewScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setTrailingViewScale:(CGSize)a3
{
  self->_trailingViewScale = a3;
}

- (double)minimalViewBlurProgress
{
  return self->_minimalViewBlurProgress;
}

- (void)_setMinimalViewBlurProgress:(double)a3
{
  self->_minimalViewBlurProgress = a3;
}

- (double)minimalViewAlpha
{
  return self->_minimalViewAlpha;
}

- (void)_setMinimalViewAlpha:(double)a3
{
  self->_minimalViewAlpha = a3;
}

- (double)minimalViewSquishProgress
{
  return self->_minimalViewSquishProgress;
}

- (void)_setMinimalViewSquishProgress:(double)a3
{
  self->_minimalViewSquishProgress = a3;
}

- (CGSize)minimalViewScale
{
  double width;
  double height;
  CGSize result;

  width = self->_minimalViewScale.width;
  height = self->_minimalViewScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setMinimalViewScale:(CGSize)a3
{
  self->_minimalViewScale = a3;
}

- (double)customContentBlurProgress
{
  return self->_customContentBlurProgress;
}

- (void)_setCustomContentBlurProgress:(double)a3
{
  self->_customContentBlurProgress = a3;
}

- (double)customContentAlpha
{
  return self->_customContentAlpha;
}

- (void)_setCustomContentAlpha:(double)a3
{
  self->_customContentAlpha = a3;
}

- (double)snapshotViewBlurProgress
{
  return self->_snapshotViewBlurProgress;
}

- (void)_setSnapshotViewBlurProgress:(double)a3
{
  self->_snapshotViewBlurProgress = a3;
}

- (double)snapshotViewAlpha
{
  return self->_snapshotViewAlpha;
}

- (void)_setSnapshotViewAlpha:(double)a3
{
  self->_snapshotViewAlpha = a3;
}

- (NSString)snapshotReason
{
  return self->_snapshotReason;
}

- (void)_setSnapshotReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReason, 0);
  objc_storeStrong((id *)&self->_associatedSystemApertureElementIdentity, 0);
  objc_storeStrong((id *)&self->_interfaceElementIdentifier, 0);
}

@end
