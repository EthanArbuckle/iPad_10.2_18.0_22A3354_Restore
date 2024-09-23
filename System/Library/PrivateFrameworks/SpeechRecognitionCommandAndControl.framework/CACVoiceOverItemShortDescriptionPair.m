@implementation CACVoiceOverItemShortDescriptionPair

- (CACVoiceOverDescribable)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (void)setShortDescription:(id)a3
{
  objc_storeStrong((id *)&self->_shortDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
