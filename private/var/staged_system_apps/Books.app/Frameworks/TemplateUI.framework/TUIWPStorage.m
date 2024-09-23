@implementation TUIWPStorage

- (id)fontMetricsAtCharacterIndex:(unint64_t)a3
{
  TUIWPFontMetrics *v5;
  void *v6;
  void *v7;
  const __CTFont *FontForStyle;

  v5 = objc_opt_new(TUIWPFontMetrics);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", a3, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", -[TUIWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", a3), 0));
  FontForStyle = (const __CTFont *)TSWPFastCreateFontForStyle(v6, v7, 100);
  -[TUIWPFontMetrics setPointSize:](v5, "setPointSize:", CTFontGetSize(FontForStyle));
  -[TUIWPFontMetrics setCapHeight:](v5, "setCapHeight:", CTFontGetCapHeight(FontForStyle));
  -[TUIWPFontMetrics setAscent:](v5, "setAscent:", CTFontGetAscent(FontForStyle));
  -[TUIWPFontMetrics setDescent:](v5, "setDescent:", CTFontGetDescent(FontForStyle));
  CFRelease(FontForStyle);

  return v5;
}

@end
