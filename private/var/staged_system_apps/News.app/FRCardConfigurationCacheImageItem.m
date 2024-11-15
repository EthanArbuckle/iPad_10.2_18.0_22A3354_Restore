@implementation FRCardConfigurationCacheImageItem

- (UIImage)channelPlaceholderImage
{
  return self->_channelPlaceholderImage;
}

- (void)setChannelPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_channelPlaceholderImage, a3);
}

- (UIImage)topicPlaceholderImage
{
  return self->_topicPlaceholderImage;
}

- (void)setTopicPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_topicPlaceholderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_channelPlaceholderImage, 0);
}

@end
