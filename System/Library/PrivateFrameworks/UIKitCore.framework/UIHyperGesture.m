@implementation UIHyperGesture

uint64_t __34___UIHyperGesture__handleGesture___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getCurrentTranslation:", a2);
}

uint64_t __34___UIHyperGesture__handleGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getCurrentVelocity:", a2);
}

uint64_t __34___UIHyperGesture__handleGesture___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_hyperGestureUpdateStateForInteractionChanged:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __34___UIHyperGesture__handleGesture___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_hyperGestureUpdateStateForInteractionEnded:", *(_QWORD *)(a1 + 40));
  return result;
}

@end
