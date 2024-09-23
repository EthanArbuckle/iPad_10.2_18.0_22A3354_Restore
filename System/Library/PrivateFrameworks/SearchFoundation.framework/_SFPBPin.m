@implementation _SFPBPin

- (_SFPBPin)initWithFacade:(id)a3
{
  id v4;
  _SFPBPin *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  _SFPBLatLng *v9;
  void *v10;
  _SFPBColor *v11;
  void *v12;
  _SFPBColor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _SFPBPin *v22;

  v4 = a3;
  v5 = -[_SFPBPin init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBLatLng initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBPin setLocation:](v5, "setLocation:", v9);

    }
    objc_msgSend(v4, "pinColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBColor alloc];
      objc_msgSend(v4, "pinColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBColor initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBPin setPinColor:](v5, "setPinColor:", v13);

    }
    objc_msgSend(v4, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "label");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPin setLabel:](v5, "setLabel:", v15);

    }
    objc_msgSend(v4, "resultID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "resultID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPin setResultID:](v5, "setResultID:", v17);

    }
    objc_msgSend(v4, "mapsData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "mapsData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPin setMapsData:](v5, "setMapsData:", v19);

    }
    if (objc_msgSend(v4, "hasPinBehavior"))
      -[_SFPBPin setPinBehavior:](v5, "setPinBehavior:", objc_msgSend(v4, "pinBehavior"));
    objc_msgSend(v4, "pinText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "pinText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPin setPinText:](v5, "setPinText:", v21);

    }
    v22 = v5;
  }

  return v5;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setPinColor:(id)a3
{
  objc_storeStrong((id *)&self->_pinColor, a3);
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

}

- (void)setResultID:(id)a3
{
  NSString *v4;
  NSString *resultID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  resultID = self->_resultID;
  self->_resultID = v4;

}

- (void)setMapsData:(id)a3
{
  NSData *v4;
  NSData *mapsData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  mapsData = self->_mapsData;
  self->_mapsData = v4;

}

- (void)setPinBehavior:(int)a3
{
  self->_pinBehavior = a3;
}

- (void)setPinText:(id)a3
{
  NSString *v4;
  NSString *pinText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pinText = self->_pinText;
  self->_pinText = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPinReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_SFPBPin location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBPin pinColor](self, "pinColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBPin label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBPin resultID](self, "resultID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBPin mapsData](self, "mapsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteDataField();

  if (-[_SFPBPin pinBehavior](self, "pinBehavior"))
    PBDataWriterWriteInt32Field();
  -[_SFPBPin pinText](self, "pinText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteStringField();

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
  int v31;
  int pinBehavior;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[_SFPBPin location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[_SFPBPin location](self, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPin location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_33;
  }
  else
  {

  }
  -[_SFPBPin pinColor](self, "pinColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[_SFPBPin pinColor](self, "pinColor");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPin pinColor](self, "pinColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pinColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_33;
  }
  else
  {

  }
  -[_SFPBPin label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[_SFPBPin label](self, "label");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBPin label](self, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_33;
  }
  else
  {

  }
  -[_SFPBPin resultID](self, "resultID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[_SFPBPin resultID](self, "resultID");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBPin resultID](self, "resultID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_33;
  }
  else
  {

  }
  -[_SFPBPin mapsData](self, "mapsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_32;
  -[_SFPBPin mapsData](self, "mapsData");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBPin mapsData](self, "mapsData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_33;
  }
  else
  {

  }
  pinBehavior = self->_pinBehavior;
  if (pinBehavior != objc_msgSend(v4, "pinBehavior"))
    goto LABEL_33;
  -[_SFPBPin pinText](self, "pinText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_32:

    goto LABEL_33;
  }
  -[_SFPBPin pinText](self, "pinText");
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
  {

LABEL_36:
    v38 = 1;
    goto LABEL_34;
  }
  v34 = (void *)v33;
  -[_SFPBPin pinText](self, "pinText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "isEqual:", v36);

  if ((v37 & 1) != 0)
    goto LABEL_36;
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[_SFPBLatLng hash](self->_location, "hash");
  v4 = -[_SFPBColor hash](self->_pinColor, "hash");
  v5 = -[NSString hash](self->_label, "hash");
  v6 = -[NSString hash](self->_resultID, "hash");
  v7 = -[NSData hash](self->_mapsData, "hash");
  v8 = 2654435761 * self->_pinBehavior;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_pinText, "hash") ^ v8;
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_label)
  {
    -[_SFPBPin label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("label"));

  }
  if (self->_location)
  {
    -[_SFPBPin location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("location"));

    }
  }
  if (self->_mapsData)
  {
    -[_SFPBPin mapsData](self, "mapsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("mapsData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mapsData"));

    }
  }
  if (self->_pinBehavior)
  {
    v12 = -[_SFPBPin pinBehavior](self, "pinBehavior");
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(&off_1E4042178 + v12);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("pinBehavior"));

  }
  if (self->_pinColor)
  {
    -[_SFPBPin pinColor](self, "pinColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pinColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pinColor"));

    }
  }
  if (self->_pinText)
  {
    -[_SFPBPin pinText](self, "pinText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pinText"));

  }
  if (self->_resultID)
  {
    -[_SFPBPin resultID](self, "resultID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("resultID"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPin dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPin)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPin *v5;
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
    self = -[_SFPBPin initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPin)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPin *v5;
  void *v6;
  _SFPBLatLng *v7;
  void *v8;
  _SFPBColor *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPBPin *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBPin;
  v5 = -[_SFPBPin init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v6);
      -[_SFPBPin setLocation:](v5, "setLocation:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v8);
      -[_SFPBPin setPinColor:](v5, "setPinColor:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBPin setLabel:](v5, "setLabel:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBPin setResultID:](v5, "setResultID:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0);
      -[_SFPBPin setMapsData:](v5, "setMapsData:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinBehavior"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPin setPinBehavior:](v5, "setPinBehavior:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinText"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBPin setPinText:](v5, "setPinText:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBColor)pinColor
{
  return self->_pinColor;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)resultID
{
  return self->_resultID;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (NSString)pinText
{
  return self->_pinText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinText, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_resultID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
