@implementation CRLCommandSelectionBehavior

- (CRLCommandSelectionBehavior)initWithPersistableForwardSelectionPath:(id)a3 persistableReverseSelectionPath:(id)a4 commitSelectionPath:(id)a5 selectionFlags:(unint64_t)a6 commitSelectionFlags:(unint64_t)a7 forwardSelectionFlags:(unint64_t)a8 reverseSelectionFlags:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  CRLCommandSelectionBehavior *v19;
  CRLCommandSelectionBehavior *v20;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLCommandSelectionBehavior;
  v19 = -[CRLCommandSelectionBehavior init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_persistableForwardSelectionPath, a3);
    objc_storeStrong((id *)&v20->_persistableReverseSelectionPath, a4);
    objc_storeStrong((id *)&v20->_commitSelectionPath, a5);
    v20->_selectionFlags = a6;
    v20->_additionalForwardSelectionFlags = a8;
    v20->_additionalReverseSelectionFlags = a9;
    v20->_additionalCommitSelectionFlags = a7;
    v20->_usePersistableCommitSelectionPath = 0;
  }

  return v20;
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5 commitSelectionFlags:(unint64_t)a6 forwardSelectionFlags:(unint64_t)a7 reverseSelectionFlags:(unint64_t)a8
{
  id v14;
  id v15;
  _TtC8Freeform27CRLPersistableSelectionPath *v16;
  _TtC8Freeform27CRLPersistableSelectionPath *v17;
  CRLCommandSelectionBehavior *v18;

  v14 = a4;
  v15 = a3;
  v16 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v15);
  v17 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v14);

  v18 = -[CRLCommandSelectionBehavior initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](self, "initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", v16, v17, v15, a5, a6, a7, a8);
  return v18;
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5 commitSelectionFlags:(unint64_t)a6
{
  return -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](self, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", a3, a4, a5, a6, 0, 0);
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5
{
  return -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:commitSelectionFlags:](self, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:commitSelectionFlags:", a3, a4, a5, 0);
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4
{
  return -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:](self, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:", a3, a4, 0);
}

- (CRLCommandSelectionBehavior)initWithCommitSelectionPath:(id)a3 forwardSelectionPath:(id)a4 reverseSelectionPath:(id)a5
{
  return -[CRLCommandSelectionBehavior initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:usePersistableCommitSelectionPath:](self, "initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:usePersistableCommitSelectionPath:", a3, a4, a5, 0);
}

- (CRLCommandSelectionBehavior)initWithCommitSelectionPath:(id)a3 forwardSelectionPath:(id)a4 reverseSelectionPath:(id)a5 usePersistableCommitSelectionPath:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  CRLCommandSelectionBehavior *v11;
  CRLCommandSelectionBehavior *v12;

  v6 = a6;
  v10 = a3;
  v11 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:](self, "initWithForwardSelectionPath:reverseSelectionPath:", a4, a5);
  v12 = v11;
  if (v11)
  {
    -[CRLCommandSelectionBehavior setUsePersistableCommitSelectionPath:](v11, "setUsePersistableCommitSelectionPath:", v6);
    -[CRLCommandSelectionBehavior setCommitSelectionPath:](v12, "setCommitSelectionPath:", v10);
  }

  return v12;
}

- (void)setCommitSelectionPath:(id)a3
{
  _TtC8Freeform27CRLPersistableSelectionPath *v5;
  _TtC8Freeform27CRLPersistableSelectionPath *persistableCommitSelectionPath;
  CRLSelectionPath *v7;

  v7 = (CRLSelectionPath *)a3;
  if (self->_commitSelectionPath != v7)
    objc_storeStrong((id *)&self->_commitSelectionPath, a3);
  if (-[CRLCommandSelectionBehavior usePersistableCommitSelectionPath](self, "usePersistableCommitSelectionPath"))
  {
    v5 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v7);
    persistableCommitSelectionPath = self->_persistableCommitSelectionPath;
    self->_persistableCommitSelectionPath = v5;

  }
}

- (void)setForwardSelectionPath:(id)a3
{
  _TtC8Freeform27CRLPersistableSelectionPath *v4;
  _TtC8Freeform27CRLPersistableSelectionPath *v5;
  id v6;

  v6 = a3;
  v4 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v6);
  if (v4 != self->_persistableForwardSelectionPath)
  {
    v5 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", self->_commitSelectionPath);
    if (v5 == self->_persistableForwardSelectionPath)
      -[CRLCommandSelectionBehavior setCommitSelectionPath:](self, "setCommitSelectionPath:", v6);

    objc_storeStrong((id *)&self->_persistableForwardSelectionPath, v4);
  }

}

- (void)setReverseSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform27CRLPersistableSelectionPath *v5;
  _TtC8Freeform27CRLPersistableSelectionPath *persistableReverseSelectionPath;

  v4 = a3;
  v5 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v4);

  persistableReverseSelectionPath = self->_persistableReverseSelectionPath;
  self->_persistableReverseSelectionPath = v5;

}

- (void)setSelectionFlags:(unint64_t)a3
{
  self->_selectionFlags = a3;
}

- (id)commandSelectionBehaviorByCoalescingWithCommandSelectionBehavior:(id)a3
{
  id v4;
  CRLCommandSelectionBehavior *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  CRLCommandSelectionBehavior *v11;

  v4 = a3;
  v5 = [CRLCommandSelectionBehavior alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistableForwardSelectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandSelectionBehavior persistableReverseSelectionPath](self, "persistableReverseSelectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandSelectionBehavior commitSelectionPath](self, "commitSelectionPath"));
  v9 = -[CRLCommandSelectionBehavior selectionFlags](self, "selectionFlags");
  v10 = objc_msgSend(v4, "additionalForwardSelectionFlags");

  v11 = -[CRLCommandSelectionBehavior initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](v5, "initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", v6, v7, v8, v9, 0, v10, -[CRLCommandSelectionBehavior additionalReverseSelectionFlags](self, "additionalReverseSelectionFlags"));
  return v11;
}

- (CRLSelectionPath)commitSelectionPath
{
  return self->_commitSelectionPath;
}

- (_TtC8Freeform27CRLPersistableSelectionPath)persistableForwardSelectionPath
{
  return self->_persistableForwardSelectionPath;
}

- (void)setPersistableForwardSelectionPath:(id)a3
{
  objc_storeStrong((id *)&self->_persistableForwardSelectionPath, a3);
}

- (_TtC8Freeform27CRLPersistableSelectionPath)persistableReverseSelectionPath
{
  return self->_persistableReverseSelectionPath;
}

- (void)setPersistableReverseSelectionPath:(id)a3
{
  objc_storeStrong((id *)&self->_persistableReverseSelectionPath, a3);
}

- (_TtC8Freeform27CRLPersistableSelectionPath)persistableCommitSelectionPath
{
  return self->_persistableCommitSelectionPath;
}

- (void)setPersistableCommitSelectionPath:(id)a3
{
  objc_storeStrong((id *)&self->_persistableCommitSelectionPath, a3);
}

- (unint64_t)selectionFlags
{
  return self->_selectionFlags;
}

- (unint64_t)additionalCommitSelectionFlags
{
  return self->_additionalCommitSelectionFlags;
}

- (unint64_t)additionalForwardSelectionFlags
{
  return self->_additionalForwardSelectionFlags;
}

- (unint64_t)additionalReverseSelectionFlags
{
  return self->_additionalReverseSelectionFlags;
}

- (BOOL)usePersistableCommitSelectionPath
{
  return self->_usePersistableCommitSelectionPath;
}

- (void)setUsePersistableCommitSelectionPath:(BOOL)a3
{
  self->_usePersistableCommitSelectionPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitSelectionPath, 0);
  objc_storeStrong((id *)&self->_persistableCommitSelectionPath, 0);
  objc_storeStrong((id *)&self->_persistableForwardSelectionPath, 0);
  objc_storeStrong((id *)&self->_persistableReverseSelectionPath, 0);
}

@end
