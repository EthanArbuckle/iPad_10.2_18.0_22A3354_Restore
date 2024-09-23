@implementation _UITextInteractionAssistantGestureState

- (void)setViewIsEditable:(BOOL)a3
{
  self->_viewIsEditable = a3;
}

- (void)setViewCanBecomeEditable:(BOOL)a3
{
  self->_viewCanBecomeEditable = a3;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)setIsFirstResponder:(BOOL)a3
{
  self->_isFirstResponder = a3;
}

- (void)setHasExternalInteractions:(BOOL)a3
{
  self->_hasExternalInteractions = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int hasExternalInteractions;
  int viewIsEditable;
  int viewCanBecomeEditable;
  int64_t mode;
  int isFirstResponder;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    hasExternalInteractions = self->_hasExternalInteractions;
    if (hasExternalInteractions == objc_msgSend(v5, "hasExternalInteractions")
      && (viewIsEditable = self->_viewIsEditable, viewIsEditable == objc_msgSend(v5, "viewIsEditable"))
      && (viewCanBecomeEditable = self->_viewCanBecomeEditable,
          viewCanBecomeEditable == objc_msgSend(v5, "viewCanBecomeEditable"))
      && (mode = self->_mode, mode == objc_msgSend(v5, "mode")))
    {
      isFirstResponder = self->_isFirstResponder;
      v11 = isFirstResponder == objc_msgSend(v5, "isFirstResponder");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasExternalInteractions
{
  return self->_hasExternalInteractions;
}

- (BOOL)viewIsEditable
{
  return self->_viewIsEditable;
}

- (BOOL)viewCanBecomeEditable
{
  return self->_viewCanBecomeEditable;
}

- (BOOL)isFirstResponder
{
  return self->_isFirstResponder;
}

- (int64_t)mode
{
  return self->_mode;
}

@end
