@implementation REHTMLDataElement

- (REHTMLDataElement)initWithData:(id)a3
{
  id v5;
  REHTMLDataElement *v6;
  REHTMLDataElement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REHTMLDataElement;
  v6 = -[REHTMLElement init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (id)_encodedData
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
