@implementation QLProxyingGenerationHandler

- (QLProxyingGenerationHandler)initWithGeneratorRequest:(id)a3
{
  id v5;
  QLProxyingGenerationHandler *v6;
  QLProxyingGenerationHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLProxyingGenerationHandler;
  v6 = -[QLProxyingGenerationHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_generatorRequest, a3);

  return v7;
}

- (void)didGenerateThumbnailForRequestWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9
{
  _BOOL8 v9;
  uint64_t v11;
  double height;
  double width;
  double y;
  double x;
  QLTGeneratorThumbnailRequest *generatorRequest;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  QLTGeneratorThumbnailRequest *v26;
  void *v27;
  id v28;

  v9 = a9;
  v11 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v28 = a5;
  generatorRequest = self->_generatorRequest;
  v19 = a4;
  -[QLTGeneratorThumbnailRequest addTypeToHandledTypes:](generatorRequest, "addTypeToHandledTypes:", a8);
  -[QLTGeneratorThumbnailRequest addTypeToSuccessfullyHandledTypes:](self->_generatorRequest, "addTypeToSuccessfullyHandledTypes:", a8);
  -[QLTGeneratorThumbnailRequest generationHandler](self->_generatorRequest, "generationHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didGenerateThumbnailForRequestWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:", v22, v19, v28, v11, a8, v9, x, y, width, height);

  objc_msgSend(v19, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (a8 == 2 && v9 && v23)
  {
    +[QLServerThread sharedInstance](QLServerThread, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_generatorRequest;
    objc_msgSend(v23, "format");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addImageData:toCacheForRequest:withBitmapFormat:contentRect:flavor:metadata:", v25, v26, v27, v11, v28, x, y, width, height);

  }
}

- (void)failedToGenerateThumbnailOfType:(int64_t)a3 forRequestWithUUID:(id)a4 error:(id)a5
{
  QLTGeneratorThumbnailRequest *generatorRequest;
  id v8;
  void *v9;
  void *v10;
  id v11;

  generatorRequest = self->_generatorRequest;
  v8 = a5;
  -[QLTGeneratorThumbnailRequest addTypeToHandledTypes:](generatorRequest, "addTypeToHandledTypes:", a3);
  -[QLTGeneratorThumbnailRequest generationHandler](self->_generatorRequest, "generationHandler");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "failedToGenerateThumbnailOfType:forRequestWithUUID:error:", a3, v10, v8);

}

- (void)didUpdateStatus:(int64_t)a3 ofThumbnailGenerationWithUUID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  -[QLTGeneratorThumbnailRequest generationHandler](self->_generatorRequest, "generationHandler", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didUpdateStatus:ofThumbnailGenerationWithUUID:", a3, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatorRequest, 0);
}

@end
