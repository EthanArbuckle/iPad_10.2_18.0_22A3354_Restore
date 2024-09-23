@implementation PKAMSMediaRequestArtworkConfiguration

- (PKAMSMediaRequestArtworkConfiguration)initWithArtworkSize:(CGSize)a3 artworkCropType:(unint64_t)a4 animatedArtworkType:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  PKAMSMediaRequestArtworkConfiguration *result;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PKAMSMediaRequestArtworkConfiguration;
  result = -[PKAMSMediaRequestArtworkConfiguration init](&v10, sel_init);
  if (result)
  {
    result->_artworkSize.width = width;
    result->_artworkSize.height = height;
    result->_cropType = a4;
    result->_animatedArtworkType = a5;
  }
  return result;
}

- (CGSize)artworkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)cropType
{
  return self->_cropType;
}

- (unint64_t)animatedArtworkType
{
  return self->_animatedArtworkType;
}

@end
