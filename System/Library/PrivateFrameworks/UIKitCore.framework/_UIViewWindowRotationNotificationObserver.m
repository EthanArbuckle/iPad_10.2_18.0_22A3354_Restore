@implementation _UIViewWindowRotationNotificationObserver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

- (void)windowWillAnimateRotation:(id)a3
{
  id WeakRetained;
  _OWORD v4[15];

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  memset(v4, 0, sizeof(v4));
  -[UIView _notifyBoundingPathChangeObserversWithChangeInfo:forAncestor:](WeakRetained, v4, 0);

}

@end
