@implementation RBSLegacyAttribute(RBProcessState)

- (void)applyToAcquisitionContext:()RBProcessState
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "acquisitionPolicy"))
  {
    v5 = objc_msgSend(a1, "requestedReason");
    objc_msgSend(v4, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1
      || v5 == 9
      && (objc_msgSend(v6, "explanation"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.extension.session")),
          v8,
          v9))
    {
      rbs_assertion_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_INFO, "forcing acquisition after state application for assertion %@", (uint8_t *)&v12, 0xCu);

      }
      objc_msgSend(v4, "setAcquisitionPolicy:", 1);
    }

  }
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSLegacyAttribute+RBProcessState.m"), 346, CFSTR("must provide error outparam"));

  }
  if (objc_msgSend(a1, "requestedReason") == 9)
  {
    objc_msgSend(v7, "targetIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isXPCService");

    if (v9)
    {
      rbs_assertion_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "assertionDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v12;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Mutating assertion %{public}@ reason from ViewService to Extension because it targets an xpc service.", buf, 0xCu);

      }
      objc_msgSend(a1, "setReason:", 13);
    }
  }
  v30 = 0;
  v13 = -[RBSLegacyAttribute _isOriginatorValidForContext:errorReason:](a1, v7, (const __CFString **)&v30);
  v14 = v30;
  v15 = (__CFString *)v14;
  if (v13)
  {
    v29 = 0;
    v16 = -[RBSLegacyAttribute _isTargetValidForContext:errorReason:]((uint64_t)a1, v7, (const __CFString **)&v29);
    v17 = v29;

    if ((v16 & 1) != 0)
    {
      v18 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    v17 = (__CFString *)v14;
  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSLegacyAttribute+RBProcessState.m"), 356, CFSTR("no failure reason provided"));

  }
  rbs_assertion_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[RBSLegacyAttribute(RBProcessState) isValidForContext:withError:].cold.1(v17);

  v20 = (void *)MEMORY[0x24BDD1540];
  v21 = *MEMORY[0x24BE80D88];
  v22 = *MEMORY[0x24BDD0FD8];
  v32[0] = v17;
  v23 = *MEMORY[0x24BE80D80];
  v31[0] = v22;
  v31[1] = v23;
  objc_msgSend(a1, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 2, v25);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v18 = 0;
LABEL_17:

  return v18;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  id v6;
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6 != a1 && (v7 = objc_opt_class(), v7 == objc_opt_class()))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribute conflict: attribute %@ conflicts with attribute %@"), a1, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BE80D88];
      v13 = *MEMORY[0x24BDD0FD8];
      v14[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 2, v12);
      *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }

  return a4;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  RBProcessCPUMaximumLimits *v45;
  RBProcessCPUMaximumLimits *v46;
  RBProcessCPUMaximumLimits *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[15];
  unsigned __int8 v51;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "isActiveDueToInheritedEndowment"))
  {
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8);
    goto LABEL_62;
  }
  v10 = -[RBSLegacyAttribute _explicitJetsamBand:](a1, v8);
  if (v10 > objc_msgSend(v7, "explicitJetsamBand"))
    objc_msgSend(v7, "setExplicitJetsamBand:", v10);
  v11 = objc_msgSend(v7, "memoryLimit");
  objc_msgSend(v8, "target");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "process");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSObject memoryLimits](v9, "memoryLimits");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v10 == 100
      || objc_msgSend(a1, "reason") == 9
      && (objc_msgSend(v8, "assertion"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "explanation"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.viewservice.session")),
          v16,
          v15,
          v17)
      && v10 == 80)
    {
      v14 = (id)*MEMORY[0x24BE80E08];
    }
    else
    {
      v14 = (id)*MEMORY[0x24BE80E10];
      if (v10)
        objc_msgSend(v7, "setPreventBaseMemoryLimitReduction:", 1);
    }
    v51 = 2;
    v18 = -[NSObject memoryLimitForCategory:strength:](v13, "memoryLimitForCategory:strength:", v14, &v51);
    if (v11 == (_DWORD)v18)
    {
      v19 = v51;
      v20 = objc_msgSend(v7, "memoryLimitStrength");
      if (v19 <= v20)
        v21 = v20;
      else
        v21 = v19;
      objc_msgSend(v7, "setMemoryLimitStrength:", v21);
    }
    else if (v11 < (int)v18)
    {
      v22 = v18;
      objc_msgSend(v7, "setMemoryLimitCategory:", v14);
      objc_msgSend(v7, "setMemoryLimitStrength:", v51);
      objc_msgSend(v7, "setMemoryLimit:", v22);
    }

  }
  else
  {
    rbs_assertion_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v13, OS_LOG_TYPE_INFO, "applying Legacy Assertion to process state without concrete target", buf, 2u);
    }
  }

  v23 = -[RBSLegacyAttribute _role](a1);
  if (v23 > objc_msgSend(v7, "role"))
  {
    if (v23 >= 2)
      objc_msgSend(v7, "setPreventSuspend:", 1);
    objc_msgSend(v7, "setRole:", v23);
  }
  v24 = -[RBSLegacyAttribute _terminationResistance]((uint64_t)a1);
  if (v24 > objc_msgSend(v7, "terminationResistance"))
    objc_msgSend(v7, "setTerminationResistance:", v24);
  if (a1)
  {
    if ((objc_msgSend(a1, "flags") & 4) == 0)
    {
      objc_msgSend(v7, "setPreventIdleSleep:", 1);
      v25 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "assertionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assertion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "explanation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "reason");
      NSStringFromRBSLegacyReason();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@:%@(%@)"), v26, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addPreventIdleSleepIdentifier:", v30);

    }
    if ((objc_msgSend(a1, "flags") & 0x20) != 0)
      goto LABEL_35;
  }
  if ((unint64_t)objc_msgSend(v7, "explicitJetsamBand") >= 0x50)
  {
LABEL_35:
    if (objc_msgSend(v7, "gpuRole") <= 1)
      objc_msgSend(v7, "setGPURole:", 2);
  }
  if (a1 && (objc_msgSend(a1, "reason") == 9 || objc_msgSend(a1, "reason") == 13))
    objc_msgSend(v7, "setTargetedBySuspendableAssertion:", 1);
  objc_msgSend(v8, "targetIdentity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "embeddedApplicationIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  if (v33)
  {
    if ((objc_msgSend(v7, "jetsamLenientMode") & 1) == 0)
    {
      objc_msgSend(v8, "availableInheritances");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "allNamespaces");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "containsObject:", *MEMORY[0x24BE80EA0]);

      if (v36)
        objc_msgSend(v7, "setJetsamLenientMode:", 1);
    }
  }
  v37 = objc_msgSend(a1, "reason");
  if (v37 == 10008)
    objc_msgSend(v7, "setThrottleBestEffortNetworking:", 1);
  if (a1)
  {
    v38 = objc_msgSend(a1, "reason") - 19;
    if (v38 > 4)
      v39 = 80;
    else
      v39 = qword_21A92FC68[v38];
    v40 = -[RBSLegacyAttribute _maxCPUDuration]((uint64_t)a1);
LABEL_52:
    objc_msgSend(v8, "targetProcess");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isPlatformBinary");

    if ((v42 & 1) == 0)
    {
      if (a1)
      {
        v43 = objc_msgSend(a1, "reason");
        if (v43 <= 0x17 && ((1 << v43) & 0xA80010) != 0)
          v44 = 1;
        else
          v44 = 2;
      }
      else
      {
        v44 = 0;
      }
      v45 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:]([RBProcessCPUMaximumLimits alloc], "initWithPercentage:duration:violationPolicy:", v39, v40, v44);
      v46 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:]([RBProcessCPUMaximumLimits alloc], "initWithPercentage:duration:violationPolicy:", 80, 180, 0);
      v47 = -[RBProcessCPUMaximumLimits initWithPercentage:duration:violationPolicy:]([RBProcessCPUMaximumLimits alloc], "initWithPercentage:duration:violationPolicy:", 80, 180, 0);
      objc_msgSend(v7, "setMaxCPUUsageLimits:forRole:", v45, 2);
      objc_msgSend(v7, "setMaxCPUUsageLimits:forRole:", v45, 4);
      objc_msgSend(v7, "setMaxCPUUsageLimits:forRole:", v46, 5);
      objc_msgSend(v7, "setMaxCPUUsageLimits:forRole:", v47, 7);

    }
    goto LABEL_58;
  }
  v49 = -[RBSLegacyAttribute _maxCPUDuration](0);
  if (v49)
  {
    v40 = v49;
    v39 = 0;
    goto LABEL_52;
  }
LABEL_58:
  v48 = objc_msgSend(v7, "legacyFinishTaskReason");
  if (-[RBSLegacyAttribute _isLegacyReasonFinishableTask:]((_BOOL8)a1, v37) && v48 - 1 >= v37)
    objc_msgSend(v7, "setLegacyFinishTaskReason:", v37);

LABEL_62:
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t started;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a5;
  -[RBSLegacyAttribute _mutateReasonWithContext:](a1, v8);
  if (objc_msgSend(v8, "isActiveDueToInheritedEndowment"))
  {
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8);
LABEL_34:

    goto LABEL_35;
  }
  if (applyToAssertionIntransientState_attributePath_context__onceToken != -1)
    dispatch_once(&applyToAssertionIntransientState_attributePath_context__onceToken, &__block_literal_global);
  v10 = -[RBSLegacyAttribute _invalidationDurationExpiringTaskCompletionsQuickly:](a1, applyToAssertionIntransientState_attributePath_context__expireTaskCompletionsQuickly);
  objc_msgSend(v7, "invalidationDuration");
  if (v10 > v11)
    objc_msgSend(v7, "setInvalidationDuration:", v10);
  if (v10 == 0.0)
    v12 = 0.0;
  else
    v12 = 5.0;
  objc_msgSend(v7, "warningDuration");
  if (v12 > v13)
    objc_msgSend(v7, "setWarningDuration:", v12);
  started = -[RBSLegacyAttribute _startPolicy]((uint64_t)a1);
  if (started > objc_msgSend(v7, "startPolicy"))
    objc_msgSend(v7, "setStartPolicy:", started);
  v15 = 2 * (a1 != 0);
  if (v15 > objc_msgSend(v7, "endPolicy"))
    objc_msgSend(v7, "setEndPolicy:", v15);
  if (a1 && (objc_msgSend(a1, "reason") == 9 || objc_msgSend(a1, "reason") == 13))
    objc_msgSend(v7, "setSuspendsOnOriginatorSuspension:", 1);
  if (-[RBSLegacyAttribute _definesRelativeStartTime]((uint64_t)a1))
    objc_msgSend(v7, "setDefinesRelativeStartTime:", 1);
  if (objc_msgSend(a1, "reason"))
    objc_msgSend(v7, "setLegacyReason:", objc_msgSend(a1, "reason"));
  if (-[RBSLegacyAttribute _role](a1) >= 2)
    objc_msgSend(v7, "setPreventsSuspension:", 1);
  if (_os_feature_enabled_impl())
  {
    v16 = -[RBSLegacyAttribute _invalidateOnThermalLevel]((uint64_t)a1);
    objc_msgSend(v7, "invalidatesOnConditions");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInvalidatesOnConditions:", v9);
    }
    -[NSObject objectForKey:](v9, "objectForKey:", CFSTR("therm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17 || v16 < objc_msgSend(v17, "integerValue"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forKey:](v9, "setValue:forKey:", v19, CFSTR("therm"));

    }
    goto LABEL_34;
  }
LABEL_35:

}

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  unsigned __int8 v12;
  unsigned int v13;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "isActiveDueToInheritedEndowment"))
  {
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBSLegacyAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8);

  }
  else
  {
    if (objc_msgSend((id)a1, "reason"))
    {
      NSStringFromRBSLegacyReason();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTag:", v10);

    }
    if (a1)
    {
      v11 = objc_msgSend((id)a1, "reason");
      if (v11 <= 0x17 && ((1 << v11) & 0xA80010) != 0)
        a1 = 1;
      else
        a1 = 2;
    }
    v12 = 2;
    do
    {
      v13 = v12;
      if (a1 > objc_msgSend(v7, "maxCPUUsageViolationPolicyForRole:", v12))
        objc_msgSend(v7, "setMaxCPUUsageViolationPolicy:forRole:", a1, v12);
      ++v12;
    }
    while (v13 < 4);
  }

}

- (BOOL)preventsSuspension
{
  return -[RBSLegacyAttribute _role](a1) > 1;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "assertion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21A8B4000, v2, v3, "Not applying RBSLegacyAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)isValidForContext:()RBProcessState withError:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21A8B4000, v1, v2, "legacy assertion validation failed: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end
