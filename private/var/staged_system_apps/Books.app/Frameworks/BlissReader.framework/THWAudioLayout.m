@implementation THWAudioLayout

- (BOOL)usesTransportController
{
  return 1;
}

- (BOOL)usesTransportControllerControls
{
  return 1;
}

- (THWMovieInfo)movieInfo
{
  uint64_t v3;
  THWMovieInfo *result;

  v3 = objc_opt_class(THWMovieInfo);
  TSUDynamicCast(v3, -[THWAudioLayout info](self, "info"));
  return result;
}

- (void)updateChildrenFromInfo
{
  id v3;
  objc_super v4;

  if (-[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo"))
  {
    v3 = objc_msgSend(-[THWAudioLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", -[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo"), self);
    if (!v3)
      v3 = objc_msgSend(objc_alloc((Class)-[TSDImageInfo layoutClass](-[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo"), "layoutClass")), "initWithInfo:", -[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo"));
    -[THWAudioLayout setChildren:](self, "setChildren:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v3));

    objc_msgSend(-[THWAudioLayout children](self, "children"), "makeObjectsPerformSelector:", "updateChildrenFromInfo");
    -[THWAudioLayout invalidate](self, "invalidate");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THWAudioLayout;
    -[THWMovieLayout updateChildrenFromInfo](&v4, "updateChildrenFromInfo");
  }
}

- (id)layoutGeometryForLayout:(id)a3
{
  TSDImageInfo *v5;
  id v7;
  __int128 v8;
  objc_super v9;
  _OWORD v10[3];

  v5 = (TSDImageInfo *)objc_msgSend(a3, "info");
  if (v5 == -[THWMovieInfo posterImageInfo](-[THWAudioLayout movieInfo](self, "movieInfo"), "posterImageInfo"))
  {
    v7 = objc_alloc((Class)TSDLayoutGeometry);
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "geometry"), "size");
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v10[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    return objc_msgSend(v7, "initWithSize:transform:", v10);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWAudioLayout;
    return -[THWMovieLayout layoutGeometryForLayout:](&v9, "layoutGeometryForLayout:", a3);
  }
}

@end
