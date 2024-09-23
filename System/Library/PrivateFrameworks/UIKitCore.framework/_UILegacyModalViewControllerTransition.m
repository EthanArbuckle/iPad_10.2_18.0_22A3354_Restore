@implementation _UILegacyModalViewControllerTransition

+ (id)transitionWithStyle:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v4[1] = a3;
  return v4;
}

- (void)_wasAssignedToViewController:(id)a3
{
  objc_msgSend(a3, "setModalTransitionStyle:", self->_modalTransitionStyle);
}

- (BOOL)_hasOwnInteractiveExitGestureForTraits:(id)a3
{
  return 0;
}

- (BOOL)_isSupportedGivenTraits:(id)a3
{
  return 1;
}

@end
