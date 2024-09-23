@implementation CALayer

void __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
  LODWORD(v2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setOpacity:", v2);
  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_2;
  v4[3] = &unk_1E94625B8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setCompletionBlock:", v4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_3;
  v1[3] = &unk_1E94625B8;
  v2 = *(id *)(a1 + 32);
  vk_dispatchMainAfterDelay(v1, 0.5);

}

uint64_t __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

@end
