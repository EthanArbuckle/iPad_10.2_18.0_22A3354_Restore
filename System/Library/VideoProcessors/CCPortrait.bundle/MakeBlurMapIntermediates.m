@implementation MakeBlurMapIntermediates

- (BOOL)validateForMetal
{
  int v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  v3 = objc_msgSend_conformsToProtocol_(self->_inputFaceMaskAdjBlurTex, a2, (uint64_t)&unk_2579B9140);
  if (v3)
  {
    v3 = objc_msgSend_conformsToProtocol_(self->_inputWeightsXTex, v4, (uint64_t)&unk_2579B9140);
    if (v3)
    {
      v3 = objc_msgSend_conformsToProtocol_(self->_inputWeightsYTex, v5, (uint64_t)&unk_2579B9140);
      if (v3)
      {
        v3 = objc_msgSend_conformsToProtocol_(self->_inputPreprocTex, v6, (uint64_t)&unk_2579B9140);
        if (v3)
        {
          v3 = objc_msgSend_conformsToProtocol_(self->_inputSampledDTex, v7, (uint64_t)&unk_2579B9140);
          if (v3)
          {
            v3 = objc_msgSend_conformsToProtocol_(self->_inputDisparityRefineBlurTex, v8, (uint64_t)&unk_2579B9140);
            if (v3)
            {
              v3 = objc_msgSend_conformsToProtocol_(self->_inputAlphaMaskDeltaTex, v9, (uint64_t)&unk_2579B9140);
              if (v3)
              {
                v3 = objc_msgSend_conformsToProtocol_(self->_inputHairMaskDeltaTex, v10, (uint64_t)&unk_2579B9140);
                if (v3)
                  LOBYTE(v3) = (objc_msgSend_conformsToProtocol_(self->_inputBlurRefineIntermediateTex, v11, (uint64_t)&unk_2579B9140) & 1) != 0;
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (MTLTexture)inputFaceMaskAdjBlurTex
{
  return self->_inputFaceMaskAdjBlurTex;
}

- (void)setInputFaceMaskAdjBlurTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputFaceMaskAdjBlurTex, a3);
}

- (MTLTexture)inputWeightsXTex
{
  return self->_inputWeightsXTex;
}

- (void)setInputWeightsXTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputWeightsXTex, a3);
}

- (MTLTexture)inputWeightsYTex
{
  return self->_inputWeightsYTex;
}

- (void)setInputWeightsYTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputWeightsYTex, a3);
}

- (MTLTexture)inputPreprocTex
{
  return self->_inputPreprocTex;
}

- (void)setInputPreprocTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputPreprocTex, a3);
}

- (MTLTexture)inputSampledDTex
{
  return self->_inputSampledDTex;
}

- (void)setInputSampledDTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputSampledDTex, a3);
}

- (MTLTexture)inputDisparityRefineBlurTex
{
  return self->_inputDisparityRefineBlurTex;
}

- (void)setInputDisparityRefineBlurTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputDisparityRefineBlurTex, a3);
}

- (MTLTexture)inputAlphaMaskDeltaTex
{
  return self->_inputAlphaMaskDeltaTex;
}

- (void)setInputAlphaMaskDeltaTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputAlphaMaskDeltaTex, a3);
}

- (MTLTexture)inputHairMaskDeltaTex
{
  return self->_inputHairMaskDeltaTex;
}

- (void)setInputHairMaskDeltaTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputHairMaskDeltaTex, a3);
}

- (MTLTexture)inputBlurRefineIntermediateTex
{
  return self->_inputBlurRefineIntermediateTex;
}

- (void)setInputBlurRefineIntermediateTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlurRefineIntermediateTex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBlurRefineIntermediateTex, 0);
  objc_storeStrong((id *)&self->_inputHairMaskDeltaTex, 0);
  objc_storeStrong((id *)&self->_inputAlphaMaskDeltaTex, 0);
  objc_storeStrong((id *)&self->_inputDisparityRefineBlurTex, 0);
  objc_storeStrong((id *)&self->_inputSampledDTex, 0);
  objc_storeStrong((id *)&self->_inputPreprocTex, 0);
  objc_storeStrong((id *)&self->_inputWeightsYTex, 0);
  objc_storeStrong((id *)&self->_inputWeightsXTex, 0);
  objc_storeStrong((id *)&self->_inputFaceMaskAdjBlurTex, 0);
}

@end
