@implementation BEAttachmentElement

- (BEAttachmentElement)initWithObjectWrapperElement:(id)a3
{
  id v4;
  void *v5;
  BEAttachmentElement *v6;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baxBookContentElement"));
  v8.receiver = self;
  v8.super_class = (Class)BEAttachmentElement;
  v6 = -[BEAttachmentElement initWithAccessibilityContainer:](&v8, "initWithAccessibilityContainer:", v5);

  if (v6)
    -[BEAttachmentElement setObjectWrapper:](v6, "setObjectWrapper:", v4);

  return v6;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAttachmentElement objectWrapper](self, "objectWrapper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
}

- (id)accessibilityAttributedLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAttachmentElement objectWrapper](self, "objectWrapper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityAttributedValue"));

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAttachmentElement objectWrapper](self, "objectWrapper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityValue"));

  return v3;
}

- (id)accessibilityAttributedValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAttachmentElement objectWrapper](self, "objectWrapper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityAttributedValue"));

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAttachmentElement objectWrapper](self, "objectWrapper"));
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return (unint64_t)v3;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAttachmentElement objectWrapper](self, "objectWrapper"));
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BAXObjectWrapper)objectWrapper
{
  return (BAXObjectWrapper *)objc_loadWeakRetained((id *)&self->_objectWrapper);
}

- (void)setObjectWrapper:(id)a3
{
  objc_storeWeak((id *)&self->_objectWrapper, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_objectWrapper);
}

@end
