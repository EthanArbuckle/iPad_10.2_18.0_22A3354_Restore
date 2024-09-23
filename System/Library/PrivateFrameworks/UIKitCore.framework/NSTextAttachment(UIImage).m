@implementation NSTextAttachment(UIImage)

+ (id)textAttachmentWithImage:()UIImage
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[_UIImageTextAttachment _initWithImage:]([_UIImageTextAttachment alloc], "_initWithImage:", v3);

  return v4;
}

@end
