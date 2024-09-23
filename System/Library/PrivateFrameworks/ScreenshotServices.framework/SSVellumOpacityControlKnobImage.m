@implementation SSVellumOpacityControlKnobImage

void __SSVellumOpacityControlKnobImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", 14.0, 14.0);
  objc_msgSend(v2, "imageWithActions:", &__block_literal_global_36);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__SSVellumOpacityControlKnobImage;
  __SSVellumOpacityControlKnobImage = v0;

}

void __SSVellumOpacityControlKnobImage_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  CGContext *v5;
  CGRect v6;

  v2 = (void *)MEMORY[0x24BDF6950];
  v3 = a2;
  objc_msgSend(v2, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  v5 = (CGContext *)objc_msgSend(v3, "CGContext");
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 14.0;
  v6.size.height = 14.0;
  CGContextFillEllipseInRect(v5, v6);
}

@end
