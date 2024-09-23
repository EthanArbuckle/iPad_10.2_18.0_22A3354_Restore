@implementation ZN15LiSolidRendererC2Ev

char *___ZN15LiSolidRendererC2Ev_block_invoke()
{
  ProGL::GL_Wrap *v0;
  float v1;
  int v2;
  ProGL::GL *v3;
  char *String;
  char *result;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  HGGLBlendingInfo *v12;
  std::__shared_weak_count *v13;
  HGGLBlendingInfo *v14;
  std::__shared_weak_count *v15;
  _BYTE v16[48];
  _BYTE v17[40];

  v0 = (ProGL::GL_Wrap *)ProGL::GL::GL((ProGL::GL *)v17);
  ProGL::GL_Wrap::getIntegerv(v0, 0x8D57u, &gMaxSamples);
  v1 = log2f(0.0);
  v2 = (int)exp2f(floorf(v1));
  if (v2 >= 1024)
    v2 = 1024;
  if (v2 <= 128)
    v2 = 128;
  gTileSize = v2;
  ProGL::Framebuffer::Framebuffer((ProGL::Framebuffer *)v16, (ProGL::GL *)v17);
  v3 = (ProGL::GL *)gMaxSamples;
  if (gMaxSamples >= 1)
  {
    while (1)
    {
      LiSolidUtils::createMultisampleColorBuffer((LiSolidUtils *)v17, v3, gTileSize, gTileSize, &v14);
      LiSolidUtils::createMultisampleColorBuffer((LiSolidUtils *)v17, v3, gTileSize, gTileSize, &v12);
      ProGL::Framebuffer::bind((ProGL::Framebuffer *)v16, (ProGL::GL *)v17, 0x8D40u);
      ProGL::Framebuffer::attach((uint64_t)v16, (int)v17, 0x8D40u, 0x8CE0u, &v14);
      ProGL::Framebuffer::attach((uint64_t)v16, (int)v17, 0x8D40u, 0x8D00u, &v12);
      v6 = v13;
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v8 = __ldaxr(p_shared_owners);
        while (__stlxr(v8 - 1, p_shared_owners));
        if (!v8)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
      v9 = v15;
      if (v15)
      {
        v10 = (unint64_t *)&v15->__shared_owners_;
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
  }
  ProGL::Framebuffer::~Framebuffer((ProGL::Framebuffer *)v16);
  ProGL::GL::~GL((ProGL::GL *)v17);
  String = (char *)glGetString(0x1F03u);
  result = strstr(String, "ARB_seamless_cube_map");
  gSeamlessCubeMap = result != 0;
  return result;
}

@end
