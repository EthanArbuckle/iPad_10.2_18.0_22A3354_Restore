@implementation UIObject

- (id)init:(int64_t)a3 confidence:(double)a4 text:(id)a5 boundingBox:(id)a6 children:(id)a7 clickable:(BOOL)a8 focused:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  UIObjectCompat *v19;
  UIObject *v20;

  v9 = a9;
  v10 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = -[UIObjectCompat initWithLabel:confidence:text:boundingBox:children:clickable:focused:]([UIObjectCompat alloc], "initWithLabel:confidence:text:boundingBox:children:clickable:focused:", a3, v18, v17, v16, v10, v9, a4);

  v20 = -[UIObject initWithCompat:](self, "initWithCompat:", v19);
  return v20;
}

- (UIObject)initWithCompat:(id)a3
{
  UIObjectCompat *v4;
  UIObject *v5;
  UIObjectCompat *underlyingObject;
  objc_super v8;

  v4 = (UIObjectCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIObject;
  v5 = -[UIObject init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (NSUUID)uuid
{
  void *v2;
  void *v3;

  -[UIObject underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (CGRect)boundingBox
{
  void *v2;
  void *v3;
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
  double v15;
  CGRect result;

  -[UIObject underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingBox");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSString)elementDetectionLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[UIObject underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)elementDetectionText
{
  void *v2;
  void *v3;
  void *v4;

  -[UIObject underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (float)elementDetectionConfidence
{
  void *v2;
  void *v3;
  double v4;
  float v5;

  -[UIObject underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v5 = v4;

  return v5;
}

- (NSString)iconDetectionLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIObject underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIObject underlyingObject](self, "underlyingObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconDetection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "labelString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (float)iconDetectionConfidence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  float v8;

  -[UIObject underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  -[UIObject underlyingObject](self, "underlyingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confidence");
  v8 = v7;

  return v8;
}

- (BOOL)clickabilityDetection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[UIObject underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clickDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[UIObject underlyingObject](self, "underlyingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clickDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clickable");

  return v7;
}

- (float)clickabilityConfidence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  float v8;

  -[UIObject underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clickDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  -[UIObject underlyingObject](self, "underlyingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clickDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confidence");
  v8 = v7;

  return v8;
}

- (BOOL)focusDetection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[UIObject underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[UIObject underlyingObject](self, "underlyingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "focused");

  return v7;
}

- (float)focusConfidence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  float v8;

  -[UIObject underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  -[UIObject underlyingObject](self, "underlyingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confidence");
  v8 = v7;

  return v8;
}

- (NSArray)children
{
  return self->_children;
}

- (UIObjectCompat)underlyingObject
{
  return (UIObjectCompat *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
