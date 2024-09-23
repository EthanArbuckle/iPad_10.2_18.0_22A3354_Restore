@implementation MTAClockSearchCell

- (id)_contentString
{
  return self->_contentString;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (void)setContentString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentString, 0);
}

@end
