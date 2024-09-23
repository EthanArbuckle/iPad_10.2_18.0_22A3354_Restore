@implementation SUScriptDocumentInteractionControllerNativeObject

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptDocumentInteractionControllerNativeObject;
  -[SUScriptDocumentInteractionControllerNativeObject dealloc](&v3, sel_dealloc);
}

- (void)presentUsingBlock:(id)a3
{
  id presentationBlock;

  presentationBlock = self->_presentationBlock;
  if (presentationBlock != a3)
  {

    self->_presentationBlock = (id)objc_msgSend(a3, "copy");
  }
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)destroyNativeObject
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = -[SUScriptNativeObject object](self, "object");
  if ((SUScriptDocumentInteractionControllerNativeObject *)objc_msgSend(v3, "delegate") == self)
    objc_msgSend(v3, "setDelegate:", 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7FF8], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF8030], 0);
  v5.receiver = self;
  v5.super_class = (Class)SUScriptDocumentInteractionControllerNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v5, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  void *v3;
  objc_super v4;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", self);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowDidRotateNotification_, *MEMORY[0x24BDF7FF8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowWillRotateNotification_, *MEMORY[0x24BDF8030], 0);
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDocumentInteractionControllerNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v4, sel_setupNativeObject);
}

- (void)documentInteractionControllerWillPresentOpenInMenu:(id)a3
{
  self->_didPickApplication = 0;
  self->_isVisible = 1;
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3
{
  if (!self->_didPickApplication)
    objc_msgSend((id)-[SUScriptObject _cancelFunction](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "_cancelFunction"), "callWithArguments:", 0);
  self->_isVisible = 0;
}

- (void)documentInteractionController:(id)a3 willBeginSendingToApplication:(id)a4
{
  void *v6;

  v6 = (void *)-[SUScriptObject _openWithFunction](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "_openWithFunction");
  objc_msgSend(v6, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a4, 0));
  self->_didPickApplication = 1;
}

- (void)_windowDidRotateNotification:(id)a3
{
  void (**presentationBlock)(id, SEL, id);

  if (self->_redisplayAfterRotation)
  {
    presentationBlock = (void (**)(id, SEL, id))self->_presentationBlock;
    if (presentationBlock)
      presentationBlock[2](presentationBlock, a2, a3);
  }
  self->_redisplayAfterRotation = 0;
}

- (void)_windowWillRotateNotification:(id)a3
{
  if (-[SUScriptDocumentInteractionControllerNativeObject _isAffectedByWindowNotification:](self, "_isAffectedByWindowNotification:", a3))
  {
    if (self->_isVisible)
    {
      self->_redisplayAfterRotation = 1;
      objc_msgSend(-[SUScriptNativeObject object](self, "object"), "dismissMenuAnimated:", 0);
    }
  }
}

- (BOOL)_isAffectedByWindowNotification:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1
    && (v5 = -[SUScriptObject parentViewController](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "parentViewController"), objc_msgSend(v5, "isViewLoaded")))
  {
    return objc_msgSend((id)objc_msgSend(v5, "view"), "isDescendantOfView:", objc_msgSend(a3, "object"));
  }
  else
  {
    return 0;
  }
}

@end
