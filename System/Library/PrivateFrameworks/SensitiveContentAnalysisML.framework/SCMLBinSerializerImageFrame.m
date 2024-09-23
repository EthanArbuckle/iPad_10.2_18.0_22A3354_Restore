@implementation SCMLBinSerializerImageFrame

- (SCMLBinSerializerImageFrame)initWithKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  SCMLBinSerializerImageFrame *v9;
  SCMLBinSerializerImageFrame *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCMLBinSerializerImageFrame;
  v9 = -[SCMLBinSerializerImageFrame init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    objc_storeStrong((id *)&v10->_imageData, a4);
  }

  return v10;
}

- (id)ciImage
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBF660]);
  -[SCMLBinSerializerImageFrame imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:", v4);

  return v5;
}

- (CGImage)cgImage
{
  id v3;
  void *v4;
  void *v5;
  CGImage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x24BDBF660]);
  -[SCMLBinSerializerImageFrame imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:", v4);

  if (v5)
  {
    v6 = (CGImage *)objc_msgSend(v5, "CGImage");
    if (!v6)
    {
      objc_msgSend(v5, "properties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x24BDD9698];
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD9698]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "properties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

      }
      else
      {
        v12 = 1;
      }
      objc_msgSend(v5, "imageByApplyingCGOrientation:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBF648], "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "extent");
      v6 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:", v13);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (__CVBuffer)pixelBuffer
{
  return -[SCMLBinSerializerImageFrame pixelBufferWithFormat:](self, "pixelBufferWithFormat:", 0);
}

- (__CVBuffer)pixelBufferWithFormat:(id)a3
{
  id v4;
  CGImage *v5;
  CGImage *v6;
  __CVBuffer *v7;

  v4 = a3;
  v5 = -[SCMLBinSerializerImageFrame cgImage](self, "cgImage");
  v6 = v5;
  if (v5)
  {
    v7 = (__CVBuffer *)pixelBufferFromCGImage(v5, v4);
    CGImageRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
