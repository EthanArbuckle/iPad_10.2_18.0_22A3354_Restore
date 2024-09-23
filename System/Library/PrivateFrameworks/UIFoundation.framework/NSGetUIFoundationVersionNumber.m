@implementation NSGetUIFoundationVersionNumber

void *___NSGetUIFoundationVersionNumber_block_invoke()
{
  void *result;
  double v1;
  double v2;

  result = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "infoDictionary"), "valueForKey:", CFSTR("CFBundleVersion"));
  if (result)
  {
    result = (void *)objc_msgSend(result, "doubleValue");
    v2 = floor(v1 + 0.5);
  }
  else
  {
    v2 = 0.0;
  }
  _NSGetUIFoundationVersionNumber_UIFoundationVersionNumber = *(_QWORD *)&v2;
  return result;
}

@end
