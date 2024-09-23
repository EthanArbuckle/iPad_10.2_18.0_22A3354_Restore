@implementation CRLiOSContextMenuController

- (CRLiOSContextMenuController)initWithDelegate:(id)a3
{
  id v4;
  CRLiOSContextMenuController *v5;
  CRLiOSContextMenuController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSContextMenuController;
  v5 = -[CRLiOSContextMenuController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[NSBlockOperation cancel](self->_resetOperation, "cancel");
  if (self->_changeSources)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012333A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2F28();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012333C8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 50, 0, "expected nil value for '%{public}s'", "_changeSources");

  }
  -[NSTimer invalidate](self->_resumeCollaborationTimer, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSContextMenuController;
  -[CRLiOSContextMenuController dealloc](&v6, "dealloc");
}

- (void)showContextMenuInPreviousLocationAnimated:(BOOL)a3 withChangeSources:(id)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A5810;
  v4[3] = &unk_1012333E8;
  v5 = a3;
  -[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:](self, "p_showContextMenuForChangeSources:withBlock:", a4, v4);
}

- (void)showContextMenuFromView:(id)a3 rect:(CGRect)a4 animated:(BOOL)a5 withChangeSources:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  _QWORD v13[4];
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A5910;
  v13[3] = &unk_101233410;
  v19 = a5;
  v14 = a3;
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  v12 = v14;
  -[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:](self, "p_showContextMenuForChangeSources:withBlock:", a6, v13);

}

- (void)p_showContextMenuForChangeSources:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233430);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF30CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233450);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 79, 0, "invalid nil value for '%{public}s'", "_delegate.editingCoordinator");

  }
  if (self->_changeSources)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233470);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF3040();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101233490);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 82, 0, "expected nil value for '%{public}s'", "_changeSources");

  }
  v16 = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "editingCoordinator"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "changeNotifier"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "addObserver:forChangeSource:", self, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

  -[CRLiOSContextMenuController setChangeSources:](self, "setChangeSources:", v19);
  if (self->_resumeCollaborationTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012334B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF2FB4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012334D0);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSContextMenuController p_showContextMenuForChangeSources:withBlock:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSContextMenuController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 90, 0, "expected nil value for '%{public}s'", "_resumeCollaborationTimer");

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_resumeCollaboration", 0, 0, 15.0));
  -[CRLiOSContextMenuController setResumeCollaborationTimer:](self, "setResumeCollaborationTimer:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v28, "addObserver:selector:name:object:", self, "p_contextMenuWillHide:", UIMenuControllerWillHideMenuNotification, 0);

  v29 = objc_loadWeakRetained((id *)&self->_delegate);
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "editingCoordinator"));
  objc_msgSend((id)v30, "suspendCollaborationWithReason:", CFSTR("CRLiOSContextMenu"));

  v7[2](v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"));
  LOBYTE(v30) = objc_msgSend(v31, "isMenuVisible");

  if ((v30 & 1) == 0)
    -[CRLiOSContextMenuController p_contextMenuWillHide:](self, "p_contextMenuWillHide:", 0);

}

- (void)p_contextMenuWillHide:(id)a3
{
  id v4;
  NSTimer *resumeCollaborationTimer;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  resumeCollaborationTimer = self->_resumeCollaborationTimer;
  if (resumeCollaborationTimer)
  {
    -[NSTimer invalidate](self->_resumeCollaborationTimer, "invalidate");
    -[CRLiOSContextMenuController setResumeCollaborationTimer:](self, "setResumeCollaborationTimer:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIMenuControllerWillHideMenuNotification, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changeNotifier"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_changeSources;
  v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "removeObserver:forChangeSource:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14), (_QWORD)v19);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[CRLiOSContextMenuController setChangeSources:](self, "setChangeSources:", 0);
  if (resumeCollaborationTimer)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "editingCoordinator"));
    objc_msgSend(v16, "resumeCollaborationWithReason:", CFSTR("CRLiOSContextMenu"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSContextMenuController resetOperation](self, "resetOperation", (_QWORD)v19));
  objc_msgSend(v17, "cancel");

  -[CRLiOSContextMenuController setResetOperation:](self, "setResetOperation:", 0);
  v18 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v18, "contextMenuDidHideForContextMenuController:", self);

}

- (void)p_resumeCollaboration
{
  void *v3;
  id WeakRetained;

  -[NSTimer invalidate](self->_resumeCollaborationTimer, "invalidate");
  -[CRLiOSContextMenuController setResumeCollaborationTimer:](self, "setResumeCollaborationTimer:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
  objc_msgSend(v3, "resumeCollaborationWithReason:", CFSTR("CRLiOSContextMenu"));

}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSContextMenuController resetOperation](self, "resetOperation"));

  if (!v8)
  {
    objc_initWeak(&location, self);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1000A645C;
    v15 = &unk_10122D4C0;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v12));
    -[CRLiOSContextMenuController setResetOperation:](self, "setResetOperation:", v9, v12, v13, v14, v15);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSContextMenuController resetOperation](self, "resetOperation"));
    objc_msgSend(v10, "addOperation:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (NSBlockOperation)resetOperation
{
  return self->_resetOperation;
}

- (void)setResetOperation:(id)a3
{
  objc_storeStrong((id *)&self->_resetOperation, a3);
}

- (CRLiOSContextMenuControllerDelegate)delegate
{
  return (CRLiOSContextMenuControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDismissOnChange
{
  return self->_shouldDismissOnChange;
}

- (void)setShouldDismissOnChange:(BOOL)a3
{
  self->_shouldDismissOnChange = a3;
}

- (NSSet)changeSources
{
  return self->_changeSources;
}

- (void)setChangeSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSTimer)resumeCollaborationTimer
{
  return self->_resumeCollaborationTimer;
}

- (void)setResumeCollaborationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_resumeCollaborationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeCollaborationTimer, 0);
  objc_storeStrong((id *)&self->_changeSources, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resetOperation, 0);
}

@end
