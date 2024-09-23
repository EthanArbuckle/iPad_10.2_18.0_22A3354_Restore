@implementation SFCalendarEvent

- (SFCalendarEvent)initWithProtobuf:(id)a3
{
  id v4;
  SFCalendarEvent *v5;
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
  SFStructuredLocation *v17;
  void *v18;
  SFStructuredLocation *v19;
  void *v20;
  void *v21;
  SFCalendarEvent *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFCalendarEvent;
  v5 = -[SFCalendarEvent init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarEvent setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v9, "secondsSince1970");
      objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarEvent setStartDate:](v5, "setStartDate:", v11);

    }
    objc_msgSend(v4, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v13, "secondsSince1970");
      objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarEvent setEndDate:](v5, "setEndDate:", v15);

    }
    if (objc_msgSend(v4, "isAllDay"))
      -[SFCalendarEvent setIsAllDay:](v5, "setIsAllDay:", objc_msgSend(v4, "isAllDay"));
    objc_msgSend(v4, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [SFStructuredLocation alloc];
      objc_msgSend(v4, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SFStructuredLocation initWithProtobuf:](v17, "initWithProtobuf:", v18);
      -[SFCalendarEvent setLocation:](v5, "setLocation:", v19);

    }
    objc_msgSend(v4, "notes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "notes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarEvent setNotes:](v5, "setNotes:", v21);

    }
    v22 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsAllDay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAllDay = a3;
}

- (BOOL)hasIsAllDay
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFCalendarEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCalendarEvent *v6;
  SFCalendarEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBCalendarEvent initWithData:]([_SFPBCalendarEvent alloc], "initWithData:", v5);
  v7 = -[SFCalendarEvent initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBCalendarEvent *v6;

  v4 = a3;
  v6 = -[_SFPBCalendarEvent initWithFacade:]([_SFPBCalendarEvent alloc], "initWithFacade:", self);
  -[_SFPBCalendarEvent data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCalendarEvent *v2;
  void *v3;

  v2 = -[_SFPBCalendarEvent initWithFacade:]([_SFPBCalendarEvent alloc], "initWithFacade:", self);
  -[_SFPBCalendarEvent dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCalendarEvent *v2;
  void *v3;

  v2 = -[_SFPBCalendarEvent initWithFacade:]([_SFPBCalendarEvent alloc], "initWithFacade:", self);
  -[_SFPBCalendarEvent jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFCalendarEvent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFCalendarEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setStartDate:", v8);

  -[SFCalendarEvent endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEndDate:", v10);

  objc_msgSend(v4, "setIsAllDay:", -[SFCalendarEvent isAllDay](self, "isAllDay"));
  -[SFCalendarEvent location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setLocation:", v12);

  -[SFCalendarEvent notes](self, "notes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setNotes:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCalendarEvent *v4;
  SFCalendarEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
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
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v4 = (SFCalendarEvent *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[SFCalendarEvent isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFCalendarEvent title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarEvent title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v10 = 0;
LABEL_41:

        goto LABEL_42;
      }
      -[SFCalendarEvent title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFCalendarEvent title](self, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCalendarEvent title](v5, "title");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_39;
        }
        v49 = v9;
      }
      -[SFCalendarEvent startDate](self, "startDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCalendarEvent startDate](v5, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v51 == 0) != (v11 != 0))
      {
        -[SFCalendarEvent startDate](self, "startDate");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[SFCalendarEvent startDate](self, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCalendarEvent startDate](v5, "startDate");
          v46 = v14;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "isEqual:"))
          {
            v10 = 0;
            v19 = v48;
            v20 = v13;
            goto LABEL_36;
          }
          v47 = v13;
        }
        else
        {
          v47 = 0;
        }
        -[SFCalendarEvent endDate](self, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCalendarEvent endDate](v5, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v15 == 0) != (v16 != 0))
        {
          v44 = v15;
          v45 = v16;
          -[SFCalendarEvent endDate](self, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[SFCalendarEvent endDate](self, "endDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCalendarEvent endDate](v5, "endDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              v10 = 0;
              v20 = v47;
              v26 = v48;
              goto LABEL_34;
            }
            v43 = v17;
          }
          else
          {
            v43 = 0;
          }
          v21 = -[SFCalendarEvent isAllDay](self, "isAllDay");
          if (v21 == -[SFCalendarEvent isAllDay](v5, "isAllDay"))
          {
            -[SFCalendarEvent location](self, "location");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCalendarEvent location](v5, "location");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v22 == 0) != (v23 != 0))
            {
              v39 = v23;
              v40 = v22;
              -[SFCalendarEvent location](self, "location");
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = (void *)v24;
              v26 = v48;
              if (v24)
              {
                v35 = (void *)v24;
                -[SFCalendarEvent location](self, "location");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFCalendarEvent location](v5, "location");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v27;
                if (!objc_msgSend(v27, "isEqual:"))
                {
                  v10 = 0;
                  v25 = v35;
                  goto LABEL_50;
                }
                v25 = v35;
              }
              -[SFCalendarEvent notes](self, "notes");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCalendarEvent notes](v5, "notes");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v29 == 0) == (v30 != 0))
              {

                v10 = 0;
              }
              else
              {
                v36 = v30;
                -[SFCalendarEvent notes](self, "notes");
                v31 = objc_claimAutoreleasedReturnValue();
                if (v31)
                {
                  v34 = (void *)v31;
                  -[SFCalendarEvent notes](self, "notes");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCalendarEvent notes](v5, "notes");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v33, "isEqual:", v32);

                }
                else
                {

                  v10 = 1;
                }
              }
              v26 = v48;
              if (!v25)
              {
LABEL_51:

                v17 = v43;
                v20 = v47;
                if (!v43)
                {
LABEL_35:

                  v19 = v26;
                  if (!v20)
                  {
LABEL_37:

LABEL_38:
                    v9 = v49;
                    if (!v8)
                    {
LABEL_40:

                      goto LABEL_41;
                    }
LABEL_39:

                    goto LABEL_40;
                  }
LABEL_36:

                  goto LABEL_37;
                }
LABEL_34:

                goto LABEL_35;
              }
LABEL_50:

              goto LABEL_51;
            }

          }
          v10 = 0;
          v20 = v47;
          v26 = v48;
          v17 = v43;
          if (!v43)
            goto LABEL_35;
          goto LABEL_34;
        }

        if (v47)
        {

        }
      }

      v10 = 0;
      goto LABEL_38;
    }
    v10 = 0;
  }
LABEL_42:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  -[SFCalendarEvent title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFCalendarEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFCalendarEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = -[SFCalendarEvent isAllDay](self, "isAllDay");
  -[SFCalendarEvent location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8 ^ v9 ^ objc_msgSend(v10, "hash");
  -[SFCalendarEvent notes](self, "notes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (SFStructuredLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
