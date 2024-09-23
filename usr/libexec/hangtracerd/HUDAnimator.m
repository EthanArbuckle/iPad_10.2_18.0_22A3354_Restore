@implementation HUDAnimator

- (HUDAnimator)init
{
  HUDAnimator *v2;
  uint64_t v3;
  NSMutableArray *animations;
  dispatch_queue_t v5;
  OS_dispatch_queue *animationQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *displayLinkAccessQueue;
  HUDAnimator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUDAnimator;
  v2 = -[HUDAnimator init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    animations = v2->_animations;
    v2->_animations = (NSMutableArray *)v3;

    v5 = dispatch_queue_create("com.apple.hangtracerd.HUDAnimationQueue", 0);
    animationQueue = v2->_animationQueue;
    v2->_animationQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.hangtracerd.HUDAnimationDisplayLinkQueue", 0);
    displayLinkAccessQueue = v2->_displayLinkAccessQueue;
    v2->_displayLinkAccessQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)sharedAnimator
{
  if (qword_1000603B8 != -1)
    dispatch_once(&qword_1000603B8, &stru_10004DF30);
  return (id)qword_1000603B0;
}

- (id)beginAnimationFromValue:(double)a3 toValue:(double)a4 duration:(double)a5 updateBlock:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *displayLinkAccessQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v22;
  HUDAnimator *v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;

  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025284;
  block[3] = &unk_10004DF58;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v24 = v12;
  v25 = v13;
  v16 = v14;
  v22 = v16;
  v23 = self;
  v17 = v13;
  v18 = v12;
  dispatch_sync(displayLinkAccessQueue, block);
  -[HUDAnimator updateDisplayLink](self, "updateDisplayLink");
  v19 = v16;

  return v19;
}

- (void)updateAnimation:(id)a3 toValue:(double)a4 duration:(double)a5
{
  id v8;
  NSObject *displayLinkAccessQueue;
  id v10;
  _QWORD block[5];
  id v12;
  double v13;
  double v14;

  v8 = a3;
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000253C0;
  block[3] = &unk_10004DFA8;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_sync(displayLinkAccessQueue, block);
  -[HUDAnimator updateDisplayLink](self, "updateDisplayLink");

}

- (void)endAnimation:(id)a3
{
  id v4;
  NSObject *displayLinkAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000255F0;
  block[3] = &unk_10004CD00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(displayLinkAccessQueue, block);

}

- (void)updateDisplayLink
{
  NSObject *displayLinkAccessQueue;
  _QWORD block[5];

  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000257F4;
  block[3] = &unk_10004D278;
  block[4] = self;
  dispatch_sync(displayLinkAccessQueue, block);
}

- (void)displayLinkFired:(id)a3
{
  id v4;
  CFTimeInterval v5;
  NSObject *displayLinkAccessQueue;
  NSObject *animationQueue;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[7];
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100025B24;
  v18[4] = sub_100025B34;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100025B24;
  v16[4] = sub_100025B34;
  v17 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = CACurrentMediaTime();
  displayLinkAccessQueue = self->_displayLinkAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025B3C;
  block[3] = &unk_10004E030;
  block[4] = self;
  block[5] = v18;
  *(CFTimeInterval *)&block[8] = v5;
  block[6] = v16;
  block[7] = &v12;
  dispatch_sync(displayLinkAccessQueue, block);
  animationQueue = self->_animationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025CC4;
  v10[3] = &unk_10004E058;
  *(CFTimeInterval *)&v10[6] = v5;
  v10[4] = v18;
  v10[5] = v16;
  dispatch_sync(animationQueue, v10);
  if (*((_BYTE *)v13 + 24))
  {
    v8 = self->_displayLinkAccessQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100025ECC;
    v9[3] = &unk_10004D278;
    v9[4] = self;
    dispatch_sync(v8, v9);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkAccessQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
