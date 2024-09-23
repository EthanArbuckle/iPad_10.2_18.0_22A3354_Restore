@implementation _WGBrokenWidgetView

- (_WGBrokenWidgetView)init
{
  void *v3;
  void *v4;
  _WGBrokenWidgetView *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BROKEN_WIDGET_EXPLANATION"), &stru_24D733868, CFSTR("Widgets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_WGBrokenWidgetView;
  v5 = -[WGExplanatoryView initWithGlyph:andExplanation:](&v7, sel_initWithGlyph_andExplanation_, 0, v4);

  return v5;
}

@end
