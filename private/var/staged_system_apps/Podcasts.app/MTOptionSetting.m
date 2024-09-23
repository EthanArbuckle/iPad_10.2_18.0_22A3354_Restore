@implementation MTOptionSetting

- (id)currentShortTitle
{
  MTOptionsDescription *options;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  options = self->_options;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetting value](self, "value"));
  v5 = -[MTOptionsDescription indexForValue:](options, "indexForValue:", objc_msgSend(v4, "unsignedIntegerValue"));

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsDescription shortTitles](self->_options, "shortTitles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v5));

  return v7;
}

- (id)menuForOptions
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  _QWORD v22[5];
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueSet"));

  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
        v9 = objc_msgSend(v8, "indexForValue:", objc_msgSend(v7, "integerValue"));

        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueSet"));
          v12 = v9 < objc_msgSend(v11, "count");

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "longTitles"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v9));

            objc_initWeak(&location, self);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_1000FFE44;
            v22[3] = &unk_1004AB2A8;
            objc_copyWeak(&v23, &location);
            v22[4] = v7;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v22));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetting value](self, "value"));
            objc_msgSend(v16, "setState:", objc_msgSend(v7, "isEqualToNumber:", v17));

            objc_msgSend(v20, "addObject:", v16);
            objc_destroyWeak(&v23);
            objc_destroyWeak(&location);

          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1004C6D40, v20));
  return v18;
}

- (MTOptionsDescription)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSAttributedString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
