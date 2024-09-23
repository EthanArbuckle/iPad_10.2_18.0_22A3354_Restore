@implementation _UIFontPickerSceneSpecification

- (id)userActivity
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", CFSTR("_UIFontPickerUIServiceActivityTypeFontPicker"));
}

@end
