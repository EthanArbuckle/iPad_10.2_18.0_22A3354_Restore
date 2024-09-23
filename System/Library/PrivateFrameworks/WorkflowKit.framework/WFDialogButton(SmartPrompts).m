@implementation WFDialogButton(SmartPrompts)

- (id)smartPromptIntentButton
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC7D50]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithIdentifier:displayString:", v3, v4);

  return v5;
}

@end
