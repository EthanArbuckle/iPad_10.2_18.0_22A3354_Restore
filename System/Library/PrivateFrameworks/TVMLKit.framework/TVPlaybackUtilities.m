@implementation TVPlaybackUtilities

+ (id)stateStringForTVPlaybackState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("¯\\_(ツ)_/¯");
  else
    return off_24EB85B68[a3 - 1];
}

+ (id)stateStringForIKState:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_class();
  return (id)objc_msgSend(v4, "stateStringForTVPlaybackState:", objc_msgSend((id)objc_opt_class(), "tvStateForIKState:", a3));
}

+ (int64_t)tvStateForIKState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
    return 0;
  else
    return a3;
}

+ (int64_t)ikStateForTVPlaybackState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
    return 0;
  else
    return a3;
}

@end
