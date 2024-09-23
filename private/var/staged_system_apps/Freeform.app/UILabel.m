@implementation UILabel

+ (void)crlaxTurnOnButtonShapeUnderlines:(id)a3
{
  _objc_msgSend(a3, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
}

- (void)crl_setTextAllowingHyphenation:(id)a3
{
  id v4;
  id v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  NSAttributedStringKey v10;
  id v11;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    LODWORD(v6) = 1036831949;
    objc_msgSend(v5, "setHyphenationFactor:", v6);
    objc_msgSend(v5, "setAlignment:", -[UILabel textAlignment](self, "textAlignment"));
    objc_msgSend(v5, "setAllowsDefaultTighteningForTruncation:", -[UILabel allowsDefaultTighteningForTruncation](self, "allowsDefaultTighteningForTruncation"));
    objc_msgSend(v5, "setLineBreakMode:", -[UILabel lineBreakMode](self, "lineBreakMode"));
    v7 = objc_alloc((Class)NSAttributedString);
    v10 = NSParagraphStyleAttributeName;
    v11 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = objc_msgSend(v7, "initWithString:attributes:", v4, v8);

  }
  else
  {
    v9 = 0;
  }
  -[UILabel setAttributedText:](self, "setAttributedText:", v9);

}

@end
