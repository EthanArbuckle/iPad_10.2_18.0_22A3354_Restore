@implementation PKMessageExtensionMessageBubbleViewController

- (PKMessageExtensionMessageBubbleViewController)initWithDelegate:(id)a3
{
  id v5;
  PKMessageExtensionMessageBubbleViewController *v6;
  PKMessageExtensionMessageBubbleViewController *v7;
  PKMessageExtensionMessageBubbleView *v8;
  PKMessageExtensionMessageBubbleView *bubbleView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMessageExtensionMessageBubbleViewController;
  v6 = -[PKMessageExtensionMessageBubbleViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = objc_alloc_init(PKMessageExtensionMessageBubbleView);
    bubbleView = v7->_bubbleView;
    v7->_bubbleView = v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKMessageExtensionMessageBubbleView *bubbleView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKMessageExtensionMessageBubbleViewController;
  -[PKMessageExtensionMessageBubbleViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKMessageExtensionMessageBubbleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didDoubleTapMessage);
  objc_msgSend(v4, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v3, "addGestureRecognizer:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_didLongPressMessage);
  objc_msgSend(v3, "addGestureRecognizer:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapMessage);
  objc_msgSend(v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v6, "requireGestureRecognizerToFail:", v4);
  objc_msgSend(v6, "requireGestureRecognizerToFail:", v5);
  objc_msgSend(v3, "addGestureRecognizer:", v6);
  bubbleView = self->_bubbleView;
  objc_msgSend(v3, "bounds");
  -[PKMessageExtensionMessageBubbleView setFrame:](bubbleView, "setFrame:");
  objc_msgSend(v3, "addSubview:", self->_bubbleView);

}

- (double)heightThatFitsWidth:(double)a3
{
  double v3;

  -[PKMessageExtensionMessageBubbleView sizeThatFits:](self->_bubbleView, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (void)didTapMessage
{
  PKMessageExtensionMessageBubbleViewControllerDelegate *delegate;
  NSObject *v4;
  uint8_t v5[16];

  delegate = self->_delegate;
  if (!delegate)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "ERROR: [PKMessageExtensionMessageBubbleViewController didTapmessage] called with nil delegate", v5, 2u);
    }

    delegate = self->_delegate;
  }
  -[PKMessageExtensionMessageBubbleViewControllerDelegate messageExtensionMessageBubbleViewControllerDidTapMessage:](delegate, "messageExtensionMessageBubbleViewControllerDidTapMessage:", self);
}

- (PKMessageExtensionMessageBubbleView)bubbleView
{
  return self->_bubbleView;
}

- (void)setBubbleView:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
