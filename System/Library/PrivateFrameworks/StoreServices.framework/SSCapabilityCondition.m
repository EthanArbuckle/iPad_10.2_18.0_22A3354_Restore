@implementation SSCapabilityCondition

- (BOOL)evaluateWithContext:(id)a3
{
  int64_t operator;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, _QWORD);
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const __CFBoolean *Value;
  BOOL v13;

  operator = self->super._operator;
  if (operator)
  {
    if (operator != 1)
    {
      v6 = 0;
LABEL_12:
      v13 = 0;
      goto LABEL_17;
    }
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  if (!v6)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, self->super._value, 0);
  v8 = (void *)SSVMobileInstallationFramework();
  v9 = (uint64_t (*)(void *, _QWORD))SSVWeakLinkedSymbolForString("MobileInstallationCheckCapabilitiesMatch", v8);
  if (v9 && (v10 = (const __CFDictionary *)v9(v7, 0)) != 0)
  {
    v11 = v10;
    Value = (const __CFBoolean *)CFDictionaryGetValue(v10, CFSTR("CapabilitiesMatch"));
    if (Value)
      v13 = CFBooleanGetValue(Value) != 0;
    else
      v13 = 0;
    CFRelease(v11);
  }
  else
  {
    v13 = 0;
  }

LABEL_17:
  return v13;
}

@end
