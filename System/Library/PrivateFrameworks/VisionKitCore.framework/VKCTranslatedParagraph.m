@implementation VKCTranslatedParagraph

- (VKCTranslatedParagraph)initWithText:(id)a3 quad:(id)a4 isPassthrough:(BOOL)a5
{
  id v9;
  id v10;
  VKCTranslatedParagraph *v11;
  VKCTranslatedParagraph *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKCTranslatedParagraph;
  v11 = -[VKCTranslatedParagraph init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    objc_storeStrong((id *)&v12->_quad, a4);
    v12->_isPassthrough = a5;
  }

  return v12;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isPassthrough
{
  return self->_isPassthrough;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_quad, 0);
}

@end
