@implementation _UIDragFeedbackGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, 0);
}

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v7;
  _QWORD v8[7];

  y = a3.y;
  x = a3.x;
  if (self->_state == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDragFeedbackGenerator.m"), 50, CFSTR("%@ is already being interacted with"), self);

  }
  -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0);
  self->_state = 2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___UIDragFeedbackGenerator_userInteractionStartedAtLocation___block_invoke;
  v8[3] = &unk_1E16B2290;
  v8[4] = self;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", v8);
}

- (void)userInteractionStarted
{
  -[_UIDragFeedbackGenerator userInteractionStartedAtLocation:](self, "userInteractionStartedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (self->_state != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDragFeedbackGenerator.m"), 74, CFSTR("%@ should be being interacted with when ending it"), self);

  }
  -[_UIDragFeedbackGenerator _stopPlayingContinuousFeedback](self, "_stopPlayingContinuousFeedback");
  if (self->_state == 2)
  {
    -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactionEndedFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v8, x, y);

  }
  self->_state = 0;
  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionEnded
{
  -[_UIDragFeedbackGenerator userInteractionEndedAtLocation:](self, "userInteractionEndedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  unint64_t state;
  BOOL v6;
  uint64_t v7;
  void *v9;

  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  state = self->_state;
  v6 = state > 4;
  v7 = (1 << state) & 0x16;
  if (v6 || v7 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDragFeedbackGenerator.m"), 95, CFSTR("%@ should be being interacted with when cancelling it"), self);

  }
  -[_UIDragFeedbackGenerator _stopPlayingContinuousFeedback](self, "_stopPlayingContinuousFeedback");
  self->_state = 0;
  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionCancelled
{
  -[_UIDragFeedbackGenerator userInteractionCancelledAtLocation:](self, "userInteractionCancelledAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)positionUpdatedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (self->_state)
  {
    -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactionUpdatedFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);

  }
}

- (void)dropTargetUpdatedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (self->_state)
  {
    -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetUpdatedFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);

  }
}

- (void)positionUpdated
{
  -[_UIDragFeedbackGenerator positionUpdatedAtLocation:](self, "positionUpdatedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)dropTargetUpdated
{
  -[_UIDragFeedbackGenerator dropTargetUpdatedAtLocation:](self, "dropTargetUpdatedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)_startPlayingContinuousFeedback
{
  void *v3;
  double v4;
  double v5;

  -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progressingFeedbackDelay");
  v5 = v4;

  if (v5 == 0.0)
    -[_UIDragFeedbackGenerator _startPlayingContinuousFeedbackNow](self, "_startPlayingContinuousFeedbackNow");
  else
    -[_UIDragFeedbackGenerator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__startPlayingContinuousFeedbackNow, 0, v5);
}

- (void)_startPlayingContinuousFeedbackNow
{
  void *v3;
  id v4;

  if (self->_state == 2)
  {
    -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "interactionProgressingFeedback");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIDragFeedbackGenerator _setPlayingContinuousFeedback:](self, "_setPlayingContinuousFeedback:", v4);
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v4, 1.79769313e308, 1.79769313e308);
    }

  }
}

- (void)_stopPlayingContinuousFeedback
{
  _UIFeedbackContinuousPlayable *playingContinuousFeedback;

  playingContinuousFeedback = self->_playingContinuousFeedback;
  if (playingContinuousFeedback)
  {
    -[_UIFeedbackContinuousPlayable stop](playingContinuousFeedback, "stop");
    -[_UIDragFeedbackGenerator _setPlayingContinuousFeedback:](self, "_setPlayingContinuousFeedback:", 0);
  }
}

- (id)_stats_key
{
  return CFSTR("drag");
}

- (int64_t)_state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (_UIFeedbackContinuousPlayable)_playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)_setPlayingContinuousFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, a3);
}

@end
