@implementation TRINamespaceLogPolicy

+ (BOOL)shouldPrivacyFilterNamespace:(id)a3 policy:(unsigned __int8)a4
{
  int v4;
  id v5;
  char v6;

  v4 = a4;
  v5 = a3;
  if (v4 == 2 || v4 == 1 && (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) == 0)
  {
    if ((objc_msgSend(&unk_1E3C19478, "containsObject:", v5) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("FED_STATS_BIOME"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
