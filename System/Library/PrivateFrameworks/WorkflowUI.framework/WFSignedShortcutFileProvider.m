@implementation WFSignedShortcutFileProvider

- (WFSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  WFSignedShortcutFileProvider *v10;
  objc_super v12;

  v6 = (void *)MEMORY[0x24BE19628];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "proposedTemporaryFileURLForFilename:", CFSTR("Shortcut.shortcut"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WFSignedShortcutFileProvider;
  v10 = -[WFWorkflowItemProvider initWithWorkflow:userInterface:placeholderItem:](&v12, sel_initWithWorkflow_userInterface_placeholderItem_, v8, v7, v9);

  return v10;
}

- (id)item
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.activity.homescreen")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.activity.launchcenter")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.activity.submit")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.my.filesharer")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.my.fileduplicator")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F6E0]) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFSignedShortcutFileProvider;
    -[WFWorkflowItemProvider item](&v6, sel_item);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (WFShortcutPackageFile)shortcutFile
{
  return self->_shortcutFile;
}

- (void)setShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutFile, a3);
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (void)setSignedShortcutFile:(id)a3
{
  objc_storeStrong((id *)&self->_signedShortcutFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
  objc_storeStrong((id *)&self->_shortcutFile, 0);
}

@end
