@implementation UITextInteractionAssistant(UITextInteractionAssistant_Internal)

- (BOOL)canShowSelectionCommands
{
  void *v3;
  uint64_t v4;

  +[UISubstituteKeyboardSession activeSession](UITextFormattingKeyboardSession, "activeSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPresented");

  if (v4)
    return 0;
  if (self->_textInteractionMode == 1001)
    return -[UITextInteraction _allowsSelectionCommands](self->_interactions, "_allowsSelectionCommands");
  return 1;
}

@end
