@implementation WFREPBAlertButton

- (id)styleAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7AEBCB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cancel")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Destructive")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAlertButton;
  -[WFREPBAlertButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBAlertButton dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  uint64_t style;
  __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  style = self->_style;
  if (style >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_style);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E7AEBCB8[style];
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("style"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preferred);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("preferred"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAlertButtonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_title)
    __assert_rtn("-[WFREPBAlertButton writeTo:]", "WFREPBAlertButton.m", 94, "nil != self->_title");
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "setTitle:", title);
  *((_DWORD *)v5 + 2) = self->_style;
  *((_BYTE *)v5 + 24) = self->_preferred;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_style;
  *(_BYTE *)(v5 + 24) = self->_preferred;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  NSString *title;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((title = self->_title, !((unint64_t)title | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](title, "isEqual:"))
    && self->_style == *((_DWORD *)v4 + 2))
  {
    if (self->_preferred)
      v6 = v4[24] != 0;
    else
      v6 = v4[24] == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_style) ^ -[NSString hash](self->_title, "hash") ^ (2654435761 * self->_preferred);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[WFREPBAlertButton setTitle:](self, "setTitle:");
    v4 = v5;
  }
  self->_style = *((_DWORD *)v4 + 2);
  self->_preferred = *((_BYTE *)v4 + 24);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (BOOL)preferred
{
  return self->_preferred;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
