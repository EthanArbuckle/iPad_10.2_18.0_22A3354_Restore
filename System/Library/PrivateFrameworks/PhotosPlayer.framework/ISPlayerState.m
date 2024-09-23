@implementation ISPlayerState

- (double)videoAlpha
{
  return self->_videoAlpha;
}

- (ISPlayerState)initWithPhotoBlurRadius:(double)a3 videoAlpha:(double)a4 videoBlurRadius:(double)a5 label:(id)a6
{
  id v10;
  ISPlayerState *v11;
  ISPlayerState *v12;
  uint64_t v13;
  NSString *diagnosticLabel;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ISPlayerState;
  v11 = -[ISPlayerState init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_photoBlurRadius = a3;
    v11->_videoAlpha = a4;
    v11->_videoBlurRadius = a5;
    v13 = objc_msgSend(v10, "copy");
    diagnosticLabel = v12->_diagnosticLabel;
    v12->_diagnosticLabel = (NSString *)v13;

  }
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISPlayerState;
  -[ISPlayerState description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n\t\tlabel:\t\t%@"), self->_diagnosticLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\n\t\tphoto:\t\t      b:%f"), *(_QWORD *)&self->_photoBlurRadius);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n\t\tvideo:\t\ta:%f, b:%f"), *(_QWORD *)&self->_videoAlpha, *(_QWORD *)&self->_videoBlurRadius);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)diagnosticLabel
{
  return self->_diagnosticLabel;
}

- (double)photoBlurRadius
{
  return self->_photoBlurRadius;
}

- (double)videoBlurRadius
{
  return self->_videoBlurRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLabel, 0);
}

+ (id)outputInfoWithPhotoBlurRadius:(double)a3 videoAlpha:(double)a4 videoBlurRadius:(double)a5 label:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhotoBlurRadius:videoAlpha:videoBlurRadius:label:", v10, a3, a4, a5);

  return v11;
}

@end
