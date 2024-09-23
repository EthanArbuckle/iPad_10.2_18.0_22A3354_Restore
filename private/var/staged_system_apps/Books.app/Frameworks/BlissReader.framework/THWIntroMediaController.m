@implementation THWIntroMediaController

- (THWIntroMediaController)initWithDocumentRoot:(id)a3
{
  THWIntroMediaController *v4;
  id v5;
  unsigned int v6;
  TSPData *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWIntroMediaController;
  v4 = -[THWIntroMediaController init](&v9, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "properties");
    if (!objc_msgSend(v5, "introMediaUrl"))
      goto LABEL_8;
    v4->_documentRoot = (THDocumentRoot *)a3;
    v4->_url = (NSURL *)objc_msgSend(v5, "introMediaUrl");
    v6 = objc_msgSend(v5, "introMediaIsVideo");
    v4->_isMovie = v6;
    if (v6)
    {
      v4->_imageData = 0;
    }
    else
    {
      v7 = (TSPData *)-[THBookDescription dataForAbsoluteURL:context:](-[THDocumentRoot bookDescription](v4->_documentRoot, "bookDescription"), "dataForAbsoluteURL:context:", v4->_url, -[THDocumentRoot context](v4->_documentRoot, "context"));
      v4->_imageData = v7;
      if (v7)
        objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "addInterestInProviderForData:", v4->_imageData);
    }
    if (!-[THWIntroMediaController info](v4, "info"))
    {
LABEL_8:

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_imageData)
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "removeInterestInProviderForData:", self->_imageData);

  -[THWAutosizedCanvasController setDelegate:](self->_controlsCanvasController, "setDelegate:", 0);
  -[THWAutosizedCanvasController teardown](self->_controlsCanvasController, "teardown");

  v3.receiver = self;
  v3.super_class = (Class)THWIntroMediaController;
  -[THWIntroMediaController dealloc](&v3, "dealloc");
}

- (NSURL)url
{
  return self->_url;
}

- (TSDInfo)info
{
  AVAsset *v4;
  NSArray *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  _QWORD v15[6];
  _QWORD v16[6];
  CMTime time;

  if (self->_info)
    return self->_info;
  if (!self->_isMovie)
  {
    +[TSDBitmapImageProvider naturalSizeForImageData:](TSDBitmapImageProvider, "naturalSizeForImageData:", self->_imageData);
    if (v6 <= 0.0)
      return self->_info;
    v8 = v7;
    if (v7 <= 0.0)
      return self->_info;
    v9 = v6;
    v10 = objc_alloc_init((Class)TSSPropertyMap);
    v11 = objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", -[THDocumentRoot context](self->_documentRoot, "context"), 0, v10, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1A02E4;
    v15[3] = &unk_426E28;
    v15[4] = self;
    v15[5] = v11;
    objc_msgSend(-[THDocumentRoot accessController](-[THWIntroMediaController documentRoot](self, "documentRoot"), "accessController"), "performWrite:", v15);
    v12 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", v9, v8);
    self->_info = (TSDInfo *)-[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", -[THDocumentRoot context](self->_documentRoot, "context"), v12, v11, self->_imageData, 0);

LABEL_13:
    return self->_info;
  }
  v4 = +[AVAsset assetWithURL:](AVAsset, "assetWithURL:", self->_url);
  v5 = -[AVAsset tracksWithMediaType:](v4, "tracksWithMediaType:", AVMediaTypeVideo);
  if (-[NSArray count](v5, "count"))
  {
    if (v4)
      -[AVAsset duration](v4, "duration");
    else
      memset(&time, 0, sizeof(time));
    if (CMTimeGetSeconds(&time) > 0.0)
    {
      objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "naturalSize");
      v12 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithSize:", v13, v14);
      v10 = objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", -[THDocumentRoot context](self->_documentRoot, "context"), 0, 0, 0);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1A02B8;
      v16[3] = &unk_426E28;
      v16[4] = self;
      v16[5] = v10;
      objc_msgSend(-[THDocumentRoot accessController](-[THWIntroMediaController documentRoot](self, "documentRoot"), "accessController"), "performWrite:", v16);
      self->_info = (TSDInfo *)-[THWMovieInfo initWithContext:geometry:style:movieRemoteURL:loadedAsset:]([THWMovieInfo alloc], "initWithContext:geometry:style:movieRemoteURL:loadedAsset:", -[THDocumentRoot context](self->_documentRoot, "context"), v12, v10, self->_url, v4);
      goto LABEL_13;
    }
  }
  return self->_info;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[TSDInfo geometry](-[THWIntroMediaController info](self, "info"), "geometry"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIView)controlsView
{
  return (UIView *)objc_msgSend(-[THWIntroMediaController p_controlsCanvasController](self, "p_controlsCanvasController"), "canvasView");
}

- (void)hostViewSizeDidChange
{
  -[THWAutosizedCanvasController invalidateLayoutsAndFrames](self->_controlsCanvasController, "invalidateLayoutsAndFrames");
  -[THWIntroMediaController p_positionControlPanel](self, "p_positionControlPanel");
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v3;
  double v4;
  id v5;
  __int128 v6;
  _OWORD v8[3];

  -[THWIntroMediaControllerDelegate hostViewSizeForIntroMediaController:](self->_delegate, "hostViewSizeForIntroMediaController:", self);
  v4 = v3;
  v5 = objc_alloc((Class)TSDLayoutGeometry);
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return objc_msgSend(v5, "initWithSize:transform:", v8, v4, 59.0);
}

- (id)autosizedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return 0;
}

- (void)autosizedCanvasControllerDidResize:(id)a3
{
  if (a3)
  {
    if (self->_controlsCanvasController == a3)
      -[THWIntroMediaController p_positionControlPanel](self, "p_positionControlPanel");
  }
}

- (BOOL)autosizedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)autosizedCanvasController:(id)a3 allowsSelectionForRep:(id)a4
{
  return 0;
}

- (BOOL)allowSelectionPopoverForAutosizedCanvasController:(id)a3
{
  return 0;
}

- (id)autosizedCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  return 0;
}

- (id)p_controlsCanvasController
{
  THWAutosizedCanvasController *v3;
  id v4;

  if (!self->_controlsCanvasController && self->_isMovie)
  {
    v3 = -[THWAutosizedCanvasController initWithDelegate:documentRoot:]([THWAutosizedCanvasController alloc], "initWithDelegate:documentRoot:", self, -[THWIntroMediaController documentRoot](self, "documentRoot"));
    self->_controlsCanvasController = v3;
    -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](-[THWAutosizedCanvasController interactiveCanvasController](v3, "interactiveCanvasController"), "setCreateRepsForOffscreenLayouts:", 1);
    v4 = -[THWIntroMediaControllerDelegate controlsInfoForIntroMediaController:](self->_delegate, "controlsInfoForIntroMediaController:", self);
    if (v4)
      -[TSDInteractiveCanvasController setInfosToDisplay:](-[THWAutosizedCanvasController interactiveCanvasController](self->_controlsCanvasController, "interactiveCanvasController"), "setInfosToDisplay:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
  }
  return self->_controlsCanvasController;
}

- (void)p_positionControlPanel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_controlsCanvasController)
  {
    -[THWIntroMediaControllerDelegate hostViewSizeForIntroMediaController:](self->_delegate, "hostViewSizeForIntroMediaController:", self);
    v4 = v3;
    v6 = v5;
    -[TSDCanvasView frame](-[THWAutosizedCanvasController canvasView](self->_controlsCanvasController, "canvasView"), "frame");
    if (v7 >= 59.0)
      v8 = v7;
    else
      v8 = 59.0;
    -[TSDCanvasView setFrame:](-[THWAutosizedCanvasController canvasView](self->_controlsCanvasController, "canvasView"), "setFrame:", 0.0, v6 + -59.0 + -40.0, v4, v8);
  }
}

- (THWIntroMediaControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWIntroMediaControllerDelegate *)a3;
}

- (BOOL)isMovie
{
  return self->_isMovie;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

@end
