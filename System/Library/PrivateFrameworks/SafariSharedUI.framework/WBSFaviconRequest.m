@implementation WBSFaviconRequest

- (WBSFaviconRequest)initWithURL:(id)a3 extraInfo:(id)a4
{

  return 0;
}

- (WBSFaviconRequest)initWithDomain:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  WBSFaviconRequest *v12;

  height = a4.height;
  width = a4.width;
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(CFSTR("http://"), "stringByAppendingString:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", v11, 1, a5, 0, 0, width, height);

  }
  else
  {
    v12 = (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", 0, 1, a5, 0, 0, a4.width, a4.height);
  }

  return v12;
}

- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5
{
  return (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", a3, 0, a5, 0, 0, a4.width, a4.height);
}

- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5 isURLTypedByUser:(BOOL)a6
{
  return (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", a3, 0, a5, a6, 0, a4.width, a4.height);
}

- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5 iconDownloadingEnabled:(BOOL)a6
{
  return (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", a3, 0, a5, 0, a6, a4.width, a4.height);
}

- (id)_initWithURL:(id)a3 type:(unint64_t)a4 iconSize:(CGSize)a5 fallbackType:(unint64_t)a6 isURLTypedByUser:(BOOL)a7 iconDownloadingEnabled:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WBSFaviconRequest *v23;
  WBSFaviconRequest *v24;
  objc_super v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v8 = a8;
  v9 = a7;
  height = a5.height;
  width = a5.width;
  v28[5] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("iconSizeExtraInfoKey");
  v15 = (void *)MEMORY[0x1E0CB3B18];
  v16 = a3;
  objc_msgSend(v15, "valueWithCGSize:", width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = CFSTR("fallbackTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  v27[2] = CFSTR("requestTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  v27[3] = CFSTR("isURLTypedByUserKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v20;
  v27[4] = CFSTR("isIconDownloadingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v26.receiver = self;
  v26.super_class = (Class)WBSFaviconRequest;
  v23 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v26, sel_initWithURL_extraInfo_, v16, v22);

  if (v23)
    v24 = v23;

  return v23;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
}

- (CGSize)iconSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iconSizeExtraInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (unint64_t)fallbackType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_numberForKey:", CFSTR("fallbackTypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)type
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_numberForKey:", CFSTR("requestTypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)isURLTypedByUser
{
  void *v2;
  char v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:", CFSTR("isURLTypedByUserKey"));

  return v3;
}

- (BOOL)isIconDownloadingEnabled
{
  void *v2;
  char v3;

  -[WBSSiteMetadataRequest extraInfo](self, "extraInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:", CFSTR("isIconDownloadingEnabled"));

  return v3;
}

@end
