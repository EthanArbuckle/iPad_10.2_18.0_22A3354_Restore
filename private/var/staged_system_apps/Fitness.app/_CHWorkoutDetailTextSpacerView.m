@implementation _CHWorkoutDetailTextSpacerView

- (_CHWorkoutDetailTextSpacerView)initWithFrame:(CGRect)a3
{
  _CHWorkoutDetailTextSpacerView *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CHWorkoutDetailTextSpacerView;
  v3 = -[_CHWorkoutDetailTextSpacerView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[_CHWorkoutDetailTextSpacerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[_CHWorkoutDetailTextSpacerView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[_CHWorkoutDetailTextSpacerView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v5);
    LODWORD(v6) = 1148846080;
    -[_CHWorkoutDetailTextSpacerView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
