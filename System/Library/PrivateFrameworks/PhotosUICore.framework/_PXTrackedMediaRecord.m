@implementation _PXTrackedMediaRecord

- (_PXTrackedMediaRecord)initWithMedia:(id)a3 mediaKind:(int64_t)a4 timestamp:(double)a5
{
  id v9;
  _PXTrackedMediaRecord *v10;
  _PXTrackedMediaRecord *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXTrackedMediaRecord;
  v10 = -[_PXTrackedMediaRecord init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_media, a3);
    v11->_mediaKind = a4;
    v11->_timestamp = a5;
  }

  return v11;
}

- (id)media
{
  return self->_media;
}

- (int64_t)mediaKind
{
  return self->_mediaKind;
}

- (_PXTrackedMediaRecord)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaViewControllerEventTracker.m"), 210, CFSTR("%s is not available as initializer"), "-[_PXTrackedMediaRecord init]");

  abort();
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_media, 0);
}

@end
