@implementation SoundClassificationListener

- (SoundClassificationListener)init
{
  SoundClassificationListener *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SoundClassificationListener;
  result = -[SoundClassificationListener init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->isFalsePositiveState = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SoundClassificationListener;
  -[SoundClassificationListener dealloc](&v2, sel_dealloc);
}

- (void)startListen
{
  if (!self->isListenerON)
    self->isListenerON = 1;
}

- (void)stopListen
{
  self->isListenerON = 0;
}

- (BOOL)isFalsePositive
{
  return 0;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SoundClassificationListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SoundClassificationListener sharedInstance]::onceToken != -1)
    dispatch_once(&+[SoundClassificationListener sharedInstance]::onceToken, block);
  return (id)+[SoundClassificationListener sharedInstance]::sharedSoundClassificationListener;
}

void __45__SoundClassificationListener_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[SoundClassificationListener sharedInstance]::sharedSoundClassificationListener;
  +[SoundClassificationListener sharedInstance]::sharedSoundClassificationListener = (uint64_t)v1;

}

@end
