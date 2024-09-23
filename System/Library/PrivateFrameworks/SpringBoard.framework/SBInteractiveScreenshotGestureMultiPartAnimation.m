@implementation SBInteractiveScreenshotGestureMultiPartAnimation

- (SBInteractiveScreenshotGestureMultiPartAnimation)initWithCompletionHandler:(id)a3
{
  id v4;
  SBInteractiveScreenshotGestureMultiPartAnimation *v5;
  uint64_t v6;
  id completionHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureMultiPartAnimation;
  v5 = -[SBInteractiveScreenshotGestureMultiPartAnimation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v6;

  }
  return v5;
}

- (void)beginAnimationWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *pendingAnimationIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pendingAnimationIdentifiers = self->_pendingAnimationIdentifiers;
  v8 = v4;
  if (!pendingAnimationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v7 = self->_pendingAnimationIdentifiers;
    self->_pendingAnimationIdentifiers = v6;

    v4 = v8;
    pendingAnimationIdentifiers = self->_pendingAnimationIdentifiers;
  }
  -[NSMutableArray addObject:](pendingAnimationIdentifiers, "addObject:", v4);

}

- (void)completeAnimationWithIdentifier:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5
{
  _BOOL4 v5;
  NSMutableArray *pendingAnimationIdentifiers;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  id completionHandler;
  NSMutableArray *v10;
  id v11;
  id v12;

  v5 = a5;
  v12 = a3;
  pendingAnimationIdentifiers = self->_pendingAnimationIdentifiers;
  if (v5)
  {
    self->_pendingAnimationIdentifiers = 0;

    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](self->_completionHandler);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    if (v8)
      ((void (**)(_QWORD, SBInteractiveScreenshotGestureMultiPartAnimation *, _QWORD, uint64_t))v8)[2](v8, self, 0, 1);
LABEL_8:

    goto LABEL_9;
  }
  if (-[NSMutableArray count](pendingAnimationIdentifiers, "count"))
  {
    -[NSMutableArray removeObject:](self->_pendingAnimationIdentifiers, "removeObject:", v12);
    if (!-[NSMutableArray count](self->_pendingAnimationIdentifiers, "count"))
    {
      v10 = self->_pendingAnimationIdentifiers;
      self->_pendingAnimationIdentifiers = 0;

      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](self->_completionHandler);
      v11 = self->_completionHandler;
      self->_completionHandler = 0;

      if (v8)
        ((void (**)(_QWORD, SBInteractiveScreenshotGestureMultiPartAnimation *, uint64_t, _QWORD))v8)[2](v8, self, 1, 0);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAnimationIdentifiers, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
