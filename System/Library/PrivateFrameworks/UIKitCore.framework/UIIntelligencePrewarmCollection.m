@implementation UIIntelligencePrewarmCollection

void ___UIIntelligencePrewarmCollection_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "_userInterfaceIdiom");
  if (v4 == 3)
  {
    v5 = a1[5];
  }
  else
  {
    if (v4)
      goto LABEL_6;
    v5 = a1[4];
  }
  *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 1;
LABEL_6:
  v6 = objc_msgSend(v3, "_isEmbeddedScreen");

  if (v6)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

void ___UIIntelligencePrewarmCollection_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backlightState");

  }
  if (*(_BYTE *)(a1 + 33))
  {
    +[_UICarPlaySession sharedInstance]();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_UICarPlaySession carSessionStatus]((uint64_t)v3);

  }
}

@end
