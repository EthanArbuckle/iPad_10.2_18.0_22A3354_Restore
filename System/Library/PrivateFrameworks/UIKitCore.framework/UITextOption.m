@implementation UITextOption

void __55___UITextOption_insetMultiplierForContentSizeCategory___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UICTContentSizeCategoryXL");
  v2[1] = CFSTR("UICTContentSizeCategoryXXL");
  v3[0] = &unk_1E1A957D0;
  v3[1] = &unk_1E1A957E0;
  v2[2] = CFSTR("UICTContentSizeCategoryXXXL");
  v2[3] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v3[2] = &unk_1E1A957F0;
  v3[3] = &unk_1E1A95800;
  v2[4] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v2[5] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v3[4] = &unk_1E1A95810;
  v3[5] = &unk_1E1A95820;
  v2[6] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v2[7] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v3[6] = &unk_1E1A95830;
  v3[7] = &unk_1E1A95840;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_23_2;
  _MergedGlobals_23_2 = v0;

}

void __31___UITextOption_baseSymbolSize__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UICTContentSizeCategoryXL");
  v2[1] = CFSTR("UICTContentSizeCategoryXXL");
  v3[0] = &unk_1E1A97BC0;
  v3[1] = &unk_1E1A97BD8;
  v2[2] = CFSTR("UICTContentSizeCategoryXXXL");
  v2[3] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v3[2] = &unk_1E1A97BF0;
  v3[3] = &unk_1E1A95850;
  v2[4] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v2[5] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v3[4] = &unk_1E1A95850;
  v3[5] = &unk_1E1A95850;
  v2[6] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v2[7] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v3[6] = &unk_1E1A95850;
  v3[7] = &unk_1E1A95850;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B780;
  qword_1ECD7B780 = v0;

}

@end
