@implementation TransitDirectionsCollectionViewCell

+ (Class)stepViewClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return (Class)objc_opt_class(TransitDirectionsStepView);
}

- (TransitDirectionsCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitDirectionsCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  TransitDirectionsStepView *stepView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsCollectionViewCell;
  v3 = -[TransitDirectionsCollectionViewCell initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitDirectionsCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[TransitDirectionsCollectionViewCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v7 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsCollectionViewCell contentView](v3, "contentView"));
    stepView = v3->_stepView;
    v3->_stepView = (TransitDirectionsStepView *)v7;

    -[TransitDirectionsStepView setCell:](v3->_stepView, "setCell:", v3);
    +[RoutingAppearanceManager configureBackgroundViewForStepCell:](RoutingAppearanceManager, "configureBackgroundViewForStepCell:", v3);
  }
  return v3;
}

- (TransitDirectionsListItem)transitListItem
{
  return -[TransitDirectionsStepView transitListItem](self->_stepView, "transitListItem");
}

- (void)configureWithItem:(id)a3
{
  -[TransitDirectionsStepView configureWithItem:](self->_stepView, "configureWithItem:", a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsCollectionViewCell;
  -[TransitDirectionsCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TransitDirectionsStepView prepareForReuse](self->_stepView, "prepareForReuse");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsCollectionViewCell;
  -[TransitDirectionsCollectionViewCell setHighlighted:](&v5, "setHighlighted:");
  -[TransitDirectionsStepView setHighlighted:](self->_stepView, "setHighlighted:", v3);
}

- (BOOL)useNavigationMetrics
{
  return -[TransitDirectionsStepView useNavigationMetrics](self->_stepView, "useNavigationMetrics");
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  -[TransitDirectionsStepView setUseNavigationMetrics:](self->_stepView, "setUseNavigationMetrics:", a3);
}

- (int64_t)navigationState
{
  return -[TransitDirectionsStepView navigationState](self->_stepView, "navigationState");
}

- (void)setNavigationState:(int64_t)a3
{
  -[TransitDirectionsStepView setNavigationState:](self->_stepView, "setNavigationState:", a3);
  -[TransitDirectionsCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (unint64_t)displayOptions
{
  return -[TransitDirectionsStepView displayOptions](self->_stepView, "displayOptions");
}

- (void)setDisplayOptions:(unint64_t)a3
{
  -[TransitDirectionsStepView setDisplayOptions:](self->_stepView, "setDisplayOptions:", a3);
}

- (double)leadingInstructionMargin
{
  double result;

  -[TransitDirectionsStepView leadingInstructionMargin](self->_stepView, "leadingInstructionMargin");
  return result;
}

- (void)setLeadingInstructionMargin:(double)a3
{
  -[TransitDirectionsStepView setLeadingInstructionMargin:](self->_stepView, "setLeadingInstructionMargin:", a3);
}

- (UIView)trailingView
{
  return -[TransitDirectionsStepView trailingView](self->_stepView, "trailingView");
}

- (void)setTrailingView:(id)a3
{
  -[TransitDirectionsStepView setTrailingView:](self->_stepView, "setTrailingView:", a3);
}

- (TransitDirectionsStepView)stepView
{
  return self->_stepView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepView, 0);
}

@end
