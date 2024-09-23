@implementation URTDefaultDestinationPresentation

- (URTDefaultDestinationPresentation)initWithAlert:(id)a3 forDestination:(int64_t)a4 preferredPresentationStyle:(int64_t)a5
{
  id v9;
  void *v10;
  URTDefaultDestinationPresentation *v11;
  objc_super v13;

  v9 = a3;
  objc_msgSend(v9, "userNotificationRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)URTDefaultDestinationPresentation;
  v11 = -[URTUserNotificationPresentation initWithContents:flags:](&v13, sel_initWithContents_flags_, v10, 3);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_alert, a3);
    v11->_destination = a4;
    v11->_preferredPresentationStyle = a5;
  }

  return v11;
}

- (void)invalidate
{
  __CFRunLoop *Main;
  objc_super v4;

  if (self->_runLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    CFRelease(self->_runLoopSource);
    self->_runLoopSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)URTDefaultDestinationPresentation;
  -[URTUserNotificationPresentation invalidate](&v4, sel_invalidate);
}

- (void)present
{
  __CFRunLoopSource *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)URTDefaultDestinationPresentation;
  -[URTUserNotificationPresentation present](&v8, sel_present);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__URTDefaultDestinationPresentation_present__block_invoke;
  v5[3] = &unk_24DC7AFA0;
  objc_copyWeak(&v6, &location);
  v3 = -[URTUserNotificationPresentation createRunLoopSourceOrdered:handler:](self, "createRunLoopSourceOrdered:handler:", 0, v5);
  if (v3)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v3, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    self->_runLoopSource = v3;
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__URTDefaultDestinationPresentation_present__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeDelegateForResponseFlags:", a3);

}

- (void)_invokeDelegateForResponseFlags:(unint64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;

  switch(a3 & 3)
  {
    case 2uLL:
      -[URTDefaultDestinationPresentation delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0)
        return;
      -[URTDefaultDestinationPresentation delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleOtherActionForAlertPresentation:", self);
      goto LABEL_10;
    case 1uLL:
      -[URTDefaultDestinationPresentation delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0)
        return;
      -[URTDefaultDestinationPresentation delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleCancelActionForAlertPresentation:", self);
      goto LABEL_10;
    case 0uLL:
      -[URTDefaultDestinationPresentation delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        -[URTDefaultDestinationPresentation delegate](self, "delegate");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleDefaultActionForAlertPresentation:", self);
LABEL_10:

      }
      break;
  }
}

- (URTAlert)alert
{
  return self->_alert;
}

- (int64_t)destination
{
  return self->_destination;
}

- (URTDestinationPresentationDelegate)delegate
{
  return (URTDestinationPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
