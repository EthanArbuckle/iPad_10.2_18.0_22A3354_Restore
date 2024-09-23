@implementation THWSceneInfo

- (THWSceneInfo)initWithContext:(id)a3 geometry:(id)a4 sourceURL:(id)a5 drmContext:(id)a6 stageColor:(id)a7
{
  THWSceneInfo *v10;
  THWSceneInfo *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THWSceneInfo;
  v10 = -[THWSceneInfo initWithContext:geometry:](&v13, "initWithContext:geometry:", a3, a4);
  v11 = v10;
  if (v10)
  {
    -[THWSceneInfo setIdleAnimationBehavior:](v10, "setIdleAnimationBehavior:", 0);
    -[THWSceneInfo setRotationConstraints:](v11, "setRotationConstraints:", 0);
    -[THWSceneInfo setSourceURL:](v11, "setSourceURL:", -[THWSceneInfo p_validateFileURL:](v11, "p_validateFileURL:", a5));
    -[THWSceneInfo setDrmContext:](v11, "setDrmContext:", a6);
    if (!a7)
      a7 = +[TSUColor clearColor](TSUColor, "clearColor");
    -[THWSceneInfo setStageColor:](v11, "setStageColor:", a7);
  }
  return v11;
}

- (THWSceneInfo)initWithContext:(id)a3 geometry:(id)a4
{
  return -[THWSceneInfo initWithContext:geometry:sourceURL:drmContext:stageColor:](self, "initWithContext:geometry:sourceURL:drmContext:stageColor:", a3, a4, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THWSceneInfo setSourceURL:](self, "setSourceURL:", 0);
  -[THWSceneInfo setStageColor:](self, "setStageColor:", 0);
  -[THWSceneInfo setPlaceholderImage:](self, "setPlaceholderImage:", 0);
  -[THWSceneInfo setDrmContext:](self, "setDrmContext:", 0);

  self->_progressKitID = 0;
  self->_progressKitSectionID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWSceneInfo;
  -[THWSceneInfo dealloc](&v3, "dealloc");
}

- (id)p_validateFileURL:(id)a3
{
  id v3;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (a3)
  {
    v6 = 0;
    v7 = 0;
    objc_msgSend(a3, "getResourceValue:forKey:error:", &v7, NSURLIsDirectoryKey, &v6);
    if (!objc_msgSend(v3, "isFileURL")
      || v6
      || objc_msgSend(v7, "BOOLValue")
      || !-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneInfo p_validateFileURL:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneInfo.m"), 90, CFSTR("Invalid sourceURL for widget %@: %@"), self, v3);
      return 0;
    }
  }
  return v3;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWSceneLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWSceneRep, a2);
}

- (THWPanelContentProvider)panelContentProvider
{
  return self->_panelContentProvider;
}

- (void)setPanelContentProvider:(id)a3
{
  self->_panelContentProvider = (THWPanelContentProvider *)a3;
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (PFDContext)drmContext
{
  return self->_drmContext;
}

- (void)setDrmContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (TSUColor)stageColor
{
  return self->_stageColor;
}

- (void)setStageColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (TSDImageInfo)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (int)idleAnimationBehavior
{
  return self->_idleAnimationBehavior;
}

- (void)setIdleAnimationBehavior:(int)a3
{
  self->_idleAnimationBehavior = a3;
}

- (int)rotationConstraints
{
  return self->_rotationConstraints;
}

- (void)setRotationConstraints:(int)a3
{
  self->_rotationConstraints = a3;
}

@end
