@implementation WBSTabDialog

+ (id)tabDialogWithPresentationBlock:(id)a3 dismissalBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v9 = MEMORY[0x1A8599ED0](v7);

  v10 = (void *)v8[1];
  v8[1] = v9;

  v11 = MEMORY[0x1A8599ED0](v6);
  v12 = (void *)v8[2];
  v8[2] = v11;

  return v8;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSTabDialog;
  return -[WBSTabDialog init](&v3, sel_init);
}

- (WBSTabDialog)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSTabDialog;
  return -[WBSTabDialog init](&v3, sel_init);
}

- (id)createInfo
{
  WBSTabDialogInformation *v3;

  v3 = -[WBSTabDialogInformation initWithPresentationBlock:dismissalBlock:blocksWebProcessUntilDismissed:]([WBSTabDialogInformation alloc], "initWithPresentationBlock:dismissalBlock:blocksWebProcessUntilDismissed:", self->_presentationBlock, self->_dismissalBlock, self->_blocksWebProcessUntilDismissed);
  -[WBSTabDialogInformation setCancellationExemptions:](v3, "setCancellationExemptions:", self->_cancellationExemptions);
  return v3;
}

- (BOOL)blocksWebProcessUntilDismissed
{
  return self->_blocksWebProcessUntilDismissed;
}

- (void)setBlocksWebProcessUntilDismissed:(BOOL)a3
{
  self->_blocksWebProcessUntilDismissed = a3;
}

- (NSArray)cancellationExemptions
{
  return self->_cancellationExemptions;
}

- (void)setCancellationExemptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationExemptions, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
}

@end
