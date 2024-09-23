@implementation TVHighlightGroup

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSArray)highlights
{
  return self->_highlights;
}

- (void)setHighlights:(id)a3
{
  objc_storeStrong((id *)&self->_highlights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
