@implementation UIView(TSUViewAdditions)

- (uint64_t)addBorderWithColor:()TSUViewAdditions
{
  objc_msgSend((id)objc_msgSend(a1, "layer"), "setBorderWidth:", 1.0);
  return objc_msgSend((id)objc_msgSend(a1, "layer"), "setBorderColor:", objc_msgSend(a3, "CGColor"));
}

@end
