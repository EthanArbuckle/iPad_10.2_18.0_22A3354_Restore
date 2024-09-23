@implementation TransitDirectionsExpandStopsCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(TransitDirectionsExpandStopsStepView);
}

- (void)setExpandableCellDelegate:(id)a3
{
  TransitDirectionsExpandableCellDelegate **p_expandableCellDelegate;
  id v5;

  p_expandableCellDelegate = &self->_expandableCellDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_expandableCellDelegate, v5);
  -[TransitDirectionsStepView setExpandableCellDelegate:](self->super.super._stepView, "setExpandableCellDelegate:", v5);

}

- (void)updateExpandCollapseStyling
{
  -[TransitDirectionsStepView updateExpandCollapseStyling](self->super.super._stepView, "updateExpandCollapseStyling");
}

- (TransitDirectionsExpandableCellDelegate)expandableCellDelegate
{
  return (TransitDirectionsExpandableCellDelegate *)objc_loadWeakRetained((id *)&self->_expandableCellDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expandableCellDelegate);
}

@end
