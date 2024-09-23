@implementation SKTaskRawParser

- (SKTaskRawParser)initWithCallback:(id)a3
{
  id v4;
  SKTaskRawParser *v5;
  SKTaskRawParser *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskRawParser;
  v5 = -[SKTaskRawParser init](&v8, "init");
  v6 = v5;
  if (v5)
    -[SKTaskRawParser setCallback:](v5, "setCallback:", v4);

  return v6;
}

- (void)parseData:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(-[SKTaskRawParser callback](self, "callback"));
  v5[2](v5, v4);

}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
