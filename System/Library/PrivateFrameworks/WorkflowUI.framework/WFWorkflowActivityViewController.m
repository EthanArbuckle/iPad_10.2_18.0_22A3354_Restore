@implementation WFWorkflowActivityViewController

- (WFWorkflowActivityViewController)initWithWorkflow:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  WFWorkflowCopyActivity *v13;
  void *v14;
  WFWorkflowLinkProvider *v15;
  void *v16;
  WFWorkflowActivityViewController *v17;
  void *v18;
  int v19;
  WFReportShortcutActivity *v20;
  WFReportShortcutActivity *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  WFWorkflowActivityViewController *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  objc_super v33;
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WFGallerySharingURLForIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = -[WFWorkflowCopyActivity initWithExcludedURL:]([WFWorkflowCopyActivity alloc], "initWithExcludedURL:", v8);
  objc_msgSend(v12, "insertObject:atIndex:", v13, 0);

  WFUserInterfaceFromViewController();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFWorkflowLinkProvider initWithWorkflow:userInterface:]([WFWorkflowLinkProvider alloc], "initWithWorkflow:userInterface:", v6, v14);
  v36[0] = v15;
  v36[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)WFWorkflowActivityViewController;
  v17 = -[WFWorkflowActivityViewController initWithActivityItems:applicationActivities:](&v33, sel_initWithActivityItems_applicationActivities_, v16, v12);

  if (v17)
  {
    -[WFWorkflowActivityViewController setLinkProvider:](v17, "setLinkProvider:", v15);
    -[WFWorkflowActivityViewController setWorkflow:](v17, "setWorkflow:", v6);
    -[WFWorkflowActivityViewController workflow](v17, "workflow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isReportable");

    if (v19)
    {
      objc_initWeak(&location, v17);
      v20 = [WFReportShortcutActivity alloc];
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __75__WFWorkflowActivityViewController_initWithWorkflow_applicationActivities___block_invoke;
      v30 = &unk_24E6038E8;
      objc_copyWeak(&v31, &location);
      v21 = -[WFReportShortcutActivity initWithWorkflow:completion:](v20, "initWithWorkflow:completion:", v6, &v27);
      -[WFReportShortcutActivity setActivityControler:](v21, "setActivityControler:", v17, v27, v28, v29, v30);
      objc_msgSend(v12, "addObject:", v21);
      v35[0] = v15;
      v35[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowActivityViewController _updateActivityItems:applicationActivities:](v17, "_updateActivityItems:applicationActivities:", v22, v12);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    v23 = *MEMORY[0x24BE8F688];
    v34[0] = *MEMORY[0x24BE8F6A0];
    v34[1] = v23;
    v34[2] = *MEMORY[0x24BE8F698];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowActivityViewController setExcludedActivityTypes:](v17, "setExcludedActivityTypes:", v24);

    -[WFWorkflowActivityViewController setObjectManipulationDelegate:](v17, "setObjectManipulationDelegate:", v17);
    v25 = v17;
  }

  return v17;
}

- (void)_customizationsDidChange
{
  void *v3;
  int64_t v4;
  __objc2_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[5];
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  if (-[WFWorkflowActivityViewController selectedMode](self, "selectedMode"))
  {
    if (-[WFWorkflowActivityViewController selectedMode](self, "selectedMode") != 1)
      return;
    WFUserInterfaceFromViewController();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WFWorkflowActivityViewController selectedDestination](self, "selectedDestination");
    if (v4 == 1)
    {
      v5 = WFP2PSignedShortcutFileProvider;
    }
    else
    {
      if (v4)
      {
LABEL_9:
        v13 = *MEMORY[0x24BE8F688];
        v17[0] = *MEMORY[0x24BE8F6A0];
        v17[1] = v13;
        v17[2] = *MEMORY[0x24BE8F698];
        v17[3] = v13;
        v17[4] = *MEMORY[0x24BE8F6F8];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowActivityViewController setExcludedActivityTypes:](self, "setExcludedActivityTypes:", v14);

        -[WFWorkflowActivityViewController signedShortcutFileProvider](self, "signedShortcutFileProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v8;
        -[WFWorkflowActivityViewController workflow](self, "workflow");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowActivityViewController _updateActivityItems:](self, "_updateActivityItems:", v15);

        goto LABEL_10;
      }
      v5 = WFICloudSignedShortcutFileProvider;
    }
    v10 = [v5 alloc];
    -[WFWorkflowActivityViewController workflow](self, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithWorkflow:userInterface:", v11, v3);
    -[WFWorkflowActivityViewController setSignedShortcutFileProvider:](self, "setSignedShortcutFileProvider:", v12);

    goto LABEL_9;
  }
  v6 = *MEMORY[0x24BE8F688];
  v19[0] = *MEMORY[0x24BE8F6A0];
  v19[1] = v6;
  v19[2] = *MEMORY[0x24BE8F698];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowActivityViewController setExcludedActivityTypes:](self, "setExcludedActivityTypes:", v7);

  -[WFWorkflowActivityViewController linkProvider](self, "linkProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  -[WFWorkflowActivityViewController workflow](self, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowActivityViewController _updateActivityItems:](self, "_updateActivityItems:", v9);
LABEL_10:

}

- (id)generateSharingModeGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("iCloud Link"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  WFLocalizedString(CFSTR("File"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE8F678];
  v7 = -[WFWorkflowActivityViewController selectedMode](self, "selectedMode");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__WFWorkflowActivityViewController_generateSharingModeGroup__block_invoke;
  v14[3] = &unk_24E603910;
  v14[4] = self;
  objc_msgSend(v6, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("WFWorkflowSharingModePicker"), v5, v7, 0, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE8F680]);
  WFLocalizedString(CFSTR("Send As"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "_initGroupWithName:identifier:customizations:", v10, CFSTR("WFWorkflowSharingModeGroup"), v11);

  return v12;
}

- (id)generateSharingDestinationGroup
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Anyone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  WFLocalizedString(CFSTR("People Who Know Me"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFWorkflowActivityViewController selectedDestination](self, "selectedDestination");
  if (v6)
  {
    if (v6 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = CFSTR("Only people who have you in their contacts will be able to use the shortcut. Your contact info will be included in the shortcut file for verification.\n\nYou can also use this option to make a personal backup of your shortcuts.");
  }
  else
  {
    v7 = CFSTR("When you export a shortcut file for anyone, Apple will sign your shortcut on its server.");
  }
  WFLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)MEMORY[0x24BE8F678];
  v10 = -[WFWorkflowActivityViewController selectedDestination](self, "selectedDestination");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__WFWorkflowActivityViewController_generateSharingDestinationGroup__block_invoke;
  v17[3] = &unk_24E603910;
  v17[4] = self;
  objc_msgSend(v9, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("WFWorkflowSharingDestinationPicker"), v5, v10, v8, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BE8F680]);
  WFLocalizedString(CFSTR("For"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "_initGroupWithName:identifier:customizations:", v13, CFSTR("WFWorkflowSharingDestinationGroup"), v14);

  return v15;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[WFWorkflowActivityViewController generateSharingModeGroup](self, "generateSharingModeGroup", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFWorkflowActivityViewController selectedMode](self, "selectedMode") == 1)
  {
    -[WFWorkflowActivityViewController generateSharingDestinationGroup](self, "generateSharingDestinationGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  return v7;
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  return 1;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (void)setSelectedMode:(int64_t)a3
{
  self->_selectedMode = a3;
}

- (int64_t)selectedDestination
{
  return self->_selectedDestination;
}

- (void)setSelectedDestination:(int64_t)a3
{
  self->_selectedDestination = a3;
}

- (WFFileRepresentation)workflowFile
{
  return self->_workflowFile;
}

- (void)setWorkflowFile:(id)a3
{
  objc_storeStrong((id *)&self->_workflowFile, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
}

- (WFWorkflowLinkProvider)linkProvider
{
  return self->_linkProvider;
}

- (void)setLinkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_linkProvider, a3);
}

- (WFSignedShortcutFileProvider)signedShortcutFileProvider
{
  return self->_signedShortcutFileProvider;
}

- (void)setSignedShortcutFileProvider:(id)a3
{
  objc_storeStrong((id *)&self->_signedShortcutFileProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedShortcutFileProvider, 0);
  objc_storeStrong((id *)&self->_linkProvider, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_workflowFile, 0);
}

void __67__WFWorkflowActivityViewController_generateSharingDestinationGroup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "selectedDestination");
  if (v3 != objc_msgSend(v4, "selectedOptionIndex"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedDestination:", objc_msgSend(v4, "selectedOptionIndex"));
    objc_msgSend(*(id *)(a1 + 32), "_customizationsDidChange");
  }

}

void __60__WFWorkflowActivityViewController_generateSharingModeGroup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "selectedMode");
  if (v3 != objc_msgSend(v4, "selectedOptionIndex"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedMode:", objc_msgSend(v4, "selectedOptionIndex"));
    objc_msgSend(*(id *)(a1 + 32), "_customizationsDidChange");
  }

}

void __75__WFWorkflowActivityViewController_initWithWorkflow_applicationActivities___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

@end
