@implementation NCNotificationListSupplementaryViewConfiguration

- (id)_initWithGroupingIdentifier:(id)a3 groupName:(id)a4 defaultAction:(id)a5 supplementaryActions:(id)a6 auxiliaryOptionsSummaryText:(id)a7 auxiliaryOptionActions:(id)a8 tintColor:(id)a9 textColor:(id)a10 materialRecipe:(int64_t)a11 containsUnmanagedContent:(BOOL)a12 preventsUserDismissal:(BOOL)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NCNotificationListSupplementaryViewConfiguration *v27;
  uint64_t v28;
  NSString *groupingIdentifier;
  uint64_t v30;
  NSString *groupName;
  uint64_t v32;
  UIAction *defaultAction;
  uint64_t v34;
  NSArray *supplementaryActions;
  uint64_t v36;
  NSString *auxiliaryOptionsSummaryText;
  uint64_t v38;
  NSArray *auxiliaryOptionActions;
  uint64_t v40;
  UIColor *tintColor;
  uint64_t v42;
  UIColor *textColor;
  objc_super v45;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v45.receiver = self;
  v45.super_class = (Class)NCNotificationListSupplementaryViewConfiguration;
  v27 = -[NCNotificationListSupplementaryViewConfiguration init](&v45, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v19, "copy");
    groupingIdentifier = v27->_groupingIdentifier;
    v27->_groupingIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    groupName = v27->_groupName;
    v27->_groupName = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    defaultAction = v27->_defaultAction;
    v27->_defaultAction = (UIAction *)v32;

    v34 = objc_msgSend(v22, "copy");
    supplementaryActions = v27->_supplementaryActions;
    v27->_supplementaryActions = (NSArray *)v34;

    v36 = objc_msgSend(v23, "copy");
    auxiliaryOptionsSummaryText = v27->_auxiliaryOptionsSummaryText;
    v27->_auxiliaryOptionsSummaryText = (NSString *)v36;

    v38 = objc_msgSend(v24, "copy");
    auxiliaryOptionActions = v27->_auxiliaryOptionActions;
    v27->_auxiliaryOptionActions = (NSArray *)v38;

    v40 = objc_msgSend(v25, "copy");
    tintColor = v27->_tintColor;
    v27->_tintColor = (UIColor *)v40;

    v42 = objc_msgSend(v26, "copy");
    textColor = v27->_textColor;
    v27->_textColor = (UIColor *)v42;

    v27->_materialRecipe = a11;
    v27->_containsUnmanagedContent = a12;
    v27->_preventsUserDismissal = a13;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int64_t v30;
  int v31;
  _BOOL4 v32;
  int v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_16:
      LOBYTE(v33) = 0;
      goto LABEL_17;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration groupingIdentifier](self, "groupingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NCIsEqual();

  if (!v8)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration groupName](self, "groupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NCIsEqual();

  if (!v11)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration defaultAction](self, "defaultAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = NCIsEqual();

  if (!v14)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration supplementaryActions](self, "supplementaryActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supplementaryActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = NCIsEqualToArray();

  if (!v17)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionsSummaryText](self, "auxiliaryOptionsSummaryText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "auxiliaryOptionsSummaryText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = NCIsEqual();

  if (!v20)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionActions](self, "auxiliaryOptionActions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "auxiliaryOptionActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = NCIsEqualToArray();

  if (!v23)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration tintColor](self, "tintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = NCIsEqual();

  if (!v26)
    goto LABEL_16;
  -[NCNotificationListSupplementaryViewConfiguration textColor](self, "textColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = NCIsEqual();

  if (!v29)
    goto LABEL_16;
  v30 = -[NCNotificationListSupplementaryViewConfiguration materialRecipe](self, "materialRecipe");
  if (v30 != objc_msgSend(v5, "materialRecipe"))
    goto LABEL_16;
  v31 = -[NCNotificationListSupplementaryViewConfiguration containsUnmanagedContent](self, "containsUnmanagedContent");
  if (v31 != objc_msgSend(v5, "containsUnmanagedContent"))
    goto LABEL_16;
  v32 = -[NCNotificationListSupplementaryViewConfiguration preventsUserDismissal](self, "preventsUserDismissal");
  v33 = v32 ^ objc_msgSend(v5, "preventsUserDismissal") ^ 1;
LABEL_17:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_groupingIdentifier, "hash");
  v4 = -[NSString hash](self->_groupName, "hash") + v3;
  v5 = -[UIAction hash](self->_defaultAction, "hash");
  v6 = v4 + v5 + -[NSArray hash](self->_supplementaryActions, "hash");
  v7 = -[NSString hash](self->_auxiliaryOptionsSummaryText, "hash");
  v8 = v7 + -[NSArray hash](self->_auxiliaryOptionActions, "hash");
  v9 = v6 + v8 + -[UIColor hash](self->_tintColor, "hash");
  return v9
       + -[UIColor hash](self->_textColor, "hash")
       + self->_materialRecipe
       + self->_containsUnmanagedContent
       + self->_preventsUserDismissal;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationListSupplementaryViewConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NCNotificationListMutableSupplementaryViewConfiguration *v4;
  uint64_t v6;

  v4 = [NCNotificationListMutableSupplementaryViewConfiguration alloc];
  LOWORD(v6) = *(_WORD *)&self->_containsUnmanagedContent;
  return -[NCNotificationListSupplementaryViewConfiguration _initWithGroupingIdentifier:groupName:defaultAction:supplementaryActions:auxiliaryOptionsSummaryText:auxiliaryOptionActions:tintColor:textColor:materialRecipe:containsUnmanagedContent:preventsUserDismissal:](v4, "_initWithGroupingIdentifier:groupName:defaultAction:supplementaryActions:auxiliaryOptionsSummaryText:auxiliaryOptionActions:tintColor:textColor:materialRecipe:containsUnmanagedContent:preventsUserDismissal:", self->_groupingIdentifier, self->_groupName, self->_defaultAction, self->_supplementaryActions, self->_auxiliaryOptionsSummaryText, self->_auxiliaryOptionActions, self->_tintColor, self->_textColor, self->_materialRecipe, v6);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationListSupplementaryViewConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListSupplementaryViewConfiguration groupingIdentifier](self, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("groupingIdentifier"));

  -[NCNotificationListSupplementaryViewConfiguration groupName](self, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("groupName"));

  -[NCNotificationListSupplementaryViewConfiguration defaultAction](self, "defaultAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("defaultAction"));

  -[NCNotificationListSupplementaryViewConfiguration supplementaryActions](self, "supplementaryActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("supplementaryActions"));

  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionsSummaryText](self, "auxiliaryOptionsSummaryText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("auxiliaryOptionsSummaryText"));

  -[NCNotificationListSupplementaryViewConfiguration auxiliaryOptionActions](self, "auxiliaryOptionActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("auxiliaryOptionActions"));

  -[NCNotificationListSupplementaryViewConfiguration tintColor](self, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("tintColor"));

  -[NCNotificationListSupplementaryViewConfiguration textColor](self, "textColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:", v17, CFSTR("textColor"));

  -[NCNotificationListSupplementaryViewConfiguration materialRecipe](self, "materialRecipe");
  MTStringFromMaterialRecipe();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:", v19, CFSTR("materialRecipe"));

  v21 = (id)objc_msgSend(v4, "appendBool:withName:", -[NCNotificationListSupplementaryViewConfiguration containsUnmanagedContent](self, "containsUnmanagedContent"), CFSTR("unmanagedContent"));
  v22 = (id)objc_msgSend(v4, "appendBool:withName:", -[NCNotificationListSupplementaryViewConfiguration preventsUserDismissal](self, "preventsUserDismissal"), CFSTR("preventsUserDismissal"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationListSupplementaryViewConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[NCNotificationListSupplementaryViewConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8D21F60);
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (NSArray)supplementaryActions
{
  return self->_supplementaryActions;
}

- (NSString)auxiliaryOptionsSummaryText
{
  return self->_auxiliaryOptionsSummaryText;
}

- (NSArray)auxiliaryOptionActions
{
  return self->_auxiliaryOptionActions;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (BOOL)containsUnmanagedContent
{
  return self->_containsUnmanagedContent;
}

- (BOOL)preventsUserDismissal
{
  return self->_preventsUserDismissal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, 0);
  objc_storeStrong((id *)&self->_supplementaryActions, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

@end
