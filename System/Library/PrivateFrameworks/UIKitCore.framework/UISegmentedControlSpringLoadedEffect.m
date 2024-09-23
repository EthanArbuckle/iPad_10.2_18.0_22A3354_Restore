@implementation UISegmentedControlSpringLoadedEffect

- (UISegmentedControlSpringLoadedEffect)init
{
  UISegmentedControlSpringLoadedEffect *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISegmentedControlSpringLoadedEffect;
  v2 = -[UISegmentedControlSpringLoadedEffect init](&v5, sel_init);
  if (v2)
  {
    +[UISpringLoadedInteraction _blinkEffect](UISpringLoadedInteraction, "_blinkEffect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControlSpringLoadedEffect setBlinkEffect:](v2, "setBlinkEffect:", v3);

  }
  return v2;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v15, "_segmentAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTargetView:", v10);

  v11 = objc_msgSend(v6, "state");
  -[UISegmentedControlSpringLoadedEffect blinkEffect](self, "blinkEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "interaction:didChangeWithContext:", v7, v6);

  v13 = -1;
  if (!v11)
    goto LABEL_5;
  v14 = v15;
  if (v11 == 3)
    goto LABEL_5;
  if (v11 == 1)
  {
    v13 = v9;
LABEL_5:
    objc_msgSend(v15, "_highlightSegment:", v13);
    v14 = v15;
  }

}

- (UISpringLoadedInteractionEffect)blinkEffect
{
  return self->_blinkEffect;
}

- (void)setBlinkEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blinkEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkEffect, 0);
}

@end
