@implementation SSSimulatedCrash

+ (void)simulateCrashWithFormat:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (SSIsInternalBuild())
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v6);
    objc_msgSend(a1, "simulateCrashWithString:", v5);

  }
}

+ (void)simulateCrashWithString:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  if (SSIsInternalBuild())
  {
    v3 = getpid();
    softLinkSimulateCrash(v3, 195939070, v4);
  }

}

@end
