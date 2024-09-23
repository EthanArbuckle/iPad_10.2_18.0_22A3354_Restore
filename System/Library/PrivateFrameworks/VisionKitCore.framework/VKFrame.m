@implementation VKFrame

- (VNImageRequestHandler)imageRequestHandler
{
  return 0;
}

- (__CVBuffer)CVImageBuffer
{
  return 0;
}

- (VKFrameInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
