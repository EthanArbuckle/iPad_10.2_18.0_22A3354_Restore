@implementation PLCodec

+ (unsigned)_typeCodeFromString:(id)a3
{
  void *v3;
  unsigned int v4;
  unsigned int v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") < 4)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "getBytes:range:", &v6, 0, 4);
    v4 = bswap32(v6);
  }

  return v4;
}

+ (BOOL)isPlayableFourCharCodecName:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "_typeCodeFromString:", v4);
    v5 = VTSelectAndCreateVideoDecoderInstance() == 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)H264fourCharCode
{
  if (H264fourCharCode_onceToken != -1)
    dispatch_once(&H264fourCharCode_onceToken, &__block_literal_global_65006);
  return (id)H264fourCharCode_codecName;
}

+ (id)HEVCfourCharCode
{
  if (HEVCfourCharCode_onceToken != -1)
    dispatch_once(&HEVCfourCharCode_onceToken, &__block_literal_global_1);
  return (id)HEVCfourCharCode_codecName;
}

void __27__PLCodec_HEVCfourCharCode__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D75130], "stringFromFourCharCode:", 1752589105);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HEVCfourCharCode_codecName;
  HEVCfourCharCode_codecName = v0;

}

void __27__PLCodec_H264fourCharCode__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D75130], "stringFromFourCharCode:", 1635148593);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)H264fourCharCode_codecName;
  H264fourCharCode_codecName = v0;

}

@end
