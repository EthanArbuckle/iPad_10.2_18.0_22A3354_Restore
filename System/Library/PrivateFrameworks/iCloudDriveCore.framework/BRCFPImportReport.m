@implementation BRCFPImportReport

- (BRCFPImportReport)init
{
  BRCFPImportReport *v2;
  BRCFPImportReport *v3;
  NSError *importError;
  FPImportProgressReport *fpReport;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCFPImportReport;
  v2 = -[BRCFPImportReport init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    importError = v2->_importError;
    v2->_importError = 0;

    fpReport = v3->_fpReport;
    v3->_fpReport = 0;

  }
  return v3;
}

- (NSError)importError
{
  return self->_importError;
}

- (void)setImportError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FPImportProgressReport)fpReport
{
  return self->_fpReport;
}

- (void)setFpReport:(id)a3
{
  objc_storeStrong((id *)&self->_fpReport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpReport, 0);
  objc_storeStrong((id *)&self->_importError, 0);
}

@end
