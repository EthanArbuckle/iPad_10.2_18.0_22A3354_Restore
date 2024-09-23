@implementation MapsInterruptionAction

+ (id)actionWithTitle:(id)a3 cancels:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setTitle:", v9);

  objc_msgSend(v10, "setCancels:", v5);
  objc_msgSend(v10, "setHandler:", v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id v5;
  id v6;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class(self));
  objc_storeStrong(v4 + 2, self->_title);
  *((_BYTE *)v4 + 8) = self->_cancels;
  v5 = objc_retainBlock(self->_handler);
  v6 = v4[3];
  v4[3] = v5;

  return v4;
}

- (void)fire
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsInterruptionAction handler](self, "handler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MapsInterruptionAction handler](self, "handler"));
    -[MapsInterruptionAction setHandler:](self, "setHandler:", 0);
    v4[2]();

  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)cancels
{
  return self->_cancels;
}

- (void)setCancels:(BOOL)a3
{
  self->_cancels = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
