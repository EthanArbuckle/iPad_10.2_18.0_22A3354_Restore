@implementation PFXDefPath

- (void)end
{
  xmlChar *v3;
  const char *v4;
  PFXSvgElement *mParent;
  uint64_t v6;
  char isKindOfClass;
  PFXSvgElement *v8;
  uint64_t v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = (xmlChar *)PFXBezierPathWithSvgPath((const xmlChar *)-[PFXSvgElement xmlValueForAttributeName:](self, "xmlValueForAttributeName:", "d"));
  v4 = -[PFXSvgElement xmlValueForAttributeName:](self, "xmlValueForAttributeName:", "transform");
  if (v4 && *v4)
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    PFXAffineTransformWithSvgTransform(v4, &v11);
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    -[xmlChar transformUsingAffineTransform:](v3, "transformUsingAffineTransform:", v10);
  }
  mParent = self->super.mParent;
  v6 = objc_opt_class(PFXMarker);
  isKindOfClass = objc_opt_isKindOfClass(mParent, v6);
  v8 = self->super.mParent;
  if ((isKindOfClass & 1) != 0)
  {
    -[PFXSvgElement setBezierPath:](self->super.mParent, "setBezierPath:", v3);
    -[PFXSvgElement setFilled:](self->super.mParent, "setFilled:", objc_msgSend(-[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "fill"), "isEqualToString:", CFSTR("none")) ^ 1);
  }
  else
  {
    v9 = objc_opt_class(PFXClipPath);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      -[PFXSvgElement setBezierPath:](self->super.mParent, "setBezierPath:", v3);
  }
}

@end
