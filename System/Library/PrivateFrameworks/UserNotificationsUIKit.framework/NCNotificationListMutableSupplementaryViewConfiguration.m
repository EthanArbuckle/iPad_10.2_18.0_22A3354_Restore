@implementation NCNotificationListMutableSupplementaryViewConfiguration

- (void)setGroupingIdentifier:(id)a3
{
  NSString *v4;
  NSString *groupingIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupingIdentifier = self->super._groupingIdentifier;
  self->super._groupingIdentifier = v4;

}

- (void)setGroupName:(id)a3
{
  NSString *v4;
  NSString *groupName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupName = self->super._groupName;
  self->super._groupName = v4;

}

- (void)setDefaultAction:(id)a3
{
  UIAction *v4;
  UIAction *defaultAction;

  v4 = (UIAction *)objc_msgSend(a3, "copy");
  defaultAction = self->super._defaultAction;
  self->super._defaultAction = v4;

}

- (void)setSupplementaryActions:(id)a3
{
  NSArray *v4;
  NSArray *supplementaryActions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  supplementaryActions = self->super._supplementaryActions;
  self->super._supplementaryActions = v4;

}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  NSString *v4;
  NSString *auxiliaryOptionsSummaryText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  auxiliaryOptionsSummaryText = self->super._auxiliaryOptionsSummaryText;
  self->super._auxiliaryOptionsSummaryText = v4;

}

- (void)setAuxiliaryOptionActions:(id)a3
{
  NSArray *v4;
  NSArray *auxiliaryOptionActions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  auxiliaryOptionActions = self->super._auxiliaryOptionActions;
  self->super._auxiliaryOptionActions = v4;

}

- (void)setTintColor:(id)a3
{
  UIColor *v4;
  UIColor *tintColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  tintColor = self->super._tintColor;
  self->super._tintColor = v4;

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *textColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  textColor = self->super._textColor;
  self->super._textColor = v4;

}

- (void)setMaterialRecipe:(int64_t)a3
{
  self->super._materialRecipe = a3;
}

- (void)setContainsUnmanagedContent:(BOOL)a3
{
  self->super._containsUnmanagedContent = a3;
}

- (void)setPreventsUserDismissal:(BOOL)a3
{
  self->super._preventsUserDismissal = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NCNotificationListSupplementaryViewConfiguration *v4;
  uint64_t v6;

  v4 = +[NCNotificationListSupplementaryViewConfiguration allocWithZone:](NCNotificationListSupplementaryViewConfiguration, "allocWithZone:", a3);
  LOWORD(v6) = *(_WORD *)&self->super._containsUnmanagedContent;
  return -[NCNotificationListSupplementaryViewConfiguration _initWithGroupingIdentifier:groupName:defaultAction:supplementaryActions:auxiliaryOptionsSummaryText:auxiliaryOptionActions:tintColor:textColor:materialRecipe:containsUnmanagedContent:preventsUserDismissal:](v4, "_initWithGroupingIdentifier:groupName:defaultAction:supplementaryActions:auxiliaryOptionsSummaryText:auxiliaryOptionActions:tintColor:textColor:materialRecipe:containsUnmanagedContent:preventsUserDismissal:", self->super._groupingIdentifier, self->super._groupName, self->super._defaultAction, self->super._supplementaryActions, self->super._auxiliaryOptionsSummaryText, self->super._auxiliaryOptionActions, self->super._tintColor, self->super._textColor, self->super._materialRecipe, v6);
}

@end
