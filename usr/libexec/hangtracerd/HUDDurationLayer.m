@implementation HUDDurationLayer

- (HUDDurationLayer)init
{
  HUDDurationLayer *v2;
  HUDDurationLayer *v3;
  NSObject *currentAnimation;
  HUDDurationLayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUDDurationLayer;
  v2 = -[HUDDurationLayer init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    currentAnimation = v2->_currentAnimation;
    v2->_currentAnimation = 0;

    v3->_updateInterval = 0.05;
    v5 = v3;
  }

  return v3;
}

- (void)setHangDuration:(double)a3 animated:(BOOL)a4
{
  double hangDuration;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  double updateInterval;
  NSObject *v18;
  NSObject *currentAnimation;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];

  hangDuration = self->_hangDuration;
  if (hangDuration == a3)
  {
    v6 = sub_100024FF4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10002E734(v7, a3, v8, v9);
  }
  else if (a4)
  {
    if (!self->_currentAnimation)
    {
      v11 = sub_100018814(hangDuration);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[HUDDurationLayer setString:](self, "setString:", v12);

      v13 = sub_100024FF4();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_10002E80C(self, v14, a3);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[HUDAnimator sharedAnimator](HUDAnimator, "sharedAnimator"));
      v16 = self->_hangDuration;
      updateInterval = self->_updateInterval;
      v32[4] = self;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100018BA0;
      v33[3] = &unk_10004DB48;
      v33[4] = self;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100018C7C;
      v32[3] = &unk_10004DB70;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "beginAnimationFromValue:toValue:duration:updateBlock:completionBlock:", v33, v32, v16, a3, updateInterval));
      currentAnimation = self->_currentAnimation;
      self->_currentAnimation = v18;

    }
    self->_hangDuration = a3;
    v20 = sub_100024FF4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_10002E7A0(v21, a3, v22, v23);

    v7 = objc_claimAutoreleasedReturnValue(+[HUDAnimator sharedAnimator](HUDAnimator, "sharedAnimator"));
    -[NSObject updateAnimation:toValue:duration:](v7, "updateAnimation:toValue:duration:", self->_currentAnimation, a3, self->_updateInterval);
  }
  else
  {
    self->_hangDuration = a3;
    v24 = self->_currentAnimation;
    if (v24)
    {
      self->_currentAnimation = 0;
      v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[HUDAnimator sharedAnimator](HUDAnimator, "sharedAnimator"));
      objc_msgSend(v26, "endAnimation:", v25);

      v27 = sub_100024FF4();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        sub_10002E8B8(v28, a3, v29, v30);

    }
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v31 = sub_100018814(a3);
    v7 = objc_claimAutoreleasedReturnValue(v31);
    -[HUDDurationLayer setString:](self, "setString:", v7);
  }

}

- (double)hangDuration
{
  return self->_hangDuration;
}

- (void)setHangDuration:(double)a3
{
  self->_hangDuration = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentAnimation, 0);
}

@end
