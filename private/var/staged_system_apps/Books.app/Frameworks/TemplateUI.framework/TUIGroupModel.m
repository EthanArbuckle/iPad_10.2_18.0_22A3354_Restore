@implementation TUIGroupModel

- (TUIGroupModel)init
{
  TUIGroupModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIGroupModel;
  result = -[TUIGroupModel init](&v3, "init");
  if (result)
    *(_WORD *)&result->_flags = *(_WORD *)&result->_flags & 0xFC00 | 0x20;
  return result;
}

- (unint64_t)halign
{
  return *(_WORD *)&self->_flags & 3;
}

- (void)setHalign:(unint64_t)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFC | a3 & 3;
}

- (unint64_t)valign
{
  return ((unint64_t)*(_WORD *)&self->_flags >> 2) & 7;
}

- (void)setValign:(unint64_t)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFE3 | (4 * (a3 & 7));
}

- (unint64_t)span
{
  return ((unint64_t)*(_WORD *)&self->_flags >> 5) & 0x1F;
}

- (void)setSpan:(unint64_t)a3
{
  char v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFC1F | (32 * (v3 & 0x1F));
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  NSArray *children;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[5];

  children = self->_children;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", &stru_23DA60);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  v7 = self->_children;
  self->_children = v6;

  v8 = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1A6D0;
  v9[3] = &unk_23DA88;
  v9[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);
  -[TUIGroupModel onContainedModelsChanged](self, "onContainedModelsChanged");
}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_children);
}

- (void)appendLayoutModelsToArray:(id)a3
{
  id v4;
  NSArray *children;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A768;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4;
  NSArray *children;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A7F0;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  NSArray *children;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  children = self->_children;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1A8A0;
  v11[3] = &unk_23DAB0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v11);

}

- (void)onContainedModelsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIGroupModel parentModel](self, "parentModel"));
  objc_msgSend(v2, "onContainedModelsChanged");

}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
