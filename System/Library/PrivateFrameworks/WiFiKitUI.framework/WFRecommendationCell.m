@implementation WFRecommendationCell

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_descriptionLabel);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeWeak((id *)&self->_descriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
}

@end
