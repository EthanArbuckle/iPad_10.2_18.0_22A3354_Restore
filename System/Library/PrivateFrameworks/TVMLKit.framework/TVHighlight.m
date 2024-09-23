@implementation TVHighlight

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSString)highlightDescription
{
  return self->_highlightDescription;
}

- (void)setHighlightDescription:(id)a3
{
  objc_storeStrong((id *)&self->_highlightDescription, a3);
}

- (TVTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (TVTimeRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_highlightDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
