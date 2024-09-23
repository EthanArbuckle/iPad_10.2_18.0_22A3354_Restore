@implementation _UIViewDeferredKeyframeAnimation

- (void)_finalize
{
  _UIViewAnimationFrame *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIViewDeferredKeyframeAnimation;
  -[_UIViewDeferredAnimation _finalize](&v6, sel__finalize);
  -[NSMutableArray sortWithOptions:usingComparator:](self->_animationFrames, "sortWithOptions:usingComparator:", 16, &__block_literal_global_556);
  v3 = objc_alloc_init(_UIViewAnimationFrame);
  -[_UIViewDeferredAnimation initialValue](self, "initialValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewAnimationFrame setValue:](v3, "setValue:", v4);

  -[NSMutableArray firstObject](self->_animationFrames, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTime");
  -[_UIViewAnimationFrame setDuration:](v3, "setDuration:");

  -[NSMutableArray insertObject:atIndex:](self->_animationFrames, "insertObject:atIndex:", v3, 0);
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_animationFrames, "count") == 0;
}

- (void)addAnimationFrameForValue:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *animationFrames;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIViewDeferredKeyframeAnimation;
  v4 = a3;
  -[_UIViewDeferredAnimation addAnimationFrameForValue:](&v8, sel_addAnimationFrameForValue_, v4);
  if (!self->_animationFrames)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    animationFrames = self->_animationFrames;
    self->_animationFrames = v5;

  }
  objc_msgSend((id)__currentViewAnimationState, "_updateAnimationFrameWithAnimationProperties:", 0, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v4);

  -[NSMutableArray addObject:](self->_animationFrames, "addObject:", v7);
}

- (void)_enumerateAnimationFramesForKeyframes:(id)a3
{
  void (**v4)(id, void *, double, double, double);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, double, double, double))a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_animationFrames;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {
    v8 = v5;
    goto LABEL_13;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v24;
  do
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
      if (v11)
      {
        -[NSMutableArray value](v11, "value", (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray startTime](v11, "startTime");
        v15 = v14;
        -[NSMutableArray duration](v11, "duration");
        v17 = v16;
        objc_msgSend(v12, "startTime");
        v4[2](v4, v13, v15, v17, v18);

      }
      v8 = v12;

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v7);

  if (v8)
  {
    -[NSMutableArray value](v8, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray startTime](v8, "startTime");
    v21 = v20;
    -[NSMutableArray duration](v8, "duration");
    v4[2](v4, v19, v21, v22, 1.0);

LABEL_13:
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationFrames, 0);
}

- (id)_animationFrames
{
  void *v5;

  if (!-[NSMutableArray count](self->_animationFrames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 3064, CFSTR("Empty keyframe animation?"));

  }
  return self->_animationFrames;
}

- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIViewDeferredKeyframeAnimation;
  -[_UIViewDeferredAnimation animateFrameAtIndex:animations:](&v19, sel_animateFrameAtIndex_animations_, a3, v7);
  if (-[NSMutableArray count](self->_animationFrames, "count") <= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 3082, CFSTR("frameIndex out of bounds"));

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_animationFrames, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTime");
  v10 = v9;
  objc_msgSend(v8, "duration");
  v12 = v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67___UIViewDeferredKeyframeAnimation_animateFrameAtIndex_animations___block_invoke;
  v16[3] = &unk_1E16B2F48;
  v17 = v8;
  v18 = v7;
  v13 = v8;
  v14 = v7;
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v16, v10, v12);

}

@end
