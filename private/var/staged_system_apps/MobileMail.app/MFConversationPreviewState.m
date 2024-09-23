@implementation MFConversationPreviewState

- (MFConversationPreviewState)initWithBackgroundUpdater:(id)a3
{
  Block_layout *v4;
  MFConversationPreviewState *v5;
  MFConversationPreviewState *v6;
  Block_layout *v7;
  Block_layout *v8;
  id backgroundUpdater;
  objc_super v11;

  v4 = (Block_layout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)MFConversationPreviewState;
  v5 = -[MFConversationPreviewState init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    if (v4)
      v7 = v4;
    else
      v7 = &stru_100520E30;
    v8 = objc_retainBlock(v7);
    backgroundUpdater = v6->_backgroundUpdater;
    v6->_backgroundUpdater = v8;

  }
  return v6;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015B140;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA110 != -1)
    dispatch_once(&qword_1005AA110, block);
  return (OS_os_log *)(id)qword_1005AA108;
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void (**v9)(void);
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;

  if (self->_state != a3)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_state - 1;
      if (v6 > 3)
        v7 = CFSTR("_MFConversationPreviewStateInvisible");
      else
        v7 = *(&off_100520E50 + v6);
      if ((unint64_t)(a3 - 1) > 3)
        v8 = CFSTR("_MFConversationPreviewStateInvisible");
      else
        v8 = *(&off_100520E50 + a3 - 1);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ -> %{public}@", (uint8_t *)&v10, 0x16u);
    }

    self->_state = a3;
    if (a3)
    {
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MFConversationPreviewState backgroundUpdater](self, "backgroundUpdater"));
      v9[2]();

    }
  }
}

- (NSString)description
{
  int64_t v2;

  v2 = -[MFConversationPreviewState state](self, "state");
  if ((unint64_t)(v2 - 1) > 3)
    return (NSString *)CFSTR("_MFConversationPreviewStateInvisible");
  else
    return (NSString *)*(&off_100520E50 + v2 - 1);
}

- (void)transitionAfterViewDidAppear
{
  NSObject *v3;
  int64_t v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterViewDidAppear]", v6, 2u);
  }

  v4 = -[MFConversationPreviewState state](self, "state");
  v5 = 4;
  if (v4 && v4 != 3)
  {
    if (v4 != 1)
      return;
    v5 = 2;
  }
  -[MFConversationPreviewState setState:](self, "setState:", v5);
}

- (void)transitionAfterViewDidDisappear
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterViewDidDisappear]", v4, 2u);
  }

  -[MFConversationPreviewState setState:](self, "setState:", 0);
  -[MFConversationPreviewState setDidScrollToReferenceMessage:](self, "setDidScrollToReferenceMessage:", 0);
}

- (void)transitionAfterScrollingToReferenceMessage
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterScrollingToReferenceMessage]", v4, 2u);
  }

  -[MFConversationPreviewState setDidScrollToReferenceMessage:](self, "setDidScrollToReferenceMessage:", 1);
}

- (void)transitionAfterChangingSources
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterChangingSources]", v4, 2u);
  }

  -[MFConversationPreviewState setDidScrollToReferenceMessage:](self, "setDidScrollToReferenceMessage:", 0);
}

- (void)setBeingPreviewed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromBOOL(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[state setBeingPreviewed: %@]", (uint8_t *)&v8, 0xCu);

  }
  if (v3)
    -[MFConversationPreviewState setState:](self, "setState:", 1);
}

- (BOOL)beingPreviewed
{
  unint64_t v2;

  v2 = -[MFConversationPreviewState state](self, "state");
  return (v2 > 4) | (6u >> v2) & 1;
}

- (void)previewDidCommit:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromBOOL(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[state previewDidCommit: %@]", (uint8_t *)&v9, 0xCu);

  }
  if (v3)
    v8 = 3;
  else
    v8 = 0;
  -[MFConversationPreviewState setState:](self, "setState:", v8);
}

- (void)previewCancelled
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MFConversationPreviewState log](MFConversationPreviewState, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state previewCancelled]", v4, 2u);
  }

  -[MFConversationPreviewState setState:](self, "setState:", 0);
}

- (BOOL)shouldScrollToReferenceMessage
{
  return !-[MFConversationPreviewState didScrollToReferenceMessage](self, "didScrollToReferenceMessage");
}

- (BOOL)isFullyVisible
{
  return (id)-[MFConversationPreviewState state](self, "state") == (id)4;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)didScrollToReferenceMessage
{
  return self->_didScrollToReferenceMessage;
}

- (void)setDidScrollToReferenceMessage:(BOOL)a3
{
  self->_didScrollToReferenceMessage = a3;
}

- (id)backgroundUpdater
{
  return self->_backgroundUpdater;
}

- (void)setBackgroundUpdater:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundUpdater, 0);
}

@end
