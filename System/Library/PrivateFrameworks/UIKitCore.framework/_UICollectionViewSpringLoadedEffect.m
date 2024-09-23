@implementation _UICollectionViewSpringLoadedEffect

- (_UICollectionViewSpringLoadedEffect)init
{
  _UICollectionViewSpringLoadedEffect *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewSpringLoadedEffect;
  v2 = -[_UICollectionViewSpringLoadedEffect init](&v5, sel_init);
  if (v2)
  {
    +[UISpringLoadedInteraction _blinkEffect](UISpringLoadedInteraction, "_blinkEffect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewSpringLoadedEffect setBlinkEffect:](v2, "setBlinkEffect:", v3);

  }
  return v2;
}

- (void)setBlinkEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blinkEffect, a3);
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideTargetItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideTargetView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "overrideTargetView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTargetView:", v11);

  }
  objc_msgSend(v7, "overrideTargetView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "targetView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "targetView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (v14, v13 == v8) && v12 != v8)
  {
    objc_msgSend(v8, "_cellForItemAtIndexPath:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTargetView:", v15);

  }
  objc_msgSend(v7, "targetView");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16
    && (v17 = (void *)v16,
        objc_msgSend(v7, "targetView"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v18,
        v17,
        (isKindOfClass & 1) == 0))
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v7, "targetView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(v8, "_cellForItemAtIndexPath:", v9);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v22;

    if (objc_msgSend(v24, "_usingBackgroundViewConfiguration"))
      v23 = v24;
    else
      v23 = 0;

  }
  v25 = objc_msgSend(v7, "state");
  if (v25 == 2)
  {
    if (v23)
    {
      objc_initWeak(&location, v8);
      v27 = (void *)MEMORY[0x1E0C99E88];
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __72___UICollectionViewSpringLoadedEffect_interaction_didChangeWithContext___block_invoke;
      v35 = &unk_1E16BE638;
      v36 = v23;
      objc_copyWeak(&v38, &location);
      v37 = v9;
      objc_msgSend(v27, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v32, 0.1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewSpringLoadedEffect setStateBlinkTimer:](self, "setStateBlinkTimer:", v28, v32, v33, v34, v35);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v25 == 1)
  {
    objc_msgSend(v7, "overrideTargetView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      goto LABEL_27;
    objc_msgSend(v7, "setTargetView:", 0);
    if (v23)
      goto LABEL_29;
    objc_msgSend(v8, "_highlightSpringLoadedItemAtIndexPath:", v9);
LABEL_28:
    -[_UICollectionViewSpringLoadedEffect blinkEffect](self, "blinkEffect");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "interaction:didChangeWithContext:", v6, v7);

    goto LABEL_29;
  }
  if (v25)
  {
    -[_UICollectionViewSpringLoadedEffect stateBlinkTimer](self, "stateBlinkTimer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "invalidate");

    -[_UICollectionViewSpringLoadedEffect setStateBlinkTimer:](self, "setStateBlinkTimer:", 0);
  }
  else
  {
    -[_UICollectionViewSpringLoadedEffect stateBlinkTimer](self, "stateBlinkTimer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "invalidate");

    -[_UICollectionViewSpringLoadedEffect setStateBlinkTimer:](self, "setStateBlinkTimer:", 0);
    objc_msgSend(v8, "_unhighlightSpringLoadedItem");
    objc_msgSend(v7, "setOverrideTargetItem:", 0);
  }
LABEL_27:
  if (!v23)
    goto LABEL_28;
LABEL_29:

}

- (UISpringLoadedInteractionEffect)blinkEffect
{
  return self->_blinkEffect;
}

- (NSTimer)stateBlinkTimer
{
  return self->_stateBlinkTimer;
}

- (void)setStateBlinkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_stateBlinkTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateBlinkTimer, 0);
  objc_storeStrong((id *)&self->_blinkEffect, 0);
}

@end
