@implementation UIGraphicsPDFRendererFormat

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIGraphicsPDFRendererFormat;
  v4 = -[UIGraphicsRendererFormat copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[UIGraphicsPDFRendererFormat documentInfo](self, "documentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDocumentInfo:", v6);

  -[UIGraphicsPDFRendererFormat outputURL](self, "outputURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputURL:", v7);

  -[UIGraphicsPDFRendererFormat pdfData](self, "pdfData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPdfData:", v8);

  return v4;
}

- (NSDictionary)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(NSDictionary *)documentInfo
{
  objc_setProperty_nonatomic_copy(self, a2, documentInfo, 40);
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableData)pdfData
{
  return (NSMutableData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPdfData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_documentInfo, 0);
}

@end
