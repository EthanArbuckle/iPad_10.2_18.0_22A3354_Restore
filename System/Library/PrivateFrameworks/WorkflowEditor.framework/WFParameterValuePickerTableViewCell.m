@implementation WFParameterValuePickerTableViewCell

- (id)configurationState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFParameterValuePickerTableViewCell;
  -[WFParameterValuePickerTableViewCell configurationState](&v10, sel_configurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCell state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomState:forKey:", v4, CFSTR("state"));

  -[WFParameterValuePickerTableViewCell parameter](self, "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomState:forKey:", v5, CFSTR("parameter"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFParameterValuePickerTableViewCell isContainedInState](self, "isContainedInState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomState:forKey:", v6, CFSTR("containedInState"));

  -[WFParameterValuePickerTableViewCell parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomState:forKey:", v7, CFSTR("parentViewController"));

  -[WFParameterValuePickerTableViewCell delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomState:forKey:", v8, CFSTR("delegate"));

  return v3;
}

- (void)setParameter:(id)a3
{
  id v5;
  WFParameterValuePickable *v6;
  WFParameterValuePickable *v7;
  char v8;
  WFParameterValuePickable *v9;

  v5 = a3;
  v6 = self->_parameter;
  v7 = (WFParameterValuePickable *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[WFParameterValuePickable isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_parameter, a3);
    -[WFParameterValuePickerTableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
LABEL_9:

}

- (void)setState:(id)a3
{
  id v5;
  WFCodableAttributeBackedSubstitutableState *v6;
  WFCodableAttributeBackedSubstitutableState *v7;
  char v8;
  WFCodableAttributeBackedSubstitutableState *v9;

  v5 = a3;
  v6 = self->_state;
  v7 = (WFCodableAttributeBackedSubstitutableState *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[WFCodableAttributeBackedSubstitutableState isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_state, a3);
    -[WFParameterValuePickerTableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
LABEL_9:

}

- (void)setContainedInState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  if (self->_containedInState != a3)
  {
    v3 = a3;
    self->_containedInState = a3;
    -[WFParameterValuePickerTableViewCell parameter](self, "parameter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "wf_usesTogglesForSelection");

    if (v6)
    {
      -[WFParameterValuePickerTableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    }
    else
    {
      if (v3)
        v7 = 3;
      else
        v7 = 0;
      -[WFParameterValuePickerTableViewCell setAccessoryType:](self, "setAccessoryType:", v7);
    }
  }
}

- (void)setParentViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  id obj;

  v4 = a3;
  v5 = objc_loadWeakRetained((id *)&self->_parentViewController);
  v6 = v4;
  obj = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeWeak((id *)&self->_parentViewController, obj);
    -[WFParameterValuePickerTableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
LABEL_9:

}

- (id)defaultContentConfiguration
{
  WFParameterValuePickerTableViewCellConfiguration *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(WFParameterValuePickerTableViewCellConfiguration);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wf_isWidgetConfigurationExtensionBundle");

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBB520];
  if (v5)
    objc_msgSend(MEMORY[0x24BEBB520], "labelFontSize");
  else
    v8 = 17.0;
  objc_msgSend(v7, "systemFontOfSize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledFontForFont:maximumPointSize:", v9, 36.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCellConfiguration setTextFont:](v3, "setTextFont:", v10);

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scaledFontForFont:maximumPointSize:", v12, 24.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCellConfiguration setSecondaryTextFont:](v3, "setSecondaryTextFont:", v13);

  -[WFParameterValuePickerTableViewCellConfiguration setContainedInState:](v3, "setContainedInState:", 0);
  -[WFParameterValuePickerTableViewCell parameter](self, "parameter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCellConfiguration setUsesToggleForSelection:](v3, "setUsesToggleForSelection:", objc_msgSend(v14, "wf_usesTogglesForSelection"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCellConfiguration setTextColor:](v3, "setTextColor:", v15);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCellConfiguration setSecondaryTextColor:](v3, "setSecondaryTextColor:", v16);

  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  void *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameter"));
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containedInState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedConfigurationForState:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "wf_pickerLocalizedTitleForState:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v37, "wf_pickerLocalizedSubtitleForState:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecondaryText:", v13);

  objc_msgSend(v37, "wf_pickerLocalizedImageForState:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "platformImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "wf_alwaysScaleIconImage"))
  {
    objc_msgSend(v15, "size");
    if (v16 < 29.0)
    {
      objc_msgSend(v15, "size");
      if (v17 < 29.0)
      {
        objc_msgSend(v15, "size");
        v19 = 29.0 / v18;
        objc_msgSend(v15, "size");
        v21 = fmin(v19, 29.0 / v20);
        objc_msgSend(v15, "size");
        v23 = v22 * v21;
        objc_msgSend(v15, "size");
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v23, v21 * v24);
        v36 = objc_msgSend(v15, "renderingMode");
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __69__WFParameterValuePickerTableViewCell_updateConfigurationUsingState___block_invoke;
        v38[3] = &unk_24EE25550;
        v39 = v15;
        objc_msgSend(v25, "imageWithActions:", v38);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "imageWithRenderingMode:", v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  objc_msgSend(v11, "setImage:", v14);
  objc_msgSend(v15, "size");
  v28 = fmin(v27, 29.0);
  objc_msgSend(v15, "size");
  v30 = fmax(v28, fmin(v29, 29.0));
  v31 = objc_msgSend(v14, "displayStyle");
  v32 = 15.0;
  if (v31 == 1)
    v32 = 2.0;
  objc_msgSend(v11, "setCornerRadius:", ceil(v30 / v32));
  objc_msgSend(v11, "setForceImageScaling:", objc_msgSend(v37, "wf_alwaysScaleIconImage"));
  objc_msgSend(v11, "setUsesInsetGroupedTableStyle:", objc_msgSend(v37, "wf_usesGroupTableViewStyle"));
  if (!v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v37, "wf_pickerLocalizedIconForState:", v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIcon:", v33);

  }
  objc_msgSend(v11, "setParentViewController:", v6);
  objc_msgSend(v11, "setContainedInState:", v8);
  objc_msgSend(v11, "setDelegate:", v9);
  -[WFParameterValuePickerTableViewCell layoutMargins](self, "layoutMargins");
  v34 = -[WFParameterValuePickerTableViewCell disablesSeparatorIconInset](self, "disablesSeparatorIconInset");
  if (v15 || v34)
  {
    if (v34)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(v11, "icon");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
LABEL_13:
    objc_msgSend(v11, "usesInsetGroupedTableStyle");
LABEL_14:
  WFConvertEdgeInsetsToRTLIfNeeded();
  -[WFParameterValuePickerTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  -[WFParameterValuePickerTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v11);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFParameterValuePickerTableViewCell;
  -[WFParameterValuePickerTableViewCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[WFParameterValuePickerTableViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (WFCodableAttributeBackedSubstitutableState)state
{
  return self->_state;
}

- (BOOL)isContainedInState
{
  return self->_containedInState;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (WFParameterValuePickerTableViewCellDelegate)delegate
{
  return (WFParameterValuePickerTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disablesSeparatorIconInset
{
  return self->_disablesSeparatorIconInset;
}

- (void)setDisablesSeparatorIconInset:(BOOL)a3
{
  self->_disablesSeparatorIconInset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

void __69__WFParameterValuePickerTableViewCell_updateConfigurationUsingState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "format");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "drawInRect:");

}

@end
