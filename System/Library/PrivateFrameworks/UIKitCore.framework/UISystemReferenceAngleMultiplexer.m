@implementation UISystemReferenceAngleMultiplexer

void __55___UISystemReferenceAngleMultiplexer_sharedMultiplexer__block_invoke()
{
  _UISystemReferenceAngleMultiplexer *v0;
  void *v1;

  v0 = objc_alloc_init(_UISystemReferenceAngleMultiplexer);
  v1 = (void *)qword_1ECD7F648;
  qword_1ECD7F648 = (uint64_t)v0;

}

id __84___UISystemReferenceAngleMultiplexer_systemReferenceAngleDidChange_mode_forWindows___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "_contextId");
  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
