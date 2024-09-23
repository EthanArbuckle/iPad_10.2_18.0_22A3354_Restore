@implementation PREditorSlidingTitleTransition

- (PREditorSlidingTitleTransition)initWithSourceTitleViewController:(id)a3 destinationTitleViewController:(id)a4
{
  id v7;
  id v8;
  PREditorSlidingTitleTransition *v9;
  PREditorSlidingTitleTransition *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditorSlidingTitleTransition;
  v9 = -[PREditorSlidingTitleTransition init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceTitleViewController, a3);
    objc_storeStrong((id *)&v10->_destinationTitleViewController, a4);
    objc_msgSend(v8, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

    objc_msgSend(v7, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 0);

  }
  return v10;
}

- (id)animationKey
{
  return 0;
}

- (void)cleanUp
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PREditorSlidingTitleTransition sourceTitleViewController](self, "sourceTitleViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditorSlidingTitleTransition destinationTitleViewController](self, "destinationTitleViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorSlidingTitleTransition animationKey](self, "animationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", v6);

  objc_msgSend(v3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  if (v9 != v3)
  {
    objc_msgSend(v9, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
}

- (UIViewController)destinationTitleViewController
{
  return self->_destinationTitleViewController;
}

- (void)setDestinationTitleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_destinationTitleViewController, a3);
}

- (UIViewController)sourceTitleViewController
{
  return self->_sourceTitleViewController;
}

- (void)setSourceTitleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTitleViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTitleViewController, 0);
  objc_storeStrong((id *)&self->_destinationTitleViewController, 0);
}

@end
