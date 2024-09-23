@implementation _UIButtonFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3
{
  return -[_UIButtonFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", a3, 0);
}

- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  void *v6;
  _UIButtonFeedbackGenerator *v7;

  _viewFromCoordinateSpace(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIButtonFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", a3, v6);

  return v7;
}

- (_UIButtonFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  _UIButtonFeedbackGenerator *v9;
  objc_super v11;

  v6 = a4;
  if (a3 == 1)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "prominentConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "defaultConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)_UIButtonFeedbackGenerator;
  v9 = -[UIFeedbackGenerator initWithConfiguration:view:](&v11, sel_initWithConfiguration_view_, v8, v6);

  return v9;
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  _QWORD v3[5];
  CGPoint v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63___UIButtonFeedbackGenerator_userInteractionStartedAtLocation___block_invoke;
  v3[3] = &unk_1E16B2290;
  v3[4] = self;
  v4 = a3;
  -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", v3);
}

- (void)userInteractionStarted
{
  -[_UIButtonFeedbackGenerator userInteractionStartedAtLocation:](self, "userInteractionStartedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIButtonFeedbackGenerator _buttonConfiguration](self, "_buttonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionEndedFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);

  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionEnded
{
  -[_UIButtonFeedbackGenerator userInteractionEndedAtLocation:](self, "userInteractionEndedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIButtonFeedbackGenerator _buttonConfiguration](self, "_buttonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionCancelledFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v7, x, y);

  -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionCancelled
{
  -[_UIButtonFeedbackGenerator userInteractionCancelledAtLocation:](self, "userInteractionCancelledAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (id)_stats_key
{
  return CFSTR("button");
}

@end
