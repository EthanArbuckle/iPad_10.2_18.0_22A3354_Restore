@implementation FRArticleContentPoolEntry

- (FCArticleContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (FRFlintDataProvider)flintDataProvider
{
  return self->_flintDataProvider;
}

- (void)setFlintDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flintDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flintDataProvider, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
