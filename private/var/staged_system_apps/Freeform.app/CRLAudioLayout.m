@implementation CRLAudioLayout

- (CRLAudioLayout)initWithInfo:(id)a3
{
  CRLAudioLayout *v3;
  CRLAudioLayout *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLAudioLayout;
  v3 = -[CRLMediaLayout initWithInfo:](&v7, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioLayout movieInfo](v3, "movieInfo"));
    if (!v5)
    {

      v4 = 0;
    }
    -[CRLCanvasLayout invalidateFrame](v4, "invalidateFrame");

  }
  return v4;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;

  v3 = a3;
  memset(&v13, 0, sizeof(v13));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "fullTransform");
  else
    memset(&v13, 0, sizeof(v13));

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "transformInRoot");
      else
        memset(&t2, 0, sizeof(t2));
      v10 = v13;
      CGAffineTransformConcat(&v12, &v10, &t2);
      v13 = v12;

    }
  }
  v12 = v13;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  return CGRectApplyAffineTransform(v14, &v12);
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  CGSize result;

  +[CRLMovieItem defaultAudioItemSize](_TtC8Freeform12CRLMovieItem, "defaultAudioItemSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)supportsFlipping
{
  return 0;
}

- (_TtC8Freeform12CRLMovieItem)movieInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLMovieItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLMovieItem *)v8;
}

- (id)computeLayoutGeometry
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo"));
  *(_QWORD *)&v5 = objc_opt_class(CRLStroke, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaLayout stroke](self, "stroke", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10 && objc_msgSend(v10, "shouldRender"))
  {
    objc_msgSend(v10, "renderedWidth");
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometryByOutsettingBy:", v11 * 0.5, v11 * 0.5));

    v3 = (void *)v12;
  }
  objc_msgSend(v3, "size");
  -[CRLMediaLayout setBoundsForStandardKnobs:](self, "setBoundsForStandardKnobs:", sub_10005FDDC());

  return v3;
}

@end
