@implementation PVRenderedTexture

- (PVRenderedTexture)initWithHGGLTexture:(HGRef<HGGLTexture>)a3
{
  PVRenderedTexture *v4;
  PVRenderedTexture *v5;
  HGGLTexture *m_Obj;
  HGGLTexture *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PVRenderedTexture;
  v4 = -[PVRenderedTexture init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    m_Obj = v4->_glTexture.m_Obj;
    v7 = *(HGGLTexture **)a3.m_Obj;
    if (m_Obj != *(HGGLTexture **)a3.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGGLTexture *))(*(_QWORD *)m_Obj + 24))(v5->_glTexture.m_Obj);
        v7 = *(HGGLTexture **)a3.m_Obj;
      }
      v5->_glTexture.m_Obj = v7;
      if (v7)
        (*(void (**)(HGGLTexture *))(*(_QWORD *)v7 + 16))(v7);
    }
  }
  return v5;
}

- (unsigned)textureName
{
  return *((_DWORD *)self->_glTexture.m_Obj + 42);
}

- (unsigned)textureTarget
{
  return *((_DWORD *)self->_glTexture.m_Obj + 40);
}

- (CGSize)textureSize
{
  int TextureRect;
  int v4;
  double v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  CGSize result;

  TextureRect = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  v5 = (double)(v4 - TextureRect);
  v6 = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  v8 = (double)(v7 - HIDWORD(v6));
  v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGRect)textureRect
{
  double TextureRect;
  double v4;
  int v5;
  int v6;
  double v7;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  TextureRect = (double)(int)HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  v4 = (double)(int)((unint64_t)HGGLTexture::GetTextureRect(self->_glTexture.m_Obj) >> 32);
  v5 = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  v7 = (double)(v6 - v5);
  v8 = HGGLTexture::GetTextureRect(self->_glTexture.m_Obj);
  v10 = (double)(v9 - HIDWORD(v8));
  v11 = TextureRect;
  v12 = v4;
  v13 = v7;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)bitmapRect
{
  HGGLTexture *m_Obj;
  int v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  m_Obj = self->_glTexture.m_Obj;
  v3 = *((_DWORD *)m_Obj + 5);
  v4 = *((_DWORD *)m_Obj + 6);
  v5 = (double)v3;
  v6 = (double)v4;
  v7 = (double)(*((_DWORD *)m_Obj + 7) - v3);
  v8 = (double)(*((_DWORD *)m_Obj + 8) - v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void).cxx_destruct
{
  HGGLTexture *m_Obj;

  m_Obj = self->_glTexture.m_Obj;
  if (m_Obj)
    (*(void (**)(HGGLTexture *, SEL))(*(_QWORD *)m_Obj + 24))(m_Obj, a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
