@implementation RUIHTMLFooterElement

- (void)configureView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v7;
    -[RUIElement sourceURL](self, "sourceURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBaseURL:", v5);

    -[RUIHTMLFooterElement HTMLContent](self, "HTMLContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:attributes:", v6, 0);

  }
}

- (NSString)HTMLContent
{
  return self->_HTMLContent;
}

- (void)setHTMLContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HTMLContent, 0);
}

@end
