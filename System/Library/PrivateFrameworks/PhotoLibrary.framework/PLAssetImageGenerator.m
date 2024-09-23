@implementation PLAssetImageGenerator

- (PLAssetImageGenerator)initWithAsset:(id)a3
{
  PLAssetImageGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLAssetImageGenerator;
  v4 = -[PLAssetImageGenerator init](&v6, sel_init);
  if (v4)
    -[PLAssetImageGenerator setImageGenerator:](v4, "setImageGenerator:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", a3));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[AVAssetImageGenerator cancelAllCGImageGeneration](-[PLAssetImageGenerator imageGenerator](self, "imageGenerator"), "cancelAllCGImageGeneration");
  -[PLAssetImageGenerator setImageGenerator:](self, "setImageGenerator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PLAssetImageGenerator;
  -[PLAssetImageGenerator dealloc](&v3, sel_dealloc);
}

- (AVAssetImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setImageGenerator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

@end
