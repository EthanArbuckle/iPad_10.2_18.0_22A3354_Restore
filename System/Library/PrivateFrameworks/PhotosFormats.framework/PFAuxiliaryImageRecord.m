@implementation PFAuxiliaryImageRecord

- (double)sourceImageSizeMaxLength
{
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;

  -[PFAuxiliaryImageRecord sourceImageSize](self, "sourceImageSize");
  v4 = v3;
  -[PFAuxiliaryImageRecord sourceImageSize](self, "sourceImageSize");
  v6 = v5;
  -[PFAuxiliaryImageRecord sourceImageSize](self, "sourceImageSize");
  if (v4 <= v6)
    return v8;
  return result;
}

- (double)effectiveScaleFactorForDestinationImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  height = a3.height;
  width = a3.width;
  -[NSDictionary objectForKeyedSubscript:](self->_auxiliaryImageInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CBD128];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD128]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  v11 = *MEMORY[0x1E0CBCEA8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  if (v10 > v13)
    v14 = v7;
  else
    v14 = v11;
  objc_msgSend(v6, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  if (width <= height)
    width = height;
  -[PFAuxiliaryImageRecord sourceImageSizeMaxLength](self, "sourceImageSizeMaxLength");
  v19 = 1.0;
  if (width > 0.0 && v18 > 0.0)
  {
    -[PFAuxiliaryImageRecord sourceImageSizeMaxLength](self, "sourceImageSizeMaxLength");
    v19 = v17 / v20 / (v17 / width);
  }

  return v19;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)auxiliaryImageInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuxiliaryImageInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CGSize)sourceImageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_sourceImageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSourceImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_sourceImageSize, &v3, 16, 1, 0);
}

- (unsigned)sourceImageOrientation
{
  return self->_sourceImageOrientation;
}

- (void)setSourceImageOrientation:(unsigned int)a3
{
  self->_sourceImageOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
