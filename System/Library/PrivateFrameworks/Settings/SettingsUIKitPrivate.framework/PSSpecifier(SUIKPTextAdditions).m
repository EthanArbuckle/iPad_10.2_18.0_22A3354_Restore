@implementation PSSpecifier(SUIKPTextAdditions)

- (uint64_t)suikp_keyboardType
{
  return *(_QWORD *)(a1 + (int)*MEMORY[0x24BE75758]);
}

- (uint64_t)suikp_autoCapsType
{
  return *(_QWORD *)(a1 + (int)*MEMORY[0x24BE75728]);
}

- (uint64_t)suikp_autoCorrectionType
{
  return *(_QWORD *)(a1 + (int)*MEMORY[0x24BE75730]);
}

@end
