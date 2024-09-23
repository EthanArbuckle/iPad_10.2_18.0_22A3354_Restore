@implementation MailboxPredictorDebugViewController

- (MailboxPredictorDebugViewController)initWithAlgoritm:(id)a3 result:(id)a4 output:(id)a5 dismiss:(id)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  MailboxPredictorDebugViewController *v14;
  MailboxPredictorDebugViewController *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  objc_super v20;

  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MailboxPredictorDebugViewController;
  v14 = -[MailboxPredictorDebugViewController init](&v20, "init");
  v15 = v14;
  if (v14)
  {
    if (v10)
      v16 = v10;
    else
      v16 = CFSTR("nil");
    -[MailboxPredictorDebugViewController setAlgorithm:](v14, "setAlgorithm:", v16);
    if (v11)
      v17 = v11;
    else
      v17 = CFSTR("nil");
    -[MailboxPredictorDebugViewController setResult:](v15, "setResult:", v17);
    if (v12)
      v18 = v12;
    else
      v18 = CFSTR("No output");
    -[MailboxPredictorDebugViewController setOutput:](v15, "setOutput:", v18);
    -[MailboxPredictorDebugViewController setDismissBlock:](v15, "setDismissBlock:", v13);
  }

  return v15;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[3];

  v23.receiver = self;
  v23.super_class = (Class)MailboxPredictorDebugViewController;
  -[MailboxPredictorDebugViewController viewDidLoad](&v23, "viewDidLoad");
  -[MailboxPredictorDebugViewController setTitle:](self, "setTitle:", CFSTR("Mailbox Prediction Debug"));
  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Dismiss"), 2, self, "_dismiss");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = objc_alloc_init((Class)UILabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 20.0));
  objc_msgSend(v5, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController result](self, "result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Prediction: %@"), v7));
  objc_msgSend(v5, "setText:", v8);

  v9 = objc_alloc_init((Class)UILabel);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0));
  objc_msgSend(v9, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController algorithm](self, "algorithm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Model: %@"), v11));
  objc_msgSend(v9, "setText:", v12);

  v13 = objc_alloc_init((Class)UITextView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  objc_msgSend(v13, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController output](self, "output"));
  objc_msgSend(v13, "setText:", v15);

  objc_msgSend(v13, "setEditable:", 0);
  v16 = objc_alloc((Class)UIStackView);
  v24[0] = v5;
  v24[1] = v9;
  v24[2] = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
  v18 = objc_msgSend(v16, "initWithArrangedSubviews:", v17);

  objc_msgSend(v18, "setAxis:", 1);
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  objc_msgSend(v18, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v18, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
  objc_msgSend(v18, "setSpacing:", 8.0);
  -[MailboxPredictorDebugViewController setOutputTextView:](self, "setOutputTextView:", v13);
  v19 = objc_alloc_init((Class)UIView);
  -[MailboxPredictorDebugViewController setView:](self, "setView:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController view](self, "view"));
  objc_msgSend(v21, "setBackgroundColor:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController view](self, "view"));
  objc_msgSend(v22, "addSubview:", v18);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  if ("selectAll:" != a3)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController outputTextView](self, "outputTextView"));
  if (objc_msgSend(v6, "selectedRange"))
  {
    v4 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController outputTextView](self, "outputTextView"));
    objc_msgSend(v7, "selectedRange");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController outputTextView](self, "outputTextView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    v4 = v9 != objc_msgSend(v11, "length");

  }
  return v4;
}

- (void)selectAll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController outputTextView](self, "outputTextView"));
  objc_msgSend(v4, "selectAll:", v5);

}

- (void)_dismiss
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController dismissBlock](self, "dismissBlock"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MailboxPredictorDebugViewController dismissBlock](self, "dismissBlock"));
    v4[2]();

  }
}

- (NSString)algorithm
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAlgorithm:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)output
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutput:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)dismissBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (UITextView)outputTextView
{
  return (UITextView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOutputTextView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextView, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
