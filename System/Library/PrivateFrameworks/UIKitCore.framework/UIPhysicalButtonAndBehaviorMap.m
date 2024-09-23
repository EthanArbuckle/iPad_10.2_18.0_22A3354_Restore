@implementation UIPhysicalButtonAndBehaviorMap

void ___UIPhysicalButtonAndBehaviorMap_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E1A965A0;
  v2[1] = &unk_1E1A96528;
  v3[0] = &unk_1E1A92AB0;
  v3[1] = &unk_1E1A92AC8;
  v2[2] = &unk_1E1A96540;
  v3[2] = &unk_1E1A92AE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7CA60;
  qword_1ECD7CA60 = v0;

}

@end
