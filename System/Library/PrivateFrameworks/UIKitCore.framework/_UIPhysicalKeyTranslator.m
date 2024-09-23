@implementation _UIPhysicalKeyTranslator

- (_UIPhysicalKeyTranslator)initWithGSKeyboard:(__GSKeyboard *)a3
{
  _UIPhysicalKeyTranslator *v4;
  _UIPhysicalKeyTranslator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalKeyTranslator;
  v4 = -[_UIPhysicalKeyTranslator init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_keyboardRef = a3;
    CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  __GSKeyboard *keyboardRef;
  objc_super v4;

  keyboardRef = self->_keyboardRef;
  if (keyboardRef)
    CFRelease(keyboardRef);
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalKeyTranslator;
  -[_UIPhysicalKeyTranslator dealloc](&v4, sel_dealloc);
}

- (id)translationForHIDUsageCode:(unsigned __int16)a3 modifiers:(int64_t)a4
{
  __GSKeyboard *v4;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = -[_UIPhysicalKeyTranslator keyboardRef](self, "keyboardRef");
  if (!v4)
    return v4;
  GSKeyboardTranslateKeyWithModifiers();
  return 0;
}

- (int)HIDUsageCodeForCharacter:(unsigned __int16)a3 modifiers:(int64_t)a4
{
  if (-[_UIPhysicalKeyTranslator keyboardRef](self, "keyboardRef"))
    return GSKeyboardGetKeyCodeForChar();
  else
    return -1;
}

- (id)layoutName
{
  __GSKeyboard *v2;

  v2 = -[_UIPhysicalKeyTranslator keyboardRef](self, "keyboardRef");
  if (v2)
  {
    GSKeyboardGetLayout();
    v2 = (__GSKeyboard *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (__GSKeyboard)keyboardRef
{
  return self->_keyboardRef;
}

@end
