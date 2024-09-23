@implementation _UIDebugColorBoundsView

+ (id)_nextColor
{
  void *v2;
  unint64_t v3;

  if (qword_1ECD81E38 != -1)
    dispatch_once(&qword_1ECD81E38, &__block_literal_global_596);
  objc_msgSend((id)_MergedGlobals_1281, "objectAtIndex:", qword_1ECD81E30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ++qword_1ECD81E30;
  qword_1ECD81E30 = v3 % objc_msgSend((id)_MergedGlobals_1281, "count");
  return v2;
}

- (_UIDebugColorBoundsView)initWithView:(id)a3
{
  _UIDebugColorBoundsView *v4;
  _UIDebugColorBoundsView *v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v13;

  objc_msgSend(a3, "bounds");
  v13.receiver = self;
  v13.super_class = (Class)_UIDebugColorBoundsView;
  v4 = -[UIView initWithFrame:](&v13, sel_initWithFrame_);
  v5 = v4;
  if (v4)
  {
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    +[_UIDebugColorBoundsView _nextColor](_UIDebugColorBoundsView, "_nextColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[UIView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);

    -[UIView _currentScreenScale](v5, "_currentScreenScale");
    v10 = 1.0 / v9;
    -[UIView layer](v5, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", v10);

  }
  return v5;
}

@end
