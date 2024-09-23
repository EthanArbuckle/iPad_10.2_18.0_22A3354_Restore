@implementation SFSportsTeam

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsWinner:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isWinner = a3;
}

- (BOOL)hasIsWinner
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFSportsTeam)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsTeam *v6;
  SFSportsTeam *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBSportsTeam initWithData:]([_SFPBSportsTeam alloc], "initWithData:", v5);
  v7 = -[SFSportsTeam initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSportsTeam *v6;

  v4 = a3;
  v6 = -[_SFPBSportsTeam initWithFacade:]([_SFPBSportsTeam alloc], "initWithFacade:", self);
  -[_SFPBSportsTeam data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSportsTeam *v2;
  void *v3;

  v2 = -[_SFPBSportsTeam initWithFacade:]([_SFPBSportsTeam alloc], "initWithFacade:", self);
  -[_SFPBSportsTeam dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSportsTeam *v2;
  void *v3;

  v2 = -[_SFPBSportsTeam initWithFacade:]([_SFPBSportsTeam alloc], "initWithFacade:", self);
  -[_SFPBSportsTeam jsonData](v2, "jsonData");
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
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFSportsTeam logo](self, "logo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLogo:", v6);

  -[SFSportsTeam record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setRecord:", v8);

  -[SFSportsTeam score](self, "score");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setScore:", v10);

  -[SFSportsTeam accessibilityDescription](self, "accessibilityDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setAccessibilityDescription:", v12);

  -[SFSportsTeam name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setName:", v14);

  -[SFSportsTeam button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setButton:", v16);

  objc_msgSend(v4, "setIsWinner:", -[SFSportsTeam isWinner](self, "isWinner"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSportsTeam *v5;
  SFSportsTeam *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
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
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;

  v5 = (SFSportsTeam *)a3;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (-[SFSportsTeam isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFSportsTeam logo](self, "logo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsTeam logo](v6, "logo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v12) = 0;
LABEL_49:

        goto LABEL_50;
      }
      -[SFSportsTeam logo](self, "logo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFSportsTeam logo](self, "logo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsTeam logo](v6, "logo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
        {
          LOBYTE(v12) = 0;
          goto LABEL_47;
        }
        v62 = v11;
        v63 = v10;
      }
      -[SFSportsTeam record](self, "record");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsTeam record](v6, "record");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 == 0) != (v14 != 0))
      {
        v61 = v14;
        -[SFSportsTeam record](self, "record");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[SFSportsTeam record](self, "record");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsTeam record](v6, "record");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
          {

LABEL_44:
LABEL_45:
            LOBYTE(v12) = 0;
            goto LABEL_46;
          }
          v59 = v17;
          v60 = v13;
          v3 = v16;
          v18 = v15;
        }
        else
        {
          v60 = v13;
          v18 = 0;
        }
        -[SFSportsTeam score](self, "score");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSportsTeam score](v6, "score");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v18;
        v22 = v3;
        if ((v19 == 0) != (v20 != 0))
        {
          v58 = v20;
          v57 = v19;
          -[SFSportsTeam score](self, "score");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            -[SFSportsTeam score](self, "score");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSportsTeam score](v6, "score");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v23, "isEqual:", v24) & 1) == 0)
            {

              if (v21)
              {

              }
              goto LABEL_45;
            }
            v54 = v24;
            v55 = v23;
            v25 = v21;
          }
          else
          {
            v25 = v21;
          }
          -[SFSportsTeam accessibilityDescription](self, "accessibilityDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSportsTeam accessibilityDescription](v6, "accessibilityDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v25;
          v22 = v3;
          if ((v26 == 0) != (v27 != 0))
          {
            v53 = v27;
            -[SFSportsTeam accessibilityDescription](self, "accessibilityDescription");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (v52)
            {
              -[SFSportsTeam accessibilityDescription](self, "accessibilityDescription");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSportsTeam accessibilityDescription](v6, "accessibilityDescription");
              v51 = v28;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v28, "isEqual:"))
              {
                LOBYTE(v12) = 0;
                v34 = v52;
                goto LABEL_65;
              }
              v50 = v21;
            }
            else
            {
              v50 = v21;
            }
            -[SFSportsTeam name](self, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSportsTeam name](v6, "name");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v29 == 0) != (v30 != 0))
            {
              v48 = v30;
              -[SFSportsTeam name](self, "name");
              v31 = objc_claimAutoreleasedReturnValue();
              v47 = v29;
              if (v31)
              {
                -[SFSportsTeam name](self, "name");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFSportsTeam name](v6, "name");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v32;
                if (!objc_msgSend(v32, "isEqual:"))
                {
                  LOBYTE(v12) = 0;
                  v37 = (void *)v31;
                  v21 = v50;
LABEL_63:

LABEL_64:
                  v34 = v52;
                  if (!v52)
                  {
LABEL_66:

                    if (v56)
                    {

                    }
                    if (v21)
                    {

                    }
LABEL_46:
                    v11 = v62;
                    v10 = v63;
                    if (!v9)
                    {
LABEL_48:

                      goto LABEL_49;
                    }
LABEL_47:

                    goto LABEL_48;
                  }
LABEL_65:

                  goto LABEL_66;
                }
                v45 = (void *)v31;
              }
              else
              {
                v45 = 0;
              }
              -[SFSportsTeam button](self, "button");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSportsTeam button](v6, "button");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v35 == 0) == (v36 != 0))
              {

                LOBYTE(v12) = 0;
                v21 = v50;
                goto LABEL_62;
              }
              v41 = v36;
              v42 = v35;
              -[SFSportsTeam button](self, "button");
              v21 = v50;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v46
                || (-[SFSportsTeam button](self, "button"),
                    v40 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[SFSportsTeam button](v6, "button"),
                    v39 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v40, "isEqual:")))
              {
                v38 = -[SFSportsTeam isWinner](self, "isWinner");
                v12 = v38 ^ -[SFSportsTeam isWinner](v6, "isWinner") ^ 1;
                if (!v46)
                {
LABEL_61:

LABEL_62:
                  v37 = v45;
                  if (!v45)
                    goto LABEL_64;
                  goto LABEL_63;
                }
              }
              else
              {
                LOBYTE(v12) = 0;
              }

              goto LABEL_61;
            }

            if (v52)
            {

            }
            v21 = v50;
            v27 = v53;
          }

          if (v56)
          {

          }
          v19 = v57;
          v20 = v58;
        }

        if (v21)
        {

        }
        v13 = v60;
        v14 = v61;
      }

      goto LABEL_44;
    }
    LOBYTE(v12) = 0;
  }
LABEL_50:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;

  -[SFSportsTeam logo](self, "logo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFSportsTeam record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFSportsTeam score](self, "score");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFSportsTeam accessibilityDescription](self, "accessibilityDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SFSportsTeam name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SFSportsTeam button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v10 ^ v14 ^ -[SFSportsTeam isWinner](self, "isWinner");

  return v15;
}

- (SFImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_storeStrong((id *)&self->_logo, a3);
}

- (NSString)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SFButtonItem)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
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

- (SFSportsTeam)initWithProtobuf:(id)a3
{
  id v4;
  SFSportsTeam *v5;
  void *v6;
  SFImage *v7;
  void *v8;
  SFImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFButtonItem *v19;
  void *v20;
  SFButtonItem *v21;
  SFSportsTeam *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFSportsTeam;
  v5 = -[SFSportsTeam init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "logo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFImage alloc];
      objc_msgSend(v4, "logo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFSportsTeam setLogo:](v5, "setLogo:", v9);

    }
    objc_msgSend(v4, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "record");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsTeam setRecord:](v5, "setRecord:", v11);

    }
    objc_msgSend(v4, "score");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "score");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsTeam setScore:](v5, "setScore:", v13);

    }
    objc_msgSend(v4, "accessibilityDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "accessibilityDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsTeam setAccessibilityDescription:](v5, "setAccessibilityDescription:", v15);

    }
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSportsTeam setName:](v5, "setName:", v17);

    }
    objc_msgSend(v4, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFButtonItem initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[SFSportsTeam setButton:](v5, "setButton:", v21);

    }
    if (objc_msgSend(v4, "isWinner"))
      -[SFSportsTeam setIsWinner:](v5, "setIsWinner:", objc_msgSend(v4, "isWinner"));
    v22 = v5;
  }

  return v5;
}

@end
