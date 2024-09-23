@implementation BCViewPropertyAnimatorCounter

- (void)animate:(id)a3
{
  -[BCViewPropertyAnimatorCounter animate:afterDelay:](self, "animate:afterDelay:", a3, 0.0);
}

- (void)animate:(id)a3 afterDelay:(double)a4
{
  id v6;
  _QWORD v7[5];

  v6 = a3;
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_93E70;
  v7[3] = &unk_28CBF0;
  v7[4] = self;
  objc_msgSend(v6, "addCompletion:", v7);
  -[BCViewPropertyAnimatorCounter setAnimationCount:](self, "setAnimationCount:", (char *)-[BCViewPropertyAnimatorCounter animationCount](self, "animationCount") + 1);
  objc_msgSend(v6, "addAnimations:", &stru_28FEB0);
  objc_msgSend(v6, "startAnimationAfterDelay:", a4);

}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (id)animationDidEnd
{
  return self->_animationDidEnd;
}

- (void)setAnimationDidEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDidEnd, 0);
}

@end
