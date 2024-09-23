@implementation PNWallpaperCrop

- (PNWallpaperCrop)initWithAsset:(id)a3 orientation:(int64_t)a4 classification:(unint64_t)a5
{
  id v8;
  PNWallpaperCrop *v9;
  double v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNWallpaperCrop;
  v9 = -[PNWallpaperCrop init](&v12, sel_init);
  if (v9)
  {
    +[PNSuggestionWallpaperUtilities cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:](PNSuggestionWallpaperUtilities, "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v8, a5, &v9->_passesClockOverlap, &v9->_cropZoomRatio, a4);
    v9->_cropScore = v10;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PNWallpaperCrop cropScore](self, "cropScore");
  v5 = v4;
  -[PNWallpaperCrop cropZoomRatio](self, "cropZoomRatio");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{cropScore:%.3f, cropZoomRatio:%.3f, passesClockOverlap:%d}"), v5, v6, -[PNWallpaperCrop passesClockOverlap](self, "passesClockOverlap"));
}

- (double)cropScore
{
  return self->_cropScore;
}

- (BOOL)passesClockOverlap
{
  return self->_passesClockOverlap;
}

- (double)cropZoomRatio
{
  return self->_cropZoomRatio;
}

@end
