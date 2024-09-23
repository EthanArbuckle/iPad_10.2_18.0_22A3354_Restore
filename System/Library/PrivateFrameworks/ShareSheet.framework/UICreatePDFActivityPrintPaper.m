@implementation UICreatePDFActivityPrintPaper

- (UICreatePDFActivityPrintPaper)initWithPaperSize:(CGSize)a3
{
  double height;
  double width;
  UICreatePDFActivityPrintPaper *v5;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)UICreatePDFActivityPrintPaper;
  v5 = -[UICreatePDFActivityPrintPaper init](&v7, sel_init);
  -[UICreatePDFActivityPrintPaper set_paperSize:](v5, "set_paperSize:", width, height);
  return v5;
}

- (CGRect)printableRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UICreatePDFActivityPrintPaper paperSize](self, "paperSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)_keywordForPDFMetadata
{
  return CFSTR("com.apple.MarkupPDF");
}

- (CGSize)_paperSize
{
  double width;
  double height;
  CGSize result;

  width = self->__paperSize.width;
  height = self->__paperSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_paperSize:(CGSize)a3
{
  self->__paperSize = a3;
}

@end
