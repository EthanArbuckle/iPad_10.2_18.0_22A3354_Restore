@implementation UIInterfaceActionViewState

+ (id)_nullViewStateForActionType:(int64_t)a3
{
  void *v4;
  void *v5;

  +[UIInterfaceAction actionWithTitle:type:handler:](UIInterfaceAction, "actionWithTitle:type:handler:", &stru_1E16EDF20, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPropertiesFromActionRepresentationView:groupView:action:", 0, 0, v4);

  return v5;
}

+ (id)viewStateForActionRepresentationView:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_enclosingInterfaceActionGroupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPropertiesFromActionRepresentationView:groupView:action:", v7, v8, v6);

  return v9;
}

+ (id)viewStateForActionRepresentationViewDescendantView:(id)a3 action:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "_enclosingInterfaceActionRepresentationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "viewStateForActionRepresentationView:action:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)viewStateForAlertControllerActionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "_enclosingInterfaceActionRepresentationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_interfaceActionRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "viewStateForActionRepresentationView:action:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)viewStateRepresentingDefaultAction
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)viewStateRepresentingPreferredAction
{
  id result;

  result = (id)objc_msgSend(a1, "viewStateRepresentingDefaultAction");
  *((_BYTE *)result + 35) = 1;
  return result;
}

- (UIInterfaceActionViewState)initWithPropertiesFromActionRepresentationView:(id)a3 groupView:(id)a4 action:(id)a5
{
  id v8;
  id v9;
  UIInterfaceActionViewState *v10;
  UIInterfaceActionViewState *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)UIInterfaceActionViewState;
  v10 = -[UIInterfaceActionVisualStyleViewState initWithPropertiesFromTopLevelView:](&v13, sel_initWithPropertiesFromTopLevelView_, a4);
  v11 = v10;
  if (v10)
  {
    -[UIInterfaceActionViewState _collectStateForDefaultState](v10, "_collectStateForDefaultState");
    -[UIInterfaceActionViewState _collectStateFromActionRepresentationView:](v11, "_collectStateFromActionRepresentationView:", v8);
    -[UIInterfaceActionViewState _collectStateFromAction:](v11, "_collectStateFromAction:", v9);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionViewState;
  v4 = -[UIInterfaceActionVisualStyleViewState copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_collectStateFromActionViewState:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[UIInterfaceActionViewState _stateEqualToActionViewState:](self, "_stateEqualToActionViewState:", v4);

  return v5;
}

- (void)_collectStateForDefaultState
{
  UIInterfaceAction *v3;
  UIInterfaceAction *action;
  id actionViewStateContext;

  +[UIInterfaceAction actionWithTitle:type:handler:](UIInterfaceAction, "actionWithTitle:type:handler:", &stru_1E16EDF20, 0, 0);
  v3 = (UIInterfaceAction *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  self->_action = v3;

  self->_isHighlighted = 0;
  self->_isPressed = 0;
  self->_isFocused = 0;
  self->_isPreferred = 0;
  actionViewStateContext = self->_actionViewStateContext;
  self->_actionViewStateContext = 0;

}

- (void)_collectStateFromActionRepresentationView:(id)a3
{
  id v4;
  void *v5;
  id actionViewStateContext;
  unint64_t v7;

  v4 = a3;
  self->_isHighlighted = objc_msgSend(v4, "isHighlighted");
  self->_isPressed = objc_msgSend(v4, "isPressed");
  self->_isFocused = objc_msgSend(v4, "isFocused");
  objc_msgSend(v4, "actionViewStateContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  actionViewStateContext = self->_actionViewStateContext;
  self->_actionViewStateContext = v5;

  v7 = objc_msgSend(v4, "visualCornerPosition");
  self->_visualCornerPosition = v7;
}

- (void)_collectStateFromAction:(id)a3
{
  UIInterfaceAction **p_action;
  id v6;

  p_action = &self->_action;
  objc_storeStrong((id *)&self->_action, a3);
  v6 = a3;
  LOBYTE(p_action) = -[UIInterfaceAction _isPreferred](*p_action, "_isPreferred");

  self->_isPreferred = (char)p_action;
}

- (void)_collectStateFromActionViewState:(id)a3
{
  id v4;
  UIInterfaceAction *v5;
  UIInterfaceAction *action;
  void *v7;
  id actionViewStateContext;
  unint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "action");
  v5 = (UIInterfaceAction *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  self->_action = v5;

  self->_isHighlighted = objc_msgSend(v4, "isHighlighted");
  self->_isPressed = objc_msgSend(v4, "isPressed");
  self->_isFocused = objc_msgSend(v4, "isFocused");
  self->_isPreferred = objc_msgSend(v4, "isPreferred");
  objc_msgSend(v4, "actionViewStateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  actionViewStateContext = self->_actionViewStateContext;
  self->_actionViewStateContext = v7;

  v9 = objc_msgSend(v4, "visualCornerPosition");
  self->_visualCornerPosition = v9;
}

- (BOOL)_stateEqualToActionViewState:(id)a3
{
  id v4;
  UIInterfaceAction *action;
  void *v6;
  int isHighlighted;
  int isPressed;
  int isFocused;
  int isPreferred;
  uint64_t v11;
  id actionViewStateContext;
  id v13;
  id v14;
  BOOL v15;
  unint64_t visualCornerPosition;

  v4 = a3;
  action = self->_action;
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIInterfaceAction isEqual:](action, "isEqual:", v6))
  {
    isHighlighted = self->_isHighlighted;
    if (isHighlighted == objc_msgSend(v4, "isHighlighted"))
    {
      isPressed = self->_isPressed;
      if (isPressed == objc_msgSend(v4, "isPressed"))
      {
        isFocused = self->_isFocused;
        if (isFocused == objc_msgSend(v4, "isFocused"))
        {
          isPreferred = self->_isPreferred;
          if (isPreferred == objc_msgSend(v4, "isPreferred"))
          {
            v11 = 48;
            actionViewStateContext = self->_actionViewStateContext;
            objc_msgSend(v4, "actionViewStateContext");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            if (actionViewStateContext == v13
              || (v14 = self->_actionViewStateContext,
                  objc_msgSend(v4, "actionViewStateContext"),
                  v11 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v14, "isEqual:", v11)))
            {
              visualCornerPosition = self->_visualCornerPosition;
              v15 = visualCornerPosition == objc_msgSend(v4, "visualCornerPosition");
              if (actionViewStateContext == v13)
              {
LABEL_13:

                goto LABEL_10;
              }
            }
            else
            {
              v15 = 0;
            }

            goto LABEL_13;
          }
        }
      }
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (BOOL)isFocused
{
  return self->_isFocused;
}

- (BOOL)isPreferred
{
  return self->_isPreferred;
}

- (id)actionViewStateContext
{
  return self->_actionViewStateContext;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionViewStateContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
