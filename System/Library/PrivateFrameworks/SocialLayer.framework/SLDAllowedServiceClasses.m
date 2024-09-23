@implementation SLDAllowedServiceClasses

void __SLDAllowedServiceClasses_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SLDAllowedServiceClasses_sClasses;
  SLDAllowedServiceClasses_sClasses = v0;

}

@end
