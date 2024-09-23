@implementation WFChooseFromMenuArrayParameter

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (id)allowedValueTypes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7B8B4A0, 0);
}

@end
