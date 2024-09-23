@implementation WFTrigger(ContentInput)

- (uint64_t)contentCollectionWithEventInfo:()ContentInput
{
  return 0;
}

- (uint64_t)requiresEventInfoAsInput
{
  return 0;
}

- (uint64_t)eventInfoForEvent:()ContentInput
{
  return 0;
}

- (uint64_t)eventInfoForEvent:()ContentInput completion:
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

@end
