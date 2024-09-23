@implementation ICSystemPaperImageGenerator

- (ICSystemPaperImageGenerator)init
{
  -[ICSystemPaperImageGenerator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICSystemPaperImageGenerator)initWithPaperAttachment:(id)a3
{
  return -[ICSystemPaperImageGenerator initWithPaperAttachment:useActivePaper:](self, "initWithPaperAttachment:useActivePaper:", a3, 0);
}

- (ICSystemPaperImageGenerator)initWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4
{
  ICSystemPaperImageGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSystemPaperImageGenerator;
  result = -[ICSystemPaperImageGenerator init](&v5, sel_init, a3, a4);
  result->_sixChannelBlendingEnabled = 1;
  return result;
}

- (id)imageWithFullResolution:(BOOL)a3 inverted:(BOOL)a4
{
  return 0;
}

- (BOOL)drawPaperInRect:(CGRect)a3
{
  return 0;
}

+ (id)imageGeneratorWithPaperAttachment:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("ICSwiftSystemPaperImageGenerator"));
  if (!v4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((swiftClass) != nil)", "+[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "swiftClass");
  v5 = (void *)objc_msgSend([v4 alloc], "initWithPaperAttachment:useActivePaper:", v3, 0);

  return v5;
}

+ (id)imageGeneratorWithPaperAttachment:(id)a3 useActivePaper:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_class *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = NSClassFromString(CFSTR("ICSwiftSystemPaperImageGenerator"));
  if (!v6)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((swiftClass) != nil)", "+[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:useActivePaper:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "swiftClass");
  v7 = (void *)objc_msgSend([v6 alloc], "initWithPaperAttachment:useActivePaper:", v5, v4);

  return v7;
}

- (CGRect)paperContentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)hasDeepLink
{
  return 0;
}

- (BOOL)validatePaperBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectGetWidth(a3) <= 10000000.0)
  {
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    if (CGRectGetHeight(v10) <= 10000000.0)
      return 1;
  }
  v7 = (void *)MEMORY[0x1E0D641A0];
  ICStringFromRect();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICSystemPaperImageGenerator validatePaperBounds:]", 1, 1, CFSTR("Unreasonably large paper bounds: %@"), v8);

  return 0;
}

- (BOOL)isSixChannelBlendingEnabled
{
  return self->_sixChannelBlendingEnabled;
}

- (void)setSixChannelBlendingEnabled:(BOOL)a3
{
  self->_sixChannelBlendingEnabled = a3;
}

@end
