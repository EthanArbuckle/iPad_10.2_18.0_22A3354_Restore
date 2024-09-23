@implementation TUIButtonBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIButtonBoxLayout, a2);
}

- (void)setStateMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  TUIButtonBox *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v4 = a3;
  v20 = self;
  v25.receiver = self;
  v25.super_class = (Class)TUIButtonBox;
  -[TUIStatefulElementBox setStateMap:](&v25, "setStateMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(TUIButtonStateModel);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "submodel"));
        v15 = TUIDynamicCast(v12, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributes"));
        if (v17)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v18 = objc_msgSend(v5, "count");
  if (v18)
    v19 = objc_msgSend(v5, "copy");
  else
    v19 = 0;
  objc_storeStrong((id *)&v20->_stateButtonAttributesMap, v19);
  if (v18)

}

+ (void)setupSize
{
  id v2;

  v2 = objc_msgSend(a1, "_metricsForButtonType:", 1);
}

+ (unint64_t)buttonTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB7D8 != -1)
  {
    dispatch_once(&qword_2CB7D8, &stru_242308);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB7D0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)buttonRoleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB7E8 != -1)
  {
    dispatch_once(&qword_2CB7E8, &stru_242328);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB7E0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (id)_metricsForButtonType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (qword_2CB7F8 != -1)
    dispatch_once(&qword_2CB7F8, &stru_242348);
  v4 = (void *)qword_2CB7F0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(unint64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSDictionary)stateButtonAttributesMap
{
  return self->_stateButtonAttributesMap;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void)setLinkEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_stateButtonAttributesMap, 0);
}

@end
