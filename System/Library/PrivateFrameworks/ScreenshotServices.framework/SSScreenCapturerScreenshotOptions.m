@implementation SSScreenCapturerScreenshotOptions

- (UIImage)preparedImage
{
  return self->_preparedImage;
}

- (void)setPreparedImage:(id)a3
{
  objc_storeStrong((id *)&self->_preparedImage, a3);
}

- (unint64_t)externalFlashLayerRenderID
{
  return self->_externalFlashLayerRenderID;
}

- (void)setExternalFlashLayerRenderID:(unint64_t)a3
{
  self->_externalFlashLayerRenderID = a3;
}

- (unsigned)externalFlashLayerContextID
{
  return self->_externalFlashLayerContextID;
}

- (void)setExternalFlashLayerContextID:(unsigned int)a3
{
  self->_externalFlashLayerContextID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedImage, 0);
}

@end
