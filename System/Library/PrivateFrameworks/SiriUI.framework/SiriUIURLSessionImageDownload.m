@implementation SiriUIURLSessionImageDownload

- (SiriUIURLSessionImageDownload)initWithFitToSize:(CGSize)a3 progressHandler:(id)a4 incremental:(BOOL)a5 client:(id)a6 fillColor:(id)a7
{
  _BOOL4 v9;
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  SiriUIURLSessionImageDownload *v16;
  SiriUIURLSessionImageDownload *v17;
  uint64_t v18;
  id progressHandler;
  NSMutableData *v20;
  NSMutableData *downloadedData;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  NSObject *v24;
  NSObject *v25;
  objc_super v27;

  v9 = a5;
  height = a3.height;
  width = a3.width;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SiriUIURLSessionImageDownload;
  v16 = -[SiriUIURLSessionImageDownload init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_fitToSize.width = width;
    v16->_fitToSize.height = height;
    v18 = objc_msgSend(v13, "copy");
    progressHandler = v17->_progressHandler;
    v17->_progressHandler = (id)v18;

    objc_storeStrong(&v17->_client, a6);
    objc_storeStrong((id *)&v17->_backgroundFillColor, a7);
    v20 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    downloadedData = v17->_downloadedData;
    v17->_downloadedData = v20;

    v22 = dispatch_queue_create("SiriUIURLSessionImageDownload", 0);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    v24 = v17->_queue;
    dispatch_get_global_queue(-32768, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v24, v25);

    if (v9)
      v17->_imageSource = CGImageSourceCreateIncremental(0);
  }

  return v17;
}

- (void)dealloc
{
  CGImageSource *imageSource;
  objc_super v4;

  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriUIURLSessionImageDownload;
  -[SiriUIURLSessionImageDownload dealloc](&v4, sel_dealloc);
}

- (void)_updateImageFromURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _BOOL4 finished;
  CGImageSource *imageSource;
  NSUInteger v10;
  NSMutableData *v11;
  void *v12;
  double v13;
  double v14;
  CGImage *ImageAtIndex;
  CGImage *v16;
  CGImageRef Copy;
  id v18;
  id v19;
  double width;
  double height;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  CGContext *CurrentContext;
  CGContext *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  NSObject *log;
  _QWORD block[4];
  id v53;
  id v54;
  BOOL v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  _BYTE v65[14];
  uint64_t v66;
  CGSize v67;
  CGSize v68;
  CGSize v69;
  CGSize v70;
  CGRect v71;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_hasSentFinished)
  {
    finished = self->_finished;
    imageSource = self->_imageSource;
    if (self->_finished || imageSource)
    {
      v10 = -[NSMutableData length](self->_downloadedData, "length");
      if (v10 > self->_lastUpdatedLength || self->_finished)
      {
        self->_lastUpdatedLength = v10;
        v11 = self->_downloadedData;
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scale");
        v14 = v13;

        if (imageSource)
        {
          CGImageSourceUpdateData(imageSource, (CFDataRef)v11, finished);
          if ((CGImageSourceGetStatus(imageSource) + 1) > 1
            || (ImageAtIndex = CGImageSourceCreateImageAtIndex(imageSource, 0, 0)) == 0)
          {
            v19 = self->_client;
            goto LABEL_30;
          }
          v16 = ImageAtIndex;
          Copy = CGImageCreateCopy(ImageAtIndex);
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Copy, 0, v14);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          CFRelease(Copy);
          CFRelease(v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:scale:", v11, v14);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        width = self->_fitToSize.width;
        height = self->_fitToSize.height;
        v19 = self->_client;
        if (v18)
        {
          objc_msgSend(v18, "size");
          v24 = v22;
          v25 = v23;
          if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
          {
            v28 = v23;
            v29 = v22;
            if (!finished)
            {
LABEL_39:
              v68.width = v29;
              v68.height = v28;
              UIGraphicsBeginImageContextWithOptions(v68, 0, v14);
              if (self->_backgroundFillColor)
              {
                CurrentContext = UIGraphicsGetCurrentContext();
                CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](self->_backgroundFillColor, "CGColor"));
                v43 = UIGraphicsGetCurrentContext();
                v71.origin.x = 0.0;
                v71.origin.y = 0.0;
                v71.size.width = v29;
                v71.size.height = v28;
                CGContextFillRect(v43, v71);
              }
              objc_msgSend(v18, "drawInRect:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v29, v28);
              UIGraphicsGetImageFromCurrentImageContext();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              UIGraphicsEndImageContext();
              v44 = (void *)*MEMORY[0x24BE08FB0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
              {
                log = v44;
                v69.width = v24;
                v69.height = v25;
                NSStringFromCGSize(v69);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v70.width = v29;
                v70.height = v28;
                NSStringFromCGSize(v70);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136316418;
                v57 = "-[SiriUIURLSessionImageDownload _updateImageFromURL:error:]";
                v58 = 2112;
                v59 = v50;
                v60 = 2112;
                v61 = v45;
                v62 = 2112;
                v63 = v19;
                v64 = 2112;
                *(_QWORD *)v65 = v6;
                *(_WORD *)&v65[8] = 1024;
                *(_DWORD *)&v65[10] = finished;
                _os_log_impl(&dword_21764F000, log, OS_LOG_TYPE_DEFAULT, "%s Loaded %@ (resized to %@) image for %@ from %@ (finished = %d)", buf, 0x3Au);

              }
LABEL_43:
              self->_newDataAvailableToRender = 0;
              v46 = (void *)MEMORY[0x219A0F948](self->_progressHandler);
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __59__SiriUIURLSessionImageDownload__updateImageFromURL_error___block_invoke;
              block[3] = &unk_24D7D9378;
              v53 = v38;
              v54 = v46;
              v55 = finished;
              v47 = v38;
              v48 = v46;
              dispatch_async(MEMORY[0x24BDAC9B8], block);
              self->_hasSentFinished = finished;

              goto LABEL_44;
            }
          }
          else
          {
            v27 = width != v22;
            if (height != v23)
              v27 = 1;
            if (v23 == 0.0)
              v27 = 0;
            if (v22 == 0.0)
              v27 = 0;
            if (!finished || v27)
            {
              v28 = v23;
              v29 = v22;
              if (v27)
              {
                v30 = width / (v22 / v23);
                v31 = height * (v22 / v25);
                if (v24 / v25 >= width / height)
                  v31 = width;
                else
                  v30 = height;
                v28 = round(v14 * v30) / v14;
                v29 = round(v14 * v31) / v14;
              }
              goto LABEL_39;
            }
          }
          v18 = v18;
          v39 = (void *)*MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            v67.width = v24;
            v67.height = v25;
            NSStringFromCGSize(v67);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v57 = "-[SiriUIURLSessionImageDownload _updateImageFromURL:error:]";
            v58 = 2112;
            v59 = v41;
            v60 = 2112;
            v61 = v19;
            v62 = 2112;
            v63 = v6;
            v64 = 1024;
            *(_DWORD *)v65 = 1;
            _os_log_impl(&dword_21764F000, v40, OS_LOG_TYPE_DEFAULT, "%s Loaded %@ image for %@ from %@ (finished = %d)", buf, 0x30u);

          }
          v38 = v18;
          goto LABEL_43;
        }
LABEL_30:
        v32 = (void *)*MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          v49 = v32;
          *(_DWORD *)buf = 136316418;
          v57 = "-[SiriUIURLSessionImageDownload _updateImageFromURL:error:]";
          v58 = 2114;
          v59 = v19;
          v60 = 2114;
          v61 = v6;
          v62 = 2114;
          v63 = v7;
          v64 = 1026;
          *(_DWORD *)v65 = finished;
          *(_WORD *)&v65[4] = 2050;
          *(_QWORD *)&v65[6] = -[NSMutableData length](v11, "length");
          _os_log_error_impl(&dword_21764F000, v49, OS_LOG_TYPE_ERROR, "%s Could not load image for %{public}@ from %{public}@: %{public}@ (finished = %{public}d, got %{public}ld bytes)", buf, 0x3Au);

        }
        v33 = (void *)MEMORY[0x24BDBCED8];
        AFAnalyticsContextCreateWithError();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dictionaryWithDictionary:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "absoluteString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("URL"));
        objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logEventWithType:context:", 1425, v35);

        v18 = 0;
        v38 = 0;
        goto LABEL_43;
      }
    }
  }
LABEL_44:

}

uint64_t __59__SiriUIURLSessionImageDownload__updateImageFromURL_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)appendDownloadedData:(id)a3 fromURL:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SiriUIURLSessionImageDownload *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke;
  block[3] = &unk_24D7D93C8;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  dispatch_source_t v4;
  id v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id v9;
  id location;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "appendData:", *(_QWORD *)(a1 + 32));
    *((_BYTE *)v3 + 64) = 1;
    if (!v3[7])
    {
      if (v3[9])
      {
        v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v3[6]);
        v5 = v3[7];
        v3[7] = v4;

        if (v3[7])
        {
          objc_initWeak(&location, *(id *)(a1 + 40));
          dispatch_source_set_timer((dispatch_source_t)v3[7], 0, 0x1DCD6500uLL, 0x2FAF080uLL);
          v6 = v3[7];
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke_2;
          handler[3] = &unk_24D7D93A0;
          objc_copyWeak(&v9, &location);
          v8 = *(id *)(a1 + 48);
          dispatch_source_set_event_handler(v6, handler);
          dispatch_resume((dispatch_object_t)v3[7]);

          objc_destroyWeak(&v9);
          objc_destroyWeak(&location);
        }
      }
    }
  }

}

void __62__SiriUIURLSessionImageDownload_appendDownloadedData_fromURL___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[64])
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateImageFromURL:error:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v3;
  }

}

- (void)finishedFromURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SiriUIURLSessionImageDownload_finishedFromURL_error___block_invoke;
  block[3] = &unk_24D7D93C8;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SiriUIURLSessionImageDownload_finishedFromURL_error___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  NSObject **v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 88) = 1;
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_updateImageFromURL:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = v6;
    v4 = v6[7];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v6[7];
      v6[7] = 0;

      v3 = v6;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundFillColor, 0);
  objc_storeStrong((id *)&self->_renderTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_downloadedData, 0);
}

@end
