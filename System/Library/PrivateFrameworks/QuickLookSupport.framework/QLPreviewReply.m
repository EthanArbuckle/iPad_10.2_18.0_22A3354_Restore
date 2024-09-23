@implementation QLPreviewReply

- (QLPreviewReply)init
{
  QLPreviewReply *v2;
  QLPreviewReply *v3;
  NSDictionary *attachments;
  NSDictionary *v5;
  NSString *title;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLPreviewReply;
  v2 = -[QLPreviewReply init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_wantsBorder = 1;
    attachments = v2->_attachments;
    v5 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v2->_stringEncoding = 4;
    v2->_attachments = v5;

    title = v3->_title;
    v3->_title = (NSString *)&stru_24C71BF60;

  }
  return v3;
}

- (QLPreviewReply)initWithViewControllerOfPreferredContentSize:(CGSize)a3 minimumSize:(CGSize)a4 title:(id)a5 wantsBorder:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double v9;
  double v10;
  id v12;
  QLPreviewReply *v13;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v9 = a3.height;
  v10 = a3.width;
  v12 = a5;
  v13 = (QLPreviewReply *)objc_opt_new();
  -[QLPreviewReply setTitle:](v13, "setTitle:", v12);

  -[QLPreviewReply setContentSize:](v13, "setContentSize:", v10, v9);
  -[QLPreviewReply setMinimumSize:](v13, "setMinimumSize:", width, height);
  -[QLPreviewReply setWantsBorder:](v13, "setWantsBorder:", v6);
  -[QLPreviewReply setReplyType:](v13, "setReplyType:", 5);

  return v13;
}

- (QLPreviewReply)initWithViewControllerOfPreferredContentSize:(CGSize)a3 title:(id)a4 wantsBorder:(BOOL)a5
{
  return -[QLPreviewReply initWithViewControllerOfPreferredContentSize:minimumSize:title:wantsBorder:](self, "initWithViewControllerOfPreferredContentSize:minimumSize:title:wantsBorder:", a4, a5, a3.width, a3.height, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (QLPreviewReply)initWithContextSize:(CGSize)contextSize isBitmap:(BOOL)isBitmap drawingBlock:(void *)drawingBlock
{
  _BOOL4 v5;
  double height;
  double width;
  void *v9;
  QLPreviewReply *v10;
  _QWORD *v11;

  v5 = isBitmap;
  height = contextSize.height;
  width = contextSize.width;
  v9 = drawingBlock;
  v10 = (QLPreviewReply *)objc_opt_new();
  -[QLPreviewReply setReplyType:](v10, "setReplyType:", !v5);
  -[QLPreviewReply setDrawInContextBlock:](v10, "setDrawInContextBlock:", v9);

  -[QLPreviewReply setContentSize:](v10, "setContentSize:", width, height);
  v11 = (_QWORD *)MEMORY[0x24BDF8410];
  if (!v5)
    v11 = (_QWORD *)MEMORY[0x24BDF84E0];
  -[QLPreviewReply setContentType:](v10, "setContentType:", *v11);

  return v10;
}

- (QLPreviewReply)initForPDFWithPageSize:(CGSize)defaultPageSize documentCreationBlock:(void *)documentCreationBlock
{
  double height;
  double width;
  void *v7;
  QLPreviewReply *v8;

  height = defaultPageSize.height;
  width = defaultPageSize.width;
  v7 = documentCreationBlock;
  v8 = (QLPreviewReply *)objc_opt_new();
  -[QLPreviewReply setReplyType:](v8, "setReplyType:", 2);
  -[QLPreviewReply setContentSize:](v8, "setContentSize:", width, height);
  -[QLPreviewReply setDocumentCreationBlock:](v8, "setDocumentCreationBlock:", v7);

  -[QLPreviewReply setContentType:](v8, "setContentType:", *MEMORY[0x24BDF84E0]);
  return v8;
}

- (QLPreviewReply)initWithFileURL:(NSURL *)fileURL
{
  return -[QLPreviewReply initWithFileURL:forcedContentType:](self, "initWithFileURL:forcedContentType:", fileURL, 0);
}

- (QLPreviewReply)initWithFileURL:(id)a3 forcedContentType:(id)a4
{
  id v6;
  id v7;
  QLPreviewReply *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (QLPreviewReply *)objc_opt_new();
  -[QLPreviewReply setReplyType:](v8, "setReplyType:", 3);
  if (v6)
  {
    v9 = objc_alloc(MEMORY[0x24BDE5F10]);
    v10 = (void *)objc_msgSend(v9, "initWithURL:sandboxType:", v6, *MEMORY[0x24BDAC000]);
    -[QLPreviewReply setFileURLHandler:](v8, "setFileURLHandler:", v10);

    if (v7)
    {
      -[QLPreviewReply setContentType:](v8, "setContentType:", v7);
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDF8238];
      objc_msgSend(MEMORY[0x24BDE5F18], "UTIForURL:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "typeWithIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewReply setContentType:](v8, "setContentType:", v13);

    }
  }

  return v8;
}

- (QLPreviewReply)initWithDataOfContentType:(UTType *)contentType contentSize:(CGSize)contentSize dataCreationBlock:(void *)dataCreationBlock
{
  double height;
  double width;
  void *v9;
  UTType *v10;
  QLPreviewReply *v11;

  height = contentSize.height;
  width = contentSize.width;
  v9 = dataCreationBlock;
  v10 = contentType;
  v11 = (QLPreviewReply *)objc_opt_new();
  -[QLPreviewReply setReplyType:](v11, "setReplyType:", 4);
  -[QLPreviewReply setContentType:](v11, "setContentType:", v10);

  -[QLPreviewReply setContentSize:](v11, "setContentSize:", width, height);
  -[QLPreviewReply setDataCreationBlock:](v11, "setDataCreationBlock:", v9);

  return v11;
}

- (void)updateWithImageData:(id)a3 bitmapFormat:(id)a4
{
  id v6;

  v6 = a4;
  -[QLPreviewReply setData:](self, "setData:", a3);
  -[QLPreviewReply setBitmapFormat:](self, "setBitmapFormat:", v6);

}

- (id)updateFromDataCreationBlock
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v7;

  -[QLPreviewReply dataCreationBlock](self, "dataCreationBlock");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[QLPreviewReply dataCreationBlock](self, "dataCreationBlock");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = 0;
    ((void (**)(_QWORD, QLPreviewReply *, id *))v4)[2](v4, self, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    -[QLPreviewReply setData:](self, "setData:", v5);

  }
  return v3;
}

- (id)drawWithContext:(CGContext *)a3
{
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[QLPreviewReply drawInContextBlock](self, "drawInContextBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[QLPreviewReply drawInContextBlock](self, "drawInContextBlock");
    v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = ((uint64_t (**)(_QWORD, CGContext *, QLPreviewReply *, id *))v6)[2](v6, a3, self, &v12);
    v8 = v12;

    v9 = 0;
    if ((v7 & 1) == 0)
      return v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("Unable to render preview");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("QuickLookPreviewErrors"), 3, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }

  v8 = (id)v9;
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  -[QLPreviewReply contentType](self, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("contentType"));

  -[QLPreviewReply data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("data"));

  objc_msgSend(v16, "encodeInteger:forKey:", -[QLPreviewReply stringEncoding](self, "stringEncoding"), CFSTR("stringEncoding"));
  -[QLPreviewReply attachments](self, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("attachments"));

  -[QLPreviewReply fileURLHandler](self, "fileURLHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("fileURL"));

  -[QLPreviewReply bitmapFormat](self, "bitmapFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("bitmapFormat"));

  -[QLPreviewReply title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("title"));

  -[QLPreviewReply contentSize](self, "contentSize");
  *(float *)&v10 = v10;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("contentWidth"), v10);
  -[QLPreviewReply contentSize](self, "contentSize");
  *(float *)&v12 = v11;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("contentHeight"), v12);
  -[QLPreviewReply minimumSize](self, "minimumSize");
  *(float *)&v13 = v13;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("minimumWidth"), v13);
  -[QLPreviewReply minimumSize](self, "minimumSize");
  *(float *)&v15 = v14;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("minimumHeight"), v15);
  objc_msgSend(v16, "encodeBool:forKey:", -[QLPreviewReply wantsBorder](self, "wantsBorder"), CFSTR("wantsBorder"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[QLPreviewReply replyType](self, "replyType"), CFSTR("replyType"));

}

- (QLPreviewReply)initWithCoder:(id)a3
{
  id v4;
  QLPreviewReply *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  float v18;
  float v19;
  double v20;
  float v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)QLPreviewReply;
  v5 = -[QLPreviewReply init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewReply setContentType:](v5, "setContentType:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewReply setData:](v5, "setData:", v7);

    -[QLPreviewReply setStringEncoding:](v5, "setStringEncoding:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stringEncoding")));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("attachments"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewReply setAttachments:](v5, "setAttachments:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewReply setFileURLHandler:](v5, "setFileURLHandler:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitmapFormat"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewReply setBitmapFormat:](v5, "setBitmapFormat:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewReply setTitle:](v5, "setTitle:", v15);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("contentWidth"));
    v17 = v16;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("contentHeight"));
    -[QLPreviewReply setContentSize:](v5, "setContentSize:", v17, v18);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minimumWidth"));
    v20 = v19;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minimumHeight"));
    -[QLPreviewReply setMinimumSize:](v5, "setMinimumSize:", v20, v21);
    -[QLPreviewReply setWantsBorder:](v5, "setWantsBorder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsBorder")));
    -[QLPreviewReply setReplyType:](v5, "setReplyType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("replyType")));
  }

  return v5;
}

- (NSStringEncoding)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(NSStringEncoding)stringEncoding
{
  self->_stringEncoding = stringEncoding;
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttachments:(NSDictionary *)attachments
{
  objc_setProperty_atomic_copy(self, a2, attachments, 24);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_atomic_copy(self, a2, title, 32);
}

- (unint64_t)replyType
{
  return self->_replyType;
}

- (void)setReplyType:(unint64_t)a3
{
  self->_replyType = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_contentSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_contentSize, &v3, 16, 1, 0);
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_minimumSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMinimumSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_minimumSize, &v3, 16, 1, 0);
}

- (QLURLHandler)fileURLHandler
{
  return (QLURLHandler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileURLHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (QLTBitmapFormat)bitmapFormat
{
  return (QLTBitmapFormat *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBitmapFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)wantsBorder
{
  return self->_wantsBorder;
}

- (void)setWantsBorder:(BOOL)a3
{
  self->_wantsBorder = a3;
}

- (id)drawInContextBlock
{
  return self->_drawInContextBlock;
}

- (void)setDrawInContextBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)documentCreationBlock
{
  return self->_documentCreationBlock;
}

- (void)setDocumentCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)dataCreationBlock
{
  return self->_dataCreationBlock;
}

- (void)setDataCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataCreationBlock, 0);
  objc_storeStrong(&self->_documentCreationBlock, 0);
  objc_storeStrong(&self->_drawInContextBlock, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_fileURLHandler, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
