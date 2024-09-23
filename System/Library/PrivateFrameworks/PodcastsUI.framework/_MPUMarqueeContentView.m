@implementation _MPUMarqueeContentView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[_MPUMarqueeContentView superview](self, "superview");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForContentSize");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    objc_msgSend(v6, "invalidateIntrinsicContentSize");

}

@end
