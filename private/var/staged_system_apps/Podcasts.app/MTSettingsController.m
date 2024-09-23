@implementation MTSettingsController

- (void)reloadGroupWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self, "groups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settingsHandler"));

    if (v6)
      objc_msgSend(v5, "setGroupSettings:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
    objc_msgSend(v7, "settingsController:reloadedGroupWithIdentifier:", self, v8);

  }
}

- (BOOL)isEnabledForGroupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController disabledGroups](self, "disabledGroups"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

- (void)setEnabled:(BOOL)a3 forGroupWithIdentifier:(id)a4
{
  _BOOL4 v4;
  NSMutableSet *disabledGroups;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  if (-[MTSettingsController isEnabledForGroupWithIdentifier:](self, "isEnabledForGroupWithIdentifier:") != v4)
  {
    disabledGroups = self->_disabledGroups;
    if (v4)
    {
      -[NSMutableSet removeObject:](disabledGroups, "removeObject:", v11);
    }
    else
    {
      v7 = v11;
      if (!disabledGroups)
      {
        v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v9 = self->_disabledGroups;
        self->_disabledGroups = v8;

        v7 = v11;
        disabledGroups = self->_disabledGroups;
      }
      -[NSMutableSet addObject:](disabledGroups, "addObject:", v7);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
    objc_msgSend(v10, "settingsController:reloadedGroupWithIdentifier:", self, v11);

  }
}

- (void)setHeaderAction:(id)a3 forGroupWithIdentifier:(id)a4
{
  NSDictionary *groups;
  id v7;
  id v8;
  void *v9;
  id v10;

  groups = self->_groups;
  v7 = a4;
  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v7));
  objc_msgSend(v10, "setHeaderAction:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
  objc_msgSend(v9, "settingsController:didChangeHeaderAction:inGroupWithIdentifier:", self, v8, v7);

}

- (void)addGroup:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5
{
  NSArray *order;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  order = self->_order;
  v9 = a4;
  v10 = a3;
  v13 = -[NSArray mutableCopy](order, "mutableCopy");
  objc_msgSend(v13, "insertObject:atIndex:", v9, a5);
  -[MTSettingsController setOrder:](self, "setOrder:", v13);
  v11 = -[NSDictionary mutableCopy](self->_groups, "mutableCopy");
  objc_msgSend(v11, "setObject:forKey:", v10, v9);

  -[MTSettingsController setGroups:](self, "setGroups:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
  objc_msgSend(v12, "settingsController:addedGroup:atIndex:", self, v10, a5);

}

- (void)removeGroupWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[NSArray mutableCopy](self->_order, "mutableCopy");
  v5 = objc_msgSend(v4, "indexOfObject:", v9);
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(v4, "removeObject:", v9);
    -[MTSettingsController setOrder:](self, "setOrder:", v4);
    v7 = -[NSDictionary mutableCopy](self->_groups, "mutableCopy");
    objc_msgSend(v7, "removeObjectForKey:", v9);
    -[MTSettingsController setGroups:](self, "setGroups:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
    objc_msgSend(v8, "settingsController:removedGroupAtIndex:", self, v6);

  }
}

- (void)removeSettingAtIndex:(unint64_t)a3 fromGroupWithIdentifier:(id)a4
{
  NSDictionary *groups;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  groups = self->_groups;
  v7 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupSettings"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObjectAtIndex:", a3);
  objc_msgSend(v11, "setGroupSettings:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
  objc_msgSend(v10, "settingsController:removedSettingAtIndex:inGroupWithIdentifier:", self, a3, v7);

}

- (void)setValue:(id)a3 forSettingWithIdentifier:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_groups, "objectForKeyedSubscript:", v10));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10004682C;
  v28 = sub_100046A8C;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupSettings"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100100B70;
  v16[3] = &unk_1004AB2D0;
  v13 = v9;
  v17 = v13;
  v18 = &v24;
  v19 = &v20;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

  v14 = (void *)v25[5];
  if (v14)
  {
    objc_msgSend(v14, "setValue:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController delegate](self, "delegate"));
    objc_msgSend(v15, "settingsController:didChangeSettingValueAtIndex:inGroupWithIdentifier:", self, v21[3], v10);

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTSettingsControllerDelegate)delegate
{
  return (MTSettingsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)disabledGroups
{
  return self->_disabledGroups;
}

- (void)setDisabledGroups:(id)a3
{
  objc_storeStrong((id *)&self->_disabledGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
