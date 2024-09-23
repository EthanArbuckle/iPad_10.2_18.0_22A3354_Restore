@implementation _UICalloutBarSystemButtonDescription

- (_UICalloutBarSystemButtonDescription)initWithTitle:(id)a3 orImage:(id)a4 action:(SEL)a5 type:(int)a6
{
  id v11;
  id v12;
  _UICalloutBarSystemButtonDescription *v13;
  _UICalloutBarSystemButtonDescription *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UICalloutBarSystemButtonDescription;
  v13 = -[_UICalloutBarSystemButtonDescription init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->m_title, a3);
    objc_storeStrong((id *)&v14->m_image, a4);
    v14->m_action = a5;
    v14->m_type = a6;
  }

  return v14;
}

+ (id)buttonDescriptionWithTitle:(id)a3 action:(SEL)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:orImage:action:type:", v8, 0, a4, v5);

  return v9;
}

+ (id)buttonDescriptionWithImage:(id)a3 action:(SEL)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:orImage:action:type:", 0, v8, a4, v5);

  return v9;
}

+ (id)buttonDescriptionWithTitle:(id)a3 image:(id)a4 action:(SEL)a5 type:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:orImage:action:type:", v11, v10, a5, v6);

  return v12;
}

- (id)materializeButtonInView:(id)a3 visualStyle:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  if (self->m_image)
  {
    if (self->m_title)
      +[UICalloutBarButton buttonWithTitle:image:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:image:action:type:inView:visualStyle:");
    else
      +[UICalloutBarButton buttonWithImage:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithImage:action:type:inView:visualStyle:", self->m_image, self->m_action, self->m_type, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UICalloutBarButton buttonWithTitle:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:action:type:inView:visualStyle:", self->m_title, self->m_action, self->m_type, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  -[_UICalloutBarSystemButtonDescription configurationBlock](self, "configurationBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UICalloutBarSystemButtonDescription configurationBlock](self, "configurationBlock");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v9);

  }
  return v9;
}

- (SEL)action
{
  return self->m_action;
}

- (NSString)title
{
  return self->m_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->m_title, a3);
}

- (id)configurationBlock
{
  return self->m_configurationBlock;
}

- (void)setConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->m_configurationBlock, 0);
  objc_storeStrong((id *)&self->m_image, 0);
  objc_storeStrong((id *)&self->m_title, 0);
}

@end
