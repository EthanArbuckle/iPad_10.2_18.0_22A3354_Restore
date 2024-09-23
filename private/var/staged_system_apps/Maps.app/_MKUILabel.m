@implementation _MKUILabel

+ (id)multiLineLabelWithFont:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)_MKUILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setFont:", v3);

  return v4;
}

- (double)_maps_lineSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel attributedText](self, "attributedText"));
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attribute:atIndex:effectiveRange:", NSParagraphStyleAttributeName, 0, 0));
    objc_msgSend(v3, "lineSpacing");
    v5 = v4;

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)_maps_setLineSpacing:(double)a3
{
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[_MKUILabel attributedText](self, "attributedText"));
  if (objc_msgSend(v12, "length"))
  {
    -[_MKUILabel _maps_lineSpacing](self, "_maps_lineSpacing");
    if (v5 != a3)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v12);
      v7 = objc_msgSend(v6, "length");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribute:atIndex:effectiveRange:", NSParagraphStyleAttributeName, 0, 0));
      v9 = v8;
      if (v8)
      {
        v10 = objc_msgSend(v8, "mutableCopy");
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
        v10 = objc_msgSend(v11, "mutableCopy");

      }
      objc_msgSend(v10, "setLineSpacing:", a3);
      objc_msgSend(v6, "addAttribute:value:range:", NSParagraphStyleAttributeName, v10, 0, v7);
      -[_MKUILabel setAttributedText:](self, "setAttributedText:", v6);

    }
  }

}

@end
