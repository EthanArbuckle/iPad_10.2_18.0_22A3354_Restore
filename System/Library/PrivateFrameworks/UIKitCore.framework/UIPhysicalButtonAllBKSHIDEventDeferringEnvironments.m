@implementation UIPhysicalButtonAllBKSHIDEventDeferringEnvironments

void ___UIPhysicalButtonAllBKSHIDEventDeferringEnvironments_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D00CA8], "ui_cameraCaptureButtonEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD80350;
  qword_1ECD80350 = v0;

}

@end
