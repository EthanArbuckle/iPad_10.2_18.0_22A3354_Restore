@implementation CRTextOrientationRecognizerConfiguration

- (CRTextOrientationRecognizerConfiguration)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRTextOrientationRecognizerConfiguration;
  return -[CRNeuralRecognizerConfiguration initWithLocale:imageReaderOptions:error:](&v5, sel_initWithLocale_imageReaderOptions_error_, CFSTR("en-US"), a3, a4);
}

@end
