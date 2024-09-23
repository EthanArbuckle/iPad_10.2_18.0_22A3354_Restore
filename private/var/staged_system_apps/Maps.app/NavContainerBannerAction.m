@implementation NavContainerBannerAction

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavContainerBannerAction;
  v3 = -[NavContainerBannerAction description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerBannerAction title](self, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ title: %@ hidden: %d"), v4, v5, -[NavContainerBannerAction hidden](self, "hidden")));

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_opt_class(self);
  v5 = (void *)objc_opt_new(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerBannerAction title](self, "title"));
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v5, "setHidden:", -[NavContainerBannerAction hidden](self, "hidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavContainerBannerAction actionHandler](self, "actionHandler"));
  objc_msgSend(v5, "setActionHandler:", v7);

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
