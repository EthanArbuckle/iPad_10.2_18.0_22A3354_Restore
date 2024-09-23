@implementation UITextField(WFAlertTextField)

- (uint64_t)suggestions
{
  return 0;
}

- (void)setSuggestions:()WFAlertTextField
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  getWFGeneralLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315138;
    v2 = "-[UITextField(WFAlertTextField) setSuggestions:]";
    _os_log_impl(&dword_227027000, v0, OS_LOG_TYPE_ERROR, "%s You tried to set suggestions on a text field that doesn't support it. You should check +usesSuggestions first.", (uint8_t *)&v1, 0xCu);
  }

}

- (uint64_t)alertTextInputMode
{
  return 0;
}

- (id)alertClearButtonMode
{
  return WFClearButtonModeFromMode(objc_msgSend(a1, "clearButtonMode"));
}

- (uint64_t)setAlertClearButtonMode:()WFAlertTextField
{
  return objc_msgSend(a1, "setClearButtonMode:", WFClearButtonModeFromString(a3));
}

- (id)alertAutocapitalizationType
{
  return WFAutocapitalizationTypeFromType(objc_msgSend(a1, "autocapitalizationType"));
}

- (uint64_t)setAlertAutocapitalizationType:()WFAlertTextField
{
  return objc_msgSend(a1, "setAutocapitalizationType:", WFAutocapitalizationTypeFromString(a3));
}

- (id)alertReturnKeyType
{
  return WFReturnKeyTypeFromType(objc_msgSend(a1, "returnKeyType"));
}

- (uint64_t)setAlertReturnKeyType:()WFAlertTextField
{
  return objc_msgSend(a1, "setReturnKeyType:", WFReturnKeyTypeFromString(a3));
}

+ (uint64_t)usesSuggestions
{
  return 0;
}

@end
