@implementation NSValidateCoreTextAttributes

CFSetRef ____NSValidateCoreTextAttributes_block_invoke()
{
  const CFSetCallBacks *v0;
  CFSetRef result;
  void *v2[6];
  void *values[5];

  values[4] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = CFSTR("NSExpansion");
  values[1] = CFSTR("NSObliqueness");
  values[2] = CFSTR("NSSuperScript");
  values[3] = CFSTR("CTVerticalForms");
  v0 = (const CFSetCallBacks *)MEMORY[0x1E0C9AEC0];
  __NSValidateCoreTextAttributes_disallowedKeysForMeasurement = (uint64_t)CFSetCreate(0, (const void **)values, 4, MEMORY[0x1E0C9AEC0]);
  v2[0] = NSMarkedClauseSegmentAttributeName;
  v2[1] = CFSTR("NSTextAlternatives");
  v2[2] = CFSTR("NSTextAlternativesDisplayStyle");
  v2[3] = CFSTR("NSSpellingState");
  v2[4] = NSTemporaryTextCorrectionAttributeName;
  v2[5] = CFSTR("NSTextEffect");
  result = CFSetCreate(0, (const void **)v2, 6, v0);
  __NSValidateCoreTextAttributes_disallowedKeysForDrawing = (uint64_t)result;
  return result;
}

@end
