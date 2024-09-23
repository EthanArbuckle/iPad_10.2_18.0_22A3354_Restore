@implementation PKISO180135GroupRepresentation

- (unint64_t)group
{
  return self->_group;
}

- (void)setGroup:(unint64_t)a3
{
  self->_group = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)analyticsTag
{
  return self->_analyticsTag;
}

- (void)setAnalyticsTag:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsTag, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
