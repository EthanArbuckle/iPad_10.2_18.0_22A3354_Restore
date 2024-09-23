@implementation CASupportsAnimationForKey

uint64_t ___CASupportsAnimationForKey_block_invoke()
{
  id v0;
  void *v1;
  uint64_t result;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)qword_1EDDCA6C0;
  qword_1EDDCA6C0 = (uint64_t)v0;

  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("bounds"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("opacity"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("position"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("transform"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("contentsRect"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("contentsCenter"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("backgroundColor"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("contentsMultiplyColor"));
  objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("filters.opacityPair.inputAmount"));
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("cornerRadius"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("scale"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("anchorPoint"));
  }
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("transform3D"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("shadowOpacity"));
  }
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("borderWidth"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("borderColor"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("shadowColor"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("shadowOffset"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("shadowRadius"));
  }
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("meshTransform"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("sublayerTransform"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("shadowPath"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("zPosition"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("anchorPointZ"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.tintAmount"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.clippingExtents.outsetMinX"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.clippingExtents.outsetMaxX"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.clippingExtents.outsetMinY"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.clippingExtents.outsetMaxY"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.clippingExtents.outsetMinZ"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.clippingExtents.outsetMaxZ"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("cornerRadii"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("path"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("fillColor"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("strokeColor"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("strokeStart"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("strokeEnd"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("lineWidth"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("miterLimit"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("lineDashPhase"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("colors"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("locations"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("startPoint"));
    objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("endPoint"));
  }
  result = dyld_program_sdk_at_least();
  if ((_DWORD)result)
    return objc_msgSend((id)qword_1EDDCA6C0, "addObject:", CFSTR("separatedOptions.pointsPerMeter"));
  return result;
}

@end
