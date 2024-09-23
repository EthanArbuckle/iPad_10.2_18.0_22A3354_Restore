@implementation PKIdentityDocumentDataElement

- (PKIdentityDocumentDataElement)initWithLocalizedLabel:(id)a3 text:(id)a4
{
  id v7;
  id v8;
  PKIdentityDocumentDataElement *v9;
  PKIdentityDocumentDataElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKIdentityDocumentDataElement;
  v9 = -[PKIdentityDocumentDataElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_storeStrong((id *)&v9->_localizedLabel, a3);
    objc_storeStrong((id *)&v10->_text, a4);
  }

  return v10;
}

- (PKIdentityDocumentDataElement)initWithLocalizedLabel:(id)a3 attributedText:(id)a4
{
  id v7;
  id v8;
  PKIdentityDocumentDataElement *v9;
  PKIdentityDocumentDataElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKIdentityDocumentDataElement;
  v9 = -[PKIdentityDocumentDataElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_storeStrong((id *)&v9->_localizedLabel, a3);
    objc_storeStrong((id *)&v10->_attributedText, a4);
  }

  return v10;
}

- (PKIdentityDocumentDataElement)initWithImage:(id)a3
{
  id v5;
  PKIdentityDocumentDataElement *v6;
  PKIdentityDocumentDataElement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityDocumentDataElement;
  v6 = -[PKIdentityDocumentDataElement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
}

@end
