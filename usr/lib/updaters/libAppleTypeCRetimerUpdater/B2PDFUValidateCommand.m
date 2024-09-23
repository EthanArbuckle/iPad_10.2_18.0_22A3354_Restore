@implementation B2PDFUValidateCommand

- (B2PDFUValidateCommand)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)B2PDFUValidateCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 12);
}

- (B2PDFUValidateCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  -[B2PDFUValidateCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

@end
