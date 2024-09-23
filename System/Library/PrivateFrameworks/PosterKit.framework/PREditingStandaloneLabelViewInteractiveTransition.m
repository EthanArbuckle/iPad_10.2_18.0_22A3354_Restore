@implementation PREditingStandaloneLabelViewInteractiveTransition

- (PREditingStandaloneLabelViewInteractiveTransition)initWithLabel:(id)a3 currentText:(id)a4 transitionText:(id)a5
{
  id v8;
  id v9;
  id v10;
  PREditingStandaloneLabelViewInteractiveTransition *v11;
  PREditingStandaloneLabelViewInteractiveTransition *v12;
  uint64_t v13;
  NSString *currentText;
  uint64_t v15;
  NSString *transitionText;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PREditingStandaloneLabelViewInteractiveTransition;
  v11 = -[PREditingStandaloneLabelViewInteractiveTransition init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_label, v8);
    v13 = objc_msgSend(v9, "copy");
    currentText = v12->_currentText;
    v12->_currentText = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    transitionText = v12->_transitionText;
    v12->_transitionText = (NSString *)v15;

  }
  return v12;
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5;

  -[PREditingStandaloneLabelViewInteractiveTransition label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactiveTransition:didUpdate:", self, a3);

}

- (void)finishInteractiveTransition
{
  id v3;

  -[PREditingStandaloneLabelViewInteractiveTransition label](self, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveTransition:didFinishSuccessfully:", self, 1);

}

- (void)cancelInteractiveTransition
{
  id v3;

  -[PREditingStandaloneLabelViewInteractiveTransition label](self, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveTransition:didFinishSuccessfully:", self, 0);

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
  PREditingStandaloneLabelViewInteractiveTransition *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__PREditingStandaloneLabelViewInteractiveTransition_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __64__PREditingStandaloneLabelViewInteractiveTransition_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PREditingStandaloneLabelViewInteractiveTransition currentText](self, "currentText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v8, "appendObject:withName:", v4, CFSTR("currentText"));

  -[PREditingStandaloneLabelViewInteractiveTransition transitionText](self, "transitionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", v6, CFSTR("transitionText"));

}

- (PREditingStandaloneLabelView)label
{
  return (PREditingStandaloneLabelView *)objc_loadWeakRetained((id *)&self->_label);
}

- (NSString)currentText
{
  return self->_currentText;
}

- (NSString)transitionText
{
  return self->_transitionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionText, 0);
  objc_storeStrong((id *)&self->_currentText, 0);
  objc_destroyWeak((id *)&self->_label);
}

@end
