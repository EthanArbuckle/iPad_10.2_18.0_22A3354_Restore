@implementation DenoiseRemixShaders

- (DenoiseRemixShaders)initWithMetal:(id)a3 vertFunc:(id)a4 pixelFormatLuma:(unint64_t)a5 pixelFormatChroma:(unint64_t)a6 pixelFormatLoG:(unint64_t)a7 lgaAlgorithm:(int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  DenoiseRemixShaders *v16;
  DenoiseRemixFragmentShader *v17;
  DenoiseRemixFragmentShader *denoiseChroma;
  DenoiseRemixFragmentShader *v19;
  DenoiseRemixFragmentShader *denoiseLumaDenoiseRemixChroma;
  DenoiseRemixFragmentShader *v21;
  DenoiseRemixFragmentShader *denoiseRemixLumaChroma;
  DenoiseRemixFragmentShader *v23;
  DenoiseRemixFragmentShader *remixLuma;
  DenoiseRemixFragmentShader *v25;
  DenoiseRemixFragmentShader *denoiseLumaAlpha;
  DenoiseRemixFragmentShader *v27;
  DenoiseRemixFragmentShader *calculateLocalGain;
  DenoiseRemixFragmentShader *v29;
  unint64_t v30;
  uint64_t v31;
  DenoiseRemixFragmentShader *writeOutGainMap;
  DenoiseRemixShaders *v33;
  DenoiseRemixShaders *v34;
  int v36;
  objc_super v37;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = a4;
  v37.receiver = self;
  v37.super_class = (Class)DenoiseRemixShaders;
  v16 = -[DenoiseRemixShaders init](&v37, sel_init);
  if (v16)
  {
    v17 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:]([DenoiseRemixFragmentShader alloc], "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("DenoiseChroma_frag"), v8, 0, a6, 0, 0);
    denoiseChroma = v16->_denoiseChroma;
    v16->_denoiseChroma = v17;

    if (v16->_denoiseChroma)
    {
      v19 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:]([DenoiseRemixFragmentShader alloc], "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("DenoiseLumaDenoiseRemixChroma_frag"), v8, 0, a5, a6, a7);
      denoiseLumaDenoiseRemixChroma = v16->_denoiseLumaDenoiseRemixChroma;
      v16->_denoiseLumaDenoiseRemixChroma = v19;

      if (v16->_denoiseLumaDenoiseRemixChroma)
      {
        v21 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:]([DenoiseRemixFragmentShader alloc], "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("DenoiseRemixLumaChroma_frag"), v8, 0, a5, a6, a7);
        denoiseRemixLumaChroma = v16->_denoiseRemixLumaChroma;
        v16->_denoiseRemixLumaChroma = v21;

        if (v16->_denoiseRemixLumaChroma)
        {
          v23 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:]([DenoiseRemixFragmentShader alloc], "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("RemixLuma_frag"), v8, 0, a5, 0, 0);
          remixLuma = v16->_remixLuma;
          v16->_remixLuma = v23;

          if (v16->_remixLuma)
          {
            v25 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:]([DenoiseRemixFragmentShader alloc], "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("DenoiseLumaAlpha_frag"), 0, 0, a5, 0, 0);
            denoiseLumaAlpha = v16->_denoiseLumaAlpha;
            v16->_denoiseLumaAlpha = v25;

            if (v16->_denoiseLumaAlpha)
            {
              v27 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:]([DenoiseRemixFragmentShader alloc], "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("CalculateLocalGain_frag"), v8, 0, a5, 0, 0);
              calculateLocalGain = v16->_calculateLocalGain;
              v16->_calculateLocalGain = v27;

              if (v16->_calculateLocalGain)
              {
                v29 = [DenoiseRemixFragmentShader alloc];
                v30 = (_DWORD)v8 == 1 ? a5 : a6;
                v31 = -[DenoiseRemixFragmentShader initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:](v29, "initWithMetal:vertFunc:fragName:useLGA:useGDGNR:pixelFormat:pixelFormat2:pixelFormat3:", v14, v15, CFSTR("WriteOutGainMap_frag"), v8, 0, v30, 0, 0);
                writeOutGainMap = v16->_writeOutGainMap;
                v16->_writeOutGainMap = (DenoiseRemixFragmentShader *)v31;

                if (v16->_writeOutGainMap)
                  goto LABEL_12;
              }
            }
          }
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v36 = FigSignalErrorAt();
    v33 = 0;
    if (!v36)
LABEL_12:
      v33 = v16;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v33 = 0;
  }
  v34 = v33;

  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeOutGainMap, 0);
  objc_storeStrong((id *)&self->_calculateLocalGain, 0);
  objc_storeStrong((id *)&self->_denoiseLumaAlpha, 0);
  objc_storeStrong((id *)&self->_remixLuma, 0);
  objc_storeStrong((id *)&self->_denoiseRemixLumaChroma, 0);
  objc_storeStrong((id *)&self->_denoiseLumaDenoiseRemixChroma, 0);
  objc_storeStrong((id *)&self->_denoiseChroma, 0);
}

@end
