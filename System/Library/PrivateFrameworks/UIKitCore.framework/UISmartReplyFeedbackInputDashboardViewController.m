@implementation UISmartReplyFeedbackInputDashboardViewController

void __57___UISmartReplyFeedbackInputDashboardViewController_init__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardStateManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "smartReplyFeedbackManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportSmartRepliesThumbsDown");

}

void __57___UISmartReplyFeedbackInputDashboardViewController_init__block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardStateManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "smartReplyFeedbackManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportSmartRepliesThumbsUp");

}

@end
