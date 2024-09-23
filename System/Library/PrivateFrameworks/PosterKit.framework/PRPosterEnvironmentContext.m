@implementation PRPosterEnvironmentContext

+ (id)environmentContextWithMode:(int64_t)a3 isPreview:(BOOL)a4 previewContent:(unint64_t)a5 isSnapshot:(BOOL)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMode:isPreview:previewContent:isSnapshot:", a3, a4, a5, a6);
}

+ (id)environmentContextForSettings:(id)a3
{
  id v4;
  uint64_t IsPreview;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "pui_content");
  IsPreview = PUIRenderingContentIsPreview();
  v6 = objc_msgSend(v4, "pui_isSnapshot");
  v7 = objc_msgSend(v4, "pui_mode");
  v8 = objc_msgSend(v4, "pui_previewContent");

  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMode:isPreview:previewContent:isSnapshot:", v7, IsPreview, v8, v6);
}

- (PRPosterEnvironmentContext)initWithMode:(int64_t)a3 isPreview:(BOOL)a4 previewContent:(unint64_t)a5 isSnapshot:(BOOL)a6
{
  PRPosterEnvironmentContext *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRPosterEnvironmentContext;
  result = -[PRPosterEnvironmentContext init](&v11, sel_init);
  if (result)
  {
    result->_preview = a4;
    result->_snapshot = a6;
    result->_mode = a3;
    result->_previewContent = a5;
  }
  return result;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (unint64_t)previewContent
{
  return self->_previewContent;
}

- (BOOL)isSnapshot
{
  return self->_snapshot;
}

@end
