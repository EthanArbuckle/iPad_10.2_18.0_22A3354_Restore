@implementation APPBStyle

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (BOOL)hasBorderStyle
{
  return self->_borderStyle != 0;
}

- (BOOL)hasButtonStyle
{
  return self->_buttonStyle != 0;
}

- (BOOL)hasShadowStyle
{
  return self->_shadowStyle != 0;
}

- (BOOL)hasTextColor
{
  return self->_textColor != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBStyle;
  v3 = -[APPBStyle description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBStyle dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBColor *backgroundColor;
  void *v5;
  APPBBorderStyle *borderStyle;
  void *v7;
  APPBButtonStyle *buttonStyle;
  void *v9;
  APPBShadowStyle *shadowStyle;
  void *v11;
  APPBColor *textColor;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](backgroundColor, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("backgroundColor"));

  }
  borderStyle = self->_borderStyle;
  if (borderStyle)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBBorderStyle dictionaryRepresentation](borderStyle, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("borderStyle"));

  }
  buttonStyle = self->_buttonStyle;
  if (buttonStyle)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPBButtonStyle dictionaryRepresentation](buttonStyle, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("buttonStyle"));

  }
  shadowStyle = self->_shadowStyle;
  if (shadowStyle)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPBShadowStyle dictionaryRepresentation](shadowStyle, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("shadowStyle"));

  }
  textColor = self->_textColor;
  if (textColor)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPBColor dictionaryRepresentation](textColor, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("textColor"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBStyleReadFrom((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBColor *backgroundColor;
  APPBBorderStyle *borderStyle;
  APPBButtonStyle *buttonStyle;
  APPBShadowStyle *shadowStyle;
  APPBColor *textColor;
  id v10;

  v4 = a3;
  backgroundColor = self->_backgroundColor;
  v10 = v4;
  if (backgroundColor)
  {
    PBDataWriterWriteSubmessage(v4, backgroundColor, 1);
    v4 = v10;
  }
  borderStyle = self->_borderStyle;
  if (borderStyle)
  {
    PBDataWriterWriteSubmessage(v10, borderStyle, 2);
    v4 = v10;
  }
  buttonStyle = self->_buttonStyle;
  if (buttonStyle)
  {
    PBDataWriterWriteSubmessage(v10, buttonStyle, 3);
    v4 = v10;
  }
  shadowStyle = self->_shadowStyle;
  if (shadowStyle)
  {
    PBDataWriterWriteSubmessage(v10, shadowStyle, 4);
    v4 = v10;
  }
  textColor = self->_textColor;
  if (textColor)
  {
    PBDataWriterWriteSubmessage(v10, textColor, 5);
    v4 = v10;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_backgroundColor)
  {
    objc_msgSend(v4, "setBackgroundColor:");
    v4 = v5;
  }
  if (self->_borderStyle)
  {
    objc_msgSend(v5, "setBorderStyle:");
    v4 = v5;
  }
  if (self->_buttonStyle)
  {
    objc_msgSend(v5, "setButtonStyle:");
    v4 = v5;
  }
  if (self->_shadowStyle)
  {
    objc_msgSend(v5, "setShadowStyle:");
    v4 = v5;
  }
  if (self->_textColor)
  {
    objc_msgSend(v5, "setTextColor:");
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
  v6 = -[APPBColor copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[APPBBorderStyle copyWithZone:](self->_borderStyle, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[APPBButtonStyle copyWithZone:](self->_buttonStyle, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[APPBShadowStyle copyWithZone:](self->_shadowStyle, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[APPBColor copyWithZone:](self->_textColor, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  APPBColor *backgroundColor;
  APPBBorderStyle *borderStyle;
  APPBButtonStyle *buttonStyle;
  APPBShadowStyle *shadowStyle;
  APPBColor *textColor;
  unsigned __int8 v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((backgroundColor = self->_backgroundColor, !((unint64_t)backgroundColor | v4[1]))
     || -[APPBColor isEqual:](backgroundColor, "isEqual:"))
    && ((borderStyle = self->_borderStyle, !((unint64_t)borderStyle | v4[2]))
     || -[APPBBorderStyle isEqual:](borderStyle, "isEqual:"))
    && ((buttonStyle = self->_buttonStyle, !((unint64_t)buttonStyle | v4[3]))
     || -[APPBButtonStyle isEqual:](buttonStyle, "isEqual:"))
    && ((shadowStyle = self->_shadowStyle, !((unint64_t)shadowStyle | v4[4]))
     || -[APPBShadowStyle isEqual:](shadowStyle, "isEqual:")))
  {
    textColor = self->_textColor;
    if ((unint64_t)textColor | v4[5])
      v10 = -[APPBColor isEqual:](textColor, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[APPBColor hash](self->_backgroundColor, "hash");
  v4 = -[APPBBorderStyle hash](self->_borderStyle, "hash") ^ v3;
  v5 = -[APPBButtonStyle hash](self->_buttonStyle, "hash");
  v6 = v4 ^ v5 ^ -[APPBShadowStyle hash](self->_shadowStyle, "hash");
  return v6 ^ -[APPBColor hash](self->_textColor, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  APPBColor *backgroundColor;
  uint64_t v6;
  APPBBorderStyle *borderStyle;
  uint64_t v8;
  APPBButtonStyle *buttonStyle;
  uint64_t v10;
  APPBShadowStyle *shadowStyle;
  uint64_t v12;
  APPBColor *textColor;
  uint64_t v14;
  _QWORD *v15;

  v4 = a3;
  backgroundColor = self->_backgroundColor;
  v15 = v4;
  v6 = v4[1];
  if (backgroundColor)
  {
    if (v6)
      -[APPBColor mergeFrom:](backgroundColor, "mergeFrom:");
  }
  else if (v6)
  {
    -[APPBStyle setBackgroundColor:](self, "setBackgroundColor:");
  }
  borderStyle = self->_borderStyle;
  v8 = v15[2];
  if (borderStyle)
  {
    if (v8)
      -[APPBBorderStyle mergeFrom:](borderStyle, "mergeFrom:");
  }
  else if (v8)
  {
    -[APPBStyle setBorderStyle:](self, "setBorderStyle:");
  }
  buttonStyle = self->_buttonStyle;
  v10 = v15[3];
  if (buttonStyle)
  {
    if (v10)
      -[APPBButtonStyle mergeFrom:](buttonStyle, "mergeFrom:");
  }
  else if (v10)
  {
    -[APPBStyle setButtonStyle:](self, "setButtonStyle:");
  }
  shadowStyle = self->_shadowStyle;
  v12 = v15[4];
  if (shadowStyle)
  {
    if (v12)
      -[APPBShadowStyle mergeFrom:](shadowStyle, "mergeFrom:");
  }
  else if (v12)
  {
    -[APPBStyle setShadowStyle:](self, "setShadowStyle:");
  }
  textColor = self->_textColor;
  v14 = v15[5];
  if (textColor)
  {
    if (v14)
      -[APPBColor mergeFrom:](textColor, "mergeFrom:");
  }
  else if (v14)
  {
    -[APPBStyle setTextColor:](self, "setTextColor:");
  }

}

- (APPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (APPBBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
  objc_storeStrong((id *)&self->_borderStyle, a3);
}

- (APPBButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStyle, a3);
}

- (APPBShadowStyle)shadowStyle
{
  return self->_shadowStyle;
}

- (void)setShadowStyle:(id)a3
{
  objc_storeStrong((id *)&self->_shadowStyle, a3);
}

- (APPBColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_shadowStyle, 0);
  objc_storeStrong((id *)&self->_buttonStyle, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
