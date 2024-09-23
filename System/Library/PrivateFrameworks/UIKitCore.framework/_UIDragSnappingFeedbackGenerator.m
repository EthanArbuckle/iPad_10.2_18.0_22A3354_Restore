@implementation _UIDragSnappingFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)userInteractionStarted
{
  void *v4;

  if (-[_UIDragFeedbackGenerator _state](self, "_state") == 1
    || -[_UIDragFeedbackGenerator _state](self, "_state") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDragFeedbackGenerator.m"), 198, CFSTR("%@ is already being interacted with"), self);

  }
  -[_UIDragSnappingFeedbackGenerator _stopLanding](self, "_stopLanding");
  -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0);
  -[_UIDragFeedbackGenerator _setState:](self, "_setState:", 1);
}

- (void)userInteractionEnded
{
  void *v4;

  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (-[_UIDragFeedbackGenerator _state](self, "_state") != 1
    && -[_UIDragFeedbackGenerator _state](self, "_state") != 2
    && -[_UIDragFeedbackGenerator _state](self, "_state") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDragFeedbackGenerator.m"), 211, CFSTR("%@ should be being interacted with when ending it"), self);

  }
  if (-[_UIDragFeedbackGenerator _state](self, "_state") != 4)
    -[_UIDragSnappingFeedbackGenerator _startLanding](self, "_startLanding");
  if (-[_UIDragFeedbackGenerator _state](self, "_state") != 3)
    -[_UIDragFeedbackGenerator _setState:](self, "_setState:", 0);
  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)draggedObjectLiftedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (-[_UIDragFeedbackGenerator _state](self, "_state") == 1)
  {
    -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interactionStartedFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);

    -[_UIDragFeedbackGenerator _setState:](self, "_setState:", 2);
  }
}

- (void)draggedObjectLandedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionEndedFeedback");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (-[_UIDragFeedbackGenerator _state](self, "_state") == 3)
  {
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);
    -[_UIDragSnappingFeedbackGenerator _stopLanding](self, "_stopLanding");
  }
  else if (-[_UIDragFeedbackGenerator _state](self, "_state") == 2)
  {
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);
    -[_UIDragFeedbackGenerator _setState:](self, "_setState:", 4);
  }

}

- (void)objectSnappedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  if (-[_UIDragFeedbackGenerator _state](self, "_state"))
  {
    -[_UIDragSnappingFeedbackGenerator _dragSnappingConfiguration](self, "_dragSnappingConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectSnappedFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);

  }
}

- (void)draggedObjectLifted
{
  -[_UIDragSnappingFeedbackGenerator draggedObjectLiftedAtLocation:](self, "draggedObjectLiftedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)draggedObjectLanded
{
  -[_UIDragSnappingFeedbackGenerator draggedObjectLandedAtLocation:](self, "draggedObjectLandedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)objectSnapped
{
  -[_UIDragSnappingFeedbackGenerator objectSnappedAtLocation:](self, "objectSnappedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)_startLanding
{
  void *v3;
  void *v4;

  if (-[_UIDragFeedbackGenerator _state](self, "_state") == 2)
  {
    -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "interactionEndedFeedback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0);
      -[_UIDragSnappingFeedbackGenerator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stopLanding, 0, 2.0);
      -[_UIDragFeedbackGenerator _setState:](self, "_setState:", 3);
    }
  }
}

- (void)_stopLanding
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopLanding, 0);
  if (-[_UIDragFeedbackGenerator _state](self, "_state") == 3)
  {
    -[_UIDragFeedbackGenerator _setState:](self, "_setState:", 0);
    -[UIFeedbackGenerator deactivate](self, "deactivate");
  }
}

@end
