@implementation UICreatePDFActivityItem

- (NSURL)previewItemURL
{
  return self->_previewItemURL;
}

- (void)setPreviewItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemURL, a3);
}

- (NSString)previewItemTitle
{
  return self->_previewItemTitle;
}

- (void)setPreviewItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_previewItemURL, 0);
}

@end
