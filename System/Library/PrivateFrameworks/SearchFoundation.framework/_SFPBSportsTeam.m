@implementation _SFPBSportsTeam

- (_SFPBSportsTeam)initWithFacade:(id)a3
{
  id v4;
  _SFPBSportsTeam *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  _SFPBImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPBButtonItem *v19;
  void *v20;
  _SFPBButtonItem *v21;
  _SFPBSportsTeam *v22;

  v4 = a3;
  v5 = -[_SFPBSportsTeam init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "logo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBImage alloc];
      objc_msgSend(v4, "logo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBImage initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBSportsTeam setLogo:](v5, "setLogo:", v9);

    }
    objc_msgSend(v4, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "record");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsTeam setRecord:](v5, "setRecord:", v11);

    }
    objc_msgSend(v4, "score");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "score");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsTeam setScore:](v5, "setScore:", v13);

    }
    objc_msgSend(v4, "accessibilityDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "accessibilityDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsTeam setAccessibilityDescription:](v5, "setAccessibilityDescription:", v15);

    }
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSportsTeam setName:](v5, "setName:", v17);

    }
    objc_msgSend(v4, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBButtonItem alloc];
      objc_msgSend(v4, "button");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBButtonItem initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBSportsTeam setButton:](v5, "setButton:", v21);

    }
    if (objc_msgSend(v4, "hasIsWinner"))
      -[_SFPBSportsTeam setIsWinner:](v5, "setIsWinner:", objc_msgSend(v4, "isWinner"));
    v22 = v5;
  }

  return v5;
}

- (void)setLogo:(id)a3
{
  objc_storeStrong((id *)&self->_logo, a3);
}

- (void)setRecord:(id)a3
{
  NSString *v4;
  NSString *record;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  record = self->_record;
  self->_record = v4;

}

- (void)setScore:(id)a3
{
  NSString *v4;
  NSString *score;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  score = self->_score;
  self->_score = v4;

}

- (void)setAccessibilityDescription:(id)a3
{
  NSString *v4;
  NSString *accessibilityDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  accessibilityDescription = self->_accessibilityDescription;
  self->_accessibilityDescription = v4;

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setIsWinner:(BOOL)a3
{
  self->_isWinner = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSportsTeamReadFrom(self, (uint64_t)a3);
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
  -[_SFPBSportsTeam logo](self, "logo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBSportsTeam record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBSportsTeam score](self, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBSportsTeam accessibilityDescription](self, "accessibilityDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBSportsTeam name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

  -[_SFPBSportsTeam button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBSportsTeam isWinner](self, "isWinner"))
    PBDataWriterWriteBOOLField();

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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int isWinner;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_SFPBSportsTeam logo](self, "logo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBSportsTeam logo](self, "logo");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSportsTeam logo](self, "logo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBSportsTeam record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBSportsTeam record](self, "record");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSportsTeam record](self, "record");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBSportsTeam score](self, "score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBSportsTeam score](self, "score");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBSportsTeam score](self, "score");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "score");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBSportsTeam accessibilityDescription](self, "accessibilityDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBSportsTeam accessibilityDescription](self, "accessibilityDescription");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBSportsTeam accessibilityDescription](self, "accessibilityDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBSportsTeam name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBSportsTeam name](self, "name");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBSportsTeam name](self, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBSportsTeam button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBSportsTeam button](self, "button");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      isWinner = self->_isWinner;
      v37 = isWinner == objc_msgSend(v4, "isWinner");
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_SFPBSportsTeam button](self, "button");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (v36)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[_SFPBImage hash](self->_logo, "hash");
  v4 = -[NSString hash](self->_record, "hash");
  v5 = -[NSString hash](self->_score, "hash");
  v6 = -[NSString hash](self->_accessibilityDescription, "hash");
  v7 = -[NSString hash](self->_name, "hash");
  v8 = -[_SFPBButtonItem hash](self->_button, "hash");
  v9 = 2654435761;
  if (!self->_isWinner)
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
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
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accessibilityDescription)
  {
    -[_SFPBSportsTeam accessibilityDescription](self, "accessibilityDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessibilityDescription"));

  }
  if (self->_button)
  {
    -[_SFPBSportsTeam button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("button"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("button"));

    }
  }
  if (self->_isWinner)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSportsTeam isWinner](self, "isWinner"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isWinner"));

  }
  if (self->_logo)
  {
    -[_SFPBSportsTeam logo](self, "logo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("logo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("logo"));

    }
  }
  if (self->_name)
  {
    -[_SFPBSportsTeam name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("name"));

  }
  if (self->_record)
  {
    -[_SFPBSportsTeam record](self, "record");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("record"));

  }
  if (self->_score)
  {
    -[_SFPBSportsTeam score](self, "score");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("score"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSportsTeam dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSportsTeam)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSportsTeam *v5;
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
    self = -[_SFPBSportsTeam initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSportsTeam)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSportsTeam *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFPBButtonItem *v17;
  void *v18;
  _SFPBSportsTeam *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBSportsTeam;
  v5 = -[_SFPBSportsTeam init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v6);
      -[_SFPBSportsTeam setLogo:](v5, "setLogo:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("record"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBSportsTeam setRecord:](v5, "setRecord:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBSportsTeam setScore:](v5, "setScore:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessibilityDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBSportsTeam setAccessibilityDescription:](v5, "setAccessibilityDescription:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBSportsTeam setName:](v5, "setName:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v16);
      -[_SFPBSportsTeam setButton:](v5, "setButton:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWinner"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSportsTeam setIsWinner:](v5, "setIsWinner:", objc_msgSend(v18, "BOOLValue"));
    v19 = v5;

  }
  return v5;
}

- (_SFPBImage)logo
{
  return self->_logo;
}

- (NSString)record
{
  return self->_record;
}

- (NSString)score
{
  return self->_score;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (NSString)name
{
  return self->_name;
}

- (_SFPBButtonItem)button
{
  return self->_button;
}

- (BOOL)isWinner
{
  return self->_isWinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_logo, 0);
}

@end
