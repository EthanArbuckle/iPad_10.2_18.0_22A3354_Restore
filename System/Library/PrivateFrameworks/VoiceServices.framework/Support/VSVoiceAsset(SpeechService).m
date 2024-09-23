@implementation VSVoiceAsset(SpeechService)

- (uint64_t)gainDecibelWithVolume:()SpeechService
{
  uint64_t result;
  double v5;

  result = objc_msgSend(a1, "footprint");
  LODWORD(v5) = 2.5;
  if (result != 1)
  {
    result = objc_msgSend(a1, "type", v5);
    if (result != 2)
    {
      result = objc_msgSend(a1, "type");
      if (a2 < 1.0 || result != 3)
        return objc_msgSend(a1, "type");
    }
  }
  return result;
}

@end
