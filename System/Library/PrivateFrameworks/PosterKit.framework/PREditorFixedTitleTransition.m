@implementation PREditorFixedTitleTransition

- (PREditorFixedTitleTransition)initWithSourceTitleViewController:(id)a3 destinationTitleViewController:(id)a4 anchorView:(id)a5
{
  id v9;
  id v10;
  id v11;
  PREditorFixedTitleTransition *v12;
  PREditorFixedTitleTransition *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PREditorFixedTitleTransition;
  v12 = -[PREditorFixedTitleTransition init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceTitleViewController, a3);
    objc_storeStrong((id *)&v13->_destinationTitleViewController, a4);
    if (v9 != v10)
    {
      objc_msgSend(v10, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);

      objc_msgSend(v9, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

    }
    objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceLayer:", v17);

    objc_msgSend(v16, "setDuration:", INFINITY);
    objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v16, "setRemovedOnCompletion:", 0);
    objc_msgSend(v16, "setUsesNormalizedCoordinates:", 1);
    objc_msgSend(v16, "setAppliesY:", 1);
    objc_msgSend(v16, "setAppliesX:", 1);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, 0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourcePoints:", v19);

    objc_msgSend(v9, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorFixedTitleTransition animationKey](v13, "animationKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAnimation:forKey:", v16, v22);

  }
  return v13;
}

- (id)animationKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fixedTitleScrolling:%p"), self);
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

  -[PREditorFixedTitleTransition sourceTitleViewController](self, "sourceTitleViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditorFixedTitleTransition destinationTitleViewController](self, "destinationTitleViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorFixedTitleTransition animationKey](self, "animationKey");
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
