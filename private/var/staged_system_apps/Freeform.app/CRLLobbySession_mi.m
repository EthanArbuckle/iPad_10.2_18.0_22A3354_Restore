@implementation CRLLobbySession_mi

- (CRLLobbySession_mi)initWithDisplayName:(id)a3 indicatorDarkColor:(id)a4 cnContact:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLLobbySession_mi *v11;
  void *v12;
  NSString *v13;
  NSString *displayName;
  CRLColor *v15;
  CRLColor *indicatorDarkColor;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRLLobbySession_mi;
  v11 = -[CRLLobbySession_mi init](&v18, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crl_substringWithComposedCharacterSequencesTruncatedToLength:", 30));
    v13 = (NSString *)objc_msgSend(v12, "copy");
    displayName = v11->_displayName;
    v11->_displayName = v13;

    v15 = (CRLColor *)objc_msgSend(v9, "copy");
    indicatorDarkColor = v11->_indicatorDarkColor;
    v11->_indicatorDarkColor = v15;

    objc_storeStrong((id *)&v11->_cnContact, a5);
  }

  return v11;
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLLobbySession_mi;
  v2 = -[CRLLobbySession_mi description](&v6, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v3));

  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  unsigned int v13;
  unsigned __int8 v14;
  CRLColor *indicatorDarkColor;

  if (self != a3)
  {
    v4 = a3;
    v6 = objc_opt_class(CRLLobbySession_mi, v5);
    v7 = sub_100221D0C(v6, v4);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      v9 = (void *)v8[1];
      v10 = self->_displayName;
      v11 = v9;
      if (v10 == v11)
      {

        goto LABEL_10;
      }
      v12 = v11;
      if (v10 && v11)
      {
        v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

        if (!v13)
          goto LABEL_13;
LABEL_10:
        indicatorDarkColor = self->_indicatorDarkColor;
        if ((unint64_t)indicatorDarkColor | v8[2])
          v14 = -[CRLColor isEqual:](indicatorDarkColor, "isEqual:");
        else
          v14 = 1;
        goto LABEL_14;
      }

    }
LABEL_13:
    v14 = 0;
LABEL_14:

    return v14;
  }
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_displayName, "hash");
}

- (CRLColor)indicatorDarkColor
{
  return self->_indicatorDarkColor;
}

- (CNContact)cnContact
{
  return self->_cnContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContact, 0);
  objc_storeStrong((id *)&self->_indicatorDarkColor, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
