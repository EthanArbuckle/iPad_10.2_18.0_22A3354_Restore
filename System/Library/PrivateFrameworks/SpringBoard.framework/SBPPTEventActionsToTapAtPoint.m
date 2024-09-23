@implementation SBPPTEventActionsToTapAtPoint

void __SBPPTEventActionsToTapAtPoint_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)*MEMORY[0x1E0CEB258];
  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a2;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyWindowForScreen:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:toView:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  objc_msgSend(v7, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v5, "tap:");

}

@end
