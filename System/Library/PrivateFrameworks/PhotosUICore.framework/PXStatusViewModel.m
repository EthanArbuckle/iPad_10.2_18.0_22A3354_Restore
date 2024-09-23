@implementation PXStatusViewModel

- (id)description
{
  NSAttributedString *attributedMessage;
  __CFString *v4;
  __CFString *message;
  __CFString *v6;
  const __CFString *symbolName;
  const __CFString *title;
  const __CFString *actionTitle;
  const __CFString *actionConfirmationAlertTitle;
  const __CFString *actionConfirmationAlertSubtitle;
  const __CFString *actionConfirmationAlertButtonTitle;
  void *v13;

  attributedMessage = self->_attributedMessage;
  if (attributedMessage)
  {
    -[NSAttributedString string](attributedMessage, "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    message = (__CFString *)self->_message;
    if (!message)
      message = CFSTR("-");
    v4 = message;
  }
  v6 = v4;
  symbolName = (const __CFString *)self->_symbolName;
  if (!symbolName)
    symbolName = CFSTR("-");
  title = (const __CFString *)self->_title;
  if (!title)
    title = CFSTR("-");
  actionTitle = (const __CFString *)self->_actionTitle;
  if (!actionTitle)
    actionTitle = CFSTR("-");
  actionConfirmationAlertTitle = (const __CFString *)self->_actionConfirmationAlertTitle;
  if (!actionConfirmationAlertTitle)
    actionConfirmationAlertTitle = CFSTR("-");
  actionConfirmationAlertSubtitle = (const __CFString *)self->_actionConfirmationAlertSubtitle;
  if (!actionConfirmationAlertSubtitle)
    actionConfirmationAlertSubtitle = CFSTR("-");
  actionConfirmationAlertButtonTitle = (const __CFString *)self->_actionConfirmationAlertButtonTitle;
  if (!actionConfirmationAlertButtonTitle)
    actionConfirmationAlertButtonTitle = CFSTR("-");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<symbolName:\"%@\", title:\"%@\", message:\"%@\", action:\"%@\", alert:\"%@/%@/%@\">"), symbolName, title, v4, actionTitle, actionConfirmationAlertTitle, actionConfirmationAlertSubtitle, actionConfirmationAlertButtonTitle);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStatusViewModel;
  -[PXStatusViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setSymbolName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *symbolName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_symbolName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      symbolName = self->_symbolName;
      self->_symbolName = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *message;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_message;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      message = self->_message;
      self->_message = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setAttributedMessage:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedMessage;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedMessage;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      attributedMessage = self->_attributedMessage;
      self->_attributedMessage = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setActionTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionTitle = self->_actionTitle;
      self->_actionTitle = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertTitle = self->_actionConfirmationAlertTitle;
      self->_actionConfirmationAlertTitle = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertSubtitle = self->_actionConfirmationAlertSubtitle;
      self->_actionConfirmationAlertSubtitle = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 64);
    }
  }

}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertButtonTitle = self->_actionConfirmationAlertButtonTitle;
      self->_actionConfirmationAlertButtonTitle = v6;

      -[PXStatusViewModel signalChange:](self, "signalChange:", 128);
    }
  }

}

- (void)setAction:(id)a3
{
  void *v4;
  id action;

  if (self->_action != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    action = self->_action;
    self->_action = v4;

    -[PXStatusViewModel signalChange:](self, "signalChange:", 256);
  }
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
