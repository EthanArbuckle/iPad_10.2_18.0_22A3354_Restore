@implementation PXMessagesExtensionViewModel

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesExtensionViewModel;
  -[PXMessagesExtensionViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setSelectedURL:(id)a3
{
  NSURL *v5;
  char v6;
  NSURL *v7;

  v7 = (NSURL *)a3;
  v5 = self->_selectedURL;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSURL isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedURL, a3);
      -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSelectedActivityType:(unint64_t)a3
{
  if (self->_selectedActivityType != a3)
  {
    self->_selectedActivityType = a3;
    -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setDrawerActive:(BOOL)a3
{
  if (self->_drawerActive != a3)
  {
    self->_drawerActive = a3;
    -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setPresentedViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_presentedViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 16);
    v5 = v6;
  }

}

- (void)setSelectedMessageText:(id)a3
{
  NSString *v4;
  NSString *selectedMessageText;

  if (self->_selectedMessageText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    selectedMessageText = self->_selectedMessageText;
    self->_selectedMessageText = v4;

    -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setSelectedMessageDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_selectedMessageDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedMessageDate, a3);
    -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)clearSelection
{
  -[PXMessagesExtensionViewModel setSelectedURL:](self, "setSelectedURL:", 0);
  -[PXMessagesExtensionViewModel setSelectedActivityType:](self, "setSelectedActivityType:", 0);
  -[PXMessagesExtensionViewModel setPresentedViewController:](self, "setPresentedViewController:", 0);
}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_recipients, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    recipients = self->_recipients;
    self->_recipients = v4;

    -[PXMessagesExtensionViewModel signalChange:](self, "signalChange:", 32);
  }

}

- (NSURL)selectedURL
{
  return self->_selectedURL;
}

- (unint64_t)selectedActivityType
{
  return self->_selectedActivityType;
}

- (NSString)selectedMessageText
{
  return self->_selectedMessageText;
}

- (NSDate)selectedMessageDate
{
  return self->_selectedMessageDate;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (BOOL)isDrawerActive
{
  return self->_drawerActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_selectedMessageDate, 0);
  objc_storeStrong((id *)&self->_selectedMessageText, 0);
  objc_storeStrong((id *)&self->_selectedURL, 0);
}

+ (PXMessagesExtensionViewModel)sharedRootViewModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PXMessagesExtensionViewModel_sharedRootViewModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRootViewModel_onceToken != -1)
    dispatch_once(&sharedRootViewModel_onceToken, block);
  return (PXMessagesExtensionViewModel *)(id)sharedRootViewModel__sharedRootViewModel;
}

void __51__PXMessagesExtensionViewModel_sharedRootViewModel__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRootViewModel__sharedRootViewModel;
  sharedRootViewModel__sharedRootViewModel = (uint64_t)v1;

}

@end
