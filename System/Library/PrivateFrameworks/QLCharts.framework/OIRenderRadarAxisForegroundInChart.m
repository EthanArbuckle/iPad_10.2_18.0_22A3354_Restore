@implementation OIRenderRadarAxisForegroundInChart

double __OIRenderRadarAxisForegroundInChart_block_invoke(uint64_t a1, double a2)
{
  OIAxisConvertValueToLocal(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  return *(double *)(a1 + 48) - a2 + -4.0;
}

@end
