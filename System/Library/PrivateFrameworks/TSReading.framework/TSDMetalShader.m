@implementation TSDMetalShader

- (id)p_createPipelineStateWithRenderPipelineDescriptor:(id)a3 device:(id)a4 setupUniforms:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  MTLRenderPipelineReflection *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MTLRenderPipelineReflection *pipelineReflectionObject;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    v23 = 0;
    v24 = 0;
    v11 = (void *)objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v8, 3, &v24, &v23);
    v12 = (MTLRenderPipelineReflection *)v24;
    v13 = v23;
    if (v12)
    {
      -[MTLRenderPipelineReflection vertexBindings](v12, "vertexBindings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_vertexUniformsIndex = -[TSDMetalShader p_indexOfUniformsFromMetalBindings:size:bufferIndex:](self, "p_indexOfUniformsFromMetalBindings:size:bufferIndex:", v14, &self->_vertexUniformsSize, &self->_bufferIndex);

      -[MTLRenderPipelineReflection fragmentBindings](v12, "fragmentBindings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_fragmentUniformsIndex = -[TSDMetalShader p_indexOfUniformsFromMetalBindings:size:bufferIndex:](self, "p_indexOfUniformsFromMetalBindings:size:bufferIndex:", v15, &self->_fragmentUniformsSize, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 89, CFSTR("Failed to create pipeline reflection object, error %@"), v13);

    }
    pipelineReflectionObject = self->_pipelineReflectionObject;
    self->_pipelineReflectionObject = v12;

    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v25 = 0;
    v11 = (void *)objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:error:", v8, &v25);
    v13 = v25;
    if (!v11)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, v21, 98, CFSTR("Failed to create pipeline state, error %@"), v13);

    }
  }

  return v11;
}

- (int64_t)p_indexOfUniformsFromMetalBindings:(id)a3 size:(unint64_t *)a4 bufferIndex:(unint64_t *)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    v20 = 0;
    v21 = -1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        TSUProtocolCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "type") && objc_msgSend(v12, "bufferDataType") == 1)
        {
          objc_msgSend(v11, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("uniforms"));

          v15 = objc_msgSend(v12, "index");
          v16 = v15;
          if (v14)
          {
            v8 = objc_msgSend(v12, "bufferDataSize");
            v21 = v16;
          }
          else
          {
            v20 = v15;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v20 = 0;
    v21 = -1;
  }
  if (a5)
    *a5 = v20;
  *a4 = v8;

  return v21;
}

- (void)p_setupPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8 setupUniforms:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MTLRenderPipelineState *v28;
  void *pipelineState;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;

  v34 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v17)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
    v21 = v20;
    if (v18)
    {
      objc_msgSend(v20, "colorAttachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:atIndexedSubscript:", v18, 0);

      if (v19)
      {
        objc_msgSend(v21, "colorAttachments");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:atIndexedSubscript:", v19, 1);

      }
      -[TSDMetalShader name](self, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[TSDMetalShader name](self, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLabel:", v25);

      }
      v26 = (void *)objc_msgSend(v17, "newFunctionWithName:", v34);
      if (v26)
      {
        objc_msgSend(v21, "setVertexFunction:", v26);
        v27 = (void *)objc_msgSend(v17, "newFunctionWithName:", v15);
        if (v27)
        {
          objc_msgSend(v21, "setFragmentFunction:", v27);
          -[TSDMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:](self, "p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:", v21, v16, a9);
          v28 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
          pipelineState = self->_pipelineState;
          self->_pipelineState = v28;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          pipelineState = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
          v33 = v16;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(pipelineState, "handleFailureInFunction:file:lineNumber:description:", v31, v32, 173, CFSTR("invalid nil value for '%s'"), "fragmentFunction");

          v16 = v33;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
        pipelineState = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", pipelineState, v30, 165, CFSTR("invalid nil value for '%s'"), "vertexFunction");

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
      pipelineState = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, pipelineState, 149, CFSTR("invalid nil value for '%s'"), "colorAttachment");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 141, CFSTR("Can't load shaders from nil library"));
  }

}

- (void)p_setupPipelineStateWithVertexFunction:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8 setupUniforms:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MTLRenderPipelineState *v27;
  void *pipelineState;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    pipelineState = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v26, pipelineState, 191, CFSTR("Can't load shaders from nil library"));
    goto LABEL_16;
  }
  v20 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  v21 = v20;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
    pipelineState = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", pipelineState, v29, 199, CFSTR("invalid nil value for '%s'"), "colorAttachment");
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v20, "colorAttachments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:atIndexedSubscript:", v18, 0);

  if (v19)
  {
    objc_msgSend(v21, "colorAttachments");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:atIndexedSubscript:", v19, 1);

  }
  -[TSDMetalShader name](self, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TSDMetalShader name](self, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLabel:", v25);

  }
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
    pipelineState = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", pipelineState, v29, 214, CFSTR("invalid nil value for '%s'"), "vertexFunction");
    goto LABEL_15;
  }
  objc_msgSend(v21, "setVertexFunction:");
  v26 = (void *)objc_msgSend(v17, "newFunctionWithName:", v15);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    pipelineState = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(pipelineState, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 222, CFSTR("invalid nil value for '%s'"), "fragmentFunction");

    goto LABEL_15;
  }
  objc_msgSend(v21, "setFragmentFunction:", v26);
  -[TSDMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:](self, "p_createPipelineStateWithRenderPipelineDescriptor:device:setupUniforms:", v21, v16, a9);
  v27 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  pipelineState = self->_pipelineState;
  self->_pipelineState = v27;
LABEL_16:

}

- (TSDMetalShader)initWithDefaultVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7 label:(id)a8 setupUniforms:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TSDMetalShader *v21;
  void *v22;
  uint64_t v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)TSDMetalShader;
  v21 = -[TSDMetalShader init](&v25, sel_init);
  if (v21)
  {
    +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v21->_name, a8);
    v21->_vertexUniformsIndex = -1;
    v21->_fragmentUniformsIndex = -1;
    LOBYTE(v24) = a9;
    -[TSDMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:](v21, "p_setupPipelineStateWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:", v15, v16, v17, v22, v18, v19, v24);

  }
  return v21;
}

- (id)initDefaultShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  TSDMetalShader *v17;
  uint64_t v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("_"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  LOBYTE(v19) = 1;
  v17 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", v13, v12, v11, v10, 0, v16, v19);

  return v17;
}

- (id)initDefaultTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  TSDMetalShader *v4;
  TSDMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"), CFSTR("TSDMetalShaderDefaultTexture_FragmentShader"), a3, a4, 0, CFSTR("Default Texture Shader"), v7);
  v5 = v4;
  if (v4)
    -[TSDMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
  return v5;
}

- (id)initDefaultTextureAndOpacityShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  TSDMetalShader *v4;
  TSDMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"), CFSTR("TSDMetalShaderDefaultOpacityTexture_FragmentShader"), a3, a4, 0, CFSTR("Default Texture and Opacity Shader"), v7);
  v5 = v4;
  if (v4)
  {
    -[TSDMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_217C2AA70;
  }
  return v5;
}

- (id)initDefaultGaussianBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 halfSizedRadius:(BOOL)a5
{
  const __CFString *v6;
  const __CFString *v7;
  TSDMetalShader *v8;
  TSDMetalShader *v9;
  uint64_t v11;

  if (a5)
    v6 = CFSTR("TSDMetalShaderDefaultHalfSizedRadiusGaussianBlur_FragmentShader");
  else
    v6 = CFSTR("TSDMetalShaderDefaultGaussianBlur_FragmentShader");
  if (a5)
    v7 = CFSTR("Default Gaussain Blur Shader with Radius 5");
  else
    v7 = CFSTR("Default Gaussian Blur Shader with Radius 9");
  LOBYTE(v11) = 0;
  v8 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"), v6, a3, a4, 0, v7, v11);
  v9 = v8;
  if (v8)
  {
    -[TSDMetalShader p_setDefaultVertexUniforms](v8, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v9->_fragmentUniformsIndex = xmmword_217C2AA80;
  }
  return v9;
}

- (id)initDefaultTextureMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5
{
  id result;
  uint64_t v6;

  LOBYTE(v6) = 0;
  result = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultMotionBlurTexture_VertexShader"), CFSTR("TSDMetalShaderDefaultMotionBlurTexture_FragmentShader"), a3, a4, a5, CFSTR("Default Texture Shader with Motion Blur"), v6);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_217C2AA90;
    *((_QWORD *)result + 7) = 1;
  }
  return result;
}

- (id)initDefaultTextureAndOpacityMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  _BOOL4 v6;
  const __CFString *v10;
  const __CFString *v11;
  id result;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;

  v6 = a6;
  if (v6)
    v10 = CFSTR("TSDMetalShaderDefaultMotionBlurTexture_VertexShader");
  else
    v10 = CFSTR("TSDMetalShaderDefaultTexture_VertexShader");
  if (v6)
    v11 = CFSTR("TSDMetalShaderDefaultMotionBlurOpacityTexture_FragmentShader");
  else
    v11 = CFSTR("TSDMetalShaderDefaultOpacityTexture_FragmentShader");
  LOBYTE(v15) = 0;
  result = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", v10, v11, a3, a4, a5, CFSTR("Default Texture and Opacity Shader with Motion Blur"), v15);
  if (result)
  {
    v13 = 64;
    if (v6)
      v13 = 192;
    v14 = !v6;
    *((_QWORD *)result + 1) = v14;
    *((_QWORD *)result + 2) = v13;
    *((_QWORD *)result + 3) = v14;
    *((_QWORD *)result + 4) = 4;
    *((_QWORD *)result + 7) = v6;
  }
  return result;
}

- (id)initDefaultBlendShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  _BOOL4 v6;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  TSDMetalShader *v13;
  TSDMetalShader *v14;
  uint64_t v16;

  v6 = a6;
  if (v6)
    v10 = CFSTR("TSDMetalShaderDefaultMotionBlurTexture_VertexShader");
  else
    v10 = CFSTR("TSDMetalShaderDefaultTexture_VertexShader");
  if (v6)
    v11 = CFSTR("TSDMetalShaderDefaultMotionBlurBlendTexture_FragmentShader");
  else
    v11 = CFSTR("TSDMetalShaderDefaultBlendTexture_FragmentShader");
  if (v6)
    v12 = CFSTR("Default Texture Blending Shader with Motion Blur");
  else
    v12 = CFSTR("Default Texture Blending Shader");
  LOBYTE(v16) = 0;
  v13 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", v10, v11, a3, a4, a5, v12, v16);
  v14 = v13;
  if (v13)
  {
    if (v6)
    {
      *(_OWORD *)&v13->_vertexUniformsIndex = xmmword_217C2AA90;
      v13->_bufferIndex = 1;
    }
    else
    {
      -[TSDMetalShader p_setDefaultVertexUniforms](v13, "p_setDefaultVertexUniforms");
    }
    *(_OWORD *)&v14->_fragmentUniformsIndex = xmmword_217C2AAA0;
  }
  return v14;
}

- (id)initDefaultVelocityCollectionShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id result;
  uint64_t v5;

  LOBYTE(v5) = 0;
  result = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalMotionBlurEffect_Collection_Vertex"), CFSTR("TSDMetalMotionBlurEffect_Collection_Fragment"), a3, a4, 0, CFSTR("Default Velocity Collection Shader"), v5);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_217C2AAB0;
    *(_OWORD *)((char *)result + 24) = xmmword_217C2AAC0;
    *((_QWORD *)result + 7) = 1;
  }
  return result;
}

- (id)initDefaultVelocityVisualizerShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  TSDMetalShader *v4;
  TSDMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"), CFSTR("TSDMetalMotionBlurEffect_Visualizer_Fragment"), a3, a4, 0, CFSTR("Default Velocity Visualizer Shader"), v7);
  v5 = v4;
  if (v4)
    -[TSDMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
  return v5;
}

- (id)initDefaultNeighborMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  TSDMetalShader *v4;
  TSDMetalShader *v5;
  uint64_t v7;

  LOBYTE(v7) = 0;
  v4 = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"), CFSTR("TSDMetalMotionBlurEffect_Neighbor_Fragment"), a3, a4, 0, CFSTR("Default Neighbor Max Shader"), v7);
  v5 = v4;
  if (v4)
  {
    -[TSDMetalShader p_setDefaultVertexUniforms](v4, "p_setDefaultVertexUniforms");
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_217C2AAB0;
  }
  return v5;
}

- (id)initDefaultTileMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id result;
  uint64_t v5;

  LOBYTE(v5) = 0;
  result = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalMotionBlurEffect_Tile_Vertex"), CFSTR("TSDMetalMotionBlurEffect_Tile_Fragment"), a3, a4, 0, CFSTR("Default Tile Max Shader"), v5);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_217C2AAD0;
    *(_OWORD *)((char *)result + 24) = xmmword_217C2AAE0;
    *((_QWORD *)result + 7) = 1;
  }
  return result;
}

- (id)initDefaultSingleDirectionMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id result;
  uint64_t v5;

  LOBYTE(v5) = 0;
  result = -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderMotionBlurSingleDirection_VertexShader"), CFSTR("TSDMetalShaderMotionBlurSingleDirection_FragmentShader"), a3, a4, 0, CFSTR("Default Single Direction Motion Blur Shader"), v5);
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_217C2AAF0;
    *(_OWORD *)((char *)result + 24) = xmmword_217C2AA70;
    *((_QWORD *)result + 7) = 0;
  }
  return result;
}

- (id)initDefaultBloomShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  return -[TSDMetalShader initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:](self, "initWithDefaultVertexShader:fragmentShader:device:colorAttachment:velocityAttachment:label:setupUniforms:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"), CFSTR("TSDMetalShaderBloom_FragmentShader"), a3, a4, 0, CFSTR("Default Bloom Shader"), v5);
}

- (void)p_setDefaultVertexUniforms
{
  *(_OWORD *)&self->_vertexUniformsIndex = xmmword_217C2AB00;
  self->_bufferIndex = 0;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TSDMetalShader *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *name;
  void *v27;
  uint64_t v29;
  id v30;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)TSDMetalShader;
  v20 = -[TSDMetalShader init](&v31, sel_init);
  if (v20)
  {
    v30 = v15;
    +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:library:](TSDMetalShaderLibraryLoader, "loadApplicationLibraryWithDevice:library:", v16, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("_"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v25;

    v20->_vertexUniformsIndex = -1;
    v20->_fragmentUniformsIndex = -1;
    v27 = (void *)objc_msgSend(v21, "newFunctionWithName:", v14);
    if (!v27)
      v27 = (void *)objc_msgSend(v22, "newFunctionWithName:", v14);
    LOBYTE(v29) = 1;
    v15 = v30;
    -[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:](v20, "p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:", v27, v30, v16, v22, v18, v19, v29);

  }
  return v20;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 library:(id)a6 colorAttachment:(id)a7
{
  return -[TSDMetalShader initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:](self, "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:velocityAttachment:", a3, a4, a5, a6, a7, 0);
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6
{
  return -[TSDMetalShader initQuadTextureShaderWithFragmentShader:device:library:colorAttachment:velocityAttachment:](self, "initQuadTextureShaderWithFragmentShader:device:library:colorAttachment:velocityAttachment:", a3, a4, a5, a6, 0);
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TSDMetalShader *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *name;
  void *v24;
  uint64_t v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TSDMetalShader;
  v17 = -[TSDMetalShader init](&v27, sel_init);
  if (v17)
  {
    +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:library:](TSDMetalShaderLibraryLoader, "loadApplicationLibraryWithDevice:library:", v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("_"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v22;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    v24 = (void *)objc_msgSend(v18, "newFunctionWithName:", CFSTR("TSDMetalShaderDefaultTexture_VertexShader"));
    if (!v24)
      v24 = (void *)objc_msgSend(v19, "newFunctionWithName:", CFSTR("TSDMetalShaderDefaultMotionBlurTexture_VertexShader"));
    LOBYTE(v26) = 1;
    -[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:](v17, "p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:", v24, v12, v13, v19, v15, v16, v26);

  }
  return v17;
}

- (id)initQuadMotionBlurTextureShaderWithFragmentShader:(id)a3 device:(id)a4 library:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TSDMetalShader *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *name;
  void *v24;
  uint64_t v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TSDMetalShader;
  v17 = -[TSDMetalShader init](&v27, sel_init);
  if (v17)
  {
    +[TSDMetalShaderLibraryLoader loadDefaultLibraryWithDevice:](TSDMetalShaderLibraryLoader, "loadDefaultLibraryWithDevice:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSDMetalShaderLibraryLoader loadApplicationLibraryWithDevice:library:](TSDMetalShaderLibraryLoader, "loadApplicationLibraryWithDevice:library:", v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("_"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v22;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    v24 = (void *)objc_msgSend(v18, "newFunctionWithName:", CFSTR("TSDMetalShaderDefaultMotionBlurTexture_VertexShader"));
    if (!v24)
      v24 = (void *)objc_msgSend(v19, "newFunctionWithName:", CFSTR("TSDMetalShaderDefaultMotionBlurTexture_VertexShader"));
    LOBYTE(v26) = 1;
    -[TSDMetalShader p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:](v17, "p_setupPipelineStateWithVertexFunction:fragmentShader:device:library:colorAttachment:velocityAttachment:setupUniforms:", v24, v12, v13, v19, v15, v16, v26);

  }
  return v17;
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5
{
  id v8;

  v8 = a3;
  objc_msgSend(v8, "pushDebugGroup:", self->_name);
  objc_msgSend(v8, "setRenderPipelineState:", self->_pipelineState);
  if ((self->_vertexUniformsIndex & 0x8000000000000000) == 0)
    objc_msgSend(v8, "setVertexBytes:length:atIndex:", a4, self->_vertexUniformsSize);
  if ((self->_fragmentUniformsIndex & 0x8000000000000000) == 0)
    objc_msgSend(v8, "setFragmentBytes:length:atIndex:", a5, self->_fragmentUniformsSize);

}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4
{
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", a3, a4, 0);
}

- (void)setPipelineStateWithEncoder:(id)a3 fragmentBytes:(const void *)a4
{
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", a3, 0, 0);
}

- (void)setPipelineStateWithEncoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "pushDebugGroup:", name);
  objc_msgSend(v5, "setRenderPipelineState:", self->_pipelineState);

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)TSDMetalShader;
  -[TSDMetalShader description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDMetalShader name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("Unnamed");
  if (v5)
    v7 = (const __CFString *)v5;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MTLRenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (MTLRenderPipelineReflection)pipelineReflectionObject
{
  return self->_pipelineReflectionObject;
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pipelineReflectionObject, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
}

@end
