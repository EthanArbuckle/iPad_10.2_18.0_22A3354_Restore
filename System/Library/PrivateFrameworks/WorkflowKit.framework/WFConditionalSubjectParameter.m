@implementation WFConditionalSubjectParameter

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (id)importQuestionBehavior
{
  __CFString *v2;

  v2 = CFSTR("NotSupported");
  return CFSTR("NotSupported");
}

- (id)defaultSupportedVariableTypes
{
  return (id)objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
}

- (id)disallowedVariableTypes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Ask"), 0);
}

@end
