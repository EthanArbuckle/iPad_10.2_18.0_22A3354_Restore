@implementation PUSelectionFeedbackGenerator

- (PUSelectionFeedbackGenerator)init
{
  PUSelectionFeedbackGenerator *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UISelectionFeedbackGenerator *feedbackGenerator;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUSelectionFeedbackGenerator;
  v2 = -[PUSelectionFeedbackGenerator init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tweakedConfigurationForCaller:usage:", v2, CFSTR("photosEditAdjustmentSelection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC4100], "feedbackWithDictionaryRepresentation:", &unk_1E59BAC50);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFeedback:", v5);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:", v4);
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = (UISelectionFeedbackGenerator *)v6;

    -[UISelectionFeedbackGenerator _setOutputMode:](v2->_feedbackGenerator, "_setOutputMode:", 5);
  }
  return v2;
}

- (void)prepareFeedback
{
  id v2;

  -[PUSelectionFeedbackGenerator feedbackGenerator](self, "feedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepare");

}

- (void)performFeedback
{
  id v2;

  -[PUSelectionFeedbackGenerator feedbackGenerator](self, "feedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionChanged");

}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

@end
