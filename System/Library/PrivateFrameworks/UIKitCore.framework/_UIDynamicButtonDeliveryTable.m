@implementation _UIDynamicButtonDeliveryTable

- (id)gestureRecognizers
{
  void *v2;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "unionSet:", a1[1]);
    objc_msgSend(v2, "unionSet:", a1[2]);
    objc_msgSend(v2, "unionSet:", a1[3]);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicButton, 0);
  objc_storeStrong((id *)&self->_endingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_updatingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_beginningGestureRecognizers, 0);
}

@end
