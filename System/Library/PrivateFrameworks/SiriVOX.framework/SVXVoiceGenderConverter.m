@implementation SVXVoiceGenderConverter

- (int64_t)getSpeechGenderFromGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (int64_t)getSpeechGenderFromVoiceInfo:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "gender");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (int64_t)getAFVoiceGenderFromTTSAssetVoiceGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

@end
