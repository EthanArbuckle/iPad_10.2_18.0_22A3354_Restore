@implementation _UIGravityWellAdaptorEffect

+ (id)effectWithAdaptedClickEffect:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAdaptedEffect:", v3);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAdaptorInteraction:", v5);

  objc_msgSend(v4, "setMaxProgress:", 1.0);
  return v4;
}

- (id)secondaryBodyPreviews
{
  return 0;
}

- (void)begin
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  -[_UIGravityWellAdaptorEffect adaptedEffect](self, "adaptedEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGravityWellAdaptorEffect adaptorInteraction](self, "adaptorInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interaction:didChangeWithContext:", v4, v5);

}

- (void)updateWithProgress:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setProgress:", a3);
  -[_UIGravityWellAdaptorEffect maxProgress](self, "maxProgress");
  objc_msgSend(v7, "setMaximumProgress:");
  -[_UIGravityWellAdaptorEffect adaptedEffect](self, "adaptedEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGravityWellAdaptorEffect adaptorInteraction](self, "adaptorInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interaction:didChangeWithContext:", v6, v7);

}

- (void)end
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setProgress:", 0.0);
  objc_msgSend(v5, "setEnded:", 1);
  -[_UIGravityWellAdaptorEffect adaptedEffect](self, "adaptedEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGravityWellAdaptorEffect adaptorInteraction](self, "adaptorInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interaction:didChangeWithContext:", v4, v5);

}

- (void)endForHandOff
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setProgress:", 0.0);
  objc_msgSend(v3, "setEnded:", 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44___UIGravityWellAdaptorEffect_endForHandOff__block_invoke;
  v5[3] = &unk_1E16B1B50;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);

}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  void *v3;
  void *v4;

  -[_UIGravityWellAdaptorEffect adaptedEffect](self, "adaptedEffect", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedPreviewForEffectContinuation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIGravityWellAdaptorEffect;
  -[_UIGravityWellEffect addCompletion:](&v11, sel_addCompletion_, v4);
  -[_UIGravityWellAdaptorEffect adaptedEffect](self, "adaptedEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v9, &location);
    -[_UIGravityWellAdaptorEffect adaptedEffect](self, "adaptedEffect", v8, 3221225472, __45___UIGravityWellAdaptorEffect_addCompletion___block_invoke, &unk_1E16C7D10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompletionBlock:", &v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (double)maxProgress
{
  return self->_maxProgress;
}

- (void)setMaxProgress:(double)a3
{
  self->_maxProgress = a3;
}

- (_UIClickHighlightEffect)adaptedEffect
{
  return self->_adaptedEffect;
}

- (void)setAdaptedEffect:(id)a3
{
  objc_storeStrong((id *)&self->_adaptedEffect, a3);
}

- (_UIGravityWellAdaptorInteraction)adaptorInteraction
{
  return self->_adaptorInteraction;
}

- (void)setAdaptorInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_adaptorInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptorInteraction, 0);
  objc_storeStrong((id *)&self->_adaptedEffect, 0);
}

@end
