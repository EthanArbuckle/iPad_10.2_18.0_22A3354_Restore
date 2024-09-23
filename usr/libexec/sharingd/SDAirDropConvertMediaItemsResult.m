@implementation SDAirDropConvertMediaItemsResult

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSNumber)conversionNeeded
{
  return self->_conversionNeeded;
}

- (void)setConversionNeeded:(id)a3
{
  objc_storeStrong((id *)&self->_conversionNeeded, a3);
}

- (PHMediaFormatConversionDestination)conversionDestination
{
  return self->_conversionDestination;
}

- (void)setConversionDestination:(id)a3
{
  objc_storeStrong((id *)&self->_conversionDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionDestination, 0);
  objc_storeStrong((id *)&self->_conversionNeeded, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
