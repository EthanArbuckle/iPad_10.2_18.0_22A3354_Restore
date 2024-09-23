@implementation PXFilterItemTagContext

- (PHKeyword)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
  objc_storeStrong((id *)&self->_keyword, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyword, 0);
}

@end
