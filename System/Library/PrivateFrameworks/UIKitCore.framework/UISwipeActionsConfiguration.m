@implementation UISwipeActionsConfiguration

+ (UISwipeActionsConfiguration)configurationWithActions:(NSArray *)actions
{
  NSArray *v4;
  _QWORD *v5;
  void *v6;

  v4 = actions;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return (UISwipeActionsConfiguration *)v5;
}

- (UISwipeActionsConfiguration)init
{
  UISwipeActionsConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISwipeActionsConfiguration;
  v2 = -[UISwipeActionsConfiguration init](&v4, sel_init);
  -[UISwipeActionsConfiguration _setAutosizesButtons:](v2, "_setAutosizesButtons:", 1);
  -[UISwipeActionsConfiguration setPerformsFirstActionWithFullSwipe:](v2, "setPerformsFirstActionWithFullSwipe:", 1);
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_actions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector(sel_performsFirstActionWithFullSwipe);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)performsFirstActionWithFullSwipe
{
  return self->_performsFirstActionWithFullSwipe;
}

- (void)setPerformsFirstActionWithFullSwipe:(BOOL)performsFirstActionWithFullSwipe
{
  self->_performsFirstActionWithFullSwipe = performsFirstActionWithFullSwipe;
}

- (BOOL)_autosizesButtons
{
  return self->_autosizesButtons;
}

- (void)_setAutosizesButtons:(BOOL)a3
{
  self->_autosizesButtons = a3;
}

- (int64_t)_swipeActionsStyle
{
  return self->__swipeActionsStyle;
}

- (void)_setSwipeActionsStyle:(int64_t)a3
{
  self->__swipeActionsStyle = a3;
}

- (double)_roundedStyleCornerRadius
{
  return self->__roundedStyleCornerRadius;
}

- (void)_setRoundedStyleCornerRadius:(double)a3
{
  self->__roundedStyleCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
