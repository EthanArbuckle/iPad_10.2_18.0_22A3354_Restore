@implementation WFShortcutiCloudLinkExporter

- (void)exportWorkflowWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[WFGallerySessionManager sharedManager](WFGallerySessionManager, "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFShortcutExporter workflowRecord](self, "workflowRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutExporter workflowRecord](self, "workflowRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uploadWorkflow:withName:shortDescription:longDescription:private:completionHandler:", v5, v7, 0, 0, 1, v4);

}

@end
