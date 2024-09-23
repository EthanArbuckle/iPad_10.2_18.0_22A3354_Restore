@implementation LNSnippetEnvironment(WorkflowUICore)

- (uint64_t)initWithSize:()WorkflowUICore locale:traitCollection:
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  double v24;
  double v25;
  BOOL ShouldDifferentiateWithoutColor;
  BOOL IsInvertColorsEnabled;
  BOOL IsReduceMotionEnabled;
  uint64_t v29;
  uint64_t v31;
  id v32;

  v9 = a6;
  v32 = a5;
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBE0B8];
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE0B8]) & 1) != 0)
  {
LABEL_2:
    v12 = 3;
    goto LABEL_29;
  }
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE0D8]) & 1) != 0)
  {
    v12 = -1;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE0A8]) & 1) != 0)
  {
    v12 = 0;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE0D0]) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE0C0]) & 1) == 0)
    {
      if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
      {
        if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE0A0]) & 1) != 0)
        {
          v12 = 4;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE098]) & 1) != 0)
        {
          v12 = 5;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE090]) & 1) != 0)
        {
          v12 = 6;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE078]) & 1) != 0)
        {
          v12 = 7;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE070]) & 1) != 0)
        {
          v12 = 8;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE068]) & 1) != 0)
        {
          v12 = 9;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0)
        {
          v12 = 10;
        }
        else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEBE058]))
        {
          v12 = 11;
        }
        else
        {
          v12 = 3;
        }
        goto LABEL_29;
      }
      goto LABEL_2;
    }
    v12 = 2;
  }
LABEL_29:

  v13 = objc_msgSend(v9, "legibilityWeight");
  v14 = objc_msgSend(v9, "layoutDirection");
  v15 = objc_msgSend(v9, "userInterfaceStyle");
  if (v15 >= 3)
    v16 = 0;
  else
    v16 = v15 - 1;
  v17 = objc_msgSend(v9, "accessibilityContrast");
  if ((unint64_t)(v17 + 1) >= 3)
    v18 = 0;
  else
    v18 = v17;
  if (v14)
    v19 = -1;
  else
    v19 = 0;
  if (v14 == 1)
    v20 = 1;
  else
    v20 = v19;
  if (v13)
    v21 = -1;
  else
    v21 = 0;
  if (v13 == 1)
    v22 = 1;
  else
    v22 = v21;
  v23 = objc_msgSend(v9, "displayGamut") == 1;
  objc_msgSend(v9, "displayScale");
  v25 = v24;
  ShouldDifferentiateWithoutColor = UIAccessibilityShouldDifferentiateWithoutColor();
  IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  BYTE3(v31) = UIAccessibilityIsReduceTransparencyEnabled();
  BYTE2(v31) = IsReduceMotionEnabled;
  BYTE1(v31) = IsInvertColorsEnabled;
  LOBYTE(v31) = ShouldDifferentiateWithoutColor;
  v29 = objc_msgSend(a1, "initWithSize:locale:dynamicTypeSize:legibilityWeight:layoutDirection:colorScheme:colorSchemeContrast:displayScale:displayGamut:accessibilityDifferentiateWithoutColor:accessibilityInvertColors:accessibilityReduceMotion:accessibilityReduceTransparency:", v32, v12, v22, v20, v16, v18, a2, a3, v25, v23, v31);

  return v29;
}

@end
