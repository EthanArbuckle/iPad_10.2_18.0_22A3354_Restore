@implementation ATLGetDecoder

+ (id)getDecoderForApplet:(uint64_t)a3 withPackage:(void *)a4 withModule:
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  __objc2_class *v8;
  __objc2_class *v9;
  void *v10;
  __objc2_class *v12;

  v4 = a4;
  objc_opt_self();
  +[AppletConfigurationData pluginDecoderForMid:](AppletConfigurationData, "pluginDecoderForMid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("A0000006800100010101")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("A00000068001FF010101")))
    {
      v8 = SlalomDecoder;
LABEL_6:
      -[__objc2_class sharedInstance](v8, "sharedInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("D1560000101000001201")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("9156000014020001")))
    {
      v9 = MercuryDecoder;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("A0000003965453000000010150000000")))
    {
      v9 = MifareDecoder;
    }
    else
    {
      if (!+[EMVDecoder isEMV:](EMVDecoder, "isEMV:", v4))
      {
        if (+[CopernicusDecoder isCopernicus:](CopernicusDecoder, "isCopernicus:", v4))
        {
          v12 = CopernicusDecoder;
        }
        else
        {
          if (+[CopernicusHCEDecoder isCopernicusHCE:](CopernicusHCEDecoder, "isCopernicusHCE:", v4))
          {
            v7 = (id)objc_opt_new();
            goto LABEL_11;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("A000000704D011500000000004000000")))
          {
            v12 = LyonDecoder;
          }
          else if (objc_msgSend(v4, "isEqualToString:", CFSTR("A000000704A0010010010001")))
          {
            v12 = WuluDecoder;
          }
          else
          {
            if (objc_msgSend(v4, "isEqualToString:", CFSTR("A0000004408001010001")))
            {
              v9 = SeosDecoder;
              goto LABEL_10;
            }
            if (objc_msgSend(v4, "isEqualToString:", CFSTR("F8434E412E43414C2E52657633")))
            {
              v8 = AtlasDecoder;
              goto LABEL_6;
            }
            if (objc_msgSend(v4, "isEqualToString:", CFSTR("A0000008588400010100")))
            {
              v12 = DreamworksDecoder;
            }
            else
            {
              if (!objc_msgSend(v4, "isEqualToString:", CFSTR("A0000008588202010100")))
              {
                v10 = 0;
                goto LABEL_12;
              }
              v12 = AlphonsoDecoder;
            }
          }
        }
        -[__objc2_class getInstance](v12, "getInstance");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v9 = EMVDecoder;
    }
LABEL_10:
    v7 = objc_alloc_init(v9);
    goto LABEL_11;
  }
  v7 = v5;
LABEL_11:
  v10 = v7;
LABEL_12:

  return v10;
}

@end
