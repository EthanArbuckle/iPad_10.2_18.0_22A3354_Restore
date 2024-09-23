@implementation _UIDragMonitorSessionPreviewUpdate

- (_UIDragMonitorSessionPreviewUpdate)initWithPreviewAndImageComponentUpdate:(id)a3
{
  id v4;
  _UIDragMonitorSessionPreviewUpdate *v5;
  _UIDragMonitorSessionPreview *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _UIDragMonitorSessionPreview *preview;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragMonitorSessionPreviewUpdate;
  v5 = -[_UIDragMonitorSessionPreviewUpdate init](&v12, sel_init);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "index");
    v6 = [_UIDragMonitorSessionPreview alloc];
    objc_msgSend(v4, "imageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIDragMonitorSessionPreview initWithImageComponent:preview:](v6, "initWithImageComponent:preview:", v7, v8);
    preview = v5->_preview;
    v5->_preview = (_UIDragMonitorSessionPreview *)v9;

    v5->_isFromCurrentSession = objc_msgSend(v4, "isFromSource");
  }

  return v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (_UIDragMonitorSessionPreview)preview
{
  return self->_preview;
}

- (BOOL)isFromCurrentSession
{
  return self->_isFromCurrentSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
}

@end
