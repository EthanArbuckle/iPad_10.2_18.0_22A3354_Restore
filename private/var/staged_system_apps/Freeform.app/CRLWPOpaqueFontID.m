@implementation CRLWPOpaqueFontID

- (CRLWPOpaqueFontID)initWithPostScriptName:(id)a3 familyName:(id)a4
{
  id v7;
  id v8;
  CRLWPOpaqueFontID *v9;
  CRLWPOpaqueFontID *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLWPOpaqueFontID;
  v9 = -[CRLWPOpaqueFontID init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_desiredPostScriptName, a3);
    objc_storeStrong((id *)&v10->_familyName, a4);
  }

  return v10;
}

- (CRLWPOpaqueFontID)initWithFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLWPOpaqueFontID *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isRequestedFont"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "desiredPostScriptName"));
  v7 = -[CRLWPOpaqueFontID initWithPostScriptName:familyName:](self, "initWithPostScriptName:familyName:", v6, v5);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  BOOL v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;

  if (self != a3)
  {
    v4 = a3;
    objc_opt_class(CRLWPOpaqueFontID, v5);
    v7 = sub_100221D0C(v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID familyName](self, "familyName"));
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "familyName"));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID familyName](self, "familyName"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "familyName"));
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_10;
        }
        else
        {

        }
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID desiredPostScriptName](self, "desiredPostScriptName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "desiredPostScriptName"));
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if ((v19 & 1) != 0)
      {
LABEL_10:
        v16 = 1;
LABEL_12:

        return v16;
      }
    }
    v16 = 0;
    goto LABEL_12;
  }
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID desiredPostScriptName](self, "desiredPostScriptName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID familyName](self, "familyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, v4));

  v6 = objc_msgSend(v5, "hash");
  return (unint64_t)v6;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID desiredPostScriptName](self, "desiredPostScriptName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPOpaqueFontID familyName](self, "familyName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: <%p> Desired PostScript Name: %@; Family Name: %@"),
                   v5,
                   self,
                   v6,
                   v7));

  return v8;
}

- (NSString)desiredPostScriptName
{
  return self->_desiredPostScriptName;
}

- (void)setDesiredPostScriptName:(id)a3
{
  objc_storeStrong((id *)&self->_desiredPostScriptName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_desiredPostScriptName, 0);
}

@end
