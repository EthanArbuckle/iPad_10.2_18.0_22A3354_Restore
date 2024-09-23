@implementation GEOComposedRouteSection(VKPolylineOverlay)

- (double)vkBounds
{
  return *(double *)(a1 + (int)*MEMORY[0x1E0D27768]) / *(double *)(MEMORY[0x1E0D266E8] + 16);
}

@end
