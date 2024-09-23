@implementation _SFPBCalendarEvent

- (_SFPBCalendarEvent)initWithFacade:(id)a3
{
  id v4;
  _SFPBCalendarEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBDate *v9;
  void *v10;
  _SFPBDate *v11;
  void *v12;
  _SFPBDate *v13;
  void *v14;
  _SFPBDate *v15;
  void *v16;
  _SFPBStructuredLocation *v17;
  void *v18;
  _SFPBStructuredLocation *v19;
  void *v20;
  void *v21;
  _SFPBCalendarEvent *v22;

  v4 = a3;
  v5 = -[_SFPBCalendarEvent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCalendarEvent setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBDate alloc];
      objc_msgSend(v4, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBDate initWithNSDate:](v9, "initWithNSDate:", v10);
      -[_SFPBCalendarEvent setStartDate:](v5, "setStartDate:", v11);

    }
    objc_msgSend(v4, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBDate alloc];
      objc_msgSend(v4, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBDate initWithNSDate:](v13, "initWithNSDate:", v14);
      -[_SFPBCalendarEvent setEndDate:](v5, "setEndDate:", v15);

    }
    if (objc_msgSend(v4, "hasIsAllDay"))
      -[_SFPBCalendarEvent setIsAllDay:](v5, "setIsAllDay:", objc_msgSend(v4, "isAllDay"));
    objc_msgSend(v4, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBStructuredLocation alloc];
      objc_msgSend(v4, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBStructuredLocation initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBCalendarEvent setLocation:](v5, "setLocation:", v19);

    }
    objc_msgSend(v4, "notes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "notes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCalendarEvent setNotes:](v5, "setNotes:", v21);

    }
    v22 = v5;
  }

  return v5;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setNotes:(id)a3
{
  NSString *v4;
  NSString *notes;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  notes = self->_notes;
  self->_notes = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCalendarEventReadFrom(self, (uint64_t)a3);
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
  -[_SFPBCalendarEvent title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBCalendarEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCalendarEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBCalendarEvent isAllDay](self, "isAllDay"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCalendarEvent location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBCalendarEvent notes](self, "notes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
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
  int isAllDay;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[_SFPBCalendarEvent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBCalendarEvent title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCalendarEvent title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBCalendarEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBCalendarEvent startDate](self, "startDate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCalendarEvent startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBCalendarEvent endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBCalendarEvent endDate](self, "endDate");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCalendarEvent endDate](self, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_28;
  }
  else
  {

  }
  isAllDay = self->_isAllDay;
  if (isAllDay != objc_msgSend(v4, "isAllDay"))
    goto LABEL_28;
  -[_SFPBCalendarEvent location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBCalendarEvent location](self, "location");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBCalendarEvent location](self, "location");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBCalendarEvent notes](self, "notes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  -[_SFPBCalendarEvent notes](self, "notes");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_31:
    v33 = 1;
    goto LABEL_29;
  }
  v29 = (void *)v28;
  -[_SFPBCalendarEvent notes](self, "notes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if ((v32 & 1) != 0)
    goto LABEL_31;
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[_SFPBDate hash](self->_startDate, "hash");
  v5 = -[_SFPBDate hash](self->_endDate, "hash");
  if (self->_isAllDay)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[_SFPBStructuredLocation hash](self->_location, "hash");
  return v7 ^ -[NSString hash](self->_notes, "hash");
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
  if (self->_endDate)
  {
    -[_SFPBCalendarEvent endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endDate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("endDate"));

    }
  }
  if (self->_isAllDay)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCalendarEvent isAllDay](self, "isAllDay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isAllDay"));

  }
  if (self->_location)
  {
    -[_SFPBCalendarEvent location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("location"));

    }
  }
  if (self->_notes)
  {
    -[_SFPBCalendarEvent notes](self, "notes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("notes"));

  }
  if (self->_startDate)
  {
    -[_SFPBCalendarEvent startDate](self, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("startDate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startDate"));

    }
  }
  if (self->_title)
  {
    -[_SFPBCalendarEvent title](self, "title");
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

  -[_SFPBCalendarEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCalendarEvent)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCalendarEvent *v5;
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
    self = -[_SFPBCalendarEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCalendarEvent)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCalendarEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBDate *v9;
  void *v10;
  _SFPBDate *v11;
  void *v12;
  void *v13;
  _SFPBStructuredLocation *v14;
  void *v15;
  void *v16;
  _SFPBCalendarEvent *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBCalendarEvent;
  v5 = -[_SFPBCalendarEvent init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBCalendarEvent setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v8);
      -[_SFPBCalendarEvent setStartDate:](v5, "setStartDate:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v10);
      -[_SFPBCalendarEvent setEndDate:](v5, "setEndDate:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAllDay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCalendarEvent setIsAllDay:](v5, "setIsAllDay:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBStructuredLocation initWithDictionary:]([_SFPBStructuredLocation alloc], "initWithDictionary:", v13);
      -[_SFPBCalendarEvent setLocation:](v5, "setLocation:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[_SFPBCalendarEvent setNotes:](v5, "setNotes:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBDate)startDate
{
  return self->_startDate;
}

- (_SFPBDate)endDate
{
  return self->_endDate;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (_SFPBStructuredLocation)location
{
  return self->_location;
}

- (NSString)notes
{
  return self->_notes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
