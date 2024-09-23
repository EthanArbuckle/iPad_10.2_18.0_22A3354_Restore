@implementation PESpatialAudioMixMode

- (PESpatialAudioMixMode)initWithType:(unint64_t)a3
{
  PESpatialAudioMixMode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PESpatialAudioMixMode;
  result = -[PESpatialAudioMixMode init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (NSString)localizedTitle
{
  unint64_t v2;

  v2 = -[PESpatialAudioMixMode type](self, "type");
  if (v2 > 3)
    return (NSString *)PELocalizedString(0);
  else
    return (NSString *)PELocalizedString(off_24C618090[v2]);
}

- (NSString)renderingStyle
{
  unint64_t v2;
  id v3;

  v2 = -[PESpatialAudioMixMode type](self, "type");
  if (v2 <= 3)
    v3 = **((id **)&unk_24C6180B0 + v2);
  return (NSString *)v3;
}

- (unint64_t)type
{
  return self->_type;
}

+ (id)audioMixModes
{
  PESpatialAudioMixMode *v2;
  PESpatialAudioMixMode *v3;
  PESpatialAudioMixMode *v4;
  PESpatialAudioMixMode *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = -[PESpatialAudioMixMode initWithType:]([PESpatialAudioMixMode alloc], "initWithType:", 0);
  v8[0] = v2;
  v3 = -[PESpatialAudioMixMode initWithType:]([PESpatialAudioMixMode alloc], "initWithType:", 3);
  v8[1] = v3;
  v4 = -[PESpatialAudioMixMode initWithType:]([PESpatialAudioMixMode alloc], "initWithType:", 2);
  v8[2] = v4;
  v5 = -[PESpatialAudioMixMode initWithType:]([PESpatialAudioMixMode alloc], "initWithType:", 1);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)audioMixModeForRenderingStyle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;

  v3 = a3;
  +[PESpatialAudioMixMode audioMixModes](PESpatialAudioMixMode, "audioMixModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v5 = v3;
  PFFind();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__PESpatialAudioMixMode_audioMixModeForRenderingStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "renderingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
