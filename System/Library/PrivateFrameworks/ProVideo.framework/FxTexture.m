@implementation FxTexture

- (FxTexture)init
{
  FxTexture *result;
  FxTexture *v3;
  FxTexturePriv *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FxTexture;
  result = -[FxImage init](&v5, sel_init);
  if (result)
  {
    v3 = result;
    v4 = (FxTexturePriv *)malloc_type_calloc(1uLL, 0xCuLL, 0x100004005A209FEuLL);
    v3->_texturePriv = v4;
    if (v4)
      return v3;
    else
      return 0;
  }
  return result;
}

- (FxTexture)initWithInfo:(id *)a3 textureId:(unsigned int)a4 andTarget:(unsigned int)a5
{
  __int128 v7;
  __int128 v8;
  FxTexture *v9;
  FxTexture *v10;
  FxTexturePriv *texturePriv;
  objc_super v13;
  _OWORD v14[4];
  double var8;

  v7 = *(_OWORD *)&a3->var6;
  v14[2] = *(_OWORD *)&a3->var4;
  v14[3] = v7;
  var8 = a3->var8;
  v8 = *(_OWORD *)&a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v8;
  v13.receiver = self;
  v13.super_class = (Class)FxTexture;
  v9 = -[FxImage initWithInfo:](&v13, sel_initWithInfo_, v14);
  v10 = v9;
  if (v9)
  {
    texturePriv = v9->_texturePriv;
    if (texturePriv
      || (texturePriv = (FxTexturePriv *)malloc_type_calloc(1uLL, 0xCuLL, 0x100004005A209FEuLL),
          (v10->_texturePriv = texturePriv) != 0))
    {
      texturePriv->var0 = a4;
      texturePriv->var1 = a5;
      texturePriv->var2 = 0;
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FxTexture *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v4 = [FxTexture alloc];
  if (self)
  {
    -[FxImage imageInfo](self, "imageInfo");
  }
  else
  {
    v10 = 0;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
  }
  return -[FxTexture initWithInfo:textureId:andTarget:](v4, "initWithInfo:textureId:andTarget:", &v6, -[FxTexture textureId](self, "textureId", v6, v7, v8, v9, v10), -[FxTexture target](self, "target"));
}

- (void)dealloc
{
  FxTexturePriv *texturePriv;
  objc_super v4;

  texturePriv = self->_texturePriv;
  if (texturePriv)
    free(texturePriv);
  v4.receiver = self;
  v4.super_class = (Class)FxTexture;
  -[FxImage dealloc](&v4, sel_dealloc);
}

- (void)setData:(void *)a3
{
  __assert_rtn("-[FxTexture setData:]", "FxTexture.mm", 86, "false");
}

- (void)setTextureId:(unsigned int)a3
{
  self->_texturePriv->var0 = a3;
}

- (void)setTarget:(unsigned int)a3
{
  self->_texturePriv->var1 = a3;
}

- (void)setIsInputImage:(BOOL)a3
{
  self->_texturePriv->var2 = a3;
}

- (BOOL)isInputImage
{
  return self->_texturePriv->var2;
}

- (void)createData:(unsigned int)a3 withType:(unsigned int)a4
{
  void *v5;

  v5 = malloc_type_malloc(4 * -[FxImage width](self, "width", *(_QWORD *)&a3, *(_QWORD *)&a4) * -[FxImage height](self, "height"), 0xAE3DFB61uLL);
  -[FxTexture bind](self, "bind");
  return v5;
}

- (unsigned)textureId
{
  return self->_texturePriv->var0;
}

- (unsigned)target
{
  return self->_texturePriv->var1;
}

- (void)bind
{
  glBindTexture(self->_texturePriv->var1, self->_texturePriv->var0);
}

- (void)enable
{
  glEnable(self->_texturePriv->var1);
}

- (void)disable
{
  glDisable(self->_texturePriv->var1);
}

- (void)setAsActiveTexture
{
  glActiveTexture(self->_texturePriv->var0);
}

- (void)getTextureCoords:(double *)a3 right:(double *)a4 bottom:(double *)a5 top:(double *)a6
{
  unint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v11 = -[FxImage dod](self, "dod");
  v12 = v11;
  v14 = v13;
  v15 = HIDWORD(v11);
  if (-[FxTexture isInputImage](self, "isInputImage"))
  {
    if (a3)
      *a3 = 0.0;
    if (a5)
      *a5 = 0.0;
    if (a4)
      *a4 = (double)((int)v14 - v12);
    if (a6)
    {
      LODWORD(v16) = HIDWORD(v14) - v15;
LABEL_18:
      *a6 = (double)(int)v16;
    }
  }
  else
  {
    if (a3)
      *a3 = (double)v12;
    if (a4)
      *a4 = (double)(int)v14;
    if (a5)
      *a5 = (double)(int)v15;
    if (a6)
    {
      v16 = HIDWORD(v14);
      goto LABEL_18;
    }
  }
}

- (BOOL)_verifyImage
{
  _BOOL4 v3;
  FxTexturePriv *texturePriv;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FxTexture;
  v3 = -[FxImage _verifyImage](&v6, sel__verifyImage);
  if (v3)
  {
    texturePriv = self->_texturePriv;
    if (texturePriv)
      LOBYTE(v3) = texturePriv->var1 != 0;
    else
      LOBYTE(v3) = 0;
  }
  return v3;
}

@end
