@implementation HKSampleType(HKRespiratory)

+ (uint64_t)hkrp_heartRateType
{
  return objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD35B8]);
}

+ (uint64_t)hkrp_oxygenSaturationType
{
  return objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3608]);
}

@end
