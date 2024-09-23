@implementation UIApplicationIsPasswordManagerExtension

void ___UIApplicationIsPasswordManagerExtension_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if (qword_1EDDC80D0 != -1)
    dispatch_once(&qword_1EDDC80D0, &__block_literal_global_902);
  if (byte_1EDDC7FFB)
  {
    objc_msgSend(MEMORY[0x1E0CA58E0], "extensionPointRecordForCurrentProcess");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (v0)
    {
      v2 = v0;
      objc_msgSend(v0, "identifier");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      byte_1EDDC8002 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.authentication-services-credential-provider-ui"));

      v0 = v2;
    }

  }
}

@end
