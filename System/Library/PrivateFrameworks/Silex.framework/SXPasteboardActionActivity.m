@implementation SXPasteboardActionActivity

- (SXPasteboardActionActivity)initWithLabel:(id)a3 type:(unint64_t)a4 pasteboard:(id)a5 string:(id)a6
{
  id v11;
  id v12;
  id v13;
  SXPasteboardActionActivity *v14;
  SXPasteboardActionActivity *v15;
  uint64_t v16;
  NSString *string;
  SXPasteboardActionActivity *v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)SXPasteboardActionActivity;
    v14 = -[SXPasteboardActionActivity init](&v20, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_label, a3);
      v15->_type = a4;
      objc_storeStrong((id *)&v15->_pasteboard, a5);
      v16 = objc_msgSend(v13, "copy");
      string = v15->_string;
      v15->_string = (NSString *)v16;

    }
    self = v15;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (SXPasteboardActionActivity)initWithLabel:(id)a3 image:(id)a4 type:(unint64_t)a5 pasteboard:(id)a6 string:(id)a7
{
  id v13;
  SXPasteboardActionActivity *v14;
  SXPasteboardActionActivity *v15;

  v13 = a4;
  v14 = -[SXPasteboardActionActivity initWithLabel:type:pasteboard:string:](self, "initWithLabel:type:pasteboard:string:", a3, a5, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_image, a4);

  return v15;
}

- (void)invokeWithAction:(id)a3 invocationMethod:(unint64_t)a4
{
  void *v5;
  id v6;

  -[SXPasteboardActionActivity pasteboard](self, "pasteboard", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXPasteboardActionActivity string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v5);

}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIImage)image
{
  return self->_image;
}

- (UIPasteboard)pasteboard
{
  return self->_pasteboard;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_pasteboard, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
