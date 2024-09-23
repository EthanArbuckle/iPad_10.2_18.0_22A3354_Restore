@implementation _UIAnimatedTextAttachment

- (_UIAnimatedTextAttachment)init
{
  _UIAnimatedTextAttachment *v2;
  void *v3;
  UIViewFloatAnimatableProperty *v4;
  UIViewFloatAnimatableProperty *heightAnimationProperty;
  uint64_t v6;
  NSMutableArray *animateAlongsideHandlers;
  uint64_t v8;
  NSMutableArray *completionHandlers;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_UIAnimatedTextAttachment;
  v2 = -[_UIAnimatedTextAttachment init](&v15, sel_init);
  if (v2)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0, 1.0, 1.0);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[_UIAnimatedTextAttachment setImage:](v2, "setImage:", v3);

    v4 = objc_alloc_init(UIViewFloatAnimatableProperty);
    heightAnimationProperty = v2->_heightAnimationProperty;
    v2->_heightAnimationProperty = v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    animateAlongsideHandlers = v2->_animateAlongsideHandlers;
    v2->_animateAlongsideHandlers = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableArray *)v8;

    objc_initWeak(&location, v2);
    v16[0] = v2->_heightAnimationProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33___UIAnimatedTextAttachment_init__block_invoke;
    v12[3] = &unk_1E16B3F40;
    objc_copyWeak(&v13, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v8[9];
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIAnimatedTextAttachment;
  -[_UIAnimatedTextAttachment setBounds:](&v9, sel_setBounds_);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39___UIAnimatedTextAttachment_setBounds___block_invoke;
  v8[3] = &unk_1E16B20D8;
  v8[4] = self;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  *(CGFloat *)&v8[7] = width;
  *(CGFloat *)&v8[8] = height;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
}

- (NSAttributedString)attachmentString
{
  return (NSAttributedString *)objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", self);
}

- (void)addAlongsideAnimation:(id)a3
{
  NSMutableArray *animateAlongsideHandlers;
  void *v4;
  id v5;

  animateAlongsideHandlers = self->_animateAlongsideHandlers;
  v5 = (id)objc_msgSend(a3, "copy");
  v4 = _Block_copy(v5);
  -[NSMutableArray addObject:](animateAlongsideHandlers, "addObject:", v4);

}

- (void)addCompletionHandler:(id)a3
{
  NSMutableArray *completionHandlers;
  void *v4;
  id v5;

  completionHandlers = self->_completionHandlers;
  v5 = (id)objc_msgSend(a3, "copy");
  v4 = _Block_copy(v5);
  -[NSMutableArray addObject:](completionHandlers, "addObject:", v4);

}

- (void)animateToTargetHeight:(double)a3 delay:(double)a4 usingSpringBehavior:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  self->_targetHeight = a3;
  if (!v8)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (a4 <= 0.0)
    -[_UIAnimatedTextAttachment _initiateAnimationUsingSpringBehavior:](self, "_initiateAnimationUsingSpringBehavior:", v8);
  else
    -[_UIAnimatedTextAttachment performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__initiateAnimationUsingSpringBehavior_, v8, a4);

}

- (void)_initiateAnimationUsingSpringBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v4 = a3;
  -[_UIAnimatedTextAttachment targetHeight](self, "targetHeight");
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke;
  v7[3] = &unk_1E16B1888;
  v7[4] = self;
  v7[5] = v5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke_2;
  v6[3] = &unk_1E16B2588;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v4, 0, v7, v6);

}

- (void)_updatePresentationValues
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void (**invalidationHandler)(void);

  -[_UIAnimatedTextAttachment bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UIAnimatedTextAttachment bounds](self, "bounds");
  v8 = v7;
  -[UIViewFloatAnimatableProperty presentationValue](self->_heightAnimationProperty, "presentationValue");
  -[_UIAnimatedTextAttachment setBounds:](self, "setBounds:", v4, v6, v8, v9);
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)targetHeight
{
  return self->_targetHeight;
}

- (void)setTargetHeight:(double)a3
{
  self->_targetHeight = a3;
}

- (UIViewFloatAnimatableProperty)heightAnimationProperty
{
  return self->_heightAnimationProperty;
}

- (void)setHeightAnimationProperty:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnimationProperty, a3);
}

- (NSMutableArray)animateAlongsideHandlers
{
  return self->_animateAlongsideHandlers;
}

- (void)setAnimateAlongsideHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_animateAlongsideHandlers, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_animateAlongsideHandlers, 0);
  objc_storeStrong((id *)&self->_heightAnimationProperty, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
