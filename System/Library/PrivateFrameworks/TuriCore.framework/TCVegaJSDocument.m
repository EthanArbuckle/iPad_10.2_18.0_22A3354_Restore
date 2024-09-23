@implementation TCVegaJSDocument

- (TCVegaJSDocument)initWithCanvas:(id)a3
{
  id v4;
  TCVegaJSDocument *v5;
  TCVegaHTMLElement *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TCVegaJSDocument;
  v5 = -[TCVegaJSDocument init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(TCVegaHTMLElement);
    -[TCVegaJSDocument setBody:](v5, "setBody:", v6);

    -[TCVegaJSDocument setCanvas:](v5, "setCanvas:", v4);
  }

  return v5;
}

- (id)createElementWithString:(id)a3
{
  id v4;
  TCVegaHTMLElement *v5;
  TCVegaHTMLElement *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("canvas")))
  {
    -[TCVegaJSDocument canvas](self, "canvas");
    v5 = (TCVegaHTMLElement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[TCVegaHTMLElement initWithTagName:]([TCVegaHTMLElement alloc], "initWithTagName:", v4);
  }
  v6 = v5;

  return v6;
}

- (TCVegaHTMLElement)body
{
  return self->body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->body, a3);
}

- (TCVegaCGCanvas)canvas
{
  return (TCVegaCGCanvas *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCanvas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->canvas, 0);
  objc_storeStrong((id *)&self->body, 0);
}

@end
