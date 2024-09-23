@implementation PXStoryPublicErrorSimulatedRecoveryAttempter

void __86___PXStoryPublicErrorSimulatedRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("Simulated Recovery"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The simulated recovery option #%li was selected."), *(_QWORD *)(a1 + 32) + 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v4);

}

@end
