@implementation RCTextLayer

- (RCTextLayer)init
{
  RCTextLayer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCTextLayer;
  v2 = -[RCTextLayer init](&v4, "init");
  if (v2)
    -[RCTextLayer setContentsScale:](v2, "setContentsScale:", UIMainScreenScale());
  return v2;
}

- (id)_attributes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCTextLayer textColor](self, "textColor"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, NSForegroundColorAttributeName);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCTextLayer font](self, "font"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, NSFontAttributeName);

  return v3;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[RCTextLayer frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[RCTextLayer _displaySize](self, "_displaySize");
  -[RCTextLayer setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (CGSize)_displaySize
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCTextLayer _attributes](self, "_attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCTextLayer text](self, "text"));
  v5 = (unint64_t)objc_msgSend(v4, "hash");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v5 ^= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10), "hash");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  if (v5 != self->_cachedSizeHash)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCTextLayer text](self, "text"));
    objc_msgSend(v11, "sizeWithAttributes:", v3);
    self->_cachedSize.width = v12;
    self->_cachedSize.height = v13;

    self->_cachedSizeHash = v5;
  }
  width = self->_cachedSize.width;
  height = self->_cachedSize.height;

  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGRect)textRectWithAlignment:(int64_t)a3 inLayoutBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[RCTextLayer _displaySize](self, "_displaySize");
  v10 = v9;
  if (a3 == 1)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    x = x + (CGRectGetWidth(v18) - v10) * 0.5;
  }
  else if (a3 == 2)
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    x = CGRectGetMaxX(v17) - v10;
  }
  v11 = x;
  v12 = rintf(v11);
  v13 = y;
  v14 = rintf(v13);
  v15 = v10;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (void)setText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[RCTextLayer setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCTextLayer;
  -[RCTextLayer setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[RCTextLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawInContext:(CGContext *)a3
{
  NSString *text;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  UIGraphicsPushContext(a3);
  text = self->_text;
  v5 = -[RCTextLayer textAlignment](self, "textAlignment");
  -[RCTextLayer bounds](self, "bounds");
  -[RCTextLayer textRectWithAlignment:inLayoutBounds:](self, "textRectWithAlignment:inLayoutBounds:", v5);
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCTextLayer _attributes](self, "_attributes"));
  -[NSString drawAtPoint:withAttributes:](text, "drawAtPoint:withAttributes:", v10, v7, v9);

  UIGraphicsPopContext();
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (int64_t)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(int64_t)a3
{
  self->_preferredAlignment = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
