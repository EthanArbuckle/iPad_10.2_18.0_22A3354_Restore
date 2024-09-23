@implementation SFTrack

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_highlighted = a3;
}

- (BOOL)hasHighlighted
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFTrack)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTrack *v6;
  SFTrack *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBTrack initWithData:]([_SFPBTrack alloc], "initWithData:", v5);
  v7 = -[SFTrack initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBTrack *v6;

  v4 = a3;
  v6 = -[_SFPBTrack initWithFacade:]([_SFPBTrack alloc], "initWithFacade:", self);
  -[_SFPBTrack data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTrack *v2;
  void *v3;

  v2 = -[_SFPBTrack initWithFacade:]([_SFPBTrack alloc], "initWithFacade:", self);
  -[_SFPBTrack dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTrack *v2;
  void *v3;

  v2 = -[_SFPBTrack initWithFacade:]([_SFPBTrack alloc], "initWithFacade:", self);
  -[_SFPBTrack jsonData](v2, "jsonData");
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
  -[SFTrack title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFTrack number](self, "number");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setNumber:", v8);

  -[SFTrack duration](self, "duration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDuration:", v10);

  objc_msgSend(v4, "setHighlighted:", -[SFTrack highlighted](self, "highlighted"));
  -[SFTrack preview](self, "preview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPreview:", v12);

  -[SFTrack playAction](self, "playAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setPlayAction:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFTrack *v4;
  SFTrack *v5;
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

  v4 = (SFTrack *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[SFTrack isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFTrack title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTrack title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v10 = 0;
LABEL_41:

        goto LABEL_42;
      }
      -[SFTrack title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFTrack title](self, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTrack title](v5, "title");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_39;
        }
        v49 = v9;
      }
      -[SFTrack number](self, "number");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTrack number](v5, "number");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v51 == 0) != (v11 != 0))
      {
        -[SFTrack number](self, "number");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          -[SFTrack number](self, "number");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFTrack number](v5, "number");
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
        -[SFTrack duration](self, "duration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTrack duration](v5, "duration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v15 == 0) != (v16 != 0))
        {
          v44 = v15;
          v45 = v16;
          -[SFTrack duration](self, "duration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[SFTrack duration](self, "duration");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFTrack duration](v5, "duration");
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
          v21 = -[SFTrack highlighted](self, "highlighted");
          if (v21 == -[SFTrack highlighted](v5, "highlighted"))
          {
            -[SFTrack preview](self, "preview");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFTrack preview](v5, "preview");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v22 == 0) != (v23 != 0))
            {
              v39 = v23;
              v40 = v22;
              -[SFTrack preview](self, "preview");
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = (void *)v24;
              v26 = v48;
              if (v24)
              {
                v35 = (void *)v24;
                -[SFTrack preview](self, "preview");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFTrack preview](v5, "preview");
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
              -[SFTrack playAction](self, "playAction");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFTrack playAction](v5, "playAction");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v29 == 0) == (v30 != 0))
              {

                v10 = 0;
              }
              else
              {
                v36 = v30;
                -[SFTrack playAction](self, "playAction");
                v31 = objc_claimAutoreleasedReturnValue();
                if (v31)
                {
                  v34 = (void *)v31;
                  -[SFTrack playAction](self, "playAction");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTrack playAction](v5, "playAction");
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

  -[SFTrack title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFTrack number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFTrack duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = -[SFTrack highlighted](self, "highlighted");
  -[SFTrack preview](self, "preview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8 ^ v9 ^ objc_msgSend(v10, "hash");
  -[SFTrack playAction](self, "playAction");
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

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (NSURL)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SFActionItem)playAction
{
  return self->_playAction;
}

- (void)setPlayAction:(id)a3
{
  objc_storeStrong((id *)&self->_playAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (SFTrack)initWithProtobuf:(id)a3
{
  id v4;
  SFTrack *v5;
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
  SFActionItem *v16;
  void *v17;
  SFActionItem *v18;
  SFTrack *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFTrack;
  v5 = -[SFTrack init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTrack setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "number");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "number");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTrack setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "duration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "duration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTrack setDuration:](v5, "setDuration:", v11);

    }
    if (objc_msgSend(v4, "highlighted"))
      -[SFTrack setHighlighted:](v5, "setHighlighted:", objc_msgSend(v4, "highlighted"));
    objc_msgSend(v4, "preview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "preview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTrack setPreview:](v5, "setPreview:", v14);

    }
    objc_msgSend(v4, "playAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [SFActionItem alloc];
      objc_msgSend(v4, "playAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SFActionItem initWithProtobuf:](v16, "initWithProtobuf:", v17);
      -[SFTrack setPlayAction:](v5, "setPlayAction:", v18);

    }
    v19 = v5;
  }

  return v5;
}

@end
