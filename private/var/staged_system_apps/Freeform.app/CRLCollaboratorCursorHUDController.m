@implementation CRLCollaboratorCursorHUDController

- (CRLCollaboratorCursorHUDController)initWithCollaboratorPresence:(id)a3 delegate:(id)a4 string:(id)a5 hudSize:(unint64_t)a6 shouldAutoTimeout:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CRLCollaboratorCursorHUDController *v23;
  CRLCollaboratorCursorHUDController *v24;
  NSString *v25;
  NSString *mFullNameString;
  NSString *mShortNameString;
  NSString *mFollowString;
  CRLOnce *v29;
  CRLOnce *mPreferredSizeOfFullNameStringOnce;
  CRLOnce *v31;
  CRLOnce *mPreferredSizeOfShortNameStringOnce;
  CRLCanvasShapeRenderable *mFollowButtonRenderable;
  double v34;
  double v35;
  double v36;
  double v37;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v38;
  void *v39;
  void *v40;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v41;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *mAvatarRenderer;
  objc_super v44;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  if (v13)
  {
    if (v15)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242D70);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E09D08();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242D90);
  v17 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:string:hudSize:shouldAutoTimeout:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 110, 0, "Invalid parameter not satisfying: %{public}s", "collaboratorPresence != nil");

  if (!v16)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242DB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09C78();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242DD0);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:string:hudSize:shouldAutoTimeout:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 111, 0, "Invalid parameter not satisfying: %{public}s", "string != nil");

  }
LABEL_22:
  v44.receiver = self;
  v44.super_class = (Class)CRLCollaboratorCursorHUDController;
  v23 = -[CRLCollaboratorCursorHUDController init](&v44, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->mCollaboratorPresence, a3);
    objc_storeWeak((id *)&v24->mDelegate, v14);
    v25 = (NSString *)objc_msgSend(v16, "copy");
    mFullNameString = v24->mFullNameString;
    v24->mFullNameString = v25;

    mShortNameString = v24->mShortNameString;
    v24->mShortNameString = 0;

    mFollowString = v24->mFollowString;
    v24->mFollowString = 0;

    v24->mHUDSize = a6;
    v29 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfFullNameStringOnce = v24->mPreferredSizeOfFullNameStringOnce;
    v24->mPreferredSizeOfFullNameStringOnce = v29;

    v31 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfShortNameStringOnce = v24->mPreferredSizeOfShortNameStringOnce;
    v24->mPreferredSizeOfShortNameStringOnce = v31;

    v24->mIsFollowing = 0;
    v24->mShouldAutoTimeout = a7;
    mFollowButtonRenderable = v24->mFollowButtonRenderable;
    v24->mFollowButtonRenderable = 0;

    -[CRLCollaboratorCursorHUDController p_avatarSize](v24, "p_avatarSize");
    v35 = v34;
    v37 = v36;
    v38 = [_TtC8Freeform29CRLCollaboratorAvatarRenderer alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "owner"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "contact"));
    v41 = -[CRLCollaboratorAvatarRenderer initWithContact:size:](v38, "initWithContact:size:", v40, v35, v37);
    mAvatarRenderer = v24->mAvatarRenderer;
    v24->mAvatarRenderer = v41;

    v24->mFollowEnabled = 0;
    *(_WORD *)&v24->mShouldAutoHide = 0;
  }

  return v24;
}

- (CRLCollaboratorCursorHUDController)initWithCollaboratorPresence:(id)a3 delegate:(id)a4 hudSize:(unint64_t)a5 shouldAutoShrink:(BOOL)a6 shouldAutoHide:(BOOL)a7 isFollowing:(BOOL)a8 isLocalParticipant:(BOOL)a9
{
  _BOOL4 v11;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CRLCollaboratorCursorHUDController *v21;
  CRLCollaboratorCursorHUDController *v22;
  CRLOnce *v23;
  CRLOnce *mPreferredSizeOfFullNameStringOnce;
  CRLOnce *v25;
  CRLOnce *mPreferredSizeOfShortNameStringOnce;
  CRLOnce *v27;
  CRLOnce *mPreferredSizeOfFollowStringOnce;
  void *v29;
  NSString *v30;
  NSString *mShortNameString;
  void *v32;
  NSString *v33;
  NSString *mFullNameString;
  void *v35;
  uint64_t v36;
  NSString *mFollowString;
  double v38;
  double v39;
  double v40;
  double v41;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v42;
  void *v43;
  void *v44;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *v45;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *mAvatarRenderer;
  uint64_t v48;
  char v49;
  objc_super v50;

  v11 = a6;
  v16 = a3;
  v17 = a4;
  if (!v16)
  {
    HIDWORD(v48) = v11;
    LODWORD(v48) = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242DF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09D98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242E10);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController initWithCollaboratorPresence:delegate:hudSize:shouldAutoShrink:shouldAutoHide:isFollowing:isLocalParticipant:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 138, 0, "Invalid parameter not satisfying: %{public}s", "collaboratorPresence != nil", v48);

    LOBYTE(v11) = v49;
  }
  v50.receiver = self;
  v50.super_class = (Class)CRLCollaboratorCursorHUDController;
  v21 = -[CRLCollaboratorCursorHUDController init](&v50, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->mCollaboratorPresence, a3);
    objc_storeWeak((id *)&v22->mDelegate, v17);
    v22->mHUDSize = a5;
    v23 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfFullNameStringOnce = v22->mPreferredSizeOfFullNameStringOnce;
    v22->mPreferredSizeOfFullNameStringOnce = v23;

    v25 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfShortNameStringOnce = v22->mPreferredSizeOfShortNameStringOnce;
    v22->mPreferredSizeOfShortNameStringOnce = v25;

    v27 = objc_alloc_init(CRLOnce);
    mPreferredSizeOfFollowStringOnce = v22->mPreferredSizeOfFollowStringOnce;
    v22->mPreferredSizeOfFollowStringOnce = v27;

    v22->mIsFollowing = a8;
    v22->mIsLocalParticipant = a9;
    v22->mShouldAutoHide = a7;
    v22->mShouldAutoShrink = v11;
    v22->mShouldAutoTimeout = 0;
    v22->mFollowEnabled = 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shortDisplayName"));
    v30 = (NSString *)objc_msgSend(v29, "copy");
    mShortNameString = v22->mShortNameString;
    v22->mShortNameString = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayName"));
    v33 = (NSString *)objc_msgSend(v32, "copy");
    mFullNameString = v22->mFullNameString;
    v22->mFullNameString = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Follow"), 0, 0));
    mFollowString = v22->mFollowString;
    v22->mFollowString = (NSString *)v36;

    -[CRLCollaboratorCursorHUDController p_avatarSize](v22, "p_avatarSize");
    v39 = v38;
    v41 = v40;
    v42 = [_TtC8Freeform29CRLCollaboratorAvatarRenderer alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "owner"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "contact"));
    v45 = -[CRLCollaboratorAvatarRenderer initWithContact:size:](v42, "initWithContact:size:", v44, v39, v41);
    mAvatarRenderer = v22->mAvatarRenderer;
    v22->mAvatarRenderer = v45;

  }
  return v22;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->mHideHUDTimer, "invalidate");
  -[NSTimer invalidate](self->mAbsoluteTimeTimer, "invalidate");
  -[NSTimer invalidate](self->mAutoShrinkTimer, "invalidate");
  -[NSTimer invalidate](self->mAutoHideTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRLCollaboratorCursorHUDController;
  -[CRLCollaboratorCursorHUDController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  NSTimer *mHideHUDTimer;
  NSTimer *mAbsoluteTimeTimer;
  void *v5;
  CRLCanvasShapeRenderable *mHUDRenderable;
  CRLCollaboratorCursorOverlayView *mSizeToggleOverlayView;
  CRLCollaboratorCursorOverlayView *mFollowToggleOverlayView;

  -[NSTimer invalidate](self->mHideHUDTimer, "invalidate");
  mHideHUDTimer = self->mHideHUDTimer;
  self->mHideHUDTimer = 0;

  -[NSTimer invalidate](self->mAbsoluteTimeTimer, "invalidate");
  mAbsoluteTimeTimer = self->mAbsoluteTimeTimer;
  self->mAbsoluteTimeTimer = 0;

  -[CRLCollaboratorCursorHUDController stopAutoHideTimer](self, "stopAutoHideTimer");
  -[CRLCollaboratorCursorHUDController stopAutoShrinkTimer](self, "stopAutoShrinkTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  objc_msgSend(v5, "removeCollaboratorHUDController:", self);

  mHUDRenderable = self->mHUDRenderable;
  self->mHUDRenderable = 0;

  mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  self->mSizeToggleOverlayView = 0;

  mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  self->mFollowToggleOverlayView = 0;

  self->mShouldAutoTimeout = 0;
}

- (void)showHUDAtPoint:(CGPoint)a3 withDirection:(unint64_t)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSTimer *v14;
  NSTimer *mAbsoluteTimeTimer;
  CGPoint v16;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  objc_msgSend(v8, "addCollaboratorHUDController:", self);

  if (sub_1000637EC())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242E30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09E28();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242E50);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController showHUDAtPoint:withDirection:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    v16.x = x;
    v16.y = y;
    v12 = NSStringFromCGPoint(v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 189, 0, "Invalid target point for collaborator HUD! %@", v13);

    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  self->mTargetPoint.x = x;
  self->mTargetPoint.y = y;
  self->mDirection = a4;
  if (self->mFollowEnabled)
  {
    if (!self->mHUDSize)
    {
      if (self->mShouldAutoShrink)
        -[CRLCollaboratorCursorHUDController resetAutoShrinkTimer](self, "resetAutoShrinkTimer");
      if (self->mShouldAutoHide)
        -[CRLCollaboratorCursorHUDController resetAutoHideTimer](self, "resetAutoHideTimer");
    }
  }
  else
  {
    -[CRLCollaboratorCursorHUDController resetFadeOutTimer](self, "resetFadeOutTimer");
    if (self->mShouldUnconditionallyFadeOutHUD
      && self->mShouldAutoTimeout
      && !self->mAbsoluteTimeTimer
      && self->mHUDSize == 1)
    {
      v14 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "hideHUD", 0, 0, 7.0));
      mAbsoluteTimeTimer = self->mAbsoluteTimeTimer;
      self->mAbsoluteTimeTimer = v14;

    }
    if (!self->mHUDSize && !self->mShouldAutoTimeout && !self->mAutoShrinkTimer)
      -[CRLCollaboratorCursorHUDController resetAutoShrinkTimer](self, "resetAutoShrinkTimer");
  }
}

- (void)hideHUD
{
  if (self->mFollowEnabled)
    -[CRLCollaboratorCursorHUDController p_hideFollowHUD](self, "p_hideFollowHUD");
  else
    -[CRLCollaboratorCursorHUDController p_hideHUDLegacy](self, "p_hideHUDLegacy");
}

- (void)resetFadeOutTimer
{
  NSTimer *v3;
  NSTimer *mHideHUDTimer;

  if (self->mShouldUnconditionallyFadeOutHUD && self->mShouldAutoTimeout)
  {
    -[NSTimer invalidate](self->mHideHUDTimer, "invalidate");
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "hideHUD", 0, 0, 1.75));
    mHideHUDTimer = self->mHideHUDTimer;
    self->mHideHUDTimer = v3;

  }
}

- (void)setShouldFadeOutUnconditionally:(BOOL)a3
{
  self->mShouldUnconditionallyFadeOutHUD = a3;
}

- (void)moveHUDToPoint:(CGPoint)a3 withDirection:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  CRLCanvasShapeRenderable *v14;
  unint64_t mDirection;
  CRLCanvasShapeRenderable *mHUDRenderable;
  id v17;
  CGPoint v18;

  y = a3.y;
  x = a3.x;
  if (sub_1000637EC())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242E70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09ED8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242E90);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController moveHUDToPoint:withDirection:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    v18.x = x;
    v18.y = y;
    v11 = NSStringFromCGPoint(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 249, 0, "Invalid target point for collaborator HUD! %@", v12);

  }
  else
  {
    if (self->mTargetPoint.x == x && self->mTargetPoint.y == y)
    {
      mDirection = self->mDirection;
      self->mTargetPoint.x = x;
      self->mTargetPoint.y = y;
      self->mDirection = a4;
      mHUDRenderable = self->mHUDRenderable;
      self->mHUDRenderable = 0;

      if (mDirection == a4)
        return;
    }
    else
    {
      self->mTargetPoint.x = x;
      self->mTargetPoint.y = y;
      self->mDirection = a4;
      v14 = self->mHUDRenderable;
      self->mHUDRenderable = 0;

    }
    v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
    objc_msgSend(v17, "positionDidUpdateForCollaboratorHUDController:", self);

  }
}

- (CGRect)scaledFrameForHUDAtPoint:(CGPoint)a3 withDirection:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGPoint v35;
  CGPoint v36;
  CGRect result;

  y = a3.y;
  x = a3.x;
  if (sub_1000637EC())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242EB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09F88();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242ED0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController scaledFrameForHUDAtPoint:withDirection:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    v36.x = x;
    v36.y = y;
    v11 = NSStringFromCGPoint(v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 265, 0, "Invalid target point for collaborator HUD! %@", v12);

    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  -[CRLCollaboratorCursorHUDController p_unscaledHUDFrame](self, "p_unscaledHUDFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  v35 = CGPointZero;
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_bezierPathForHUDWithFrame:direction:outAnchorPoint:](self, "p_bezierPathForHUDWithFrame:direction:outAnchorPoint:", a4, &v35, v14, v16, v18, v20)));
  objc_msgSend(v21, "setPath:", objc_msgSend(v22, "CGPath"));
  objc_msgSend(v22, "bounds");
  objc_msgSend(v21, "setBounds:");
  objc_msgSend(v21, "setAnchorPoint:", v35);
  objc_msgSend(v21, "setPosition:", x, y);
  objc_msgSend(v21, "frame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)p_delegate
{
  return objc_loadWeakRetained((id *)&self->mDelegate);
}

- (BOOL)p_isCompact
{
  return self->mHUDSize == 1;
}

- (void)didEndZoomingOperation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  objc_msgSend(v3, "updatePositionForCollaboratorHUDController:", self);

}

- (void)p_hideFollowHUD
{
  double v3;
  id v4;

  -[CRLCollaboratorCursorHUDController stopAutoHideTimer](self, "stopAutoHideTimer");
  LODWORD(v3) = 0;
  -[CRLCanvasRenderable setOpacity:](self->mHUDRenderable, "setOpacity:", v3);
  -[CRLCollaboratorCursorOverlayView setAlpha:](self->mSizeToggleOverlayView, "setAlpha:", 0.0);
  -[CRLCollaboratorCursorOverlayView setAlpha:](self->mFollowToggleOverlayView, "setAlpha:", 0.0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  objc_msgSend(v4, "removeCollaboratorHUDController:", self);

}

- (void)p_hideHUDLegacy
{
  NSTimer *mHideHUDTimer;
  NSTimer *mAbsoluteTimeTimer;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  _QWORD v11[5];
  _QWORD v12[5];

  -[NSTimer invalidate](self->mHideHUDTimer, "invalidate");
  mHideHUDTimer = self->mHideHUDTimer;
  self->mHideHUDTimer = 0;

  -[NSTimer invalidate](self->mAbsoluteTimeTimer, "invalidate");
  mAbsoluteTimeTimer = self->mAbsoluteTimeTimer;
  self->mAbsoluteTimeTimer = 0;

  if (self->mFadeStartTime == 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->mFadeStartTime = v5;
  }
  -[CRLCollaboratorCursorHUDController p_currentDesiredOpacity](self, "p_currentDesiredOpacity");
  v7 = v6;
  *(float *)&v6 = v6;
  -[CRLCanvasRenderable setOpacity:](self->mHUDRenderable, "setOpacity:", v6);
  -[CRLCollaboratorCursorOverlayView setAlpha:](self->mSizeToggleOverlayView, "setAlpha:", v7);
  -[CRLCollaboratorCursorOverlayView setAlpha:](self->mFollowToggleOverlayView, "setAlpha:", v7);
  +[CATransaction begin](CATransaction, "begin");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001DCEA4;
  v12[3] = &unk_10122D110;
  v12[4] = self;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v12);
  -[CRLCanvasRenderable opacity](self->mHUDRenderable, "opacity");
  v9 = sub_10006191C(0.0, 0.200000003, v8);
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
  LODWORD(v10) = 0;
  -[CRLCanvasRenderable setOpacity:](self->mHUDRenderable, "setOpacity:", v10);
  +[CATransaction commit](CATransaction, "commit");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001DCF38;
  v11[3] = &unk_10122D110;
  v11[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v9);
}

- (double)p_currentDesiredOpacity
{
  double v3;
  double result;

  if (self->mFadeStartTime == 0.0)
    return 1.0;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  result = (v3 - self->mFadeStartTime) / -0.200000003 + 1.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)p_followButtonPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate", a3));
  objc_msgSend(v4, "beginFollowing:forHUDController:", self->mCollaboratorPresence, self);

}

- (id)p_stringToDisplay
{
  uint64_t v2;

  if (self->mFollowEnabled && !self->mIsFollowing)
    v2 = 112;
  else
    v2 = 104;
  return *(id *)((char *)&self->super.isa + v2);
}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;

  if (self->mFollowEnabled)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow](self, "p_decoratorOverlayRenderablesWithFollow"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy](self, "p_decoratorOverlayRenderablesLegacy"));
  return (NSArray *)v2;
}

- (id)p_decoratorOverlayRenderablesLegacy
{
  NSTimer *mHideHUDTimer;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  CRLCanvasShapeRenderable *mHUDRenderable;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CRLCanvasShapeRenderable *v19;
  CRLCanvasShapeRenderable *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  void *v47;
  double v48;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *mAvatarRenderer;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  NSObject *v70;
  NSString *v71;
  void *v72;
  NSObject *v73;
  NSString *v74;
  void *v75;
  unint64_t mDirection;
  unint64_t mHUDSize;
  double v78;
  CGPoint v79;
  CRLCanvasShapeRenderable *v80;
  uint8_t buf[8];
  __int16 v82;
  const char *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  int v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  unint64_t v91;
  __int16 v92;
  unint64_t v93;
  __int16 v94;
  void *v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  mHideHUDTimer = self->mHideHUDTimer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  -[CRLCollaboratorCursorHUDController p_currentDesiredOpacity](self, "p_currentDesiredOpacity");
  v6 = v5;
  objc_msgSend(v4, "updatePositionForCollaboratorHUDController:", self);
  if (self->mHideHUDTimer)
    v7 = 1;
  else
    v7 = mHideHUDTimer == 0;
  if (v7)
  {
    mHUDRenderable = self->mHUDRenderable;
    if (!mHUDRenderable)
    {
      v9 = sub_1003A91F4();
      -[CRLCollaboratorCursorHUDController p_unscaledHUDFrame](self, "p_unscaledHUDFrame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_stringToDisplay](self, "p_stringToDisplay"));
      v19 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
      v20 = self->mHUDRenderable;
      self->mHUDRenderable = v19;

      -[CRLCanvasRenderable setZPosition:](self->mHUDRenderable, "setZPosition:", 1.0);
      if (sub_10006178C(v11, v13, v15, v17))
      {
        v79 = CGPointZero;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_bezierPathForHUDWithFrame:direction:outAnchorPoint:](self, "p_bezierPathForHUDWithFrame:direction:outAnchorPoint:", self->mDirection, &v79, v11, v13, v15, v17));
        if (objc_msgSend(v21, "isEmpty"))
        {
          v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101242F30);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v73 = v23;
            v99.origin.x = v11;
            v99.origin.y = v13;
            v99.size.width = v15;
            v99.size.height = v17;
            v74 = NSStringFromCGRect(v99);
            v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
            mDirection = self->mDirection;
            mHUDSize = self->mHUDSize;
            *(_DWORD *)buf = 67110914;
            *(_DWORD *)&buf[4] = v22;
            v82 = 2082;
            v83 = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]";
            v84 = 2082;
            v85 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
            v86 = 1024;
            v87 = 433;
            v88 = 2114;
            v89 = v75;
            v90 = 2048;
            v91 = mDirection;
            v92 = 2048;
            v93 = mHUDSize;
            v94 = 2112;
            v95 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", buf, 0x4Au);

          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101242F50);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
          v96.origin.x = v11;
          v96.origin.y = v13;
          v96.size.width = v15;
          v96.size.height = v17;
          v27 = NSStringFromCGRect(v96);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 433, 0, "Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", v28, self->mDirection, self->mHUDSize, v18);
        }
        else
        {
          v37 = objc_retainAutorelease(v21);
          -[CRLCanvasShapeRenderable setPath:](self->mHUDRenderable, "setPath:", objc_msgSend(v37, "CGPath"));
          objc_msgSend(v37, "bounds");
          -[CRLCanvasRenderable setBounds:](self->mHUDRenderable, "setBounds:");
          -[CRLCanvasRenderable setAnchorPoint:](self->mHUDRenderable, "setAnchorPoint:", v79);
          if ((sub_1000637EC() & 1) == 0)
          {
            -[CRLCanvasRenderable setPosition:](self->mHUDRenderable, "setPosition:", self->mTargetPoint.x, self->mTargetPoint.y);
            -[CRLCanvasRenderable frame](self->mHUDRenderable, "frame");
            v39 = v38;
            v41 = v40;
            v43 = v42;
            v45 = v44;
            objc_msgSend(v4, "contentsScale");
            -[CRLCanvasRenderable setFrame:](self->mHUDRenderable, "setFrame:", sub_100063150(v39, v41, v43, v45, v46));
          }
          if (-[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
          }
          else
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorPresence owner](self->mCollaboratorPresence, "owner"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "collaboratorColorForType:", 1));

          }
          -[CRLCanvasShapeRenderable setFillColor:](self->mHUDRenderable, "setFillColor:", objc_msgSend(v25, "CGColor"));
          *(float *)&v48 = v6;
          -[CRLCanvasRenderable setOpacity:](self->mHUDRenderable, "setOpacity:", v48);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
          mAvatarRenderer = self->mAvatarRenderer;
          objc_msgSend(v4, "contentsScale");
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorAvatarRenderer renderAvatarImageWithContentsScale:](mAvatarRenderer, "renderAvatarImageWithContentsScale:"));
          -[CRLCollaboratorCursorHUDController p_avatarSize](self, "p_avatarSize");
          v51 = v50;
          v53 = v52;
          -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
          if (v9)
            v55 = v15 - v54 - v51;
          else
            v55 = v54;
          objc_msgSend(v26, "setContents:", objc_msgSend(v28, "CGImage"));
          objc_msgSend(v26, "setFrame:", v55, (v17 - v53) * 0.5, v51, v53);
          objc_msgSend(v4, "contentsScale");
          objc_msgSend(v26, "setContentsScale:");
          -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v26);
          if (!-[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact"))
          {
            -[CRLCollaboratorCursorHUDController p_displayStringSize](self, "p_displayStringSize");
            v57 = v56;
            v59 = v58;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasTextRenderable renderable](CRLCanvasTextRenderable, "renderable"));
            -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
            v62 = v51 + v61;
            -[CRLCollaboratorCursorHUDController p_avatarTrailingSpace](self, "p_avatarTrailingSpace");
            v64 = v62 + v63;
            if (v9)
              v65 = v15 - (v57 + v64);
            else
              v65 = v64;
            objc_msgSend(v60, "setString:", v18);
            objc_msgSend(v4, "contentsScale");
            objc_msgSend(v60, "setFrame:", sub_100063150(v65, (v17 - v59) * 0.5, v57, v59, v66));
            *(_QWORD *)buf = 0;
            v78 = 0.0;
            -[CRLCollaboratorCursorHUDController p_stringFontSize:fontWeight:isDisplayString:](self, "p_stringFontSize:fontWeight:isDisplayString:", buf, &v78, 1);
            objc_msgSend(v60, "setFontSize:", *(double *)buf);
            if ((unint64_t)objc_msgSend(v18, "length") >= 4)
              objc_msgSend(v60, "setTruncationMode:", kCATruncationEnd);
            v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", *(double *)buf, v78));
            objc_msgSend(v60, "setFont:", v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
            objc_msgSend(v60, "setForegroundColor:", objc_msgSend(v68, "CGColor"));

            objc_msgSend(v4, "contentsScale");
            objc_msgSend(v60, "setContentsScale:");
            -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v60);

          }
        }

      }
      else
      {
        v30 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242EF0);
        v31 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v70 = v31;
          v98.origin.x = v11;
          v98.origin.y = v13;
          v98.size.width = v15;
          v98.size.height = v17;
          v71 = NSStringFromCGRect(v98);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)&buf[4] = v30;
          v82 = 2082;
          v83 = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]";
          v84 = 2082;
          v85 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
          v86 = 1024;
          v87 = 428;
          v88 = 2114;
          v89 = v72;
          v90 = 2112;
          v91 = (unint64_t)v18;
          _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not creating cursor HUD because frame is %{public}@ for string %@", buf, 0x36u);

        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242F10);
        v32 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesLegacy]"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
        v97.origin.x = v11;
        v97.origin.y = v13;
        v97.size.width = v15;
        v97.size.height = v17;
        v35 = NSStringFromCGRect(v97);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 428, 0, "Not creating cursor HUD because frame is %{public}@ for string %@", v36, v18);

      }
      if (v6 < 1.0)
      {
        +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "hideHUD", 0);
        -[CRLCollaboratorCursorHUDController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "hideHUD", 0, 0.0);
      }

      mHUDRenderable = self->mHUDRenderable;
    }
    v80 = mHUDRenderable;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
  }
  else
  {
    v29 = &__NSArray0__struct;
  }

  return v29;
}

- (id)p_decoratorOverlayRenderablesWithFollow
{
  void *v3;
  CRLCanvasShapeRenderable *mHUDRenderable;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CRLCanvasShapeRenderable *v14;
  CRLCanvasShapeRenderable *v15;
  void *v16;
  CRLCanvasShapeRenderable *mFollowButtonRenderable;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  void *v43;
  void *v44;
  _TtC8Freeform23CRLCollaboratorPresence *mCollaboratorPresence;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  _TtC8Freeform29CRLCollaboratorAvatarRenderer *mAvatarRenderer;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CRLCanvasShapeRenderable *v88;
  CRLCanvasShapeRenderable *v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double MinX;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  NSObject *v104;
  NSString *v105;
  void *v106;
  NSObject *v107;
  NSString *v108;
  void *v109;
  unint64_t mDirection;
  unint64_t mHUDSize;
  CRLCanvasShapeRenderable *v112;
  id v113;
  id v114;
  void *v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  CGPoint v119;
  CRLCanvasShapeRenderable *v120;
  _BYTE buf[28];
  __int16 v122;
  int v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  unint64_t v127;
  __int16 v128;
  unint64_t v129;
  __int16 v130;
  void *v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  objc_msgSend(v3, "updatePositionForCollaboratorHUDController:", self);
  mHUDRenderable = self->mHUDRenderable;
  if (!mHUDRenderable)
  {
    v5 = sub_1003A91F4();
    -[CRLCollaboratorCursorHUDController p_unscaledHUDFrame](self, "p_unscaledHUDFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    v15 = self->mHUDRenderable;
    self->mHUDRenderable = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_stringToDisplay](self, "p_stringToDisplay"));
    mFollowButtonRenderable = self->mFollowButtonRenderable;
    self->mFollowButtonRenderable = 0;

    -[CRLCanvasRenderable setZPosition:](self->mHUDRenderable, "setZPosition:", 1.0);
    if (sub_10006178C(v7, v9, v11, v13))
    {
      v119 = CGPointZero;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_bezierPathForHUDWithFrame:direction:outAnchorPoint:](self, "p_bezierPathForHUDWithFrame:direction:outAnchorPoint:", self->mDirection, &v119, v7, v9, v11, v13));
      if (objc_msgSend(v18, "isEmpty"))
      {
        v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242FB0);
        v20 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v107 = v20;
          v138.origin.x = v7;
          v138.origin.y = v9;
          v138.size.width = v11;
          v138.size.height = v13;
          v108 = NSStringFromCGRect(v138);
          v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
          mDirection = self->mDirection;
          mHUDSize = self->mHUDSize;
          *(_DWORD *)buf = 67110914;
          *(_DWORD *)&buf[4] = v19;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]";
          *(_WORD *)&buf[18] = 2082;
          *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
          v122 = 1024;
          v123 = 531;
          v124 = 2114;
          v125 = v109;
          v126 = 2048;
          v127 = mDirection;
          v128 = 2048;
          v129 = mHUDSize;
          v130 = 2112;
          v131 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", buf, 0x4Au);

        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242FD0);
        v21 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
        v132.origin.x = v7;
        v132.origin.y = v9;
        v132.size.width = v11;
        v132.size.height = v13;
        v24 = NSStringFromCGRect(v132);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 531, 0, "Produced an empty bezier path for HUD with frame %{public}@ direction %zi HUD size %zi string %@", v25, self->mDirection, self->mHUDSize, v16);
      }
      else
      {
        v33 = objc_retainAutorelease(v18);
        -[CRLCanvasShapeRenderable setPath:](self->mHUDRenderable, "setPath:", objc_msgSend(v33, "CGPath"));
        objc_msgSend(v33, "bounds");
        -[CRLCanvasRenderable setBounds:](self->mHUDRenderable, "setBounds:");
        -[CRLCanvasRenderable setAnchorPoint:](self->mHUDRenderable, "setAnchorPoint:", v119);
        if ((sub_1000637EC() & 1) == 0)
        {
          -[CRLCanvasRenderable setPosition:](self->mHUDRenderable, "setPosition:", self->mTargetPoint.x, self->mTargetPoint.y);
          -[CRLCanvasRenderable frame](self->mHUDRenderable, "frame");
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v41 = v40;
          objc_msgSend(v3, "contentsScale");
          -[CRLCanvasRenderable setFrame:](self->mHUDRenderable, "setFrame:", sub_100063150(v35, v37, v39, v41, v42));
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorPresence owner](self->mCollaboratorPresence, "owner"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "collaboratorColorForType:", 1));

        if (!v22)
        {
          if (qword_10147E4E0 != -1)
            dispatch_once(&qword_10147E4E0, &stru_101242FF0);
          v44 = off_1013D91E0;
          if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
          {
            mCollaboratorPresence = self->mCollaboratorPresence;
            v46 = v44;
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorPresence owner](mCollaboratorPresence, "owner"));
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = mCollaboratorPresence;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v47;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Collaborator Cursor: Unable to load collaborator color for presence: %{public}@ %{public}@", buf, 0x16u);

          }
        }
        v115 = v18;
        -[CRLCanvasShapeRenderable setFillColor:](self->mHUDRenderable, "setFillColor:", objc_msgSend(v22, "CGColor"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
        -[CRLCanvasRenderable setShadowColor:](self->mHUDRenderable, "setShadowColor:", objc_msgSend(v48, "CGColor"));

        LODWORD(v49) = 1045220557;
        -[CRLCanvasRenderable setShadowOpacity:](self->mHUDRenderable, "setShadowOpacity:", v49);
        -[CRLCanvasRenderable setShadowRadius:](self->mHUDRenderable, "setShadowRadius:", 12.0);
        -[CRLCanvasRenderable setShadowOffset:](self->mHUDRenderable, "setShadowOffset:", 0.0, 2.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        mAvatarRenderer = self->mAvatarRenderer;
        objc_msgSend(v3, "contentsScale");
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorAvatarRenderer renderAvatarImageWithContentsScale:](mAvatarRenderer, "renderAvatarImageWithContentsScale:"));
        -[CRLCollaboratorCursorHUDController p_avatarSize](self, "p_avatarSize");
        v52 = v51;
        v54 = v53;
        -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
        if (v5)
          v56 = v11 - v55 - v52;
        else
          v56 = v55;
        objc_msgSend(v23, "setContents:", objc_msgSend(v25, "CGImage"));
        objc_msgSend(v23, "setFrame:", v56, (v13 - v54) * 0.5, v52, v54);
        objc_msgSend(v3, "contentsScale");
        objc_msgSend(v23, "setContentsScale:");
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.0, 0.100000001));
        objc_msgSend(v57, "setFillColor:", objc_msgSend(v58, "CGColor"));

        v134.origin.x = v56;
        v134.origin.y = (v13 - v54) * 0.5;
        v134.size.width = v52;
        v134.size.height = v54;
        v135 = CGRectInset(v134, -1.0, -1.0);
        v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v135.origin.x, v135.origin.y, v135.size.width, v135.size.height)));
        objc_msgSend(v57, "setPath:", objc_msgSend(v59, "CGPath"));
        objc_msgSend(v23, "anchorPoint");
        objc_msgSend(v57, "setAnchorPoint:");
        -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v57);
        -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v23);
        if (!-[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact"))
        {
          v114 = v59;
          -[CRLCollaboratorCursorHUDController p_displayStringSize](self, "p_displayStringSize");
          v61 = v60;
          v63 = v62;
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasTextRenderable renderable](CRLCanvasTextRenderable, "renderable"));
          objc_msgSend(v64, "setString:", v16);
          -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
          v66 = v52 + v65;
          -[CRLCollaboratorCursorHUDController p_avatarTrailingSpace](self, "p_avatarTrailingSpace");
          v68 = v66 + v67;
          v69 = v61 + v68;
          if (v5)
            v70 = v11 - (v61 + v68);
          else
            v70 = v68;
          objc_msgSend(v3, "contentsScale");
          objc_msgSend(v64, "setFrame:", sub_100063150(v70, (v13 - v63) * 0.5, v61, v63, v71));
          *(_QWORD *)buf = 0;
          v118 = 0;
          -[CRLCollaboratorCursorHUDController p_stringFontSize:fontWeight:isDisplayString:](self, "p_stringFontSize:fontWeight:isDisplayString:", buf, &v118, 1);
          objc_msgSend(v64, "setFontSize:", *(double *)buf);
          if ((unint64_t)objc_msgSend(v16, "length") >= 4)
            objc_msgSend(v64, "setTruncationMode:", kCATruncationEnd);
          objc_msgSend(v64, "setFont:", -[CRLCollaboratorCursorHUDController p_fontForDisplayString](self, "p_fontForDisplayString"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
          objc_msgSend(v64, "setForegroundColor:", objc_msgSend(v72, "CGColor"));

          objc_msgSend(v3, "contentsScale");
          objc_msgSend(v64, "setContentsScale:");
          -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v64);
          if (!self->mIsFollowing && !self->mIsLocalParticipant)
          {
            -[CRLCollaboratorCursorHUDController p_followButtonSize](self, "p_followButtonSize");
            v74 = v73;
            v76 = v75;
            -[CRLCollaboratorCursorHUDController p_displayStringTrailingSpace](self, "p_displayStringTrailingSpace");
            v78 = v69 + v77;
            if (v5)
              v79 = v11 - (v74 + v78);
            else
              v79 = v78;
            objc_msgSend(v3, "contentsScale");
            v81 = sub_100063150(v79, (v13 - v76) * 0.5, v74, v76, v80);
            v83 = v82;
            v85 = v84;
            v87 = v86;
            v88 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
            v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v81, v83, v85, v87, v87 * 0.5)));
            -[CRLCanvasShapeRenderable setPath:](v88, "setPath:", objc_msgSend(v113, "CGPath"));
            -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v88);
            v89 = self->mFollowButtonRenderable;
            self->mFollowButtonRenderable = v88;
            v112 = v88;

            -[CRLCollaboratorCursorHUDController p_updateButtonRenderableFillColor](self, "p_updateButtonRenderableFillColor");
            -[CRLCollaboratorCursorHUDController p_followButtonStringSize](self, "p_followButtonStringSize");
            v91 = v90;
            v93 = v92;
            v136.origin.x = v81;
            v136.origin.y = v83;
            v136.size.width = v85;
            v136.size.height = v87;
            MinX = CGRectGetMinX(v136);
            -[CRLCollaboratorCursorHUDController p_followButtonInternalHorizontalPadding](self, "p_followButtonInternalHorizontalPadding");
            v96 = MinX + v95;
            -[CRLCollaboratorCursorHUDController p_verticalTextOffset](self, "p_verticalTextOffset");
            v98 = (v13 - v93) * 0.5 - v97;
            v99 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasTextRenderable renderable](CRLCanvasTextRenderable, "renderable"));
            objc_msgSend(v99, "setString:", self->mFollowString);
            objc_msgSend(v3, "contentsScale");
            objc_msgSend(v99, "setFrame:", sub_100063150(v96, v98, v91, v93, v100));
            v116 = 0;
            v117 = 0.0;
            -[CRLCollaboratorCursorHUDController p_stringFontSize:fontWeight:isDisplayString:](self, "p_stringFontSize:fontWeight:isDisplayString:", &v117, &v116, 0);
            objc_msgSend(v99, "setFontSize:", v117);
            objc_msgSend(v99, "setFont:", -[CRLCollaboratorCursorHUDController p_fontForFollowButtonString](self, "p_fontForFollowButtonString"));
            v101 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
            objc_msgSend(v99, "setForegroundColor:", objc_msgSend(v101, "CGColor"));

            objc_msgSend(v3, "contentsScale");
            objc_msgSend(v99, "setContentsScale:");
            -[CRLCanvasRenderable addSubrenderable:](self->mHUDRenderable, "addSubrenderable:", v99);

          }
          v59 = v114;
        }

        v18 = v115;
      }

    }
    else
    {
      v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242F70);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v104 = v27;
        v137.origin.x = v7;
        v137.origin.y = v9;
        v137.size.width = v11;
        v137.size.height = v13;
        v105 = NSStringFromCGRect(v137);
        v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v26;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m";
        v122 = 1024;
        v123 = 526;
        v124 = 2114;
        v125 = v106;
        v126 = 2112;
        v127 = (unint64_t)v16;
        _os_log_error_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not creating cursor HUD because frame is %{public}@ for string %@", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242F90);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_decoratorOverlayRenderablesWithFollow]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
      v133.origin.x = v7;
      v133.origin.y = v9;
      v133.size.width = v11;
      v133.size.height = v13;
      v31 = NSStringFromCGRect(v133);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 526, 0, "Not creating cursor HUD because frame is %{public}@ for string %@", v32, v16);

    }
    mHUDRenderable = self->mHUDRenderable;
  }
  v120 = mHUDRenderable;
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v120, 1));

  return v102;
}

- (void)p_updateButtonRenderableFillColor
{
  double v3;
  id v4;

  v3 = 0.5;
  if (!self->mInteractionInProgress)
    v3 = 0.300000012;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.0, v3));
  -[CRLCanvasShapeRenderable setFillColor:](self->mFollowButtonRenderable, "setFillColor:", objc_msgSend(v4, "CGColor"));

}

- (id)p_followToggleOverlayView
{
  CRLCollaboratorCursorOverlayView *mFollowToggleOverlayView;
  CRLCollaboratorCursorOverlayView *v4;
  CRLCollaboratorCursorOverlayView *v5;

  mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  if (!mFollowToggleOverlayView)
  {
    v4 = -[CRLCollaboratorCursorOverlayView initWithFrame:]([CRLCollaboratorCursorOverlayView alloc], "initWithFrame:", NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
    v5 = self->mFollowToggleOverlayView;
    self->mFollowToggleOverlayView = v4;

    mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  }
  return mFollowToggleOverlayView;
}

- (id)p_sizeToggleOverlayView
{
  CRLCollaboratorCursorOverlayView *mSizeToggleOverlayView;
  CRLCollaboratorCursorOverlayView *v4;
  CRLCollaboratorCursorOverlayView *v5;

  mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  if (!mSizeToggleOverlayView)
  {
    v4 = -[CRLCollaboratorCursorOverlayView initWithFrame:]([CRLCollaboratorCursorOverlayView alloc], "initWithFrame:", NSZeroRect.origin.x, NSZeroRect.origin.y, NSZeroRect.size.width, NSZeroRect.size.height);
    v5 = self->mSizeToggleOverlayView;
    self->mSizeToggleOverlayView = v4;

    mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  }
  return mSizeToggleOverlayView;
}

- (id)decoratorOverlayViews
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  unsigned int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;

  if (self->mFollowEnabled)
  {
    if (self->mHUDRenderable)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
      v4 = objc_msgSend(v3, "shouldSuppressCollaboratorCursorHUDForController:", self);

      if ((v4 & 1) == 0)
      {
        v7 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
        v8 = sub_1003A91F4();
        -[CRLCollaboratorCursorHUDController p_unscaledHUDFrame](self, "p_unscaledHUDFrame");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        if (sub_10006178C(v9, v11, v13, v15))
        {
          if ((v7 & 1) == 0)
          {
LABEL_28:
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
            v29 = v28;
            -[CRLCollaboratorCursorHUDController p_avatarSize](self, "p_avatarSize");
            v31 = v29 + v30;
            -[CRLCollaboratorCursorHUDController p_avatarTrailingSpace](self, "p_avatarTrailingSpace");
            v33 = v32 + v31;
            if (v8)
              v34 = v14 - v33;
            else
              v34 = 0.0;
            if (!sub_10006178C(v34, 0.0, v33, v16))
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101243090);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E0A0B8();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_1012430B0);
              v35 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 714, 0, "Non-finite sizeOverlayFrameInRenderable.");

            }
            -[CRLCanvasRenderable frame](self->mHUDRenderable, "frame");
            v39 = sub_1000603D0(v34, 0.0, v38);
            v41 = v40;
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_sizeToggleOverlayView](self, "p_sizeToggleOverlayView"));
            objc_msgSend(v42, "setInteractionDelegate:", self);
            objc_msgSend(v42, "setFrame:", v39, v41, v33, v16);
            objc_msgSend(v27, "addObject:", v42);
            if (!self->mIsFollowing)
            {
              -[CRLCollaboratorCursorHUDController p_followButtonSize](self, "p_followButtonSize");
              v44 = v43;
              -[CRLCollaboratorCursorHUDController p_displayStringSize](self, "p_displayStringSize");
              v46 = v33 + v45;
              -[CRLCollaboratorCursorHUDController p_displayStringTrailingSpace](self, "p_displayStringTrailingSpace");
              v48 = v47 + v46;
              if (v8)
                v49 = v14 - (v44 + v48);
              else
                v49 = v48;
              if (!sub_10006178C(v49, 0.0, v44, v16))
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012430D0);
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100E0A038();
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012430F0);
                v50 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DE7468(v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]"));
                v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 732, 0, "Non-finite followButtonFrameInRenderable.");

              }
              -[CRLCanvasRenderable frame](self->mHUDRenderable, "frame");
              v54 = sub_1000603D0(v49, 0.0, v53);
              v56 = v55;
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_followToggleOverlayView](self, "p_followToggleOverlayView"));
              objc_msgSend(v57, "setInteractionDelegate:", self);
              objc_msgSend(v57, "setFrame:", v54, v56, v44, v16);
              objc_msgSend(v27, "addObject:", v57);

            }
            v5 = objc_msgSend(v27, "copy");

            goto LABEL_57;
          }
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101243010);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E0A1B8();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101243030);
          v17 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 687, 0, "Non-finite standardHUDFrame.");

          if (!v7)
            goto LABEL_28;
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101243050);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E0A138();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101243070);
          v20 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController decoratorOverlayViews]"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 694, 0, "Non-finite avatarFrameInRenderable.");

        }
        -[CRLCanvasRenderable frame](self->mHUDRenderable, "frame");
        v24 = sub_1000603D0(v10, v12, v23);
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_sizeToggleOverlayView](self, "p_sizeToggleOverlayView"));
        objc_msgSend(v27, "setInteractionDelegate:", self);
        objc_msgSend(v27, "setFrame:", v24, v26, v14, v16);
        v58 = v27;
        v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
LABEL_57:

        return v5;
      }
    }
  }
  v5 = &__NSArray0__struct;
  return v5;
}

- (id)p_cachedPath
{
  CRLBezierPath *v3;
  CRLBezierPath *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLBezierPath *mCachedPath;

  v3 = self->mCachedPath;
  v4 = v3;
  if (v3 && -[CRLBezierPath isEmpty](v3, "isEmpty"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243110);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A238();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243130);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_cachedPath]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 757, 0, "Retrieving cached path which is empty! Ignoring.");

    mCachedPath = self->mCachedPath;
    self->mCachedPath = 0;

    v4 = 0;
  }
  return v4;
}

- (CGPoint)p_cachedAnchorPointForDirection:(unint64_t)a3
{
  CGFloat x;
  CGFloat y;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGPoint result;

  if (self->mCachedPathDirection == a3)
  {
    x = self->mCachedAnchorPoint.x;
    y = self->mCachedAnchorPoint.y;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243150);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A2B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243170);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    x = CGPointZero.x;
    y = CGPointZero.y;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController p_cachedAnchorPointForDirection:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 771, 0, "p_cachedAnchorPointIfAvailableForDirection should only be called when p_cachedPathIfAvailableForDirection is not nil for the same direction");

  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)p_clearPathAndAnchorPointCaches
{
  CRLBezierPath *mCachedPath;

  mCachedPath = self->mCachedPath;
  self->mCachedPath = 0;

}

- (id)p_bezierPathForHUDWithFrame:(CGRect)a3 direction:(unint64_t)a4 outAnchorPoint:(CGPoint *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double MidX;
  double MinY;
  double v21;
  double MidY;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_cachedPath](self, "p_cachedPath"));
  if (v12)
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    if (CGRectEqualToRect(v28, self->mCachedFrameForPaths) && self->mCachedPathDirection == a4)
    {
      v13 = objc_msgSend(v12, "copy");
      -[CRLCollaboratorCursorHUDController p_cachedAnchorPointForDirection:](self, "p_cachedAnchorPointForDirection:", a4);
      v15 = v14;
      v17 = v16;
      if (!a5)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  v15 = 0.5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", x, y, width, height, height * 0.5));
  v17 = 0.5;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_15;
    case 1uLL:
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      MidX = CGRectGetMidX(v29);
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      MinY = CGRectGetMinY(v30);
      v21 = -7.0;
      goto LABEL_10;
    case 2uLL:
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      MidX = CGRectGetMidX(v31);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      MinY = CGRectGetMaxY(v32);
      v21 = 7.0;
LABEL_10:
      MidY = MinY + v21;
      break;
    case 3uLL:
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v23 = CGRectGetMinX(v33) + 2.0;
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      MidY = CGRectGetMidY(v34);
      v24 = -7.0;
      goto LABEL_13;
    case 4uLL:
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v23 = CGRectGetMaxX(v35) + -2.0;
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      MidY = CGRectGetMidY(v36);
      v24 = 7.0;
LABEL_13:
      MidX = v23 + v24;
      break;
    default:
      MidX = CGPointZero.x;
      MidY = CGPointZero.y;
      break;
  }
  objc_msgSend(v18, "bounds");
  v15 = MidX / v25;
  v17 = MidY / v26;
LABEL_15:
  v13 = v18;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  if (!CGRectEqualToRect(v37, self->mCachedFrameForPaths))
  {
    self->mCachedFrameForPaths.origin.x = x;
    self->mCachedFrameForPaths.origin.y = y;
    self->mCachedFrameForPaths.size.width = width;
    self->mCachedFrameForPaths.size.height = height;
    -[CRLCollaboratorCursorHUDController p_clearPathAndAnchorPointCaches](self, "p_clearPathAndAnchorPointCaches");
  }
  if ((objc_msgSend(v13, "isEmpty") & 1) == 0)
  {
    objc_storeStrong((id *)&self->mCachedPath, v18);
    self->mCachedPathDirection = a4;
    self->mCachedAnchorPoint.x = v15;
    self->mCachedAnchorPoint.y = v17;
  }

  if (a5)
  {
LABEL_20:
    a5->x = v15;
    a5->y = v17;
  }
LABEL_21:

  return v13;
}

- (void)userInteractionBeganForView:(id)a3
{
  self->mInteractionInProgress = 1;
  -[CRLCollaboratorCursorHUDController p_updateButtonRenderableFillColor](self, "p_updateButtonRenderableFillColor", a3);
}

- (void)userInteractionEndedForView:(id)a3
{
  CRLCollaboratorCursorOverlayView *v4;
  CRLCollaboratorCursorOverlayView *v5;

  v5 = (CRLCollaboratorCursorOverlayView *)a3;
  self->mInteractionInProgress = 0;
  -[CRLCollaboratorCursorHUDController p_updateButtonRenderableFillColor](self, "p_updateButtonRenderableFillColor");
  v4 = v5;
  if (self->mSizeToggleOverlayView == v5)
  {
    -[CRLCollaboratorCursorHUDController p_toggleSize](self, "p_toggleSize");
    goto LABEL_6;
  }
  if (self->mFollowToggleOverlayView == v5 && !self->mIsFollowing)
  {
    -[CRLCollaboratorCursorHUDController p_followButtonPressed:](self, "p_followButtonPressed:", v5);
LABEL_6:
    v4 = v5;
  }

}

- (void)userInteractionCancelledForView:(id)a3
{
  self->mInteractionInProgress = 0;
  -[CRLCollaboratorCursorHUDController p_updateButtonRenderableFillColor](self, "p_updateButtonRenderableFillColor", a3);
}

- (void)p_toggleSize
{
  id v3;

  if (self->mFollowEnabled || !self->mShouldAutoTimeout)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
    objc_msgSend(v3, "toggleSizeForCollaboratorHUDController:", self);

  }
}

- (CGRect)p_unscaledHUDFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
  v4 = v3;
  -[CRLCollaboratorCursorHUDController p_avatarSize](self, "p_avatarSize");
  v6 = v4 + v5;
  -[CRLCollaboratorCursorHUDController p_avatarTrailingSpace](self, "p_avatarTrailingSpace");
  v8 = v7 + v6;
  -[CRLCollaboratorCursorHUDController p_displayStringSize](self, "p_displayStringSize");
  v10 = v8 + v9;
  -[CRLCollaboratorCursorHUDController p_displayStringTrailingSpace](self, "p_displayStringTrailingSpace");
  v12 = v11 + v10;
  -[CRLCollaboratorCursorHUDController p_followButtonSize](self, "p_followButtonSize");
  v14 = v12 + v13;
  -[CRLCollaboratorCursorHUDController p_followButtonTrailingSpace](self, "p_followButtonTrailingSpace");
  v16 = v15 + v14;
  -[CRLCollaboratorCursorHUDController p_totalHeight](self, "p_totalHeight");
  v18 = v17;
  *(float *)&v17 = v16;
  v19 = fmaxf(*(float *)&v17, 22.0);
  v20 = 0.0;
  v21 = 0.0;
  result.size.height = v18;
  result.size.width = v19;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)p_avatarLeadingSpace
{
  unsigned int v3;
  double result;
  double v5;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  result = 8.0;
  if (v3)
    result = 4.0;
  v5 = 3.0;
  if (v3)
    v5 = 0.0;
  if (!self->mFollowEnabled)
    return v5;
  return result;
}

- (double)p_avatarTrailingSpace
{
  unsigned int v3;
  double result;
  double v5;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  result = 8.0;
  if (v3)
    result = 4.0;
  v5 = 5.0;
  if (v3)
    v5 = 0.0;
  if (!self->mFollowEnabled)
    return v5;
  return result;
}

- (double)p_verticalTextOffset
{
  return -0.5;
}

- (CGSize)p_avatarSize
{
  unsigned int v3;
  double v4;
  unint64_t v5;
  double v6;
  CGSize result;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  if (self->mFollowEnabled)
  {
    v4 = 30.0;
    if ((v3 & 1) == 0)
    {
      v5 = -[CRLCollaboratorCursorHUDController p_getAccessibilitySizeFromTraitCollection](self, "p_getAccessibilitySizeFromTraitCollection", 30.0);
      v4 = 0.0;
      if (v5 < 5)
        v4 = dbl_100EEE3E8[v5];
    }
  }
  else
  {
    v4 = 24.0;
    if (v3)
      v4 = 30.0;
  }
  v6 = v4;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)p_sizeForString:(id)a3 font:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  const __CFAttributedString *v9;
  const __CTLine *v10;
  double width;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSAttributedStringKey v17;
  id v18;
  CGSize result;
  CGRect BoundsWithOptions;

  v17 = NSFontAttributeName;
  v18 = a4;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v8 = objc_alloc((Class)NSAttributedString);

  v9 = (const __CFAttributedString *)objc_msgSend(v8, "initWithString:attributes:", v6, v7);
  v10 = CTLineCreateWithAttributedString(v9);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v10, 0);
  width = BoundsWithOptions.size.width;
  if (v10)
    CFRelease(v10);
  v12 = sub_100063090(width);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)p_fontForFollowButtonString
{
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 0.0;
  -[CRLCollaboratorCursorHUDController p_stringFontSize:fontWeight:isDisplayString:](self, "p_stringFontSize:fontWeight:isDisplayString:", &v4, &v3, 0);
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v4, v3));
}

- (id)p_fontForDisplayString
{
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 0.0;
  -[CRLCollaboratorCursorHUDController p_stringFontSize:fontWeight:isDisplayString:](self, "p_stringFontSize:fontWeight:isDisplayString:", &v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v4, v3));
}

- (CGSize)p_followButtonStringSize
{
  CRLOnce *mPreferredSizeOfFollowStringOnce;
  double width;
  double height;
  _QWORD v6[5];
  CGSize result;

  if (self->mFollowString)
  {
    mPreferredSizeOfFollowStringOnce = self->mPreferredSizeOfFollowStringOnce;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001DFB54;
    v6[3] = &unk_10122D110;
    v6[4] = self;
    -[CRLOnce performBlockOnce:](mPreferredSizeOfFollowStringOnce, "performBlockOnce:", v6);
  }
  else
  {
    self->mCachedPreferredSizeOfFollowString = CGSizeZero;
  }
  width = self->mCachedPreferredSizeOfFollowString.width;
  height = self->mCachedPreferredSizeOfFollowString.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)p_displayStringSize
{
  CRLOnce *mPreferredSizeOfFullNameStringOnce;
  const CGSize *p_mCachedPreferredSizeOfFullNameString;
  CRLOnce *mPreferredSizeOfShortNameStringOnce;
  CGFloat *p_height;
  CGSize *p_mCachedPreferredSizeOfShortNameString;
  double width;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  _QWORD v14[5];
  _QWORD v15[5];
  CGSize result;

  mPreferredSizeOfFullNameStringOnce = self->mPreferredSizeOfFullNameStringOnce;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001DFCBC;
  v15[3] = &unk_10122D110;
  v15[4] = self;
  -[CRLOnce performBlockOnce:](mPreferredSizeOfFullNameStringOnce, "performBlockOnce:", v15);
  p_mCachedPreferredSizeOfFullNameString = &CGSizeZero;
  if (self->mShortNameString)
  {
    mPreferredSizeOfShortNameStringOnce = self->mPreferredSizeOfShortNameStringOnce;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001DFD0C;
    v14[3] = &unk_10122D110;
    v14[4] = self;
    -[CRLOnce performBlockOnce:](mPreferredSizeOfShortNameStringOnce, "performBlockOnce:", v14);
  }
  else
  {
    self->mCachedPreferredSizeOfShortNameString = CGSizeZero;
  }
  if (-[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact"))
  {
    p_height = &CGSizeZero.height;
  }
  else
  {
    p_mCachedPreferredSizeOfShortNameString = &self->mCachedPreferredSizeOfShortNameString;
    if (self->mIsFollowing)
      p_height = &self->mCachedPreferredSizeOfFullNameString.height;
    else
      p_height = &self->mCachedPreferredSizeOfShortNameString.height;
    if (self->mIsFollowing)
      p_mCachedPreferredSizeOfShortNameString = &self->mCachedPreferredSizeOfFullNameString;
    if (self->mFollowEnabled)
    {
      p_mCachedPreferredSizeOfFullNameString = p_mCachedPreferredSizeOfShortNameString;
    }
    else
    {
      p_height = &self->mCachedPreferredSizeOfFullNameString.height;
      p_mCachedPreferredSizeOfFullNameString = &self->mCachedPreferredSizeOfFullNameString;
    }
  }
  width = p_mCachedPreferredSizeOfFullNameString->width;
  v9 = *p_height;
  -[CRLCollaboratorCursorHUDController p_maximumDisplayStringWidth](self, "p_maximumDisplayStringWidth");
  *(float *)&v10 = v10;
  v11 = width;
  v12 = fminf(*(float *)&v10, v11);
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)p_maximumDisplayStringWidth
{
  unsigned __int8 v3;
  double result;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  result = 0.0;
  if ((v3 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate", 0.0));
    objc_msgSend(v5, "visibleCanvasWidth");
    v7 = v6;

    -[CRLCollaboratorCursorHUDController p_widthOfEverythingExceptDisplayString](self, "p_widthOfEverythingExceptDisplayString");
    return v7 + -40.0 - v8;
  }
  return result;
}

- (double)p_widthOfEverythingExceptDisplayString
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[CRLCollaboratorCursorHUDController p_avatarLeadingSpace](self, "p_avatarLeadingSpace");
  v4 = v3;
  -[CRLCollaboratorCursorHUDController p_avatarSize](self, "p_avatarSize");
  v6 = v4 + v5;
  -[CRLCollaboratorCursorHUDController p_avatarTrailingSpace](self, "p_avatarTrailingSpace");
  v8 = v7 + v6;
  -[CRLCollaboratorCursorHUDController p_displayStringTrailingSpace](self, "p_displayStringTrailingSpace");
  v10 = v9 + v8;
  -[CRLCollaboratorCursorHUDController p_followButtonSize](self, "p_followButtonSize");
  v12 = v10 + v11;
  -[CRLCollaboratorCursorHUDController p_followButtonTrailingSpace](self, "p_followButtonTrailingSpace");
  return v13 + v12;
}

- (double)p_displayStringTrailingSpace
{
  unsigned int v2;
  double result;

  v2 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  result = 8.0;
  if (v2)
    return 0.0;
  return result;
}

- (CGSize)p_followButtonSize
{
  unsigned int v3;
  double width;
  double height;
  double v6;
  double v7;
  CGSize result;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  if (self->mFollowEnabled && ((!self->mIsFollowing && !self->mIsLocalParticipant) & ~v3) != 0)
  {
    if ((unint64_t)-[CRLCollaboratorCursorHUDController p_getAccessibilitySizeFromTraitCollection](self, "p_getAccessibilitySizeFromTraitCollection") <= 1)height = 24.0;
    else
      height = 28.0;
    -[CRLCollaboratorCursorHUDController p_followButtonStringSize](self, "p_followButtonStringSize");
    width = v6 + 8.0 + 8.0;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v7 = height;
  result.height = v7;
  result.width = width;
  return result;
}

- (double)p_followButtonTrailingSpace
{
  unsigned int v3;
  int v4;
  int v5;
  double result;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  if (self->mIsFollowing)
    v4 = 1;
  else
    v4 = v3;
  if (self->mFollowEnabled)
    v5 = v4;
  else
    v5 = 1;
  result = 8.0;
  if (v5)
    return 0.0;
  return result;
}

- (double)p_followButtonInternalHorizontalPadding
{
  BOOL v2;
  double result;

  v2 = self->mIsFollowing || !self->mFollowEnabled;
  result = 0.0;
  if (!v2)
    return 8.0;
  return result;
}

- (double)p_totalHeight
{
  unsigned int v3;
  _BOOL4 mFollowEnabled;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;

  v3 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  mFollowEnabled = self->mFollowEnabled;
  -[CRLCollaboratorCursorHUDController p_avatarSize](self, "p_avatarSize");
  v6 = v5;
  if (mFollowEnabled)
  {
    if (v3)
    {
      return v5 + 8.0;
    }
    else if ((unint64_t)-[CRLCollaboratorCursorHUDController p_getAccessibilitySizeFromTraitCollection](self, "p_getAccessibilitySizeFromTraitCollection") <= 1)
    {
      return 40.0;
    }
    else
    {
      return 42.0;
    }
  }
  else
  {
    -[CRLCollaboratorCursorHUDController p_displayStringSize](self, "p_displayStringSize");
    if ((v3 & 1) == 0)
    {
      v8 = v6 + 6.0;
      v9 = v7 + 2.0;
      return fmaxf(v8, v9);
    }
  }
  return v6;
}

- (void)p_stringFontSize:(double *)a3 fontWeight:(double *)a4 isDisplayString:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v9;
  UIFontWeight v10;
  double v11;

  v5 = a5;
  v9 = -[CRLCollaboratorCursorHUDController p_isCompact](self, "p_isCompact");
  if (self->mFollowEnabled)
  {
    if (v5)
    {
      v10 = UIFontWeightMedium;
      switch(-[CRLCollaboratorCursorHUDController p_getAccessibilitySizeFromTraitCollection](self, "p_getAccessibilitySizeFromTraitCollection"))
      {
        case 0:
          goto LABEL_11;
        case 1:
          goto LABEL_12;
        case 2:
          v11 = 19.0;
          break;
        case 3:
          v11 = 21.0;
          break;
        case 4:
          v11 = 23.0;
          break;
        default:
          goto LABEL_10;
      }
    }
    else
    {
      v10 = UIFontWeightBold;
      switch(-[CRLCollaboratorCursorHUDController p_getAccessibilitySizeFromTraitCollection](self, "p_getAccessibilitySizeFromTraitCollection"))
      {
        case 0:
          v11 = 11.0;
          break;
        case 1:
LABEL_11:
          v11 = 13.0;
          break;
        case 2:
LABEL_12:
          v11 = 15.0;
          break;
        case 3:
          v11 = 17.0;
          break;
        case 4:
          v11 = 20.0;
          break;
        default:
LABEL_10:
          v11 = 0.0;
          break;
      }
    }
  }
  else
  {
    v10 = UIFontWeightMedium;
    v11 = 15.0;
    if (v9)
      v11 = 10.0;
  }
  if (a3)
    *a3 = v11;
  if (a4)
    *a4 = v10;
}

- (int64_t)p_getAccessibilitySizeFromTraitCollection
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTraitCollection"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  if ((objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraLarge) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraExtraLarge) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryExtraExtraExtraLarge) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityMedium) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityLarge) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraLarge) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraLarge) & 1) != 0)
  {
    v5 = 4;
  }
  else if (objc_msgSend(v4, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraExtraLarge))
  {
    v5 = 4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)resetAutoHideTimer
{
  if (self->mAutoHideTimer)
    -[CRLCollaboratorCursorHUDController stopAutoHideTimer](self, "stopAutoHideTimer");
  -[CRLCollaboratorCursorHUDController startAutoHideTimer](self, "startAutoHideTimer");
}

- (void)stopAutoHideTimer
{
  NSTimer *mAutoHideTimer;
  NSTimer *v4;

  mAutoHideTimer = self->mAutoHideTimer;
  if (mAutoHideTimer)
  {
    -[NSTimer invalidate](mAutoHideTimer, "invalidate");
    v4 = self->mAutoHideTimer;
    self->mAutoHideTimer = 0;

  }
}

- (void)startAutoHideTimer
{
  void *v3;
  void *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *mAutoHideTimer;

  if (self->mAutoHideTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101243190);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A338();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012431B0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController startAutoHideTimer]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1396, 0, "expected nil value for '%{public}s'", "mAutoHideTimer");

  }
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_autoHideHUD", 0, 0, 7.0));
  mAutoHideTimer = self->mAutoHideTimer;
  self->mAutoHideTimer = v6;

}

- (void)resetAutoShrinkTimer
{
  if (self->mAutoShrinkTimer)
    -[CRLCollaboratorCursorHUDController stopAutoShrinkTimer](self, "stopAutoShrinkTimer");
  -[CRLCollaboratorCursorHUDController startAutoShrinkTimer](self, "startAutoShrinkTimer");
}

- (void)stopAutoShrinkTimer
{
  NSTimer *mAutoShrinkTimer;
  NSTimer *v4;

  mAutoShrinkTimer = self->mAutoShrinkTimer;
  if (mAutoShrinkTimer)
  {
    -[NSTimer invalidate](mAutoShrinkTimer, "invalidate");
    v4 = self->mAutoShrinkTimer;
    self->mAutoShrinkTimer = 0;

  }
}

- (void)startAutoShrinkTimer
{
  void *v3;
  void *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *mAutoShrinkTimer;

  if (self->mAutoShrinkTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012431D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0A3C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012431F0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCollaboratorCursorHUDController startAutoShrinkTimer]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCollaboratorCursorHUDController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1419, 0, "expected nil value for '%{public}s'", "mAutoShrinkTimer");

  }
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_autoShrinkHUD", 0, 0, 7.0));
  mAutoShrinkTimer = self->mAutoShrinkTimer;
  self->mAutoShrinkTimer = v6;

}

- (void)p_autoShrinkHUD
{
  id v3;

  if (!self->mShouldAutoTimeout)
  {
    if (self->mShouldUnconditionallyFadeOutHUD)
    {
      -[CRLCollaboratorCursorHUDController hideHUD](self, "hideHUD");
    }
    else
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
      objc_msgSend(v3, "toggleSizeForCollaboratorHUDController:", self);

    }
  }
}

- (void)p_autoHideHUD
{
  void *v3;
  CRLCanvasShapeRenderable *mHUDRenderable;
  CRLCollaboratorCursorOverlayView *mSizeToggleOverlayView;
  CRLCollaboratorCursorOverlayView *mFollowToggleOverlayView;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCollaboratorCursorHUDController p_delegate](self, "p_delegate"));
  objc_msgSend(v3, "removeCollaboratorHUDController:", self);

  mHUDRenderable = self->mHUDRenderable;
  self->mHUDRenderable = 0;

  mSizeToggleOverlayView = self->mSizeToggleOverlayView;
  self->mSizeToggleOverlayView = 0;

  mFollowToggleOverlayView = self->mFollowToggleOverlayView;
  self->mFollowToggleOverlayView = 0;

}

- (_TtC8Freeform23CRLCollaboratorPresence)collaboratorPresence
{
  return self->mCollaboratorPresence;
}

- (unint64_t)hudSize
{
  return self->mHUDSize;
}

- (NSString)string
{
  return self->mFullNameString;
}

- (BOOL)isFollowing
{
  return self->mIsFollowing;
}

- (void)setIsFollowing:(BOOL)a3
{
  self->mIsFollowing = a3;
}

- (BOOL)shouldAutoTimeout
{
  return self->mShouldAutoTimeout;
}

- (BOOL)shouldAutoHide
{
  return self->mShouldAutoHide;
}

- (BOOL)shouldAutoShrink
{
  return self->mShouldAutoShrink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFollowButton, 0);
  objc_storeStrong((id *)&self->mFollowToggleOverlayView, 0);
  objc_storeStrong((id *)&self->mSizeToggleOverlayView, 0);
  objc_storeStrong((id *)&self->mAvatarRenderer, 0);
  objc_storeStrong((id *)&self->mCachedPath, 0);
  objc_storeStrong((id *)&self->mPreferredSizeOfFollowStringOnce, 0);
  objc_storeStrong((id *)&self->mPreferredSizeOfShortNameStringOnce, 0);
  objc_storeStrong((id *)&self->mPreferredSizeOfFullNameStringOnce, 0);
  objc_storeStrong((id *)&self->mFollowString, 0);
  objc_storeStrong((id *)&self->mShortNameString, 0);
  objc_storeStrong((id *)&self->mFullNameString, 0);
  objc_storeStrong((id *)&self->mFollowButtonRenderable, 0);
  objc_storeStrong((id *)&self->mHUDRenderable, 0);
  objc_storeStrong((id *)&self->mAutoHideTimer, 0);
  objc_storeStrong((id *)&self->mAutoShrinkTimer, 0);
  objc_storeStrong((id *)&self->mAbsoluteTimeTimer, 0);
  objc_storeStrong((id *)&self->mHideHUDTimer, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mCollaboratorPresence, 0);
}

@end
