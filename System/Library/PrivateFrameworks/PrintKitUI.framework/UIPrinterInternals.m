@implementation UIPrinterInternals

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printer, 0);
}

@end
