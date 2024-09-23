@implementation WFWorkflowCopyActivity

- (WFWorkflowCopyActivity)initWithExcludedURL:(id)a3
{
  id v5;
  WFWorkflowCopyActivity *v6;
  WFWorkflowCopyActivity *v7;
  WFWorkflowCopyActivity *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowCopyActivity;
  v6 = -[UIActivity init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_excludedURL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return CFSTR("is.workflow.my.linkcopier");
}

- (id)activityTitle
{
  return WFLocalizedString(CFSTR("Copy iCloud Link"));
}

- (id)_systemImageName
{
  return CFSTR("link.icloud");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "if_firstObjectPassingTest:", &__block_literal_global_5419);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x24BDD1758];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__WFWorkflowCopyActivity_prepareWithActivityItems___block_invoke;
  v9[3] = &unk_24E6038C0;
  v9[4] = self;
  v5 = a3;
  objc_msgSend(v4, "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowCopyActivity setURL:](self, "setURL:", v8);

}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;

  -[WFWorkflowCopyActivity URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowCopyActivity URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setURL:", v5);

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (NSURL)excludedURL
{
  return self->_excludedURL;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_excludedURL, 0);
}

uint64_t __51__WFWorkflowCopyActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v7)
  {
    v10 = 0;
    v9 = 0;
    v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    v8 = 0;
    v10 = v7;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "excludedURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v10) ^ 1;
    v9 = v7;
    goto LABEL_8;
  }
  v8 = 0;
  v9 = v7;
LABEL_9:

  return v8;
}

uint64_t __54__WFWorkflowCopyActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = v2;
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = objc_msgSend(v4, "isFileURL") ^ 1;
    else
      v3 = 0;

  }
  return v3;
}

@end
