@implementation PLPhotoEditImportProperties

+ (id)importPropertiesWithEXIFOrientation:(int64_t)a3
{
  return (id)objc_msgSend(a1, "importPropertiesWithEXIFOrientation:duration:", a3, 0.0);
}

+ (id)importPropertiesWithEXIFOrientation:(int64_t)a3 duration:(double)a4
{
  double *v6;
  int64_t v7;

  v6 = (double *)objc_alloc_init((Class)a1);
  if ((unint64_t)(a3 - 1) >= 8)
    v7 = 1;
  else
    v7 = a3;
  *((_QWORD *)v6 + 1) = v7;
  v6[2] = a4;
  return v6;
}

- (int64_t)baseEXIFOrientation
{
  return self->_baseEXIFOrientation;
}

- (double)baseDuration
{
  return self->_baseDuration;
}

@end
