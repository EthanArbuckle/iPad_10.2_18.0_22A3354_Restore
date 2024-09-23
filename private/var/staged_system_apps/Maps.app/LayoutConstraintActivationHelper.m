@implementation LayoutConstraintActivationHelper

- (LayoutConstraintActivationHelper)init
{
  LayoutConstraintActivationHelper *v2;
  uint64_t v3;
  NSMutableArray *pendingConstraintsToActivate;
  uint64_t v5;
  NSMutableArray *pendingConstraintsToDeactivate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LayoutConstraintActivationHelper;
  v2 = -[LayoutConstraintActivationHelper init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingConstraintsToActivate = v2->_pendingConstraintsToActivate;
    v2->_pendingConstraintsToActivate = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingConstraintsToDeactivate = v2->_pendingConstraintsToDeactivate;
    v2->_pendingConstraintsToDeactivate = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)scheduleConstraint:(id)a3 activate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToDeactivate](self, "pendingConstraintsToDeactivate"));
      objc_msgSend(v8, "removeObject:", v14);

      v9 = objc_msgSend(v14, "isActive");
      v7 = v14;
      if ((v9 & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToActivate](self, "pendingConstraintsToActivate"));
LABEL_7:
        v13 = v10;
        objc_msgSend(v10, "addObject:", v14);

        v7 = v14;
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToActivate](self, "pendingConstraintsToActivate"));
      objc_msgSend(v11, "removeObject:", v14);

      v12 = objc_msgSend(v14, "isActive");
      v7 = v14;
      if (v12)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToDeactivate](self, "pendingConstraintsToDeactivate"));
        goto LABEL_7;
      }
    }
  }

}

- (void)scheduleConstraints:(id)a3 activate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[LayoutConstraintActivationHelper scheduleConstraint:activate:](self, "scheduleConstraint:activate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), v4, (_QWORD)v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)pendingConstraintsToActivate:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToActivate](self, "pendingConstraintsToActivate"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToDeactivate](self, "pendingConstraintsToDeactivate"));
  v4 = v3;
  v5 = objc_msgSend(v3, "copy");

  return v5;
}

- (void)clearPendingConstraints
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToActivate](self, "pendingConstraintsToActivate"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToDeactivate](self, "pendingConstraintsToDeactivate"));
  objc_msgSend(v4, "removeAllObjects");

}

- (void)commitPendingConstraints
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToDeactivate](self, "pendingConstraintsToDeactivate"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToDeactivate](self, "pendingConstraintsToDeactivate"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToActivate](self, "pendingConstraintsToActivate"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutConstraintActivationHelper pendingConstraintsToActivate](self, "pendingConstraintsToActivate"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

  }
  -[LayoutConstraintActivationHelper clearPendingConstraints](self, "clearPendingConstraints");
}

- (NSMutableArray)pendingConstraintsToActivate
{
  return self->_pendingConstraintsToActivate;
}

- (void)setPendingConstraintsToActivate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConstraintsToActivate, a3);
}

- (NSMutableArray)pendingConstraintsToDeactivate
{
  return self->_pendingConstraintsToDeactivate;
}

- (void)setPendingConstraintsToDeactivate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConstraintsToDeactivate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConstraintsToDeactivate, 0);
  objc_storeStrong((id *)&self->_pendingConstraintsToActivate, 0);
}

@end
