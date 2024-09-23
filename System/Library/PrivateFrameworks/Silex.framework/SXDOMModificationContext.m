@implementation SXDOMModificationContext

- (SXDOMModificationContext)initWithLayoutOptions:(id)a3 specVersion:(id)a4
{
  id v7;
  id v8;
  SXDOMModificationContext *v9;
  SXDOMModificationContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDOMModificationContext;
  v9 = -[SXDOMModificationContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutOptions, a3);
    objc_storeStrong((id *)&v10->_specVersion, a4);
  }

  return v10;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specVersion, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
