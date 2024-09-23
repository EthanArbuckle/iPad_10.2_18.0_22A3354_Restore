@implementation SXAudioComponent

+ (id)typeString
{
  return CFSTR("audio");
}

- (unint64_t)traits
{
  void *v2;

  -[SXAudioComponent stillImageIdentifier](self, "stillImageIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 12;
  else
    return 8;
}

@end
