@implementation PXGVideoSessionPixelBufferSource

- (PXGVideoSessionPixelBufferSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGVideoSessionPixelBufferSource.m"), 28, CFSTR("%s is not available as initializer"), "-[PXGVideoSessionPixelBufferSource init]");

  abort();
}

- (PXGVideoSessionPixelBufferSource)initWithVideoSession:(id)a3 maxOutputSize:(CGSize)a4
{
  double height;
  double width;
  id v8;
  PXGVideoSessionPixelBufferSource *v9;
  PXGVideoSessionPixelBufferSource *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *bufferRequestIdentifier;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGVideoSessionPixelBufferSource;
  v9 = -[PXGVideoSessionPixelBufferSource init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoSession, a3);
    v10->_maxOutputSize.width = width;
    v10->_maxOutputSize.height = height;
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "initWithFormat:", CFSTR("%@-%@"), v12, v14);
    bufferRequestIdentifier = v10->_bufferRequestIdentifier;
    v10->_bufferRequestIdentifier = (NSString *)v15;

    objc_msgSend(v8, "registerChangeObserver:context:", v10, VideoSessionObservableContext);
    objc_msgSend(v8, "requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:", v10->_bufferRequestIdentifier, width, height);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PXVideoSession cancelPixelBufferOutputWithRequestIdentifier:](self->_videoSession, "cancelPixelBufferOutputWithRequestIdentifier:", self->_bufferRequestIdentifier);
  v3.receiver = self;
  v3.super_class = (Class)PXGVideoSessionPixelBufferSource;
  -[PXGVideoSessionPixelBufferSource dealloc](&v3, sel_dealloc);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  void *v9;
  void (**v10)(void);
  void (**v11)(void);
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  if ((void *)VideoSessionObservableContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGVideoSessionPixelBufferSource.m"), 60, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x400) != 0)
  {
    -[PXGVideoSessionPixelBufferSource pixelBufferDidChangeHandler](self, "pixelBufferDidChangeHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PXGVideoSessionPixelBufferSource pixelBufferDidChangeHandler](self, "pixelBufferDidChangeHandler");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();

    }
  }
  if ((v6 & 0x20) != 0)
  {
    -[PXGVideoSessionPixelBufferSource videoSession](self, "videoSession");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPlayable") & 1) != 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[PXGVideoSessionPixelBufferSource providePlaceholderHandler](self, "providePlaceholderHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PXGVideoSessionPixelBufferSource providePlaceholderHandler](self, "providePlaceholderHandler");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)setProvidePlaceholderHandler:(id)a3
{
  void *v4;
  id providePlaceholderHandler;
  id v6;
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  providePlaceholderHandler = self->_providePlaceholderHandler;
  self->_providePlaceholderHandler = v4;

  -[PXGVideoSessionPixelBufferSource videoSession](self, "videoSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isPlayable") & 1) != 0)
  {

  }
  else
  {
    v6 = self->_providePlaceholderHandler;

    if (v6)
      (*((void (**)(void))self->_providePlaceholderHandler + 2))();
  }
}

- (__CVBuffer)currentPixelBuffer
{
  void *v2;
  __CVBuffer *v3;

  -[PXGVideoSessionPixelBufferSource videoSession](self, "videoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CVBuffer *)objc_msgSend(v2, "currentPixelBuffer");

  return v3;
}

- (CGAffineTransform)preferredTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[PXGVideoSessionPixelBufferSource videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "preferredTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (id)pixelBufferDidChangeHandler
{
  return self->_pixelBufferDidChangeHandler;
}

- (void)setPixelBufferDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)providePlaceholderHandler
{
  return self->_providePlaceholderHandler;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (CGSize)maxOutputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxOutputSize.width;
  height = self->_maxOutputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong(&self->_providePlaceholderHandler, 0);
  objc_storeStrong(&self->_pixelBufferDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_bufferRequestIdentifier, 0);
}

@end
