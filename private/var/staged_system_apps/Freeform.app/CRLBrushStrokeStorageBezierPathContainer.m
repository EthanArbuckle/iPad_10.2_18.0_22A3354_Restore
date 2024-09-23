@implementation CRLBrushStrokeStorageBezierPathContainer

- (CRLBrushStrokeStorageBezierPathContainer)initWithOriginalPath:(id)a3 pathWithPossibleSmoothing:(id)a4
{
  id v7;
  id v8;
  CRLBrushStrokeStorageBezierPathContainer *v9;
  CRLBrushStrokeStorageBezierPathContainer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLBrushStrokeStorageBezierPathContainer;
  v9 = -[CRLBrushStrokeStorageBezierPathContainer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalPath, a3);
    objc_storeStrong((id *)&v10->_pathWithPossibleSmoothing, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  objc_opt_class(CRLBrushStrokeStorageBezierPathContainer, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStrokeStorageBezierPathContainer originalPath](self, "originalPath")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalPath")),
        v11 = objc_msgSend(v9, "isEqual:", v10),
        v10,
        v9,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStrokeStorageBezierPathContainer pathWithPossibleSmoothing](self, "pathWithPossibleSmoothing"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathWithPossibleSmoothing"));
    v14 = objc_msgSend(v12, "isEqual:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStrokeStorageBezierPathContainer originalPath](self, "originalPath"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBrushStrokeStorageBezierPathContainer pathWithPossibleSmoothing](self, "pathWithPossibleSmoothing"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (CRLBezierPath)originalPath
{
  return self->_originalPath;
}

- (CRLBezierPath)pathWithPossibleSmoothing
{
  return self->_pathWithPossibleSmoothing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathWithPossibleSmoothing, 0);
  objc_storeStrong((id *)&self->_originalPath, 0);
}

@end
