@implementation CRCompositeOutputRegion

- (CRCompositeOutputRegion)outputRegionWithContentsOfQuad:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCompositeOutputRegion;
  -[CROutputRegion outputRegionWithContentsOfQuad:](&v5, sel_outputRegionWithContentsOfQuad_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldComputeBoundsFromChildren:", 1);
  return (CRCompositeOutputRegion *)v3;
}

- (CRCompositeOutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRCompositeOutputRegion;
  -[CROutputRegion outputRegionWithContentsBetweenStartPoint:endPoint:](&v6, sel_outputRegionWithContentsBetweenStartPoint_endPoint_, a3.x, a3.y, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldComputeBoundsFromChildren:", 1);
  return (CRCompositeOutputRegion *)v4;
}

- (CRCompositeOutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRCompositeOutputRegion;
  -[CROutputRegion outputRegionWithContentsOfCharacterRange:](&v9, sel_outputRegionWithContentsOfCharacterRange_, a3.location, a3.length);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingQuad");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(v3, "children"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v3, "setShouldComputeBoundsFromChildren:", 1);
  }
  return (CRCompositeOutputRegion *)v3;
}

- (void)setShouldComputeBoundsFromChildren:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRCompositeOutputRegion;
  -[CROutputRegion setShouldComputeBoundsFromChildren:](&v5, sel_setShouldComputeBoundsFromChildren_);
  if (v3)
    -[CROutputRegion setBoundingQuad:](self, "setBoundingQuad:", 0);
}

- (unint64_t)textRegionType
{
  return 3;
}

@end
