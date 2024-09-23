@implementation TTSSpeakUPAUManager

+ (AudioComponentDescription)component
{
  qmemcpy(retstr, "xfuapupslppa", 12);
  return result;
}

+ (void)registerAU
{
  AudioComponentDescription v2;

  *(_OWORD *)&v2.componentType = xmmword_1A3ABF420;
  v2.componentFlagsMask = 0;
  AudioComponentRegister(&v2, CFSTR("SPEECH ENHANCER"), 0, (AudioComponentFactoryFunction)sub_1A39878B8);
}

@end
