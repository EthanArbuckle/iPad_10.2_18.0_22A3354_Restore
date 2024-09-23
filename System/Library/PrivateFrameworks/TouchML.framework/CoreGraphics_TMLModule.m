@implementation CoreGraphics_TMLModule

+ (BOOL)loadModule
{
  return 1;
}

+ (void)initializeJSContext:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  v12 = a3;
  objc_msgSend_initializeJSContext_(TMLVector, v4, v5, v12);
  objc_msgSend_initializeJSContext_(TMLAffineTransform, v6, v7, v12);
  objc_msgSend_defineConstants_(a1, v8, v9, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, v11, &unk_24F4FE618, CFSTR("CGPathCreateCopyByStrokingPath"));

}

@end
