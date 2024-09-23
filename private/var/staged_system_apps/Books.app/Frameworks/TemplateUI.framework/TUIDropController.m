@implementation TUIDropController

- (void)_accessDropBehaviorForEmbeddedCollectionView:(id)a3 block:(id)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(id, void *, void *))a4;
  if (objc_msgSend(v12, "acceptsDrop"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dropHandler"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionsData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "behaviorDataForTrigger:", CFSTR("drop")));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "behavior"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionObject"));
        v5[2](v5, v10, v11);

      }
    }

  }
}

- (void)_embeddedCollectionView:(id)a3 performDrop:(id)a4
{
  id v5;
  _QWORD v6[4];
  TUIDropController *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3B1D0;
  v6[3] = &unk_23E898;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[TUIDropController _accessDropBehaviorForEmbeddedCollectionView:block:](v7, "_accessDropBehaviorForEmbeddedCollectionView:block:", a3, v6);

}

- (BOOL)_embeddedCollectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3B324;
  v9[3] = &unk_23E8C0;
  v11 = &v12;
  v9[4] = self;
  v7 = a4;
  v10 = v7;
  -[TUIDropController _accessDropBehaviorForEmbeddedCollectionView:block:](self, "_accessDropBehaviorForEmbeddedCollectionView:block:", v6, v9);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (UIDropInteraction)dropInteraction
{
  UIDropInteraction *dropInteraction;
  UIDropInteraction *v4;
  UIDropInteraction *v5;

  dropInteraction = self->_dropInteraction;
  if (!dropInteraction)
  {
    v4 = (UIDropInteraction *)objc_msgSend(objc_alloc((Class)UIDropInteraction), "initWithDelegate:", self);
    v5 = self->_dropInteraction;
    self->_dropInteraction = v4;

    dropInteraction = self->_dropInteraction;
  }
  return dropInteraction;
}

- (id)_embeddedCollectionViewForInteraction:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hitTest:withEvent:", 0, v9, v11));

  v15 = objc_opt_class(TUIEmbeddedCollectionView, v14);
  v16 = TUIPlatformAncestorOfClass(v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDropController _embeddedCollectionViewForInteraction:session:](self, "_embeddedCollectionViewForInteraction:session:", a3, v6));
  LOBYTE(self) = -[TUIDropController _embeddedCollectionView:canHandleDropSession:](self, "_embeddedCollectionView:canHandleDropSession:", v7, v6);

  return (char)self;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDropController _embeddedCollectionViewForInteraction:session:](self, "_embeddedCollectionViewForInteraction:session:", a3, v6));
  LODWORD(self) = -[TUIDropController _embeddedCollectionView:canHandleDropSession:](self, "_embeddedCollectionView:canHandleDropSession:", v7, v6);

  if ((_DWORD)self)
    v8 = 2;
  else
    v8 = 0;
  v9 = objc_msgSend(objc_alloc((Class)UIDropProposal), "initWithDropOperation:", v8);

  return v9;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[TUIDropController _embeddedCollectionViewForInteraction:session:](self, "_embeddedCollectionViewForInteraction:session:", a3, v6));
  -[TUIDropController _embeddedCollectionView:performDrop:](self, "_embeddedCollectionView:performDrop:", v7, v6);

}

- (TUIActionHandlerDelegate)actionHandlerDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionHandlerDelegate);
}

- (void)setActionHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandlerDelegate, a3);
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_actionHandlerDelegate);
}

@end
