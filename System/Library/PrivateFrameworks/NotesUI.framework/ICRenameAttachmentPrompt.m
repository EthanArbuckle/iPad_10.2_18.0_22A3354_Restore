@implementation ICRenameAttachmentPrompt

+ (void)showWithTitle:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0CEE5B0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_msgSend([v7 alloc], "initWithExistingTitle:", v10);

  objc_msgSend(v11, "showFromViewController:completion:", v9, v8);
}

@end
