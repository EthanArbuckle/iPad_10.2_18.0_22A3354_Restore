@implementation CACEditingModeOverlayElement

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGRect v29;
  CGRect v30;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
  {
    v6 = v4;
    v7 = -[CACEditingModeOverlayElement range](self, "range");
    v9 = v8;
    v11 = 0;
    if (v7 == objc_msgSend(v6, "range") && v9 == v10)
    {
      -[CACEditingModeOverlayElement label](self, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v13))
      {
        -[CACEditingModeOverlayElement representedText](self, "representedText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "representedText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v15))
        {
          -[CACEditingModeOverlayElement axFrame](self, "axFrame");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          objc_msgSend(v6, "axFrame");
          v30.origin.x = v24;
          v30.origin.y = v25;
          v30.size.width = v26;
          v30.size.height = v27;
          v29.origin.x = v17;
          v29.origin.y = v19;
          v29.size.width = v21;
          v29.size.height = v23;
          v11 = CGRectEqualToRect(v29, v30);
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)representedText
{
  return self->_representedText;
}

- (void)setRepresentedText:(id)a3
{
  objc_storeStrong((id *)&self->_representedText, a3);
}

- (CGRect)axFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_axFrame.origin.x;
  y = self->_axFrame.origin.y;
  width = self->_axFrame.size.width;
  height = self->_axFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAxFrame:(CGRect)a3
{
  self->_axFrame = a3;
}

- (CGRect)interfaceOrientedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_interfaceOrientedFrame.origin.x;
  y = self->_interfaceOrientedFrame.origin.y;
  width = self->_interfaceOrientedFrame.size.width;
  height = self->_interfaceOrientedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInterfaceOrientedFrame:(CGRect)a3
{
  self->_interfaceOrientedFrame = a3;
}

- (unint64_t)textUnit
{
  return self->_textUnit;
}

- (void)setTextUnit:(unint64_t)a3
{
  self->_textUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedText, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
