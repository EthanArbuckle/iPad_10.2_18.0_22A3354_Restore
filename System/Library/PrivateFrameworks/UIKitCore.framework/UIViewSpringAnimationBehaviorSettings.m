@implementation UIViewSpringAnimationBehaviorSettings

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (!-[UIViewSpringAnimationBehaviorSettings isEqual:](self, "isEqual:", v4))
  {
    objc_storeStrong((id *)(v4 + 64), self->_name);
    *(_QWORD *)(v4 + 56) = self->_behaviorType;
    *(double *)(v4 + 72) = self->_deceleration;
    *(double *)(v4 + 80) = self->_dampingRatio;
    *(double *)(v4 + 88) = self->_response;
    *(double *)(v4 + 104) = self->_trackingDampingRatio;
    *(double *)(v4 + 112) = self->_trackingResponse;
    *(double *)(v4 + 96) = self->_retargetImpulse;
    *(double *)(v4 + 120) = self->_trackingRetargetImpulse;
    *(double *)(v4 + 128) = self->_dampingRatioSmoothing;
    *(double *)(v4 + 136) = self->_responseSmoothing;
    *(double *)(v4 + 144) = self->_trackingDampingRatioSmoothing;
    *(double *)(v4 + 152) = self->_trackingResponseSmoothing;
    *(_BYTE *)(v4 + 48) = self->_smoothingAndProjectionEnabled;
    *(double *)(v4 + 160) = self->_inertialTargetSmoothingRatio;
    *(double *)(v4 + 168) = self->_inertialProjectionDeceleration;
    v5 = -[PTFrameRateRangeSettings copy](self->_preferredFrameRateRange, "copy");
    v6 = *(void **)(v4 + 176);
    *(_QWORD *)(v4 + 176) = v5;

  }
  return (id)v4;
}

- (void)setDefaultValues
{
  -[UIViewSpringAnimationBehaviorSettings setBehaviorType:](self, "setBehaviorType:", 2);
  -[UIViewSpringAnimationBehaviorSettings setDeceleration:](self, "setDeceleration:", 0.998);
  -[UIViewSpringAnimationBehaviorSettings setDampingRatio:](self, "setDampingRatio:", 0.845);
  -[UIViewSpringAnimationBehaviorSettings setResponse:](self, "setResponse:", 0.531);
  -[UIViewSpringAnimationBehaviorSettings setTrackingDampingRatio:](self, "setTrackingDampingRatio:", 0.86);
  -[UIViewSpringAnimationBehaviorSettings setTrackingResponse:](self, "setTrackingResponse:", 0.15);
  -[UIViewSpringAnimationBehaviorSettings setRetargetImpulse:](self, "setRetargetImpulse:", 0.0);
  -[UIViewSpringAnimationBehaviorSettings setTrackingRetargetImpulse:](self, "setTrackingRetargetImpulse:", 0.0);
  -[UIViewSpringAnimationBehaviorSettings setDampingRatioSmoothing:](self, "setDampingRatioSmoothing:", 0.0);
  -[UIViewSpringAnimationBehaviorSettings setResponseSmoothing:](self, "setResponseSmoothing:", 0.0);
  -[UIViewSpringAnimationBehaviorSettings setTrackingDampingRatioSmoothing:](self, "setTrackingDampingRatioSmoothing:", 0.0);
  -[UIViewSpringAnimationBehaviorSettings setTrackingResponseSmoothing:](self, "setTrackingResponseSmoothing:", 0.0);
  -[UIViewSpringAnimationBehaviorSettings setSmoothingAndProjectionEnabled:](self, "setSmoothingAndProjectionEnabled:", 0);
}

- (void)setDefaultCriticallyDampedValues
{
  -[UIViewSpringAnimationBehaviorSettings setDefaultValues](self, "setDefaultValues");
  -[UIViewSpringAnimationBehaviorSettings setDampingRatio:](self, "setDampingRatio:", 1.0);
  -[UIViewSpringAnimationBehaviorSettings setResponse:](self, "setResponse:", 0.336);
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  double v8;
  double v9;
  double v10;
  $6E732EA7D3E0C9EC9CEEF7385E7E4683 *result;
  double trackingResponseSmoothing;
  double response;
  double v14;
  double responseSmoothing;
  double inertialProjectionDeceleration;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 == 1)
  {
    -[UIViewSpringAnimationBehaviorSettings _effectiveTrackingDampingRatio](self, "_effectiveTrackingDampingRatio");
    retstr->var0 = v8;
    -[UIViewSpringAnimationBehaviorSettings _effectiveTrackingResponse](self, "_effectiveTrackingResponse");
    retstr->var1 = v9;
    -[UIViewSpringAnimationBehaviorSettings _effectiveTrackingRetargetImpulse](self, "_effectiveTrackingRetargetImpulse");
    retstr->var10 = v10;
    result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)-[UIViewSpringAnimationBehaviorSettings smoothingAndProjectionEnabled](self, "smoothingAndProjectionEnabled");
    if ((_DWORD)result)
    {
      trackingResponseSmoothing = self->_trackingResponseSmoothing;
      retstr->var6 = self->_trackingDampingRatioSmoothing;
      retstr->var7 = trackingResponseSmoothing;
      if (!a4)
      {
        *(_WORD *)&retstr->var2 = 257;
        response = self->_response;
        retstr->var4 = self->_dampingRatio;
        retstr->var5 = response;
      }
    }
  }
  else
  {
    v14 = self->_response;
    retstr->var0 = self->_dampingRatio;
    retstr->var1 = v14;
    retstr->var10 = self->_retargetImpulse;
    result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)-[UIViewSpringAnimationBehaviorSettings smoothingAndProjectionEnabled](self, "smoothingAndProjectionEnabled");
    if ((_DWORD)result)
    {
      responseSmoothing = self->_responseSmoothing;
      retstr->var6 = self->_dampingRatioSmoothing;
      retstr->var7 = responseSmoothing;
      if (a4 == 1)
      {
        inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
        retstr->var8 = self->_inertialTargetSmoothingRatio * self->_trackingResponse;
        retstr->var9 = inertialProjectionDeceleration;
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t behaviorType;
  uint64_t v6;
  id v7;
  NSString *name;
  id v9;
  double deceleration;
  id v11;
  double dampingRatio;
  id v13;
  double response;
  id v15;
  double retargetImpulse;
  id v17;
  double trackingDampingRatio;
  id v19;
  double trackingResponse;
  id v21;
  double trackingRetargetImpulse;
  id v23;
  _BOOL8 smoothingAndProjectionEnabled;
  id v25;
  double dampingRatioSmoothing;
  id v27;
  void *v28;
  double responseSmoothing;
  id v30;
  void *v31;
  double trackingDampingRatioSmoothing;
  id v33;
  void *v34;
  double trackingResponseSmoothing;
  id v36;
  void *v37;
  double inertialTargetSmoothingRatio;
  id v39;
  void *v40;
  double inertialProjectionDeceleration;
  id v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
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

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  behaviorType = self->_behaviorType;
  v6 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke;
  v86[3] = &unk_1E16B7678;
  v7 = v4;
  v87 = v7;
  objc_msgSend(v55, "appendInteger:counterpart:", behaviorType, v86);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v84[0] = v6;
  v84[1] = 3221225472;
  v84[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_2;
  v84[3] = &unk_1E16B76A0;
  v9 = v7;
  v85 = v9;
  objc_msgSend(v54, "appendString:counterpart:", name, v84);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  deceleration = self->_deceleration;
  v82[0] = v6;
  v82[1] = 3221225472;
  v82[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_3;
  v82[3] = &unk_1E16B4CF0;
  v11 = v9;
  v83 = v11;
  objc_msgSend(v53, "appendDouble:counterpart:", v82, deceleration);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  dampingRatio = self->_dampingRatio;
  v80[0] = v6;
  v80[1] = 3221225472;
  v80[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_4;
  v80[3] = &unk_1E16B4CF0;
  v13 = v11;
  v81 = v13;
  objc_msgSend(v52, "appendCGFloat:counterpart:", v80, dampingRatio);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  v78[0] = v6;
  v78[1] = 3221225472;
  v78[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_5;
  v78[3] = &unk_1E16B4CF0;
  v15 = v13;
  v79 = v15;
  objc_msgSend(v51, "appendCGFloat:counterpart:", v78, response);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  retargetImpulse = self->_retargetImpulse;
  v76[0] = v6;
  v76[1] = 3221225472;
  v76[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_6;
  v76[3] = &unk_1E16B4CF0;
  v17 = v15;
  v77 = v17;
  objc_msgSend(v50, "appendCGFloat:counterpart:", v76, retargetImpulse);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  trackingDampingRatio = self->_trackingDampingRatio;
  v74[0] = v6;
  v74[1] = 3221225472;
  v74[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_7;
  v74[3] = &unk_1E16B4CF0;
  v19 = v17;
  v75 = v19;
  objc_msgSend(v49, "appendCGFloat:counterpart:", v74, trackingDampingRatio);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  trackingResponse = self->_trackingResponse;
  v72[0] = v6;
  v72[1] = 3221225472;
  v72[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_8;
  v72[3] = &unk_1E16B4CF0;
  v21 = v19;
  v73 = v21;
  objc_msgSend(v48, "appendCGFloat:counterpart:", v72, trackingResponse);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  trackingRetargetImpulse = self->_trackingRetargetImpulse;
  v70[0] = v6;
  v70[1] = 3221225472;
  v70[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_9;
  v70[3] = &unk_1E16B4CF0;
  v23 = v21;
  v71 = v23;
  objc_msgSend(v47, "appendCGFloat:counterpart:", v70, trackingRetargetImpulse);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  smoothingAndProjectionEnabled = self->_smoothingAndProjectionEnabled;
  v68[0] = v6;
  v68[1] = 3221225472;
  v68[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_10;
  v68[3] = &unk_1E16B2268;
  v25 = v23;
  v69 = v25;
  objc_msgSend(v46, "appendBool:counterpart:", smoothingAndProjectionEnabled, v68);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  dampingRatioSmoothing = self->_dampingRatioSmoothing;
  v66[0] = v6;
  v66[1] = 3221225472;
  v66[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_11;
  v66[3] = &unk_1E16B4CF0;
  v27 = v25;
  v67 = v27;
  objc_msgSend(v45, "appendCGFloat:counterpart:", v66, dampingRatioSmoothing);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  responseSmoothing = self->_responseSmoothing;
  v64[0] = v6;
  v64[1] = 3221225472;
  v64[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_12;
  v64[3] = &unk_1E16B4CF0;
  v30 = v27;
  v65 = v30;
  objc_msgSend(v28, "appendCGFloat:counterpart:", v64, responseSmoothing);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  trackingDampingRatioSmoothing = self->_trackingDampingRatioSmoothing;
  v62[0] = v6;
  v62[1] = 3221225472;
  v62[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_13;
  v62[3] = &unk_1E16B4CF0;
  v33 = v30;
  v63 = v33;
  objc_msgSend(v31, "appendCGFloat:counterpart:", v62, trackingDampingRatioSmoothing);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  trackingResponseSmoothing = self->_trackingResponseSmoothing;
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_14;
  v60[3] = &unk_1E16B4CF0;
  v36 = v33;
  v61 = v36;
  objc_msgSend(v34, "appendCGFloat:counterpart:", v60, trackingResponseSmoothing);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  inertialTargetSmoothingRatio = self->_inertialTargetSmoothingRatio;
  v58[0] = v6;
  v58[1] = 3221225472;
  v58[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_15;
  v58[3] = &unk_1E16B4CF0;
  v39 = v36;
  v59 = v39;
  objc_msgSend(v37, "appendCGFloat:counterpart:", v58, inertialTargetSmoothingRatio);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
  v56[0] = v6;
  v56[1] = 3221225472;
  v56[2] = __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_16;
  v56[3] = &unk_1E16B4CF0;
  v57 = v39;
  v42 = v39;
  objc_msgSend(v40, "appendCGFloat:counterpart:", v56, inertialProjectionDeceleration);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = objc_msgSend(v43, "isEqual");

  return (char)v39;
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "behaviorType");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deceleration");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dampingRatio");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "response");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retargetImpulse");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingDampingRatio");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingResponse");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingRetargetImpulse");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smoothingAndProjectionEnabled");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dampingRatioSmoothing");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "responseSmoothing");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingDampingRatioSmoothing");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingResponseSmoothing");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inertialTargetSmoothingRatio");
}

uint64_t __49__UIViewSpringAnimationBehaviorSettings_isEqual___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inertialProjectionDeceleration");
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
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendInteger:", self->_behaviorType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:", self->_name);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendDouble:", self->_deceleration);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendCGFloat:", self->_dampingRatio);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendCGFloat:", self->_response);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendCGFloat:", self->_retargetImpulse);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendCGFloat:", self->_trackingDampingRatio);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendCGFloat:", self->_trackingResponse);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGFloat:", self->_trackingRetargetImpulse);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:", self->_smoothingAndProjectionEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGFloat:", self->_dampingRatioSmoothing);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCGFloat:", self->_responseSmoothing);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendCGFloat:", self->_trackingDampingRatioSmoothing);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendCGFloat:", self->_trackingResponseSmoothing);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendCGFloat:", self->_inertialTargetSmoothingRatio);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendCGFloat:", self->_inertialProjectionDeceleration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)description
{
  return (NSString *)-[UIViewSpringAnimationBehaviorSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIViewSpringAnimationBehaviorSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("Name"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIViewSpringAnimationBehaviorSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UIViewSpringAnimationBehaviorSettings *v11;

  -[UIViewSpringAnimationBehaviorSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__UIViewSpringAnimationBehaviorSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

void __79__UIViewSpringAnimationBehaviorSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "BSAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("animationSettings"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "preferredFrameRateRange");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("preferredFrameRateRange"));

}

- (id)BSAnimationSettings
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIViewSpringAnimationBehaviorSettings dampingRatio](self, "dampingRatio");
  v4 = v3;
  -[UIViewSpringAnimationBehaviorSettings response](self, "response");
  v6 = 6.28318531 / v5 * (6.28318531 / v5);
  v7 = sqrt(v6);
  objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 1.0, v6, v4 * (v7 + v7));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)settlingDuration
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 1.0);
  -[UIViewSpringAnimationBehaviorSettings dampingRatio](self, "dampingRatio");
  v5 = v4;
  -[UIViewSpringAnimationBehaviorSettings response](self, "response");
  v7 = sqrt(6.28318531 / v6 * (6.28318531 / v6));
  v8 = v5 * (v7 + v7);
  objc_msgSend(v3, "setStiffness:");
  objc_msgSend(v3, "setDamping:", v8);
  objc_msgSend(v3, "settlingDuration");
  v10 = v9;

  return v10;
}

- (double)_effectiveTrackingDampingRatio
{
  double result;

  if (-[UIViewSpringAnimationBehaviorSettings behaviorType](self, "behaviorType") == 1)
    -[UIViewSpringAnimationBehaviorSettings dampingRatio](self, "dampingRatio");
  else
    -[UIViewSpringAnimationBehaviorSettings trackingDampingRatio](self, "trackingDampingRatio");
  return result;
}

- (double)_effectiveTrackingResponse
{
  double result;

  if (-[UIViewSpringAnimationBehaviorSettings behaviorType](self, "behaviorType") == 1)
    -[UIViewSpringAnimationBehaviorSettings response](self, "response");
  else
    -[UIViewSpringAnimationBehaviorSettings trackingResponse](self, "trackingResponse");
  return result;
}

- (double)_effectiveTrackingRetargetImpulse
{
  double result;

  if (-[UIViewSpringAnimationBehaviorSettings behaviorType](self, "behaviorType") == 1)
    -[UIViewSpringAnimationBehaviorSettings retargetImpulse](self, "retargetImpulse");
  else
    -[UIViewSpringAnimationBehaviorSettings trackingRetargetImpulse](self, "trackingRetargetImpulse");
  return result;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4;
  float preferred;
  float maximum;
  float minimum;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  -[UIViewSpringAnimationBehaviorSettings preferredFrameRateRange](self, "preferredFrameRateRange");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", v4, v8, v9, v10);

}

- (CAFrameRateRange)frameRateRange
{
  void *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  CAFrameRateRange result;

  -[UIViewSpringAnimationBehaviorSettings preferredFrameRateRange](self, "preferredFrameRateRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameRateRange");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  v9 = v4;
  v10 = v6;
  v11 = v8;
  result.preferred = v11;
  result.maximum = v10;
  result.minimum = v9;
  return result;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "_moduleWithSectionTitle:", CFSTR("Behavior"));
}

+ (id)_moduleWithSectionTitle:(id)a3
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
  void *v13;
  void *v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  void *v69;
  id v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v70 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("behaviorType == %d"), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("behaviorType == %d OR behaviorType == %d"), 1, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("behaviorType == %d"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("behaviorType == %d AND smoothingAndProjectionEnabled = YES"), 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("behaviorType == %d AND smoothingAndProjectionEnabled = YES"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Behavior Type"), CFSTR("behaviorType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "possibleValues:titles:", &unk_1E1A92BE8, &unk_1E1A92C00);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Deceleration"), CFSTR("deceleration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "condition:", v69);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("dampingRatio"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.001, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "precision:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "condition:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("response"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 1000.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "condition:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Retarget Impulse"), CFSTR("retargetImpulse"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "condition:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v25);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tracking Damping Ratio"), CFSTR("trackingDampingRatio"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.001, 10.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "condition:", v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v29);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tracking Response"), CFSTR("trackingResponse"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 1000.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "condition:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v33);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tracking Retarget Impulse"), CFSTR("trackingRetargetImpulse"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", 0.0, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "condition:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v37);

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Smoothing and Projection"), CFSTR("smoothingAndProjectionEnabled"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v38);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio Smoothing"), CFSTR("dampingRatioSmoothing"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "condition:", v6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v42);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Response Smoothing"), CFSTR("responseSmoothing"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "precision:", 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "condition:", v6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v46);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tracking Damping Ratio Smoothing"), CFSTR("trackingDampingRatioSmoothing"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "between:and:", 0.0, 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "precision:", 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "condition:", v7);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v50);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tracking Response Smoothing"), CFSTR("trackingResponseSmoothing"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "between:and:", 0.0, 1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "precision:", 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "condition:", v7);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v54);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Target Smoothing Ratio"), CFSTR("inertialTargetSmoothingRatio"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "between:and:", 0.0, 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "precision:", 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "condition:", v7);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v58);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Projection Deceleration"), CFSTR("inertialProjectionDeceleration"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "between:and:", 0.0, 1.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "precision:", 7);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "condition:", v7);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v62);

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Frame Rate Range"), CFSTR("preferredFrameRateRange"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v63);

  v64 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v8, v70);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v71[0] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "moduleWithTitle:contents:", 0, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

- (int64_t)behaviorType
{
  return self->_behaviorType;
}

- (void)setBehaviorType:(int64_t)a3
{
  self->_behaviorType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)deceleration
{
  return self->_deceleration;
}

- (void)setDeceleration:(double)a3
{
  self->_deceleration = a3;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (double)trackingDampingRatio
{
  return self->_trackingDampingRatio;
}

- (void)setTrackingDampingRatio:(double)a3
{
  self->_trackingDampingRatio = a3;
}

- (double)trackingResponse
{
  return self->_trackingResponse;
}

- (void)setTrackingResponse:(double)a3
{
  self->_trackingResponse = a3;
}

- (double)trackingRetargetImpulse
{
  return self->_trackingRetargetImpulse;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  self->_trackingRetargetImpulse = a3;
}

- (BOOL)smoothingAndProjectionEnabled
{
  return self->_smoothingAndProjectionEnabled;
}

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  self->_smoothingAndProjectionEnabled = a3;
}

- (double)dampingRatioSmoothing
{
  return self->_dampingRatioSmoothing;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  self->_dampingRatioSmoothing = a3;
}

- (double)responseSmoothing
{
  return self->_responseSmoothing;
}

- (void)setResponseSmoothing:(double)a3
{
  self->_responseSmoothing = a3;
}

- (double)trackingDampingRatioSmoothing
{
  return self->_trackingDampingRatioSmoothing;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  self->_trackingDampingRatioSmoothing = a3;
}

- (double)trackingResponseSmoothing
{
  return self->_trackingResponseSmoothing;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  self->_trackingResponseSmoothing = a3;
}

- (double)inertialTargetSmoothingRatio
{
  return self->_inertialTargetSmoothingRatio;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  self->_inertialTargetSmoothingRatio = a3;
}

- (double)inertialProjectionDeceleration
{
  return self->_inertialProjectionDeceleration;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  self->_inertialProjectionDeceleration = a3;
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  return self->_preferredFrameRateRange;
}

- (void)setPreferredFrameRateRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
