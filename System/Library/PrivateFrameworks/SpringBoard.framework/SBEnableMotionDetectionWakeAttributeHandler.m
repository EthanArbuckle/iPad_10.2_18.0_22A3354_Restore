@implementation SBEnableMotionDetectionWakeAttributeHandler

+ (id)attributeClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
  BSDispatchMain();
}

void __70__SBEnableMotionDetectionWakeAttributeHandler_activateWithFirstEntry___block_invoke()
{
  id v0;

  +[SBAmbientMotionDetectionWakeAttributeMonitor sharedInstance](SBAmbientMotionDetectionWakeAttributeMonitor, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_setShouldEnableMotionDetectionWake:", 1);

}

- (void)deactivateWithFinalEntry:(id)a3
{
  BSDispatchMain();
}

void __72__SBEnableMotionDetectionWakeAttributeHandler_deactivateWithFinalEntry___block_invoke()
{
  id v0;

  +[SBAmbientMotionDetectionWakeAttributeMonitor sharedInstance](SBAmbientMotionDetectionWakeAttributeMonitor, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_setShouldEnableMotionDetectionWake:", 0);

}

@end
