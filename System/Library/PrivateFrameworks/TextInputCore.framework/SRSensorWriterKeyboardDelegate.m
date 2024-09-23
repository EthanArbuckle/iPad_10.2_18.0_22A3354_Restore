@implementation SRSensorWriterKeyboardDelegate

- (id)classNameForSensorIdentifier:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.SensorKit.keyboardMetrics")))
    return CFSTR("SRKeyboardMetrics");
  else
    return 0;
}

@end
