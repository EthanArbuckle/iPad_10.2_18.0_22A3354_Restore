@implementation UITextField(SUScriptTextFieldAdditions)

- (uint64_t)configureFromScriptTextField:()SUScriptTextFieldAdditions
{
  objc_msgSend(a1, "setAutocapitalizationType:", __SUAutocapitalizationTypeForString((void *)objc_msgSend(a3, "_autocapitalizationType")));
  objc_msgSend(a1, "setAutocorrectionType:", __SUAutocorrectionTypeForString(objc_msgSend(a3, "_autocorrectionType")));
  objc_msgSend(a1, "setKeyboardType:", __SUKeyboardTypeForString(objc_msgSend(a3, "_keyboardType")));
  objc_msgSend(a1, "setPlaceholder:", (id)objc_msgSend(a3, "_copyPlaceholder"));
  return objc_msgSend(a1, "setText:", (id)objc_msgSend(a3, "_copyValue"));
}

@end
