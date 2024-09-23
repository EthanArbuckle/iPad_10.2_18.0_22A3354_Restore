@implementation _UISTouchAuthenticationRecord

+ (id)build:(id)a3
{
  void (**v5)(id, id);
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, id))a3;
  v6 = -[_UISTouchAuthenticationRecord _init]([_UISMutableTouchAuthenticationRecord alloc]);
  v5[2](v5, v6);

  v7 = objc_msgSend(v6, "copy");
  objc_msgSend((id)v7, "serviceBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UISTouchAuthenticationRecord.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[record serviceBundleId]"));

  }
  objc_msgSend((id)v7, "serviceBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISTouchAuthenticationVerifier verifierForServiceBundleId:](_UISTouchAuthenticationVerifier, "verifierForServiceBundleId:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "verifyRecord:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v7 + 65) = objc_msgSend(v11, "passesSecurityAnalysis");
  if (objc_msgSend(v10, "shouldSuppressInauthenticTouches"))
    v12 = objc_msgSend(v11, "passesSecurityAnalysis");
  else
    v12 = 1;
  if (objc_msgSend((id)v7, "hostIsInternal"))
    v13 = os_variant_allows_internal_security_policies() ^ 1;
  else
    v13 = 0;
  *(_BYTE *)(v7 + 66) = v13 | v12;
  if (!*(_BYTE *)(v7 + 65))
  {
    _UISViewServiceHitTestLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[_UISTouchAuthenticationRecord sysdiagnosePayload](v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v24 = v7;
      v25 = 2114;
      v26 = (uint64_t)v15;
      _os_log_impl(&dword_190875000, v14, OS_LOG_TYPE_DEFAULT, "Hit test info for record %{public}p: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v11, "failureReasons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      _UISViewServiceHitTestLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_opt_class();
        v19 = v18;
        objc_msgSend(v11, "failureReasons");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = (uint64_t)v18;
        v25 = 2050;
        v26 = v7;
        v27 = 2114;
        v28 = v20;
        _os_log_impl(&dword_190875000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p> Touch failed authentication for the following reasons:%{public}@", buf, 0x20u);

      }
    }
  }
  *(_QWORD *)(v7 + 56) = mach_continuous_time();

  return (id)v7;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("_UISTouchAuthenticationRecord.m"), 137, CFSTR("_UISTouchAuthenticationRecord cannot be subclassed"));

      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)_UISTouchAuthenticationRecord;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (id)sysdiagnosePayload
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  long double v16;
  long double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  double v30;
  long double v31;
  long double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  CATransform3D v39;
  CGAffineTransform transform;
  CGAffineTransformComponents v41;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)a1, "securityAnalysis");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "hostBundleId");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (const __CFString *)v4;
    else
      v6 = CFSTR("(unknown)");
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("host"));

    if (*(_QWORD *)(a1 + 40))
      v7 = *(const __CFString **)(a1 + 40);
    else
      v7 = CFSTR("(unknown)");
    objc_msgSend(v2, "setValue:forKey:", v7, CFSTR("service"));
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v8, CFSTR("hti"));

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "hasInsecureFilter"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v9, CFSTR("inf"));

      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "cumulativeOpacity");
      *(float *)&v12 = v11;
      v13 = 0.0;
      v14 = v11 == 0.0;
      v15 = 0.0;
      if (!v14)
      {
        v16 = fabs(*(float *)&v12);
        v17 = *(float *)&v12 / v16;
        v18 = log10(v16);
        v19 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v18));
        v12 = round(v16 * v19);
        v15 = v17 * (v12 / v19);
      }
      objc_msgSend(v10, "numberWithDouble:", v15, v12);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v20, CFSTR("a"));

      +[_UISTouchAuthenticationVerifier verifierForServiceBundleId:](_UISTouchAuthenticationVerifier, "verifierForServiceBundleId:", *(_QWORD *)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v21, "transformGradeFailureReasonsForRecord:", a1);

      NSStringFromBOOL();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v22, CFSTR("tf"));

      memset(&v41, 0, sizeof(v41));
      objc_msgSend(v3, "cumulativeLayerTransform");
      CATransform3DGetAffineTransform(&transform, &v39);
      CGAffineTransformDecompose(&v41, &transform);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d %d %d (%.2f) %d %d (%.2f, %.2f) %d (%.2f) %d (%.2f, %.2f) %d"), v20 & 1, (v20 >> 1) & 1, (v20 >> 2) & 1, *(_QWORD *)&v41.rotation, (v20 >> 3) & 1, (v20 >> 4) & 1, *(_QWORD *)&v41.scale.width, *(_QWORD *)&v41.scale.height, (v20 >> 5) & 1, *(_QWORD *)&v41.horizontalShear, (v20 >> 6) & 1, *(_QWORD *)&v41.translation.dx, *(_QWORD *)&v41.translation.dy, (v20 >> 7) & 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v23, CFSTR("tf_components"));
      objc_msgSend((id)a1, "securityAnalysis");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "occlusionMask");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d %d %d %d"), (v25 >> 1) & 1, (v25 >> 2) & 1, (v25 >> 3) & 1, (v25 >> 4) & 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v26, CFSTR("occ_components"));
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)a1, "securityAnalysis");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "occlusionPercentage");
      if (v29 != 0.0)
      {
        v30 = v29;
        v31 = fabs(v30);
        v32 = v30 / v31;
        v33 = log10(v31);
        v34 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v33));
        v13 = v32 * (round(v31 * v34) / v34);
      }
      objc_msgSend(v27, "numberWithDouble:", v13);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v35, CFSTR("ocp"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "parentsHaveInsecureLayerProperties"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v36, CFSTR("pip"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v37, CFSTR("default"));

      objc_msgSend(v2, "setValue:forKey:", *(_QWORD *)(a1 + 24), CFSTR("sdkVersion"));
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_UISTouchAuthenticationRecord)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UISTouchAuthenticationRecord init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("_UISTouchAuthenticationRecord.m"), 126, CFSTR("cannot directly allocate _UISTouchAuthenticationRecord"));

  return 0;
}

+ (id)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_UISTouchAuthenticationRecord new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_UISTouchAuthenticationRecord.m"), 131, CFSTR("cannot directly allocate _UISTouchAuthenticationRecord"));

  return 0;
}

- (unint64_t)hash
{
  void *v3;

  -[BKSWindowServerHitTestSecurityAnalysis hash](self->_securityAnalysis, "hash");
  -[NSString hash](self->_hostBundleId, "hash");
  -[NSString hash](self->_hostSDKVersion, "hash");
  -[NSString hash](self->_serviceBundleId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_serviceInstanceIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hash");

  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && *((unsigned __int8 *)v5 + 32) == self->_hostIsInternal
      && BSEqualObjects()
      && v5[6] == self->_serviceInstanceIdentifier;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D22FA8], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_msgSend(v10, "appendObject:withName:", self->_securityAnalysis, CFSTR("securityAnalysis"));
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", self->_hostBundleId, CFSTR("hostBundleId"));
  v6 = (id)objc_msgSend(v10, "appendObject:withName:", self->_hostSDKVersion, CFSTR("hostSDKVersion"));
  v7 = (id)objc_msgSend(v10, "appendBool:withName:", self->_hostIsInternal, CFSTR("hostIsInternal"));
  v8 = (id)objc_msgSend(v10, "appendObject:withName:", self->_serviceBundleId, CFSTR("serviceBundleId"));
  v9 = (id)objc_msgSend(v10, "appendInteger:withName:", self->_serviceInstanceIdentifier, CFSTR("serviceInstanceIdentifier"));

}

- (BKSWindowServerHitTestSecurityAnalysis)securityAnalysis
{
  return self->_securityAnalysis;
}

- (NSString)hostBundleId
{
  return self->_hostBundleId;
}

- (NSString)hostSDKVersion
{
  return self->_hostSDKVersion;
}

- (BOOL)hostIsInternal
{
  return self->_hostIsInternal;
}

- (NSString)serviceBundleId
{
  return self->_serviceBundleId;
}

- (int64_t)serviceInstanceIdentifier
{
  return self->_serviceInstanceIdentifier;
}

+ (BOOL)shouldAuthenticateServiceBundleId:(id)a3
{
  return +[_UISTouchAuthenticationVerifier shouldAuthenticateServiceBundleId:](_UISTouchAuthenticationVerifier, "shouldAuthenticateServiceBundleId:", a3);
}

- (id)analyticsPayloadWithDuration:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  uint64_t v24;
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
  float v38;
  double v39;
  long double v40;
  long double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  long double v53;
  long double v54;
  double v55;
  double v56;
  double v57;
  void *v58;

  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)a1, "securityAnalysis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "hostBundleId");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = CFSTR("(unknown)");
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("hostBundleId"));

    if (*(_QWORD *)(a1 + 40))
      v9 = *(const __CFString **)(a1 + 40);
    else
      v9 = CFSTR("(unknown)");
    objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("serviceBundleId"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("touchIsAuthentic"));

    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v11, CFSTR("hasHitTestInfo"));

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "occlusionMask") != 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("detectedOcclusion"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "hasInsecureFilter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("hasInsecureFilter"));

      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "cumulativeOpacity");
      *(float *)&v16 = v15;
      v17 = 0.0;
      v18 = v15 == 0.0;
      v19 = 0.0;
      if (!v18)
      {
        v20 = fabs(*(float *)&v16);
        v21 = *(float *)&v16 / v20;
        v22 = log10(v20);
        v23 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v22));
        v16 = round(v20 * v23);
        v19 = v21 * (v16 / v23);
      }
      objc_msgSend(v14, "numberWithDouble:", v19, v16);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v24, CFSTR("cumulativeOpacity"));

      +[_UISTouchAuthenticationVerifier verifierForServiceBundleId:](_UISTouchAuthenticationVerifier, "verifierForServiceBundleId:", *(_QWORD *)(a1 + 40));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = objc_msgSend(v25, "transformGradeFailureReasonsForRecord:", a1);

      NSStringFromBOOL();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v26, CFSTR("hasInvalidTransform"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24 & 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v27, CFSTR("transformFailFiniteTransform"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 1) & 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v28, CFSTR("transformFailAffineTransform"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 2) & 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v29, CFSTR("transformFailAllowedRotation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 3) & 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v30, CFSTR("transformFailUniformScale"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 4) & 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v31, CFSTR("transformFailAllowedScale"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 5) & 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v32, CFSTR("transformFailAllowedShear"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 6) & 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v33, CFSTR("transformFailAllowedTranslation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v24 >> 7) & 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v34, CFSTR("transformFailAllowedShift"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "parentsHaveInsecureLayerProperties"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v35, CFSTR("parentsHaveInsecureLayerProperties"));

      v36 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)a1, "securityAnalysis");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "occlusionPercentage");
      if (v38 != 0.0)
      {
        v39 = v38;
        v40 = fabs(v39);
        v41 = v39 / v40;
        v42 = log10(v40);
        v43 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v42));
        v17 = v41 * (round(v40 * v43) / v43);
      }
      objc_msgSend(v36, "numberWithDouble:", v17);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v44, CFSTR("occlusionPercentage"));

      objc_msgSend((id)a1, "securityAnalysis");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "occlusionMask");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v46 >> 1) & 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v47, CFSTR("occlusionTypeLayer"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v46 >> 2) & 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v48, CFSTR("occlusionTypeClipped"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v46 >> 3) & 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v49, CFSTR("occlusionTypeBorder"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v46 >> 4) & 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v50, CFSTR("occlusionTypeLayerLimit"));

      if (a2)
      {
        v51 = (void *)MEMORY[0x1E0CB37E8];
        v52 = -[_UISTouchAuthenticationRecord timeSinceCreation](a1);
        if (v52 == 0.0)
        {
          v57 = 0.0;
        }
        else
        {
          v53 = fabs(v52);
          v54 = v52 / v53;
          v55 = log10(v53);
          v56 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v55));
          v57 = v54 * (round(v53 * v56) / v56);
        }
        objc_msgSend(v51, "numberWithDouble:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKey:", v58, CFSTR("duration"));

      }
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)timeSinceCreation
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  mach_timebase_info info;

  if (!a1)
    return 0.0;
  info = 0;
  mach_timebase_info(&info);
  v2 = mach_continuous_time();
  LODWORD(v4) = info.denom;
  LODWORD(v3) = info.numer;
  return (double)(v2 - *(_QWORD *)(a1 + 56)) * (double)v3 / (double)v4 / 1000000000.0;
}

- (_UISTouchAuthenticationRecord)initWithSecurityAnalysis:(id)a3 timestamp:(double)a4 hostBundleId:(id)a5 hostSDKVersion:(id)a6 hostIsInternal:(BOOL)a7 serviceBundleId:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _UISTouchAuthenticationRecord *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = (void *)objc_opt_class();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __127___UISTouchAuthenticationRecord_initWithSecurityAnalysis_timestamp_hostBundleId_hostSDKVersion_hostIsInternal_serviceBundleId___block_invoke;
  v24[3] = &unk_1E2CAF5E0;
  v25 = v13;
  v26 = v14;
  v29 = a7;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  objc_msgSend(v17, "build:", v24);
  v22 = (_UISTouchAuthenticationRecord *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)eventLeadToSensitiveDataTransmission
{
  return self->_eventLeadToSensitiveDataTransmission;
}

- (BOOL)shouldAllowEvents
{
  return self->_shouldAllowEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBundleId, 0);
  objc_storeStrong((id *)&self->_hostSDKVersion, 0);
  objc_storeStrong((id *)&self->_hostBundleId, 0);
  objc_storeStrong((id *)&self->_securityAnalysis, 0);
}

@end
