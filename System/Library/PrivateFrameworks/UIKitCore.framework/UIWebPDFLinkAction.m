@implementation UIWebPDFLinkAction

- (void)dealloc
{
  objc_super v3;

  -[UIWebPDFLinkAction setTitle:](self, "setTitle:", 0);
  -[UIWebPDFLinkAction setHandler:](self, "setHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFLinkAction;
  -[UIWebPDFLinkAction dealloc](&v3, sel_dealloc);
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)type
{
  return self->type;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
