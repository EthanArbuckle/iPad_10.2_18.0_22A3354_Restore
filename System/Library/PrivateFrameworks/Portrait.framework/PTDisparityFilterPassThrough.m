@implementation PTDisparityFilterPassThrough

- (PTDisparityFilterPassThrough)initWithMetalContext:(id)a3
{
  id v5;
  PTDisparityFilterPassThrough *v6;
  PTDisparityFilterPassThrough *v7;
  PTDisparityFilterPassThrough *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTDisparityFilterPassThrough;
  v6 = -[PTDisparityFilterPassThrough init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = v7;
  }

  return v7;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return 0;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  PTMetalContext *metalContext;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;

  metalContext = self->_metalContext;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  -[PTMetalContext textureUtil](metalContext, "textureUtil");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy:inTex:outTex:", v13, v12, v11);

  return v15;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  return -[PTDisparityFilterPassThrough temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:](self, "temporalDisparityFilter:inDisplacement:inStatePrev:inDisparity:outDisparity:outState:", a3, 0, a4, a4, a7, a7);
}

- (id)debugTextures:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)debugTexturesNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
