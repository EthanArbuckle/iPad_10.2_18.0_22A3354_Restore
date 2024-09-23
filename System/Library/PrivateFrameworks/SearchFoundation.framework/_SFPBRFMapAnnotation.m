@implementation _SFPBRFMapAnnotation

- (_SFPBRFMapAnnotation)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFMapAnnotation *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  _SFPBRFVisualProperty *v11;
  void *v12;
  _SFPBRFVisualProperty *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFPBRFMapPoint *v17;
  void *v18;
  _SFPBRFMapPoint *v19;
  void *v20;
  _SFPBRFTextProperty *v21;
  void *v22;
  _SFPBRFTextProperty *v23;
  _SFPBRFMapAnnotation *v24;

  v4 = a3;
  v5 = -[_SFPBRFMapAnnotation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "coordinate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "coordinate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBLatLng initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFMapAnnotation setCoordinate:](v5, "setCoordinate:", v9);

    }
    objc_msgSend(v4, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFVisualProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFMapAnnotation setContent:](v5, "setContent:", v13);

    }
    objc_msgSend(v4, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFMapAnnotation setTitle:](v5, "setTitle:", v15);

    }
    objc_msgSend(v4, "anchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBRFMapPoint alloc];
      objc_msgSend(v4, "anchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBRFMapPoint initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBRFMapAnnotation setAnchor:](v5, "setAnchor:", v19);

    }
    objc_msgSend(v4, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBRFTextProperty initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBRFMapAnnotation setLabel:](v5, "setLabel:", v23);

    }
    v24 = v5;
  }

  return v5;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapAnnotationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBRFMapAnnotation coordinate](self, "coordinate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapAnnotation content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapAnnotation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBRFMapAnnotation anchor](self, "anchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapAnnotation label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_SFPBRFMapAnnotation coordinate](self, "coordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFMapAnnotation coordinate](self, "coordinate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFMapAnnotation coordinate](self, "coordinate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFMapAnnotation content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFMapAnnotation content](self, "content");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFMapAnnotation content](self, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFMapAnnotation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFMapAnnotation title](self, "title");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFMapAnnotation title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFMapAnnotation anchor](self, "anchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFMapAnnotation anchor](self, "anchor");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFMapAnnotation anchor](self, "anchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFMapAnnotation label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFMapAnnotation label](self, "label");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_SFPBRFMapAnnotation label](self, "label");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[_SFPBLatLng hash](self->_coordinate, "hash");
  v4 = -[_SFPBRFVisualProperty hash](self->_content, "hash") ^ v3;
  v5 = -[NSString hash](self->_title, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBRFMapPoint hash](self->_anchor, "hash");
  return v6 ^ -[_SFPBRFTextProperty hash](self->_label, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_anchor)
  {
    -[_SFPBRFMapAnnotation anchor](self, "anchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anchor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("anchor"));

    }
  }
  if (self->_content)
  {
    -[_SFPBRFMapAnnotation content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("content"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("content"));

    }
  }
  if (self->_coordinate)
  {
    -[_SFPBRFMapAnnotation coordinate](self, "coordinate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("coordinate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("coordinate"));

    }
  }
  if (self->_label)
  {
    -[_SFPBRFMapAnnotation label](self, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("label"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("label"));

    }
  }
  if (self->_title)
  {
    -[_SFPBRFMapAnnotation title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFMapAnnotation dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBRFMapAnnotation)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFMapAnnotation *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBRFMapAnnotation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFMapAnnotation)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFMapAnnotation *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  _SFPBRFVisualProperty *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBRFMapPoint *v13;
  void *v14;
  _SFPBRFTextProperty *v15;
  _SFPBRFMapAnnotation *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFPBRFMapAnnotation;
  v5 = -[_SFPBRFMapAnnotation init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coordinate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v6);
      -[_SFPBRFMapAnnotation setCoordinate:](v5, "setCoordinate:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFMapAnnotation setContent:](v5, "setContent:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBRFMapAnnotation setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBRFMapPoint initWithDictionary:]([_SFPBRFMapPoint alloc], "initWithDictionary:", v12);
      -[_SFPBRFMapAnnotation setAnchor:](v5, "setAnchor:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v14);
      -[_SFPBRFMapAnnotation setLabel:](v5, "setLabel:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (_SFPBLatLng)coordinate
{
  return self->_coordinate;
}

- (_SFPBRFVisualProperty)content
{
  return self->_content;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBRFMapPoint)anchor
{
  return self->_anchor;
}

- (_SFPBRFTextProperty)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end
