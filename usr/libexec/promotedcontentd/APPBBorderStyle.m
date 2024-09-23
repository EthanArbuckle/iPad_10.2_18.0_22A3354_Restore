@implementation APPBBorderStyle

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setWidth:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCornerRadius:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cornerRadius = a3;
}

- (void)setHasCornerRadius:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCornerRadius
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBBorderStyle;
  v3 = -[APPBBorderStyle description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBBorderStyle dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  APPBColor *color;
  void *v6;
  char has;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  color = self->_color;
  if (color)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](color, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("color"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_width;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("width"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_cornerRadius;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cornerRadius"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBBorderStyleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBColor *color;
  char has;
  id v7;

  v4 = a3;
  color = self->_color;
  v7 = v4;
  if (color)
  {
    PBDataWriterWriteSubmessage(v4, color, 1);
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField(v7, 2, self->_width);
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField(v7, 3, self->_cornerRadius);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_color)
  {
    v6 = v4;
    objc_msgSend(v4, "setColor:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_width);
    *((_BYTE *)v4 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_cornerRadius);
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBColor copyWithZone:](self->_color, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = LODWORD(self->_width);
    *((_BYTE *)v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = LODWORD(self->_cornerRadius);
    *((_BYTE *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBColor *color;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_13;
  color = self->_color;
  if ((unint64_t)color | *((_QWORD *)v4 + 1))
  {
    if (!-[APPBColor isEqual:](color, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_width != *((float *)v4 + 5))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_cornerRadius != *((float *)v4 + 4))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  float width;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float cornerRadius;
  float v12;
  float v13;
  float v14;

  v3 = -[APPBColor hash](self->_color, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    width = self->_width;
    v7 = -width;
    if (width >= 0.0)
      v7 = self->_width;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    cornerRadius = self->_cornerRadius;
    v12 = -cornerRadius;
    if (cornerRadius >= 0.0)
      v12 = self->_cornerRadius;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBColor *color;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  color = self->_color;
  v6 = *((_QWORD *)v4 + 1);
  if (color)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[APPBColor mergeFrom:](color, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[APPBBorderStyle setColor:](self, "setColor:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 24);
  if ((v7 & 2) != 0)
  {
    self->_width = *((float *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 24);
  }
  if ((v7 & 1) != 0)
  {
    self->_cornerRadius = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (APPBColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (float)width
{
  return self->_width;
}

- (float)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
