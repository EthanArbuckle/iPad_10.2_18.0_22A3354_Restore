@implementation _UISTouchAuthenticationVerifier

+ (id)runOverriddenThresholds
{
  void *v0;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_self();
  if (os_variant_allows_internal_security_policies())
  {
    v2 = (void *)runOverriddenThresholds_userDefaults;
    if (!runOverriddenThresholds_userDefaults)
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
      v4 = (void *)runOverriddenThresholds_userDefaults;
      runOverriddenThresholds_userDefaults = v3;

      v2 = (void *)runOverriddenThresholds_userDefaults;
    }
    objc_msgSend(v2, "objectForKey:", CFSTR("touchAuthenticationOverriddenThresholds"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

+ (BOOL)shouldAuthenticateServiceBundleId:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_self();
  objc_msgSend(&unk_1E2CBBA28, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    +[_UISTouchAuthenticationVerifier runOverriddenThresholds]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

+ (id)verifierForServiceBundleId:(id)a3
{
  id v3;
  _UISTouchAuthenticationVerifier *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _UISTouchAuthenticationVerifier *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSDictionary *thresholds;
  void (**v14)(_QWORD, _QWORD, double, double);
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  UISTransform3DGrader *lenientGrader;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  UISTransform3DGrader *strictGrader;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v41[4];
  _UISTouchAuthenticationVerifier *v42;
  objc_super v43;

  v3 = a3;
  objc_msgSend((id)verifierForServiceBundleId__verifiersByServiceBundleId, "objectForKeyedSubscript:", v3);
  v4 = (_UISTouchAuthenticationVerifier *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_self();
    objc_msgSend(&unk_1E2CBBA28, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISTouchAuthenticationVerifier runOverriddenThresholds]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = [_UISTouchAuthenticationVerifier alloc];
    v8 = v5;
    v9 = v7;
    if (v4)
    {
      v43.receiver = v4;
      v43.super_class = (Class)_UISTouchAuthenticationVerifier;
      v10 = objc_msgSendSuper2(&v43, sel_init);
      v4 = v10;
      if (v10)
      {
        if (v8 | v9)
        {
          v11 = (NSDictionary *)objc_msgSend(&unk_1E2CBBA50, "mutableCopy");
          v12 = v11;
          if (v8)
            -[NSDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v8);
          if (v9)
            -[NSDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", v9);
          thresholds = v4->_thresholds;
          v4->_thresholds = v12;
        }
        else
        {
          thresholds = v10->_thresholds;
          v10->_thresholds = (NSDictionary *)&unk_1E2CBBA78;
        }

        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __89___UISTouchAuthenticationVerifier_initWithBuildOverrideThresholds_runOverrideThresholds___block_invoke;
        v41[3] = &unk_1E2CAF9C0;
        v4 = v4;
        v42 = v4;
        v14 = (void (**)(_QWORD, _QWORD, double, double))MEMORY[0x194010C34](v41);
        -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("lowerScaleMultiplierLenient"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;
        -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("upperScaleMultiplierLenient"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;
        -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("allowsAllRotations"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, objc_msgSend(v21, "BOOLValue"), v17, v20);
        v22 = objc_claimAutoreleasedReturnValue();
        lenientGrader = v4->_lenientGrader;
        v4->_lenientGrader = (UISTransform3DGrader *)v22;

        -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("lowerScaleMultiplierStrict"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;
        -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("upperScaleMultiplierStrict"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;
        -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("allowsAllRotations"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, objc_msgSend(v30, "BOOLValue"), v26, v29);
        v31 = objc_claimAutoreleasedReturnValue();
        strictGrader = v4->_strictGrader;
        v4->_strictGrader = (UISTransform3DGrader *)v31;

        if (os_variant_allows_internal_security_policies())
        {
          v4->_shouldSuppressInauthenticTouches = 1;
        }
        else
        {
          -[NSDictionary objectForKeyedSubscript:](v4->_thresholds, "objectForKeyedSubscript:", CFSTR("suppressTouchOnCustomerOS"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v4->_shouldSuppressInauthenticTouches = v33 != 0;

        }
      }
    }

    v34 = (void *)verifierForServiceBundleId__verifiersByServiceBundleId;
    if (!verifierForServiceBundleId__verifiersByServiceBundleId)
    {
      v35 = (void *)MEMORY[0x1E0C99E08];
      objc_opt_self();
      objc_msgSend(&unk_1E2CBBA28, "allKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sharedKeySetForKeys:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dictionaryWithSharedKeySet:", v37);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)verifierForServiceBundleId__verifiersByServiceBundleId;
      verifierForServiceBundleId__verifiersByServiceBundleId = v38;

      v34 = (void *)verifierForServiceBundleId__verifiersByServiceBundleId;
    }
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v4, v3);

  }
  return v4;
}

- (uint64_t)_hostSupportsStrictTouchVerificationForRecord:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("hostsForLenientTouchAuthentication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  objc_msgSend(v3, "hostBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
  {

LABEL_7:
    objc_msgSend(v3, "hostSDKVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("SDKVersionForStrictTouchAuthentication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "isVersion:greaterThanOrEqualToVersion:", v8, v9);

    }
    else
    {
      v7 = !objc_msgSend(v8, "length") && objc_msgSend(v9, "length");
    }

    goto LABEL_15;
  }
  v6 = objc_msgSend(v3, "hostIsInternal");

  if ((v6 & 1) == 0)
    goto LABEL_7;
  v7 = 0;
LABEL_15:

LABEL_16:
  return v7;
}

- (unint64_t)transformGradeFailureReasonsForRecord:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  _OWORD v11[8];

  v4 = a3;
  v5 = -[_UISTouchAuthenticationVerifier _hostSupportsStrictTouchVerificationForRecord:]((uint64_t)self, v4);
  v6 = 16;
  if (v5)
    v6 = 24;
  v7 = *(id *)((char *)&self->super.isa + v6);
  objc_msgSend(v4, "securityAnalysis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "cumulativeLayerTransform");
  else
    memset(v11, 0, sizeof(v11));
  v9 = objc_msgSend(v7, "gradeTransform3D:", v11);

  return v9;
}

- (id)failureDescriptionForSecurityAnalysis:(uint64_t)a3 minimumOpacity:(double)a4 occlusionThreshold:(double)a5 transformGrade:
{
  id v9;
  void *v10;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CATransform3D v30;
  CGAffineTransform transform;
  CGAffineTransformComponents v32;

  v9 = a2;
  if (!a1 || !os_variant_allows_internal_security_policies())
  {
    v10 = 0;
    goto LABEL_4;
  }
  v12 = (void *)objc_opt_new();
  v10 = v12;
  if (!v9)
    objc_msgSend(v12, "appendString:", CFSTR(" < security analysis missing >"));
  objc_msgSend(v9, "cumulativeOpacity");
  if (v13 < a4)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "cumulativeOpacity");
    objc_msgSend(v14, "stringWithFormat:", CFSTR(" < computed opacity %.2f%% less than %.2f%% threshold >"), (float)(v15 * 100.0), a4 * 100.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v16);

  }
  if (objc_msgSend(v9, "hasInsecureFilter"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" < insecure filter detected >"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v17);

  }
  if (a3)
  {
    memset(&v32, 0, sizeof(v32));
    if (v9)
      objc_msgSend(v9, "cumulativeLayerTransform");
    else
      memset(&v30, 0, sizeof(v30));
    CATransform3DGetAffineTransform(&transform, &v30);
    CGAffineTransformDecompose(&v32, &transform);
    v18 = (void *)objc_opt_new();
    v19 = v18;
    if ((a3 & 1) != 0)
    {
      objc_msgSend(v18, "appendString:", CFSTR(" non-finite"));
      if ((a3 & 2) == 0)
      {
LABEL_17:
        if ((a3 & 4) == 0)
          goto LABEL_18;
        goto LABEL_31;
      }
    }
    else if ((a3 & 2) == 0)
    {
      goto LABEL_17;
    }
    objc_msgSend(v19, "appendString:", CFSTR(" non-affine"));
    if ((a3 & 4) == 0)
    {
LABEL_18:
      if ((a3 & 8) == 0)
        goto LABEL_19;
      goto LABEL_32;
    }
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" invalid-rotation[%.2f]"), *(_QWORD *)&v32.rotation);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendString:", v26);

    if ((a3 & 8) == 0)
    {
LABEL_19:
      if ((a3 & 0x10) == 0)
      {
        if ((a3 & 0x20) == 0)
          goto LABEL_21;
        goto LABEL_35;
      }
LABEL_33:
      objc_msgSend(v19, "appendString:", CFSTR(" scale.not-allowed"));
LABEL_34:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" scale[width=%.2f, height=%.2f]"), *(_QWORD *)&v32.scale.width, *(_QWORD *)&v32.scale.height, *(_QWORD *)&v30.m11, *(_QWORD *)&v30.m12, *(_QWORD *)&v30.m13, *(_QWORD *)&v30.m14, *(_QWORD *)&v30.m21, *(_QWORD *)&v30.m22, *(_QWORD *)&v30.m23, *(_QWORD *)&v30.m24, *(_QWORD *)&v30.m31, *(_QWORD *)&v30.m32, *(_QWORD *)&v30.m33, *(_QWORD *)&v30.m34, *(_QWORD *)&v30.m41, *(_QWORD *)&v30.m42,
        *(_QWORD *)&v30.m43,
        *(_QWORD *)&v30.m44);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendString:", v27);

      if ((a3 & 0x20) == 0)
      {
LABEL_21:
        if ((a3 & 0x40) == 0)
          goto LABEL_22;
        goto LABEL_36;
      }
LABEL_35:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" invalid-shear[%.2f]"), *(_QWORD *)&v32.horizontalShear);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendString:", v28);

      if ((a3 & 0x40) == 0)
      {
LABEL_22:
        if ((a3 & 0x80) == 0)
        {
LABEL_24:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" < failed transforms: %@ >"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendString:", v20);

          goto LABEL_25;
        }
LABEL_23:
        objc_msgSend(v19, "appendString:", CFSTR(" invalid-shift"));
        goto LABEL_24;
      }
LABEL_36:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" invalid-translation[dx=%.2f, dy=%.2f]"), *(_QWORD *)&v32.translation.dx, *(_QWORD *)&v32.translation.dy);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendString:", v29);

      if ((a3 & 0x80) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
LABEL_32:
    objc_msgSend(v19, "appendString:", CFSTR(" scale.not-uniform"));
    if ((a3 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_25:
  objc_msgSend(v9, "occlusionPercentage");
  if (v21 >= a5)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "occlusionPercentage");
    objc_msgSend(v22, "stringWithFormat:", CFSTR(" < occlusion %.2f%% greater than %.2f%% threshold >"), (float)(v23 * 100.0), a5 * 100.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v24);

  }
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_failureDescriptionForSecurityAnalysis_minimumOpacity_occlusionThreshold_transformGrade_, a1, CFSTR("_UISTouchAuthenticationVerifier.m"), 445, CFSTR("touch failed authentication but we were unable to describe why"));

  }
LABEL_4:

  return v10;
}

- (id)verifyRecord:(id)a3
{
  id v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  float v16;
  float v17;
  void *v18;
  uint64_t v19;
  _UISTouchAuthenticationVerifierResult *v20;

  v4 = a3;
  v5 = -[_UISTouchAuthenticationVerifier _hostSupportsStrictTouchVerificationForRecord:]((uint64_t)self, v4);
  if (v5)
    v6 = CFSTR("minimumOpacityStrict");
  else
    v6 = CFSTR("minimumOpacityLenient");
  if (v5)
    v7 = CFSTR("occlusionThresholdStrict");
  else
    v7 = CFSTR("occlusionThresholdLenient");
  -[NSDictionary objectForKeyedSubscript:](self->_thresholds, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[NSDictionary objectForKeyedSubscript:](self->_thresholds, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v4, "securityAnalysis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_UISTouchAuthenticationVerifier transformGradeFailureReasonsForRecord:](self, "transformGradeFailureReasonsForRecord:", v4);

  if (!v14
    || (objc_msgSend(v14, "cumulativeOpacity"), v10 >= v16)
    || (objc_msgSend(v14, "hasInsecureFilter") & 1) != 0
    || v15
    || (objc_msgSend(v14, "occlusionPercentage"), v13 <= v17))
  {
    if (os_variant_allows_internal_security_policies())
    {
      -[_UISTouchAuthenticationVerifier failureDescriptionForSecurityAnalysis:minimumOpacity:occlusionThreshold:transformGrade:]((uint64_t)self, v14, v15, v10, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    else
    {
      v19 = 0;
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
    v19 = 1;
  }
  v20 = -[_UISTouchAuthenticationVerifierResult initWithPassesSecurityAnalysis:failureReasons:]([_UISTouchAuthenticationVerifierResult alloc], "initWithPassesSecurityAnalysis:failureReasons:", v19, v18);

  return v20;
}

- (BOOL)shouldSuppressInauthenticTouches
{
  return self->_shouldSuppressInauthenticTouches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strictGrader, 0);
  objc_storeStrong((id *)&self->_lenientGrader, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
}

@end
