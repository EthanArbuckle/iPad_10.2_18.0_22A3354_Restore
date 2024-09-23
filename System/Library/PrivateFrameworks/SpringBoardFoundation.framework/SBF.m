@implementation SBF

uint64_t ___SBF_Private_IsN84OrSimilarDevice_block_invoke()
{
  uint64_t result;

  result = SBFEffectiveArtworkSubtype();
  _SBF_Private_IsN84OrSimilarDevice_isN84OrSimilarDevice = result == 1792;
  return result;
}

uint64_t ___SBF_Private_IsN84ZoomedOrSimilarDevice_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = SBFEffectiveArtworkSubtype();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nativeScale");

  if (v0 == 1792)
    result = BSFloatEqualToFloat();
  else
    result = 0;
  _SBF_Private_IsN84ZoomedOrSimilarDevice_isN84Zoomed4OrSimilarDevice = result;
  return result;
}

uint64_t ___SBF_Private_IsD33OrSimilarDevice_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _SBF_Private_IsD33OrSimilarDevice_isD33OrSimilarDevice = (result & 0xFFFFFFFE) == 18;
  return result;
}

void ___SBF_Private_IsD52OrSimilarDevice_block_invoke()
{
  int v0;
  void *v1;
  char v2;

  v0 = MGGetSInt32Answer();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nativeScale");

  if (v0 == 22)
    v2 = BSFloatEqualToFloat() ^ 1;
  else
    v2 = 0;
  _SBF_Private_IsD52OrSimilarDevice_isD52OrSimilarDevice = v2;
}

uint64_t ___SBF_Private_IsD52ZoomedOrSimilarDevice_block_invoke()
{
  int v0;
  void *v1;
  uint64_t result;

  v0 = MGGetSInt32Answer();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nativeScale");

  if (v0 == 22)
    result = BSFloatEqualToFloat();
  else
    result = 0;
  _SBF_Private_IsD52ZoomedOrSimilarDevice_isD52ZoomedOrSimilarDevice = result;
  return result;
}

void ___SBF_Private_IsD54_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD54_isD54 = objc_msgSend(v1, "hasPrefix:", CFSTR("D54"));
}

void ___SBF_Private_IsD53_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD53_isD53 = objc_msgSend(v1, "hasPrefix:", CFSTR("D53"));
}

void ___SBF_Private_IsD16_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD16_isD16 = objc_msgSend(v1, "hasPrefix:", CFSTR("D16"));
}

void ___SBF_Private_IsD17_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD17_isD17 = objc_msgSend(v1, "hasPrefix:", CFSTR("D17"));
}

void ___SBF_Private_IsD63_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD63_isD63 = objc_msgSend(v1, "hasPrefix:", CFSTR("D63"));
}

void ___SBF_Private_IsD64_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD64_isD64 = objc_msgSend(v1, "hasPrefix:", CFSTR("D64"));
}

void ___SBF_Private_IsD63Like_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("D17")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D27")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D63")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D73")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D37")) & 1) != 0
    || (_SBF_Private_IsD63Like_isD63Like = objc_msgSend(v2, "hasPrefix:", CFSTR("D83")),
        (_SBF_Private_IsD63Like_isD63Like & 1) != 0))
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v2, "hasPrefix:", CFSTR("D47"));
  }
  _SBF_Private_IsD63Like_isD63Like = v1;

}

void ___SBF_Private_IsD64Like_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("D64")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D28")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D74")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("D38")) & 1) != 0
    || (_SBF_Private_IsD64Like_isD64Like = objc_msgSend(v2, "hasPrefix:", CFSTR("D84")),
        (_SBF_Private_IsD64Like_isD64Like & 1) != 0))
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v2, "hasPrefix:", CFSTR("D48"));
  }
  _SBF_Private_IsD64Like_isD64Like = v1;

}

void ___SBF_Private_IsD93Like_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD93Like_isD93Like = objc_msgSend(v1, "hasPrefix:", CFSTR("D93"));
}

void ___SBF_Private_IsD94Like_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productHardwareModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _SBF_Private_IsD94Like_isD94Like = objc_msgSend(v1, "hasPrefix:", CFSTR("D94"));
}

@end
