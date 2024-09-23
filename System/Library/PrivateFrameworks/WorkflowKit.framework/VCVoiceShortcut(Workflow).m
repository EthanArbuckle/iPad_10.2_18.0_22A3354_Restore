@implementation VCVoiceShortcut(Workflow)

- (WFWorkflow)workflow
{
  void *v1;
  WFWorkflow *v2;

  objc_msgSend(a1, "shortcut");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = -[WFWorkflow initWithShortcut:error:]([WFWorkflow alloc], "initWithShortcut:error:", v1, 0);
  else
    v2 = 0;

  return v2;
}

@end
