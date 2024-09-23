@implementation UIScrollView

- (void)scrollToTop
{
  -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
}

- (void)ic_performRecapScrollTestNamed:(id)a3 iterations:(unint64_t)a4
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (byte_1005DDE70)
  {
    v6 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollView:completionHandler:", v5, self, 0);
    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v6);
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10040A06C(v6);
  }

}

@end
