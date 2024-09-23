@implementation SearchUIClearProactiveCategoryHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!objc_msgSend(v7, "shouldClearWholeSection") || objc_msgSend(v7, "category") == 2)
  {
    objc_msgSend(v8, "feedbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v8, "feedbackDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICommandHandler rowModel](self, "rowModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeRowModel:completion:", v12, 0);
    goto LABEL_5;
  }
  objc_msgSend(v8, "feedbackDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedbackDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SearchUICommandHandler rowModel](self, "rowModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[SearchUICommandHandler rowModel](self, "rowModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeSectionContainingRowModel:completion:", v12, 0);
      goto LABEL_5;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "feedbackDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SearchUICommandHandler sectionModel](self, "sectionModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_6;
    -[SearchUICommandHandler sectionModel](self, "sectionModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeSectionModel:completion:", v12, 0);
  }
LABEL_5:

LABEL_6:
LABEL_7:
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifyingResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "category") == 1)
  {
    if (objc_msgSend(v7, "shouldClearWholeSection"))
      objc_msgSend(MEMORY[0x1E0DA9CA8], "deleteAllRecents");
    else
      objc_msgSend(MEMORY[0x1E0DA9CA8], "deleteResult:", v14);
  }
  else
  {
    SearchUIGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_1DAD39000, v15, OS_LOG_TYPE_DEFAULT, "Proactive to handle result through feedback, result: %@", (uint8_t *)&v19, 0xCu);
    }

  }
}

@end
