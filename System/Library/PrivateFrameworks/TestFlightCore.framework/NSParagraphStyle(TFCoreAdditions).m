@implementation NSParagraphStyle(TFCoreAdditions)

- (id)tf_paragraphStyleWithBaseWritingDirection:()TFCoreAdditions
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "setBaseWritingDirection:", a3);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
