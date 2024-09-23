@implementation PFXDefImage

- (void)end
{
  PFXSvgElement *mParent;
  uint64_t v4;

  mParent = self->super.mParent;
  v4 = objc_opt_class(PFXPattern);
  if ((objc_opt_isKindOfClass(mParent, v4) & 1) != 0)
    -[PFXSvgElement setImageHref:](self->super.mParent, "setImageHref:", +[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "href"), -[PFXSvgDefsDocument entryPath](self->super.mDocument, "entryPath")));
}

@end
