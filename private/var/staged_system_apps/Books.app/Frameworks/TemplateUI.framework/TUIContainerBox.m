@implementation TUIContainerBox

- (void)updateModelChildren:(id)a3
{
  NSArray *v4;
  NSArray *children;
  NSArray *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[NSArray enumerateObjectsUsingBlock:](self->_children, "enumerateObjectsUsingBlock:", &stru_2434F8);
  v4 = (NSArray *)objc_msgSend(v7, "copy");
  children = self->_children;
  self->_children = v4;

  v6 = self->_children;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_177B6C;
  v8[3] = &unk_2410A0;
  v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
  -[TUIContainerBox onContainedModelsChanged](self, "onContainedModelsChanged");

}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_children);
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
  v7[2] = sub_177C30;
  v7[3] = &unk_2410A0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
