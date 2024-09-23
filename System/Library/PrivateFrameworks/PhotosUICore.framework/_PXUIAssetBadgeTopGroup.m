@implementation _PXUIAssetBadgeTopGroup

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (PXUIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (PXAssetBadgeInfo)badgeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].badges;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[1].count;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->count;
  *(_OWORD *)&self->_badgeInfo.badges = *(_OWORD *)&a3->badges;
  *(_OWORD *)&self->_badgeInfo.count = v3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)imageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageFrame.origin.x;
  y = self->_imageFrame.origin.y;
  width = self->_imageFrame.size.width;
  height = self->_imageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageFrame:(CGRect)a3
{
  self->_imageFrame = a3;
}

- (CGRect)chevronImageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_chevronImageFrame.origin.x;
  y = self->_chevronImageFrame.origin.y;
  width = self->_chevronImageFrame.size.width;
  height = self->_chevronImageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setChevronImageFrame:(CGRect)a3
{
  self->_chevronImageFrame = a3;
}

- (CGRect)labelFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_labelFrame.origin.x;
  y = self->_labelFrame.origin.y;
  width = self->_labelFrame.size.width;
  height = self->_labelFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLabelFrame:(CGRect)a3
{
  self->_labelFrame = a3;
}

- (CGRect)buttonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_buttonFrame.origin.x;
  y = self->_buttonFrame.origin.y;
  width = self->_buttonFrame.size.width;
  height = self->_buttonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setButtonFrame:(CGRect)a3
{
  self->_buttonFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
