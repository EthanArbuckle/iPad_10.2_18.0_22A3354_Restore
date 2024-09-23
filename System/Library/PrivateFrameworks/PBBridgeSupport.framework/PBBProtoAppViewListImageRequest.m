@implementation PBBProtoAppViewListImageRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoAppViewListImageRequest;
  -[PBBProtoAppViewListImageRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoAppViewListImageRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_scale;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scale"));

  *(float *)&v6 = self->_width;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("width"));

  *(float *)&v8 = self->_height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("height"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoAppViewListImageRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_scale);
  *((_DWORD *)a3 + 4) = LODWORD(self->_width);
  *((_DWORD *)a3 + 2) = LODWORD(self->_height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_scale);
  *((_DWORD *)result + 4) = LODWORD(self->_width);
  *((_DWORD *)result + 2) = LODWORD(self->_height);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  BOOL v5;

  v4 = (float *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_scale == v4[3]
    && self->_width == v4[4]
    && self->_height == v4[2];

  return v5;
}

- (unint64_t)hash
{
  float scale;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float width;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  float height;
  float v22;
  float v23;
  float v24;
  float v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  scale = self->_scale;
  v4 = -scale;
  if (scale >= 0.0)
    v4 = self->_scale;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  width = self->_width;
  v13 = -width;
  if (width >= 0.0)
    v13 = self->_width;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = fmodf(v14, 1.8447e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  height = self->_height;
  v22 = -height;
  if (height >= 0.0)
    v22 = self->_height;
  v23 = floorf(v22 + 0.5);
  v24 = (float)(v22 - v23) * 1.8447e19;
  v25 = fmodf(v23, 1.8447e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabsf(v24);
  if (v24 >= 0.0)
    v28 = v27;
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_scale = *((float *)a3 + 3);
  self->_width = *((float *)a3 + 4);
  self->_height = *((float *)a3 + 2);
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (float)width
{
  return self->_width;
}

- (void)setWidth:(float)a3
{
  self->_width = a3;
}

- (float)height
{
  return self->_height;
}

- (void)setHeight:(float)a3
{
  self->_height = a3;
}

@end
