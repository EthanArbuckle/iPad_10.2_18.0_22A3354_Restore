@implementation VUIDeviceMediaLibrary

- (BOOL)isUpdating
{
  return 0;
}

- (BOOL)isInitialUpdateInProgress
{
  return 0;
}

- (BOOL)didFailUpdateCloudLibrary
{
  return 0;
}

- (void)updateProgressWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("completionHandler"));
    v3 = 0;
  }
  (*((void (**)(float))v3 + 2))(1.0);

}

@end
