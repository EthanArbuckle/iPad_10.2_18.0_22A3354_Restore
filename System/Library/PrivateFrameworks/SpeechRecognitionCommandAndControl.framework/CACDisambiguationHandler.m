@implementation CACDisambiguationHandler

- (CACDisambiguationHandler)initWithLabeledElements:(id)a3
{
  id v5;
  CACDisambiguationHandler *v6;
  CACDisambiguationHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACDisambiguationHandler;
  v6 = -[CACDisambiguationHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_labeledElements, a3);

  return v7;
}

- (void)handleChosenLabeledElement:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  -[CACDisambiguationHandler chosenLabeledElementHandler](self, "chosenLabeledElementHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CACDisambiguationHandler chosenLabeledElementHandler](self, "chosenLabeledElementHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    objc_msgSend(v4, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__CACDisambiguationHandler_handleChosenLabeledElement___block_invoke;
      block[3] = &unk_24F2AA860;
      v10 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __55__CACDisambiguationHandler_handleChosenLabeledElement___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "element");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cacActivate");

}

- (NSArray)labeledElements
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabeledElements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)chosenLabeledElementHandler
{
  return self->_chosenLabeledElementHandler;
}

- (void)setChosenLabeledElementHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chosenLabeledElementHandler, 0);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

@end
