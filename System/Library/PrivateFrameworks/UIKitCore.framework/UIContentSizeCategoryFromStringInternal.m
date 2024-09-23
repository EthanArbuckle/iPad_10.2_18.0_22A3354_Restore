@implementation UIContentSizeCategoryFromStringInternal

void ___UIContentSizeCategoryFromStringInternal_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];

  v2[13] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("_UICTContentSizeCategoryUnspecified");
  v2[1] = CFSTR("UICTContentSizeCategoryXS");
  v2[2] = CFSTR("UICTContentSizeCategoryS");
  v2[3] = CFSTR("UICTContentSizeCategoryM");
  v2[4] = CFSTR("UICTContentSizeCategoryL");
  v2[5] = CFSTR("UICTContentSizeCategoryXL");
  v2[6] = CFSTR("UICTContentSizeCategoryXXL");
  v2[7] = CFSTR("UICTContentSizeCategoryXXXL");
  v2[8] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v2[9] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v2[10] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v2[11] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v2[12] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81A80;
  qword_1ECD81A80 = v0;

}

@end
