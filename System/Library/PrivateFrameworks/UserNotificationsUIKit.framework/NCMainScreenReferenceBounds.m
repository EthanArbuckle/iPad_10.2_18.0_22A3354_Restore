@implementation NCMainScreenReferenceBounds

void __NCMainScreenReferenceBounds_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  NCMainScreenReferenceBounds___mainScreenReferenceBounds_0 = v0;
  NCMainScreenReferenceBounds___mainScreenReferenceBounds_1 = v1;
  NCMainScreenReferenceBounds___mainScreenReferenceBounds_2 = v2;
  NCMainScreenReferenceBounds___mainScreenReferenceBounds_3 = v3;

}

@end
