@implementation UIBarsTwoPartCrossfadeTransitionProgress

void ___UIBarsTwoPartCrossfadeTransitionProgress_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___UIBarsTwoPartCrossfadeTransitionProgress_block_invoke_2;
  v6[3] = &unk_1E16B2560;
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, 0.0, 0.3);
  v3[0] = v2;
  v3[1] = 3221225472;
  v3[2] = ___UIBarsTwoPartCrossfadeTransitionProgress_block_invoke_3;
  v3[3] = &unk_1E16B2560;
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v3, 0.7, 0.3);

}

uint64_t ___UIBarsTwoPartCrossfadeTransitionProgress_block_invoke_2(uint64_t result)
{
  if (*(double *)(result + 40) < 0.3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t ___UIBarsTwoPartCrossfadeTransitionProgress_block_invoke_3(uint64_t result)
{
  if (*(double *)(result + 40) >= 0.3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t ___UIBarsTwoPartCrossfadeTransitionProgress_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
