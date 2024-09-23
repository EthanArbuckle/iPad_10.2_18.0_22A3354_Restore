@implementation UIInputViewSetPlacementAssistantOnScreenForNonKeyboard

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 1, 0, a5, 1, 1.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
    goto LABEL_11;
  if (!objc_msgSend(v8, "isInputViewPlaceholder"))
  {
    objc_msgSend(v8, "inputAssistantView");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v8, "inputAssistantView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isDescendantOfView:", v10);

      if (v15)
      {
        objc_msgSend(v10, "bottomAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "inputAssistantView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v20 = v17;
        objc_msgSend(v17, "bottomAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:constant:", v21, 0.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    objc_msgSend(v8, "inputAccessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_12;
    objc_msgSend(v8, "inputAccessoryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isDescendantOfView:", v10);

    if (v19)
    {
      objc_msgSend(v10, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v23.receiver = self;
  v23.super_class = (Class)UIInputViewSetPlacementAssistantOnScreenForNonKeyboard;
  -[UIInputViewSetPlacementWrapper verticalConstraintForInputViewSet:hostView:containerView:](&v23, sel_verticalConstraintForInputViewSet_hostView_containerView_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v11;
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, a5, 7, 1.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
