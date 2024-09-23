@implementation SSHarvestedApplicationDocument

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSHarvestedApplicationDocument)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSHarvestedApplicationDocument *v5;
  uint64_t v6;
  NSData *PDFData;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;

  v4 = a3;
  v5 = -[SSHarvestedApplicationDocument init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSSHarvestedApplicationMetadataPDFDataKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  PDFData = v5->_PDFData;
  v5->_PDFData = (NSData *)v6;

  v5->_PDFPage = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kSSHarvestedApplicationMetadataPDFPageKey"));
  objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("kSSHarvestedApplicationMetadataPDFVisibleRectKey"));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v5->_PDFVisibleRect.origin.x = v9;
  v5->_PDFVisibleRect.origin.y = v11;
  v5->_PDFVisibleRect.size.width = v13;
  v5->_PDFVisibleRect.size.height = v15;
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SSHarvestedApplicationDocument PDFData](self, "PDFData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kSSHarvestedApplicationMetadataPDFDataKey"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[SSHarvestedApplicationDocument PDFPage](self, "PDFPage"), CFSTR("kSSHarvestedApplicationMetadataPDFPageKey"));
  -[SSHarvestedApplicationDocument PDFVisibleRect](self, "PDFVisibleRect");
  objc_msgSend(v5, "encodeCGRect:forKey:", CFSTR("kSSHarvestedApplicationMetadataPDFVisibleRectKey"));

}

- (NSString)loggableDescription
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  CGRect v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SSHarvestedApplicationDocument PDFData](self, "PDFData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSHarvestedApplicationDocument PDFPage](self, "PDFPage");
  -[SSHarvestedApplicationDocument PDFVisibleRect](self, "PDFVisibleRect");
  NSStringFromCGRect(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" has pdfData: %d, page:%d, visibleRect:%@"), v5 != 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  return (NSString *)v3;
}

- (NSData)PDFData
{
  return self->_PDFData;
}

- (void)setPDFData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)PDFPage
{
  return self->_PDFPage;
}

- (void)setPDFPage:(int64_t)a3
{
  self->_PDFPage = a3;
}

- (CGRect)PDFVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_PDFVisibleRect.origin.x;
  y = self->_PDFVisibleRect.origin.y;
  width = self->_PDFVisibleRect.size.width;
  height = self->_PDFVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPDFVisibleRect:(CGRect)a3
{
  self->_PDFVisibleRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PDFData, 0);
}

@end
