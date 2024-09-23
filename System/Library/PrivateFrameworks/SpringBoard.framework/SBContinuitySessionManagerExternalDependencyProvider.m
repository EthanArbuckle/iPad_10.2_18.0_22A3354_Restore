@implementation SBContinuitySessionManagerExternalDependencyProvider

void __61___SBContinuitySessionManagerExternalDependencyProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FDC0]), "initWithResourceType:andState:", 7, 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __80___SBContinuitySessionManagerExternalDependencyProvider__setResourceHintActive___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateState:", *(unsigned __int8 *)(a1 + 40)) & 1) == 0)
  {
    SBLogContinuitySession();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 40))
        v3 = CFSTR("started");
      else
        v3 = CFSTR("ended");
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Updating resource hint for continuity session %{public}@ returned NO ?!?!?!", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  v1 = (_BYTE *)(a1 + 32);
  if (*(_BYTE *)(a1 + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "MCSetBoolRestriction:value:", *MEMORY[0x1E0D47100], 0);
    objc_msgSend(v2, "MCSetBoolRestriction:value:", *MEMORY[0x1E0D46FD0], 0);
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v2, CFSTR("com.apple.springboard"), CFSTR("com.apple.springboard.continuityRestrictions"), 0, 0, 0, 0, &v6);
  v4 = v6;

  if (v4)
  {
    SBLogContinuitySession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke_cold_1(v1);

  }
}

void __80___SBContinuitySessionManagerExternalDependencyProvider__setRestrictionsActive___block_invoke_cold_1(_BYTE *a1)
{
  const __CFString *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = CFSTR("applying");
  if (!*a1)
    v1 = CFSTR("clearing");
  LODWORD(v4) = 138543618;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v2, v3, "Error %{public}@ continuity restrictions: %{public}@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2_0();
}

@end
