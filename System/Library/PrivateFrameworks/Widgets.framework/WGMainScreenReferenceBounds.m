@implementation WGMainScreenReferenceBounds

void __WGMainScreenReferenceBounds_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  CGRect v7;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_0 = v1;
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_1 = v2;
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_2 = v3;
  WGMainScreenReferenceBounds___mainScreenReferenceBounds_3 = v4;

  *(_QWORD *)&v7.origin.x = WGMainScreenReferenceBounds___mainScreenReferenceBounds_0;
  *(_QWORD *)&v7.origin.y = WGMainScreenReferenceBounds___mainScreenReferenceBounds_1;
  *(_QWORD *)&v7.size.width = WGMainScreenReferenceBounds___mainScreenReferenceBounds_2;
  *(_QWORD *)&v7.size.height = WGMainScreenReferenceBounds___mainScreenReferenceBounds_3;
  if (CGRectIsEmpty(v7))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRect WGMainScreenReferenceBounds(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WGGeometry.m"), 28, CFSTR("Failed to initialize main screen reference bounds!"));

  }
}

@end
