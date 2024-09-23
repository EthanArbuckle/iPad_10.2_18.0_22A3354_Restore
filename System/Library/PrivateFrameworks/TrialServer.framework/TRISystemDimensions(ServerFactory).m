@implementation TRISystemDimensions(ServerFactory)

+ (id)fullSystemDimensions:()ServerFactory
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = (void *)MEMORY[0x1E0DC0F80];
  v4 = a3;
  objc_msgSend(v3, "systemDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[TRIUserAdjustableSettings getExperimentOptOut:](TRIUserAdjustableSettings, "getExperimentOptOut:", v4);

  objc_msgSend(v5, "setExperimentOptOutStatus:", v6);
  return v5;
}

@end
