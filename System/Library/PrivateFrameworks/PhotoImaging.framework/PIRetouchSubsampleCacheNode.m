@implementation PIRetouchSubsampleCacheNode

- (id)_modifyEvaluatedGeometry:(id)a3
{
  return a3;
}

- (id)retouchInputNode
{
  void *i;
  uint64_t v3;

  -[NUCacheNode inputNode](self, "inputNode");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); ; i = (void *)v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
    }
    objc_msgSend(i, "inputNode");
    v3 = objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "evaluationMode") == 1
    && (v17[0] = 0,
        v17[1] = 0,
        v10 = (void *)MEMORY[0x1E0D52300],
        v11 = objc_msgSend(v9, "scale"),
        objc_msgSend(v10, "subsampleFactorForScale:additionalScale:", v11, v12, v17) == 1))
  {
    -[NUCacheNode inputNode](self, "inputNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PIRetouchSubsampleCacheNode;
    -[PIRetouchCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v16, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  return objc_msgSend(MEMORY[0x1E0D52300], "subsampleFactorForScale:additionalScale:", a3.var0, a3.var1, v4);
}

- (int64_t)padding
{
  return 5;
}

- (void)_updateInputRegion:(id)a3 outputRegion:(id)a4 forStroke:(id)a5 geometry:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _BYTE v23[32];
  __int128 v24;
  __int128 v25;
  _BYTE v26[32];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v22 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sourceOffset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("y"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v15, "doubleValue");
  v41 = 0u;
  v42 = 0u;
  if (v11)
    objc_msgSend(v11, "extent");
  +[PIRepairUtilities brushStrokeFromRetouchStrokeDictionary:](PIRepairUtilities, "brushStrokeFromRetouchStrokeDictionary:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v39 = 0u;
  v40 = 0u;
  if (v16)
  {
    objc_msgSend(v16, "extent");
  }
  else
  {
    v37 = 0uLL;
    v38 = 0uLL;
  }
  NUPixelRectIntersection();
  v35 = 0u;
  v36 = 0u;
  memset(v34, 0, sizeof(v34));
  memset(v33, 0, sizeof(v33));
  objc_msgSend(v17, "radius");
  v19 = v18;
  v20 = NUPixelPointFromCGPoint();
  v31 = v41;
  v32 = v42;
  v29 = v39;
  v30 = v40;
  +[PIRepairUtilities calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:](PIRepairUtilities, "calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:", v20, v21, &v31, &v29, &v35, v34, v19, v33);
  v29 = v35;
  v30 = v36;
  NUPixelRectFlipYOrigin();
  v35 = v31;
  v36 = v32;
  -[NUCacheNode subsampleFactor](self, "subsampleFactor");
  -[PIRetouchSubsampleCacheNode padding](self, "padding");
  v29 = v35;
  v30 = v36;
  NUPixelRectDilate();
  v35 = v31;
  v36 = v32;
  NUScaleMake();
  objc_msgSend(v11, "scaledSize");
  v31 = 0u;
  v32 = 0u;
  v29 = v35;
  v30 = v36;
  NUPixelRectScaleRational();
  v29 = 0u;
  v30 = 0u;
  NUAlignPixelRectToPixelGrid();
  v27 = v29;
  v28 = v30;
  NUPixelRectIntersection();
  objc_msgSend(v12, "addRect:", v26);

  v27 = 0u;
  v28 = 0u;
  NUAlignPixelRectToPixelGrid();
  v24 = v27;
  v25 = v28;
  NUPixelRectIntersection();
  objc_msgSend(v22, "addRect:", v23);

}

- (void)resolveWithInputImage:(id)a3 retouchStrokes:(id)a4 cacheKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  PIRetouchSubsampleSourceNode *v11;
  void *v12;
  void *v13;
  PIRetouchSubsampleSourceNode *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [PIRetouchSubsampleSourceNode alloc];
  -[NURenderNode settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("detectedFaces"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PIRetouchSourceNode initWithInputImage:retouchStrokes:detectedFaces:cacheKey:](v11, "initWithInputImage:retouchStrokes:detectedFaces:cacheKey:", v10, v9, v13, v8);

  -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v14, 0);
}

@end
