@implementation UIFeedbackGeneratorGestureRecognizer

void __81___UIFeedbackGeneratorGestureRecognizer___removeCompletedInteractionsAfterDelay___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[38], "minusSet:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

id __64___UIFeedbackGeneratorGestureRecognizer_touchesEnded_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_UIFeedbackGeneratorGestureRecognizerCompletedTouch completedTouchFromTouch:](_UIFeedbackGeneratorGestureRecognizerCompletedTouch, "completedTouchFromTouch:", a2);
}

id __68___UIFeedbackGeneratorGestureRecognizer_touchesCancelled_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_UIFeedbackGeneratorGestureRecognizerCompletedTouch completedTouchFromTouch:](_UIFeedbackGeneratorGestureRecognizerCompletedTouch, "completedTouchFromTouch:", a2);
}

@end
