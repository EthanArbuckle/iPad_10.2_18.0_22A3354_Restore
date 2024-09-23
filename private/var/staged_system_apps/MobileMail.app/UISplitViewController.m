@implementation UISplitViewController

- (void)mf_setColumn:(int64_t)a3 visible:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void (**v14)(id, uint64_t);
  unsigned __int8 v15;
  char v16;
  _QWORD v17[5];
  void (**v18)(id, uint64_t);
  int64_t v19;
  BOOL v20;
  _QWORD v21[4];
  void (**v22)(id, uint64_t);

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = v10;
  if (v6)
  {
    if (v7)
      -[UISplitViewController showColumn:](self, "showColumn:", a3);
    else
      -[UISplitViewController hideColumn:](self, "hideColumn:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self, "transitionCoordinator"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001E54CC;
    v21[3] = &unk_10051C358;
    v14 = v11;
    v22 = v14;
    v15 = objc_msgSend(v13, "animateAlongsideTransition:completion:", &stru_100523BA8, v21);

    if (v14)
      v16 = v15;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
      v14[2](v14, 1);
    v12 = v22;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003A7D4;
    v17[3] = &unk_100523BD0;
    v20 = v7;
    v17[4] = self;
    v19 = a3;
    v18 = (void (**)(id, uint64_t))v10;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    v12 = v18;
  }

}

- (BOOL)shouldSnapshot
{
  void *v2;
  id v3;
  uint64_t v4;
  int v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController viewControllers](self, "viewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    v5 = 1;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v5 &= objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "shouldSnapshot");
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

@end
