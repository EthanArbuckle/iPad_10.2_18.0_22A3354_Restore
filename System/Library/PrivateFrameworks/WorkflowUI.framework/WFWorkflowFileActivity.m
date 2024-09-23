@implementation WFWorkflowFileActivity

- (WFWorkflowFileActivity)initWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  WFWorkflowFileActivity *v14;
  WFWorkflowFileActivity *v15;
  WFWorkflowFileActivity *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFWorkflowFileActivity;
  v14 = -[UIActivity init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceView, a3);
    objc_storeStrong((id *)&v15->_barButtonItem, a5);
    v15->_sourceRect.origin.x = x;
    v15->_sourceRect.origin.y = y;
    v15->_sourceRect.size.width = width;
    v15->_sourceRect.size.height = height;
    v16 = v15;
  }

  return v15;
}

- (WFWorkflowFileActivity)initWithPopoverModel:(id)a3
{
  id v5;
  WFWorkflowFileActivity *v6;
  WFWorkflowFileActivity *v7;
  WFWorkflowFileActivity *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowFileActivity;
  v6 = -[UIActivity init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_popoverModel, a3);
    v8 = v7;
  }

  return v7;
}

- (id)activityType
{
  return (id)objc_msgSend((id)objc_opt_class(), "activityType");
}

- (id)activityTitle
{
  return WFLocalizedString(CFSTR("Share as File"));
}

- (id)_systemImageName
{
  return CFSTR("doc");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BEC4038], "shortcutFileSharingEnabled"))
  {
    objc_msgSend(v3, "objectsMatchingClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (WFFileRepresentation)workflowFile
{
  WFFileRepresentation *workflowFile;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFFileRepresentation *v9;
  WFFileRepresentation *v10;

  workflowFile = self->_workflowFile;
  if (!workflowFile)
  {
    -[WFWorkflowFileActivity activityItems](self, "activityItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsMatchingClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeToDiskWithError:", 0);
    v9 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    v10 = self->_workflowFile;
    self->_workflowFile = v9;

    workflowFile = self->_workflowFile;
  }
  return workflowFile;
}

- (void)performActivity
{
  WFPopoverModel *popoverModel;
  id v3;

  popoverModel = self->_popoverModel;
  if (popoverModel)
  {
    -[WFWorkflowFileActivity createViewController](self, "createViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[WFPopoverModel displayFileActivityWith:](popoverModel, "displayFileActivityWith:", v3);

  }
}

- (id)activityViewController
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_popoverModel)
  {
    v2 = 0;
  }
  else
  {
    -[WFWorkflowFileActivity createViewController](self, "createViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "popoverPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowFileActivity sourceView](self, "sourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSourceView:", v5);

    -[WFWorkflowFileActivity sourceRect](self, "sourceRect");
    objc_msgSend(v4, "setSourceRect:");
    -[WFWorkflowFileActivity barButtonItem](self, "barButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBarButtonItem:", v6);

    objc_msgSend(v4, "setPermittedArrowDirections:", -[WFWorkflowFileActivity arrowDirection](self, "arrowDirection"));
  }
  return v2;
}

- (id)createViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WFWorkflowFileActivity workflowFile](self, "workflowFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BE8F650]);
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  v11 = *MEMORY[0x24BE8F6B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExcludedActivityTypes:", v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__WFWorkflowFileActivity_createViewController__block_invoke;
  v10[3] = &unk_24E604388;
  v10[4] = self;
  objc_msgSend(v7, "setCompletionWithItemsHandler:", v10);

  return v7;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirection = a3;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItem, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (WFPopoverModel)popoverModel
{
  return self->_popoverModel;
}

- (void)setPopoverModel:(id)a3
{
  objc_storeStrong((id *)&self->_popoverModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverModel, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_workflowFile, 0);
}

uint64_t __46__WFWorkflowFileActivity_createViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:");
}

+ (id)activityType
{
  return CFSTR("is.workflow.my.filesharer");
}

@end
