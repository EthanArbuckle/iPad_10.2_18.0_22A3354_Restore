@implementation FRHTMLStrippingXMLDelegate

- (FRHTMLStrippingXMLDelegate)init
{
  FRHTMLStrippingXMLDelegate *v2;
  NSMutableArray *v3;
  NSMutableArray *strings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FRHTMLStrippingXMLDelegate;
  v2 = -[FRHTMLStrippingXMLDelegate init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    strings = v2->_strings;
    v2->_strings = v3;

  }
  return v2;
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRHTMLStrippingXMLDelegate strings](self, "strings"));
  objc_msgSend(v6, "addObject:", v5);

}

- (NSString)strippedString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRHTMLStrippingXMLDelegate strings](self, "strings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsJoinedByString:", &stru_1000191B8));

  return (NSString *)v3;
}

- (NSMutableArray)strings
{
  return self->_strings;
}

- (void)setStrings:(id)a3
{
  objc_storeStrong((id *)&self->_strings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strings, 0);
}

@end
