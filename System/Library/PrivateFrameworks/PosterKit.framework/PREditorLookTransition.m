@implementation PREditorLookTransition

- (PREditorLookTransition)initWithCurrentLook:(id)a3 destinationLook:(id)a4
{
  id v6;
  id v7;
  PREditorLookTransition *v8;
  uint64_t v9;
  PREditingLook *currentLook;
  uint64_t v11;
  PREditingLook *destinationLook;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditorLookTransition;
  v8 = -[PREditorLookTransition init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    currentLook = v8->_currentLook;
    v8->_currentLook = (PREditingLook *)v9;

    v11 = objc_msgSend(v7, "copy");
    destinationLook = v8->_destinationLook;
    v8->_destinationLook = (PREditingLook *)v11;

  }
  return v8;
}

- (BOOL)matchesCurrentLook:(id)a3 destinationLook:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[PREditorLookTransition currentLook](self, "currentLook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BSEqualObjects();

  if (v9)
  {
    -[PREditorLookTransition destinationLook](self, "destinationLook");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateInteractiveTransition:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = fmax(fmin((a3 + -0.2) / 0.6, 1.0), 0.0);
  -[PREditorLookTransition titleStyleTransition](self, "titleStyleTransition");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateInteractiveTransition:", v5);
  -[PREditorLookTransition titleScrollingTransition](self, "titleScrollingTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateInteractiveTransition:", a3);
  -[PREditorLookTransition subtitleStyleTransition](self, "subtitleStyleTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateInteractiveTransition:", v5);
  -[PREditorLookTransition complicationTransition](self, "complicationTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateInteractiveTransition:", v5);
  -[PREditorLookTransition lookNameTransition](self, "lookNameTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateInteractiveTransition:", a3);

}

- (void)finishInteractiveTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PREditorLookTransition titleStyleTransition](self, "titleStyleTransition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelInteractiveTransition");
  -[PREditorLookTransition titleScrollingTransition](self, "titleScrollingTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishInteractiveTransition");
  -[PREditorLookTransition subtitleStyleTransition](self, "subtitleStyleTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishInteractiveTransition");
  -[PREditorLookTransition complicationTransition](self, "complicationTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishInteractiveTransition");
  -[PREditorLookTransition lookNameTransition](self, "lookNameTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishInteractiveTransition");

}

- (void)cancelInteractiveTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PREditorLookTransition titleStyleTransition](self, "titleStyleTransition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelInteractiveTransition");
  -[PREditorLookTransition titleScrollingTransition](self, "titleScrollingTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelInteractiveTransition");
  -[PREditorLookTransition subtitleStyleTransition](self, "subtitleStyleTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelInteractiveTransition");
  -[PREditorLookTransition complicationTransition](self, "complicationTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelInteractiveTransition");
  -[PREditorLookTransition lookNameTransition](self, "lookNameTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelInteractiveTransition");

}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PREditorLookTransition *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __37__PREditorLookTransition_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __37__PREditorLookTransition_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  -[PREditorLookTransition currentLook](self, "currentLook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v16, "appendObject:withName:", v4, CFSTR("currentLook"));

  -[PREditorLookTransition destinationLook](self, "destinationLook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v16, "appendObject:withName:", v6, CFSTR("destinationLook"));

  -[PREditorLookTransition titleStyleTransition](self, "titleStyleTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v16, "appendObject:withName:", v8, CFSTR("titleStyleTransition"));

  -[PREditorLookTransition titleScrollingTransition](self, "titleScrollingTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v16, "appendObject:withName:", v10, CFSTR("titleScrollingTransition"));

  -[PREditorLookTransition subtitleStyleTransition](self, "subtitleStyleTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v16, "appendObject:withName:", v12, CFSTR("subtitleStyleTransition"));

  -[PREditorLookTransition lookNameTransition](self, "lookNameTransition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v16, "appendObject:withName:", v14, CFSTR("lookNameTransition"));

}

- (PREditingLook)currentLook
{
  return self->_currentLook;
}

- (PREditingLook)destinationLook
{
  return self->_destinationLook;
}

- (PREditorTitleViewControllerTransitioning)titleStyleTransition
{
  return self->_titleStyleTransition;
}

- (void)setTitleStyleTransition:(id)a3
{
  objc_storeStrong((id *)&self->_titleStyleTransition, a3);
}

- (PREditorTitleTransitioning)titleScrollingTransition
{
  return self->_titleScrollingTransition;
}

- (void)setTitleScrollingTransition:(id)a3
{
  objc_storeStrong((id *)&self->_titleScrollingTransition, a3);
}

- (CSProminentDisplayTransitioning)subtitleStyleTransition
{
  return self->_subtitleStyleTransition;
}

- (void)setSubtitleStyleTransition:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleStyleTransition, a3);
}

- (PREditorLookSwitchingComplicationTransition)complicationTransition
{
  return self->_complicationTransition;
}

- (void)setComplicationTransition:(id)a3
{
  objc_storeStrong((id *)&self->_complicationTransition, a3);
}

- (PREditingStandaloneLabelViewTransitioning)lookNameTransition
{
  return self->_lookNameTransition;
}

- (void)setLookNameTransition:(id)a3
{
  objc_storeStrong((id *)&self->_lookNameTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookNameTransition, 0);
  objc_storeStrong((id *)&self->_complicationTransition, 0);
  objc_storeStrong((id *)&self->_subtitleStyleTransition, 0);
  objc_storeStrong((id *)&self->_titleScrollingTransition, 0);
  objc_storeStrong((id *)&self->_titleStyleTransition, 0);
  objc_storeStrong((id *)&self->_destinationLook, 0);
  objc_storeStrong((id *)&self->_currentLook, 0);
}

@end
