@implementation ApplyBlurMapIntermediates

- (BOOL)validateForMetal
{
  int v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;

  v3 = objc_msgSend_conformsToProtocol_(self->_inputIntermediateTex, a2, (uint64_t)&unk_2579B9140);
  if (v3)
  {
    v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex1, v4, (uint64_t)&unk_2579B9140);
    if (v3)
    {
      v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex2, v5, (uint64_t)&unk_2579B9140);
      if (v3)
      {
        v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex1sRGB, v6, (uint64_t)&unk_2579B9140);
        if (v3)
        {
          v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex2sRGB, v7, (uint64_t)&unk_2579B9140);
          if (v3)
            LOBYTE(v3) = (objc_msgSend_conformsToProtocol_(self->_inputHalfResRGTex, v8, (uint64_t)&unk_2579B9140) & 1) != 0;
        }
      }
    }
  }
  return v3;
}

- (MTLTexture)inputIntermediateTex
{
  return self->_inputIntermediateTex;
}

- (void)setInputIntermediateTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputIntermediateTex, a3);
}

- (MTLTexture)inputSmoothedBlurmap
{
  return self->_inputSmoothedBlurmap;
}

- (void)setInputSmoothedBlurmap:(id)a3
{
  objc_storeStrong((id *)&self->_inputSmoothedBlurmap, a3);
}

- (MTLTexture)inputHalfResTex1
{
  return self->_inputHalfResTex1;
}

- (void)setInputHalfResTex1:(id)a3
{
  objc_storeStrong((id *)&self->_inputHalfResTex1, a3);
}

- (MTLTexture)inputHalfResTex2
{
  return self->_inputHalfResTex2;
}

- (void)setInputHalfResTex2:(id)a3
{
  objc_storeStrong((id *)&self->_inputHalfResTex2, a3);
}

- (MTLTexture)inputHalfResTex1sRGB
{
  return self->_inputHalfResTex1sRGB;
}

- (void)setInputHalfResTex1sRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputHalfResTex1sRGB, a3);
}

- (MTLTexture)inputHalfResTex2sRGB
{
  return self->_inputHalfResTex2sRGB;
}

- (void)setInputHalfResTex2sRGB:(id)a3
{
  objc_storeStrong((id *)&self->_inputHalfResTex2sRGB, a3);
}

- (MTLTexture)inputHalfResRGTex
{
  return self->_inputHalfResRGTex;
}

- (void)setInputHalfResRGTex:(id)a3
{
  objc_storeStrong((id *)&self->_inputHalfResRGTex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputHalfResRGTex, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex2sRGB, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex1sRGB, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex2, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex1, 0);
  objc_storeStrong((id *)&self->_inputSmoothedBlurmap, 0);
  objc_storeStrong((id *)&self->_inputIntermediateTex, 0);
}

@end
