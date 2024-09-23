@implementation SVXSpeechSynthesisResultConverter

- (id)toServiceCommandResult:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "type");
  if (v3 == 2)
  {
    +[SVXServiceCommandResult resultIgnored](SVXServiceCommandResult, "resultIgnored");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 == 1)
      +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    else
      +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
