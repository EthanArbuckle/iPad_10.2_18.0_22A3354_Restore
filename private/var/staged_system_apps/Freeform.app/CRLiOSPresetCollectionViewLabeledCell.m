@implementation CRLiOSPresetCollectionViewLabeledCell

- (UIButton)presetButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_presetButton);
}

- (void)setPresetButton:(id)a3
{
  objc_storeWeak((id *)&self->_presetButton, a3);
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
}

- (NSLayoutConstraint)labelVerticalSpacingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_labelVerticalSpacingConstraint);
}

- (void)setLabelVerticalSpacingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_labelVerticalSpacingConstraint, a3);
}

- (NSLayoutConstraint)presetViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_presetViewLeadingConstraint);
}

- (void)setPresetViewLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_presetViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)presetViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_presetViewTrailingConstraint);
}

- (void)setPresetViewTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_presetViewTrailingConstraint, a3);
}

- (BOOL)labelHasDefaultLocalizedName
{
  return self->_labelHasDefaultLocalizedName;
}

- (void)setLabelHasDefaultLocalizedName:(BOOL)a3
{
  self->_labelHasDefaultLocalizedName = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presetViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_presetViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_labelVerticalSpacingConstraint);
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_label);
  objc_destroyWeak((id *)&self->_presetButton);
}

@end
