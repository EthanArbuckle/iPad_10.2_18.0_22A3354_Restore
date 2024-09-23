@implementation _WGLockedOutWidgetView

- (_WGLockedOutWidgetView)initWithExplanation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _WGLockedOutWidgetView *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x24BDF6AC8];
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("TimerWidgetGlyph"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)_WGLockedOutWidgetView;
  v9 = -[WGExplanatoryView initWithGlyph:andExplanation:](&v11, sel_initWithGlyph_andExplanation_, v8, v6);

  return v9;
}

@end
