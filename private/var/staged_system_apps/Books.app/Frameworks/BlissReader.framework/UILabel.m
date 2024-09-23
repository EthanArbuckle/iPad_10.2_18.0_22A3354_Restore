@implementation UILabel

- (void)applyParagraphStyle:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  const void *FontForStyle;

  if (a3)
  {
    if (objc_msgSend(a3, "definesProperty:", 86))
    {
      v5 = objc_msgSend(a3, "intValueForProperty:", 86);
      if (v5 == 1)
        v6 = 2;
      else
        v6 = v5 == 2;
      -[UILabel setTextAlignment:](self, "setTextAlignment:", v6);
    }
    -[UILabel setTextColor:](self, "setTextColor:", objc_msgSend(objc_msgSend(a3, "valueForProperty:", 18), "UIColor"));
    FontForStyle = (const void *)TSWPFastCreateFontForStyle(0, a3, 100);
    -[UILabel setFont:](self, "setFont:", TSWPUIFontForCTFont());
    CFRelease(FontForStyle);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UILabel(THAdditions) applyParagraphStyle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/UILabel-THAdditions.m"), 20, CFSTR("invalid nil value for '%s'"), "paragraphStyle");
  }
}

@end
