@implementation WFEnumerationValuePicker

- (WFEnumerationValuePicker)initWithParameter:(id)a3 currentState:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFEnumerationValuePicker *v12;
  WFEnumerationValuePicker *v13;
  void *v14;
  id completionHandler;
  WFEnumerationValuePicker *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFEnumerationValuePicker;
  v12 = -[WFEnumerationValuePicker init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parameter, a3);
    objc_storeStrong((id *)&v13->_currentState, a4);
    v14 = _Block_copy(v11);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = v14;

    v16 = v13;
  }

  return v13;
}

- (int64_t)editingSlotArrayIndex
{
  void *v3;
  void *v4;
  int64_t v5;

  -[WFEnumerationValuePicker slotIdentifier](self, "slotIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFEnumerationValuePicker slotIdentifier](self, "slotIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "arrayIndex");

  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)dismissWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFEnumerationValuePicker parameterValuePickerViewController](self, "parameterValuePickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFEnumerationValuePicker parameterValuePickerViewController](self, "parameterValuePickerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

  }
}

- (void)cancelOperationAndCommitState
{
  void *v3;
  void (**v4)(id, uint64_t);

  -[WFEnumerationValuePicker cancelHandler](self, "cancelHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFEnumerationValuePicker cancelHandler](self, "cancelHandler");
    v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

  }
}

- (void)cancelOperationCommittingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[WFEnumerationValuePicker cancelHandler](self, "cancelHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFEnumerationValuePicker cancelHandler](self, "cancelHandler");
    v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
}

- (void)parameterValuePickingDidFinishWithParameterState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  char IsMultipleValue;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFEnumerationValuePicker parameter](self, "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!objc_msgSend(v7, "allowsMultipleValues") || (objc_msgSend(v7, "isRangedSizeArray") & 1) != 0)
    goto LABEL_10;
  -[WFEnumerationValuePicker slotIdentifier](self, "slotIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", CFSTR("_array_add_")))
  {

LABEL_10:
    v10 = v4;
    goto LABEL_11;
  }
  -[WFEnumerationValuePicker currentState](self, "currentState");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_17;
  v14 = (void *)v13;
  -[WFEnumerationValuePicker currentState](self, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WFParameterStateIsMultipleValue(v15) & 1) != 0)
  {

LABEL_17:
    goto LABEL_18;
  }
  IsMultipleValue = WFParameterStateIsMultipleValue(v4);

  if ((IsMultipleValue & 1) == 0)
    goto LABEL_10;
LABEL_18:
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) != 0)
    goto LABEL_10;
  -[WFEnumerationValuePicker currentState](self, "currentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (-[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex") == 0x7FFFFFFFFFFFFFFFLL
      || (v18 = -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex"),
          objc_msgSend(v17, "value"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "count"),
          v19,
          v18 >= v20))
    {
      objc_msgSend(v17, "stateByAppendingValue:", v4);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v17, "stateByReplacingValueAtIndex:withValue:", -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex"), v4);
      v21 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {

    v23 = objc_alloc((Class)objc_msgSend(v7, "multipleStateClass"));
    v24[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v23, "initWithParameterStates:", v17);
  }
  v10 = (id)v21;

LABEL_11:
  -[WFEnumerationValuePicker completionHandler](self, "completionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFEnumerationValuePicker completionHandler](self, "completionHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v10);

  }
}

- (void)parameterValuePickingDidClear
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  -[WFEnumerationValuePicker parameter](self, "parameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  -[WFEnumerationValuePicker currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v15 = v7;

  v8 = objc_msgSend(v5, "allowsMultipleValues");
  if (!v8
    || -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex") == 0x7FFFFFFFFFFFFFFFLL
    || (v9 = -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex"),
        objc_msgSend(v15, "value"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9 >= v11))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v15, "stateByRemovingValueAtIndex:", -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFEnumerationValuePicker completionHandler](self, "completionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFEnumerationValuePicker completionHandler](self, "completionHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v12);

  }
}

- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4
{
  -[WFEnumerationValuePicker parameterValuePickingDidFinishWithParameterState:](self, "parameterValuePickingDidFinishWithParameterState:", a4);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (!-[WFEnumerationValuePicker suppressAutomaticCancellation](self, "suppressAutomaticCancellation", a3))
    -[WFEnumerationValuePicker cancelOperationAndCommitState](self, "cancelOperationAndCommitState");
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  int64_t v5;

  v4 = a4;
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {
    if (objc_msgSend(v4, "horizontalSizeClass") == 1)
      v5 = 2;
    else
      v5 = -1;
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (WFVariableSubstitutableParameterState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (WFEnumerationParameter)parameter
{
  return self->_parameter;
}

- (void)setParameter:(id)a3
{
  objc_storeStrong((id *)&self->_parameter, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WFParameterValuePickerViewController)parameterValuePickerViewController
{
  return self->_parameterValuePickerViewController;
}

- (void)setParameterValuePickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parameterValuePickerViewController, a3);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WFSlotIdentifier)slotIdentifier
{
  return self->_slotIdentifier;
}

- (void)setSlotIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_slotIdentifier, a3);
}

- (BOOL)suppressAutomaticCancellation
{
  return self->_suppressAutomaticCancellation;
}

- (void)setSuppressAutomaticCancellation:(BOOL)a3
{
  self->_suppressAutomaticCancellation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_parameterValuePickerViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

+ (id)presentWithParameter:(id)a3 state:(id)a4 slotIdentifier:(id)a5 initialCollection:(id)a6 variableProvider:(id)a7 variableUIDelegate:(id)a8 allowsPickingVariables:(BOOL)a9 processing:(BOOL)a10 presentationAnchor:(id)a11 cancelHandler:(id)a12 completionHandler:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  WFEnumerationValuePicker *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  void *v35;
  int isKindOfClass;
  void *v37;
  id v38;
  id v39;
  void *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  WFParameterValuePickerViewController *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  WFEnumerationValuePicker *v90;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v84 = a11;
  v21 = a13;
  v22 = a12;
  v23 = a8;
  v24 = v18;
  v25 = v23;
  v26 = a7;
  v27 = a6;
  v28 = -[WFEnumerationValuePicker initWithParameter:currentState:completionHandler:]([WFEnumerationValuePicker alloc], "initWithParameter:currentState:completionHandler:", v24, v19, v21);

  -[WFEnumerationValuePicker setSlotIdentifier:](v28, "setSlotIdentifier:", v20);
  v90 = v28;
  -[WFEnumerationValuePicker setCancelHandler:](v28, "setCancelHandler:", v22);

  v86 = v20;
  if (v20)
    v29 = objc_msgSend(v20, "arrayIndex");
  else
    v29 = 0x7FFFFFFFFFFFFFFFLL;
  v30 = v28;
  if (objc_msgSend(v24, "allowsMultipleValues", v84) && (objc_msgSend(v24, "isRangedSizeArray") & 1) == 0)
    v31 = objc_msgSend(v24, "wf_supportsSearch") ^ 1;
  else
    v31 = 0;
  if (a10)
    v32 = 0;
  else
    v32 = objc_msgSend(v24, "wf_supportsSearch") ^ 1;
  v33 = v19;
  if (v33)
  {
    v88 = v25;
    v34 = v29;
    v35 = v24;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v37 = v33;
    else
      v37 = 0;
    v38 = v37;

    if ((isKindOfClass & 1 & v31) == 1)
    {
      v39 = v38;

      v87 = v33;
    }
    else
    {
      v87 = v38;
      if ((objc_msgSend(v35, "allowsMultipleValues") & isKindOfClass) == 1)
      {
        if (v29 == 0x7FFFFFFFFFFFFFFFLL
          || (objc_msgSend(v38, "value"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(v40, "count"),
              v40,
              v34 >= v41))
        {

          v33 = 0;
        }
        else
        {
          objc_msgSend(v38, "parameterStates");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectAtIndex:", v34);
          v43 = objc_claimAutoreleasedReturnValue();

          v33 = (id)v43;
        }
      }
    }
    v24 = v35;
    v30 = v90;
    v25 = v88;
  }
  else
  {
    objc_msgSend(v24, "allowsMultipleValues");
    v87 = 0;
  }
  v89 = v24;
  v44 = -[WFParameterValuePickerViewController initWithParameter:widgetFamily:allowsVariables:initialCollection:currentState:delegate:]([WFParameterValuePickerViewController alloc], "initWithParameter:widgetFamily:allowsVariables:initialCollection:currentState:delegate:", v24, 3, v32, v27, v33, v30);

  objc_msgSend(v30, "setParameterValuePickerViewController:", v44);
  -[WFParameterValuePickerViewController setVariableProvider:](v44, "setVariableProvider:", v26);

  -[WFParameterValuePickerViewController setVariableUIDelegate:](v44, "setVariableUIDelegate:", v25);
  -[WFParameterValuePickerViewController setAllowsMultipleSelection:](v44, "setAllowsMultipleSelection:", v31);
  WFLocalizedString(CFSTR("No options available."));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController setNoOptionAvailableTitle:](v44, "setNoOptionAvailableTitle:", v45);

  if (!a10)
  {
    objc_msgSend(v33, "variable");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46
      || ((objc_msgSend(v24, "defaultSerializedRepresentation"),
           v47 = objc_claimAutoreleasedReturnValue(),
           v48 = (void *)v47,
           v47 != 0 || v33 == 0)
        ? (v30 = (void *)v47)
        : (v30 = 0),
          ((v47 == 0 && v33 != 0) | v31) == 1))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "bundleIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqualToString:", *MEMORY[0x24BEC17D8]);

      if (v46)
      {

        v30 = v90;
        if (!v51)
          goto LABEL_36;
      }
      else
      {

        v30 = v90;
        if ((v51 & 1) == 0)
          goto LABEL_36;
      }
      WFLocalizedString(CFSTR("Clear"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerViewController setRemoveItemButtonTitle:](v44, "setRemoveItemButtonTitle:", v48);
    }

    v30 = v90;
  }
LABEL_36:
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v44);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "wf_isWidgetConfigurationExtensionBundle");

  if (v54)
  {
    objc_msgSend(v52, "setModalPresentationStyle:", 2);
    objc_msgSend(v52, "presentationController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v87;
    if (v55)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v57 = v55;
      else
        v57 = 0;
    }
    else
    {
      v57 = 0;
    }
    v78 = v89;
    v79 = v57;

    objc_msgSend(v79, "_setWantsBottomAttachedInCompactHeight:", 1);
  }
  else
  {
    objc_msgSend(v85, "sourceViewController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "traitCollection");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "layoutDirection");

    objc_msgSend(v52, "setModalPresentationStyle:", 7);
    objc_msgSend(v52, "popoverPresentationController");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setDelegate:", v30);

    objc_msgSend(v85, "sourceView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "popoverPresentationController");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setSourceView:", v62);

    objc_msgSend(v85, "sourceRect");
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;
    objc_msgSend(v52, "popoverPresentationController");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setSourceRect:", v65, v67, v69, v71);

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v63) = objc_msgSend(v73, "wf_isFocusConfigurationExtensionBundle");

    if ((_DWORD)v63)
    {
      objc_msgSend(v52, "popoverPresentationController");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      v76 = 15;
    }
    else
    {
      if (v60 == 1)
        v77 = 10;
      else
        v77 = 6;
      objc_msgSend(v52, "popoverPresentationController");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      v76 = v77;
    }
    objc_msgSend(v74, "setPermittedArrowDirections:", v76);
    v56 = v87;
    v78 = v89;

    objc_msgSend(v52, "popoverPresentationController");
    v79 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "wf_forcePresentationInPresenterSceneIfNeeded");
  }

  objc_msgSend(v85, "sourceViewController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "traitCollection");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setOverrideUserInterfaceStyle:", objc_msgSend(v81, "userInterfaceStyle"));

  objc_msgSend(v85, "sourceViewController");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "presentViewController:animated:completion:", v52, 1, 0);

  return v30;
}

@end
