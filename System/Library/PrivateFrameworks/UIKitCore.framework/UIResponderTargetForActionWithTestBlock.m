@implementation UIResponderTargetForActionWithTestBlock

uint64_t ___UIResponderTargetForActionWithTestBlock_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 20);
  v1 = (void *)_MergedGlobals_996;
  _MergedGlobals_996 = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 20);
  v3 = (void *)qword_1ECD7D368;
  qword_1ECD7D368 = v2;

  result = dyld_program_sdk_at_least();
  v5 = 2;
  if (!(_DWORD)result)
    v5 = 0;
  qword_1ECD7D370 = v5;
  return result;
}

@end
