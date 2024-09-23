@implementation APPBButtonStyle

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (BOOL)hasHighlightedColor
{
  return self->_highlightedColor != 0;
}

- (BOOL)hasDisabledColor
{
  return self->_disabledColor != 0;
}

- (BOOL)hasTextColor
{
  return self->_textColor != 0;
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

- (BOOL)hasBorderStyle
{
  return self->_borderStyle != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBButtonStyle;
  v3 = -[APPBButtonStyle description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBButtonStyle dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  APPBColor *color;
  void *v6;
  APPBColor *highlightedColor;
  void *v8;
  APPBColor *disabledColor;
  void *v10;
  APPBColor *textColor;
  void *v12;
  void *v13;
  APPBBorderStyle *borderStyle;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  color = self->_color;
  if (color)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](color, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("color"));

  }
  highlightedColor = self->_highlightedColor;
  if (highlightedColor)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](highlightedColor, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("highlightedColor"));

  }
  disabledColor = self->_disabledColor;
  if (disabledColor)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](disabledColor, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("disabledColor"));

  }
  textColor = self->_textColor;
  if (textColor)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](textColor, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("textColor"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_cornerRadius;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cornerRadius"));

  }
  borderStyle = self->_borderStyle;
  if (borderStyle)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APPBBorderStyle dictionaryRepresentation](borderStyle, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("borderStyle"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBButtonStyleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBColor *color;
  APPBColor *highlightedColor;
  APPBColor *disabledColor;
  APPBColor *textColor;
  APPBBorderStyle *borderStyle;
  id v10;

  v4 = a3;
  color = self->_color;
  v10 = v4;
  if (color)
  {
    PBDataWriterWriteSubmessage(v4, color, 1);
    v4 = v10;
  }
  highlightedColor = self->_highlightedColor;
  if (highlightedColor)
  {
    PBDataWriterWriteSubmessage(v10, highlightedColor, 2);
    v4 = v10;
  }
  disabledColor = self->_disabledColor;
  if (disabledColor)
  {
    PBDataWriterWriteSubmessage(v10, disabledColor, 3);
    v4 = v10;
  }
  textColor = self->_textColor;
  if (textColor)
  {
    PBDataWriterWriteSubmessage(v10, textColor, 4);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField(v10, 5, self->_cornerRadius);
    v4 = v10;
  }
  borderStyle = self->_borderStyle;
  if (borderStyle)
  {
    PBDataWriterWriteSubmessage(v10, borderStyle, 6);
    v4 = v10;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_color)
  {
    objc_msgSend(v4, "setColor:");
    v4 = v5;
  }
  if (self->_highlightedColor)
  {
    objc_msgSend(v5, "setHighlightedColor:");
    v4 = v5;
  }
  if (self->_disabledColor)
  {
    objc_msgSend(v5, "setDisabledColor:");
    v4 = v5;
  }
  if (self->_textColor)
  {
    objc_msgSend(v5, "setTextColor:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = LODWORD(self->_cornerRadius);
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_borderStyle)
  {
    objc_msgSend(v5, "setBorderStyle:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBColor copyWithZone:](self->_color, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[APPBColor copyWithZone:](self->_highlightedColor, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[APPBColor copyWithZone:](self->_disabledColor, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[APPBColor copyWithZone:](self->_textColor, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = LODWORD(self->_cornerRadius);
    *((_BYTE *)v5 + 56) |= 1u;
  }
  v14 = -[APPBBorderStyle copyWithZone:](self->_borderStyle, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBColor *color;
  APPBColor *highlightedColor;
  APPBColor *disabledColor;
  APPBColor *textColor;
  APPBBorderStyle *borderStyle;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_17;
  color = self->_color;
  if ((unint64_t)color | *((_QWORD *)v4 + 2))
  {
    if (!-[APPBColor isEqual:](color, "isEqual:"))
      goto LABEL_17;
  }
  highlightedColor = self->_highlightedColor;
  if ((unint64_t)highlightedColor | *((_QWORD *)v4 + 5))
  {
    if (!-[APPBColor isEqual:](highlightedColor, "isEqual:"))
      goto LABEL_17;
  }
  disabledColor = self->_disabledColor;
  if ((unint64_t)disabledColor | *((_QWORD *)v4 + 4))
  {
    if (!-[APPBColor isEqual:](disabledColor, "isEqual:"))
      goto LABEL_17;
  }
  textColor = self->_textColor;
  if ((unint64_t)textColor | *((_QWORD *)v4 + 6))
  {
    if (!-[APPBColor isEqual:](textColor, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_cornerRadius != *((float *)v4 + 6))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  borderStyle = self->_borderStyle;
  if ((unint64_t)borderStyle | *((_QWORD *)v4 + 1))
    v10 = -[APPBBorderStyle isEqual:](borderStyle, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float cornerRadius;
  float v9;
  float v10;
  float v11;

  v3 = -[APPBColor hash](self->_color, "hash");
  v4 = -[APPBColor hash](self->_highlightedColor, "hash");
  v5 = -[APPBColor hash](self->_disabledColor, "hash");
  v6 = -[APPBColor hash](self->_textColor, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    cornerRadius = self->_cornerRadius;
    v9 = -cornerRadius;
    if (cornerRadius >= 0.0)
      v9 = self->_cornerRadius;
    v10 = floorf(v9 + 0.5);
    v11 = (float)(v9 - v10) * 1.8447e19;
    v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[APPBBorderStyle hash](self->_borderStyle, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBColor *color;
  uint64_t v6;
  APPBColor *highlightedColor;
  uint64_t v8;
  APPBColor *disabledColor;
  uint64_t v10;
  APPBColor *textColor;
  uint64_t v12;
  APPBBorderStyle *borderStyle;
  uint64_t v14;
  id v15;

  v4 = a3;
  color = self->_color;
  v6 = *((_QWORD *)v4 + 2);
  v15 = v4;
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
    -[APPBButtonStyle setColor:](self, "setColor:");
  }
  v4 = v15;
LABEL_7:
  highlightedColor = self->_highlightedColor;
  v8 = *((_QWORD *)v4 + 5);
  if (highlightedColor)
  {
    if (!v8)
      goto LABEL_13;
    -[APPBColor mergeFrom:](highlightedColor, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[APPBButtonStyle setHighlightedColor:](self, "setHighlightedColor:");
  }
  v4 = v15;
LABEL_13:
  disabledColor = self->_disabledColor;
  v10 = *((_QWORD *)v4 + 4);
  if (disabledColor)
  {
    if (!v10)
      goto LABEL_19;
    -[APPBColor mergeFrom:](disabledColor, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[APPBButtonStyle setDisabledColor:](self, "setDisabledColor:");
  }
  v4 = v15;
LABEL_19:
  textColor = self->_textColor;
  v12 = *((_QWORD *)v4 + 6);
  if (textColor)
  {
    if (!v12)
      goto LABEL_25;
    -[APPBColor mergeFrom:](textColor, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[APPBButtonStyle setTextColor:](self, "setTextColor:");
  }
  v4 = v15;
LABEL_25:
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_cornerRadius = *((float *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  borderStyle = self->_borderStyle;
  v14 = *((_QWORD *)v4 + 1);
  if (borderStyle)
  {
    if (v14)
    {
      -[APPBBorderStyle mergeFrom:](borderStyle, "mergeFrom:");
LABEL_32:
      v4 = v15;
    }
  }
  else if (v14)
  {
    -[APPBButtonStyle setBorderStyle:](self, "setBorderStyle:");
    goto LABEL_32;
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

- (APPBColor)highlightedColor
{
  return self->_highlightedColor;
}

- (void)setHighlightedColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedColor, a3);
}

- (APPBColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledColor, a3);
}

- (APPBColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (float)cornerRadius
{
  return self->_cornerRadius;
}

- (APPBBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
  objc_storeStrong((id *)&self->_borderStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);
}

@end
