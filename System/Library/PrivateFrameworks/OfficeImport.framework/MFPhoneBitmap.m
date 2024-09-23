@implementation MFPhoneBitmap

- (id)getImage
{
  OITSUImage *v3;
  OITSUImage *m_image;

  if (!self->m_image && !-[MFBitmap isEmpty](self, "isEmpty"))
  {
    v3 = -[OITSUImage initWithData:]([OITSUImage alloc], "initWithData:", self->super.m_bmpData);
    m_image = self->m_image;
    self->m_image = v3;

  }
  return self->m_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_image, 0);
}

@end
