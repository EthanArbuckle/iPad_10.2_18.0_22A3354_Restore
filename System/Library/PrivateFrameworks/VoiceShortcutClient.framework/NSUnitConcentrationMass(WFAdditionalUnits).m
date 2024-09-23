@implementation NSUnitConcentrationMass(WFAdditionalUnits)

+ (id)wf_microgramsPerCubicMeter
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A78]), "initWithCoefficient:", 0.000000001);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A70]), "initWithSymbol:converter:", CFSTR("μg/m³"), v0);

  return v1;
}

@end
