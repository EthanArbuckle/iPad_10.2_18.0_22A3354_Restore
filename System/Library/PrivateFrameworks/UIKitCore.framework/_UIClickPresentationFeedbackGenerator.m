@implementation _UIClickPresentationFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIClickPresentationFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIClickPresentationFeedbackGenerator;
  return -[UIFeedbackGenerator initWithConfiguration:view:](&v5, sel_initWithConfiguration_view_, a3, a4);
}

- (void)previewedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIClickPresentationFeedbackGenerator _clickConfiguration](self, "_clickConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewedPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);

}

- (void)poppedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIClickPresentationFeedbackGenerator _clickConfiguration](self, "_clickConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "poppedPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);

}

- (void)draggedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[_UIClickPresentationFeedbackGenerator _clickConfiguration](self, "_clickConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "draggedPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v6, x, y);

}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  -[UIFeedbackGenerator activateWithCompletionBlock:](self, "activateWithCompletionBlock:", 0);
}

- (void)userInteractionStarted
{
  -[_UIClickPresentationFeedbackGenerator userInteractionStartedAtLocation:](self, "userInteractionStartedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  int has_internal_diagnostics;
  BOOL v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  _UIClickPresentationFeedbackGenerator *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = -[UIFeedbackGenerator isActive](self, "isActive");
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Attempted to end user interaction on %@ when it was not active.", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else if (!v5)
  {
    v7 = userInteractionEndedAtLocation____s_category_0;
    if (!userInteractionEndedAtLocation____s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&userInteractionEndedAtLocation____s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Attempted to end user interaction on %@ when it was not active.", (uint8_t *)&v9, 0xCu);
    }
  }
  if (-[UIFeedbackGenerator isActive](self, "isActive"))
    -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionEnded
{
  -[_UIClickPresentationFeedbackGenerator userInteractionEndedAtLocation:](self, "userInteractionEndedAtLocation:", 1.79769313e308, 1.79769313e308);
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  int has_internal_diagnostics;
  BOOL v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  _UIClickPresentationFeedbackGenerator *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2, a3.x, a3.y);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = -[UIFeedbackGenerator isActive](self, "isActive");
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Attempted to cancel user interaction on %@ when it was not active.", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else if (!v5)
  {
    v7 = userInteractionCancelledAtLocation____s_category_0;
    if (!userInteractionCancelledAtLocation____s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&userInteractionCancelledAtLocation____s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Attempted to cancel user interaction on %@ when it was not active.", (uint8_t *)&v9, 0xCu);
    }
  }
  if (-[UIFeedbackGenerator isActive](self, "isActive"))
    -[UIFeedbackGenerator deactivate](self, "deactivate");
}

- (void)userInteractionCancelled
{
  -[_UIClickPresentationFeedbackGenerator userInteractionCancelledAtLocation:](self, "userInteractionCancelledAtLocation:", 1.79769313e308, 1.79769313e308);
}

@end
