@implementation CRLAXZorderButton

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v3 = objc_alloc((Class)UIAccessibilityCustomAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAXZorderButton actionTitle](self, "actionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAXZorderButton target](self, "target"));
  v6 = objc_msgSend(v3, "initWithName:target:selector:", v4, v5, -[CRLAXZorderButton action](self, "action"));

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v7;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTitle, 0);
}

@end
