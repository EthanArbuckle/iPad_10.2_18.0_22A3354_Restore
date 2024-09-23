@implementation ICUITextViewDebuggingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICUITextViewDebuggingViewController;
  -[ICUITextViewDebuggingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICUITextViewDebuggingViewController textView](self, "textView"));
  objc_msgSend(v3, "setTextContainerInset:", 16.0, 16.0, 16.0, 16.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICUITextViewDebuggingViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitle:", CFSTR("UITextView"));

}

- (void)dismiss:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICUITextViewDebuggingViewController navigationController](self, "navigationController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

@end
