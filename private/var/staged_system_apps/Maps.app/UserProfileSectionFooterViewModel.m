@implementation UserProfileSectionFooterViewModel

- (UserProfileSectionFooterViewModel)initWithContentString:(id)a3
{
  id v5;
  UserProfileSectionFooterViewModel *v6;
  UserProfileSectionFooterViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UserProfileSectionFooterViewModel;
  v6 = -[UserProfileSectionFooterViewModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentString, a3);

  return v7;
}

- (NSAttributedString)contentString
{
  return self->_contentString;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (BOOL)containsLink
{
  return self->_containsLink;
}

- (void)setContainsLink:(BOOL)a3
{
  self->_containsLink = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

@end
