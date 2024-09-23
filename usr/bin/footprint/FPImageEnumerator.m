@implementation FPImageEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
}

@end
