@implementation BKPDFTOCTableViewCell

- (PDFOutline)pdfChapter
{
  return self->_pdfChapter;
}

- (void)setPdfChapter:(id)a3
{
  objc_storeStrong((id *)&self->_pdfChapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfChapter, 0);
}

@end
