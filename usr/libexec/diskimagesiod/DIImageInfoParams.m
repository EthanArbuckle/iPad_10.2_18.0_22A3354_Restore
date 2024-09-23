@implementation DIImageInfoParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIImageInfoParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  DIImageInfoParams *v7;
  DIImageInfoParams *v8;
  DIImageInfoParams *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIImageInfoParams;
  v7 = -[DIBaseParams initWithURL:error:](&v11, "initWithURL:error:", v6, a4);
  v8 = v7;
  if (v7
    && (v7->_extraInfo = 0,
        v7->_openEncryption = 1,
        !-[DIBaseParams openExistingImageWithFlags:error:](v7, "openExistingImageWithFlags:error:", 0, a4)))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (DIImageInfoParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIImageInfoParams *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  DIImageInfoParams *v14;
  objc_super v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputURL"));
  v16.receiver = self;
  v16.super_class = (Class)DIImageInfoParams;
  v8 = -[DIBaseParams initWithURL:error:](&v16, "initWithURL:error:", v7, a4);

  if (!v8)
    goto LABEL_3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diskImageParamsXPC"));
  -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v8, "shadowChain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shadowChain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodes"));
  v13 = objc_msgSend(v10, "addShadowNodes:error:", v12, a4);

  if ((v13 & 1) == 0)
    v14 = 0;
  else
LABEL_3:
    v14 = v8;

  return v14;
}

- (BOOL)retrieveWithError:(id *)a3
{
  DIClient2Controller_XPCHandler *v5;
  void *v6;
  _BOOL8 v7;
  BOOL v8;
  NSDictionary *v9;
  NSDictionary *imageInfo;
  _QWORD *v11;
  CFTypeRef cf;
  _QWORD *v14;

  if (-[DIImageInfoParams openEncryption](self, "openEncryption"))
  {
    v5 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (!-[DIClient2Controller_XPCHandler connectWithError:](v5, "connectWithError:", a3)
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v5, 2, a3))
    {

      return 0;
    }

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v7 = -[DIImageInfoParams extraInfo](self, "extraInfo");
  if (v6)
    objc_msgSend(v6, "getImageInfoWithExtra:error:", v7, a3);
  else
    v14 = 0;

  v8 = v14 != 0;
  if (v14)
  {
    (*(void (**)(CFTypeRef *__return_ptr))(*(_QWORD *)((char *)v14 + *(_QWORD *)(*v14 - 96)) + 16))(&cf);
    v9 = (NSDictionary *)CFRetain(cf);
    imageInfo = self->_imageInfo;
    self->_imageInfo = v9;

    sub_100012138(&cf);
    v11 = v14;
    v14 = 0;
    if (v11)
      (*(void (**)(_QWORD *))(*v11 + 8))(v11);
  }
  return v8;
}

- (NSDictionary)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)extraInfo
{
  return self->_extraInfo;
}

- (void)setExtraInfo:(BOOL)a3
{
  self->_extraInfo = a3;
}

- (BOOL)openEncryption
{
  return self->_openEncryption;
}

- (void)setOpenEncryption:(BOOL)a3
{
  self->_openEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfo, 0);
}

@end
