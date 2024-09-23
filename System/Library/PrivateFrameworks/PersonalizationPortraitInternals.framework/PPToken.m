@implementation PPToken

- (PPToken)initWithText:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  PPToken *v9;
  PPToken *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPToken;
  v9 = -[PPToken init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
