@implementation BKPDFSearchResult

- (PDFSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
}

@end
