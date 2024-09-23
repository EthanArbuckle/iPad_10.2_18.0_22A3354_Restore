@implementation SBSSKExternalDisplayServiceParticipantSceneExtension

+ (id)settingsExtensions
{
  return 0;
}

+ (id)clientSettingsExtensions
{
  return 0;
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (id)hostComponents
{
  return 0;
}

+ (id)clientComponents
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
