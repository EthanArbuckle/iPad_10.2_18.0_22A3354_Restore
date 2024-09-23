@implementation TransitDirectionsIncidentCollectionViewCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(TransitDirectionsIncidentStepView, a2);
}

- (void)setDelegate:(id)a3
{
  TransitDirectionsIncidentCellDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCollectionViewCell stepView](self, "stepView"));
  objc_msgSend(v6, "setDelegate:", v5);

}

- (TransitDirectionsIncidentCellDelegate)delegate
{
  return (TransitDirectionsIncidentCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
