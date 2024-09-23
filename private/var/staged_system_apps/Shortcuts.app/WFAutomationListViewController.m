@implementation WFAutomationListViewController

- (BOOL)scrollForNavigationTap
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFAutomationListViewController tableView](self, "tableView"));
  v3 = objc_msgSend(v2, "wf_scrollToTopAnimated:", 1);

  return v3;
}

@end
