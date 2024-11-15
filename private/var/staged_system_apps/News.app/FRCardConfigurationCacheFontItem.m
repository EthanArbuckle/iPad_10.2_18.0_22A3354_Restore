@implementation FRCardConfigurationCacheFontItem

- (UIFont)topicFont
{
  return self->_topicFont;
}

- (void)setTopicFont:(id)a3
{
  objc_storeStrong((id *)&self->_topicFont, a3);
}

- (UIFont)channelFont
{
  return self->_channelFont;
}

- (void)setChannelFont:(id)a3
{
  objc_storeStrong((id *)&self->_channelFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelFont, 0);
  objc_storeStrong((id *)&self->_topicFont, 0);
}

@end
