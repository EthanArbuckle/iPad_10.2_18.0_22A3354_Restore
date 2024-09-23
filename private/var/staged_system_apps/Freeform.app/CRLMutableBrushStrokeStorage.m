@implementation CRLMutableBrushStrokeStorage

- (CRLMutableBrushStrokeStorage)init
{
  CRLMutableBrushStrokeStorage *v2;
  uint64_t v3;
  NSMutableDictionary *paths;
  uint64_t v5;
  NSMutableDictionary *bounds;
  uint64_t v7;
  NSMutableDictionary *textureIndices;
  uint64_t v9;
  NSMutableDictionary *options;
  uint64_t v11;
  NSMutableDictionary *lineEnds;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRLMutableBrushStrokeStorage;
  v2 = -[CRLMutableBrushStrokeStorage init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    paths = v2->_paths;
    v2->_paths = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    bounds = v2->_bounds;
    v2->_bounds = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    textureIndices = v2->_textureIndices;
    v2->_textureIndices = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    options = v2->_options;
    v2->_options = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    lineEnds = v2->_lineEnds;
    v2->_lineEnds = (NSMutableDictionary *)v11;

  }
  return v2;
}

- (unint64_t)totalSectionCount
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMutableBrushStrokeStorage paths](self, "paths"));
  v3 = +[CRLImmutableBrushStrokeStorage p_totalSectionCountWithPaths:](CRLImmutableBrushStrokeStorage, "p_totalSectionCountWithPaths:", v2);

  return v3;
}

- (void)setImage:(id)a3
{
  CRLImage *v4;
  CRLImage *image;

  v4 = (CRLImage *)objc_msgSend(a3, "copy");
  image = self->_image;
  self->_image = v4;

}

- (void)addPath:(id)a3 withBounds:(CGRect)a4 shouldSmooth:(BOOL)a5 forKey:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CRLBrushStrokeStorageBezierPathContainer *v19;
  id v20;
  CRLBrushStrokeStorageBezierPathContainer *v21;
  void *v22;
  void *v23;
  id v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v24 = a3;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v13));
  if (!v14)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_paths, "setObject:forKeyedSubscript:", v14, v13);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bounds, "objectForKeyedSubscript:", v13));
  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bounds, "setObject:forKeyedSubscript:", v15, v13);
    if (a5)
      goto LABEL_5;
LABEL_7:
    v16 = objc_msgSend(v24, "copy");
    goto LABEL_8;
  }
  if (!a5)
    goto LABEL_7;
LABEL_5:
  v16 = (id)objc_claimAutoreleasedReturnValue(+[CRLMutableBrushStrokeStorage p_smoothPath:](CRLMutableBrushStrokeStorage, "p_smoothPath:", v24));
LABEL_8:
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v13));
  v19 = [CRLBrushStrokeStorageBezierPathContainer alloc];
  v20 = objc_msgSend(v24, "copy");
  v21 = -[CRLBrushStrokeStorageBezierPathContainer initWithOriginalPath:pathWithPossibleSmoothing:](v19, "initWithOriginalPath:pathWithPossibleSmoothing:", v20, v17);
  objc_msgSend(v18, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bounds, "objectForKeyedSubscript:", v13));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  objc_msgSend(v22, "addObject:", v23);

}

+ (id)p_smoothPath:(id)a3
{
  return +[CRLBezierPath smoothBezierPath:withThreshold:](CRLBezierPath, "smoothBezierPath:withThreshold:", a3, 0.05);
}

- (void)addTextureIndex:(unint64_t)a3 forKey:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_textureIndices, "objectForKeyedSubscript:"));
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_textureIndices, "setObject:forKeyedSubscript:", v6, v8);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v6, "addObject:", v7);

}

- (void)setOption:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *options;
  id v6;
  id v7;

  options = self->_options;
  v6 = a4;
  v7 = objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](options, "setObject:forKey:", v7, v6);

}

- (void)setLineEnd:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *lineEnds;
  id v6;
  id v7;
  CRLLineEnd *v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  CRLLineEnd *v19;
  id v20;

  lineEnds = self->_lineEnds;
  v6 = a4;
  v7 = a3;
  v8 = [CRLLineEnd alloc];
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = objc_msgSend(v20, "copy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wrapPath"));
  v11 = objc_msgSend(v10, "copy");
  objc_msgSend(v7, "endPoint");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v7, "isFilled");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v18 = objc_msgSend(v7, "lineJoin");

  v19 = -[CRLLineEnd initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](v8, "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", v9, v11, v16, v17, v18, v13, v15);
  -[NSMutableDictionary setObject:forKey:](lineEnds, "setObject:forKey:", v19, v6);

}

- (id)deepCopy
{
  CRLImmutableBrushStrokeStorage *v2;
  void *v3;

  v2 = -[CRLImmutableBrushStrokeStorage initWithImage:paths:bounds:textureIndices:options:lineEnds:]([CRLImmutableBrushStrokeStorage alloc], "initWithImage:paths:bounds:textureIndices:options:lineEnds:", self->_image, self->_paths, self->_bounds, self->_textureIndices, self->_options, self->_lineEnds);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImmutableBrushStrokeStorage deepCopy](v2, "deepCopy"));

  return v3;
}

- (CRLImage)image
{
  return self->_image;
}

- (NSDictionary)paths
{
  return &self->_paths->super;
}

- (NSDictionary)bounds
{
  return &self->_bounds->super;
}

- (NSDictionary)textureIndices
{
  return &self->_textureIndices->super;
}

- (NSDictionary)options
{
  return &self->_options->super;
}

- (NSDictionary)lineEnds
{
  return &self->_lineEnds->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_lineEnds, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textureIndices, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
