@implementation APPBShadowStyle

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear(&self->_offsets, a2);
  v3.receiver = self;
  v3.super_class = (Class)APPBShadowStyle;
  -[APPBShadowStyle dealloc](&v3, "dealloc");
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setOpacity:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_opacity = a3;
}

- (void)setHasOpacity:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOpacity
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRadius:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)offsetsCount
{
  return self->_offsets.count;
}

- (int)offsets
{
  return self->_offsets.list;
}

- (void)clearOffsets
{
  PBRepeatedInt32Clear(&self->_offsets, a2);
}

- (void)addOffset:(int)a3
{
  PBRepeatedInt32Add(&self->_offsets, *(_QWORD *)&a3);
}

- (int)offsetAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_offsets;
  unint64_t count;
  void *v6;
  void *v7;

  p_offsets = &self->_offsets;
  count = self->_offsets.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_offsets->list[a3];
}

- (void)setOffsets:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_offsets, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBShadowStyle;
  v3 = -[APPBShadowStyle description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBShadowStyle dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  color = self->_color;
  if (color)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](color, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("color"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_opacity;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("opacity"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_radius;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("radius"));

  }
  v10 = PBRepeatedInt32NSArray(&self->_offsets);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("offset"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBShadowStyleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBColor *color;
  char has;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_offsets;
  unint64_t v8;
  id v9;

  v4 = a3;
  color = self->_color;
  v9 = v4;
  if (color)
  {
    PBDataWriterWriteSubmessage(v4, color, 1);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField(v9, 2, self->_opacity);
    v4 = v9;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField(v9, 3, self->_radius);
    v4 = v9;
  }
  p_offsets = &self->_offsets;
  if (p_offsets->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field(v9, p_offsets->list[v8], 4);
      v4 = v9;
      ++v8;
    }
    while (v8 < p_offsets->count);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_color)
  {
    objc_msgSend(v4, "setColor:");
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = LODWORD(self->_opacity);
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 11) = LODWORD(self->_radius);
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (-[APPBShadowStyle offsetsCount](self, "offsetsCount"))
  {
    objc_msgSend(v9, "clearOffsets");
    v6 = -[APPBShadowStyle offsetsCount](self, "offsetsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addOffset:", -[APPBShadowStyle offsetAtIndex:](self, "offsetAtIndex:", i));
    }
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
  v7 = (void *)v5[4];
  v5[4] = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 10) = LODWORD(self->_opacity);
    *((_BYTE *)v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 11) = LODWORD(self->_radius);
    *((_BYTE *)v5 + 48) |= 2u;
  }
  PBRepeatedInt32Copy(v5 + 1, &self->_offsets);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  APPBColor *color;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_15;
  color = self->_color;
  if ((unint64_t)color | *((_QWORD *)v4 + 4))
  {
    if (!-[APPBColor isEqual:](color, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[48] & 1) == 0 || self->_opacity != *((float *)v4 + 10))
      goto LABEL_15;
  }
  else if ((v4[48] & 1) != 0)
  {
LABEL_15:
    IsEqual = 0;
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[48] & 2) == 0 || self->_radius != *((float *)v4 + 11))
      goto LABEL_15;
  }
  else if ((v4[48] & 2) != 0)
  {
    goto LABEL_15;
  }
  IsEqual = PBRepeatedInt32IsEqual(&self->_offsets, v4 + 8);
LABEL_16:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  float opacity;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float radius;
  float v12;
  float v13;
  float v14;

  v3 = -[APPBColor hash](self->_color, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    opacity = self->_opacity;
    v7 = -opacity;
    if (opacity >= 0.0)
      v7 = self->_opacity;
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
  if ((has & 2) != 0)
  {
    radius = self->_radius;
    v12 = -radius;
    if (radius >= 0.0)
      v12 = self->_radius;
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
  return v5 ^ v3 ^ v10 ^ PBRepeatedInt32Hash(&self->_offsets);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBColor *color;
  uint64_t v6;
  char v7;
  char *v8;
  char *v9;
  char *i;
  id v11;

  v4 = a3;
  color = self->_color;
  v6 = *((_QWORD *)v4 + 4);
  v11 = v4;
  if (color)
  {
    if (!v6)
      goto LABEL_7;
    -[APPBColor mergeFrom:](color, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[APPBShadowStyle setColor:](self, "setColor:");
  }
  v4 = v11;
LABEL_7:
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 1) != 0)
  {
    self->_opacity = *((float *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_radius = *((float *)v4 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = (char *)objc_msgSend(v4, "offsetsCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[APPBShadowStyle addOffset:](self, "addOffset:", objc_msgSend(v11, "offsetAtIndex:", i));
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

- (float)opacity
{
  return self->_opacity;
}

- (float)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
