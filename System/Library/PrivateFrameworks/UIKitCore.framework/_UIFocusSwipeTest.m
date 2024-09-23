@implementation _UIFocusSwipeTest

- (_UIFocusSwipeTest)initWithIdentifier:(id)a3
{
  _UIFocusSwipeTest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusSwipeTest;
  result = -[_UIFocusTest initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
  if (result)
    result->_swipeAxis = 1;
  return result;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  void *v5;
  const $B42DDA7905377C1B85A751F444708923 *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  -[_UIFocusSwipeTest window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusSwipeTest.m"), 63, CFSTR("Focus swipe test must have a window in order to start."));

  }
  if (!-[_UIFocusSwipeTest swipeAxis](self, "swipeAxis"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusSwipeTest.m"), 64, CFSTR("Focus swipe test must have a swipe axis in order to start."));

  }
  if (-[_UIFocusSwipeTest swipeAxis](self, "swipeAxis") == 1)
  {
    self->_eventCount = 57;
    v6 = (const $B42DDA7905377C1B85A751F444708923 *)&horizontalSwipingEvents;
  }
  else if (-[_UIFocusSwipeTest swipeAxis](self, "swipeAxis") == 2)
  {
    self->_eventCount = 46;
    v6 = (const $B42DDA7905377C1B85A751F444708923 *)&verticalSwipingEvents;
  }
  else
  {
    v6 = 0;
    self->_eventCount = 0;
  }
  self->_events = v6;
  v9[2]();

}

- (void)main
{
  _UIFocusEngineFakePanGestureRecognizer *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _UIFocusEngineFakePanGestureRecognizer *v10;
  _QWORD v11[5];
  _UIFocusEngineFakePanGestureRecognizer *v12;
  id v13;
  id v14;

  v3 = objc_alloc_init(_UIFocusEngineFakePanGestureRecognizer);
  -[_UIFocusSwipeTest window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_focusEventRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_uiktest_panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_uiktest_setPanGestureRecognizer:", v3);
  v7 = dispatch_queue_create("_UIFocusSwipeTest", 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25___UIFocusSwipeTest_main__block_invoke;
  v11[3] = &unk_1E16B51E8;
  v11[4] = self;
  v12 = v3;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  v10 = v3;
  dispatch_async(v7, v11);

}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (unint64_t)swipeAxis
{
  return self->_swipeAxis;
}

- (void)setSwipeAxis:(unint64_t)a3
{
  self->_swipeAxis = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
}

@end
