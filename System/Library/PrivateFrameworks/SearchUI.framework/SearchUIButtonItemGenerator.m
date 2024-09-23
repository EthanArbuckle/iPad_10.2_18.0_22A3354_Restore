@implementation SearchUIButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 != objc_opt_class();
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  SearchUIButtonItem *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  objc_msgSend(v6, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "applicationBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v9);

    if (v10)
      goto LABEL_9;
LABEL_6:
    v13 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v11);

    if (!v12)
    {
LABEL_9:
      v17 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", v6);
      v18[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (!v8)
    goto LABEL_9;
  -[SearchUIButtonItemGenerator feedbackDelegate](self, "feedbackDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[SearchUICommandHandler hasValidHandlerForCommand:rowModel:environment:](SearchUICommandHandler, "hasValidHandlerForCommand:rowModel:environment:", v8, 0, v15);

  v13 = 0;
  if (v16)
    goto LABEL_9;
LABEL_10:
  v7[2](v7, v13, 1);

}

- (SearchUIButtonItemGeneratorViewDelegate)delegate
{
  return (SearchUIButtonItemGeneratorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
