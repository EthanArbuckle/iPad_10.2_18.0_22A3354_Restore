@implementation DOMTreeWalker

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
      WTF::RefCounted<WebCore::TreeWalker>::deref((_QWORD *)internal + 1);
    v5.receiver = self;
    v5.super_class = (Class)DOMTreeWalker;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (DOMNode)root
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 2));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unsigned)whatToShow
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 8);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (id)filter
{
  DOMObjectInternal *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = kit(*((DOMObjectInternal **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)expandEntityReferences
{
  return 0;
}

- (DOMNode)currentNode
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 5));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (void)setCurrentNode:(DOMNode *)currentNode
{
  DOMObjectInternal *internal;
  void *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  if (!currentNode || (internal = currentNode->super._internal) == 0)
    raiseTypeErrorException();
  WebCore::TreeWalker::setCurrentNode(self->super._internal, (Node *)internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
}

- (DOMNode)parentNode
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::parentNode(self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7);
    v4 = 0;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, &v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)firstChild
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::firstChild(self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7);
    v4 = 0;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, &v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)lastChild
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::lastChild(self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7);
    v4 = 0;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, &v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)previousSibling
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7[2];
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  MEMORY[0x1D82A3C98](v7, self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7[0]);
    v4 = v8;
    if (v8 == -1)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)nextSibling
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7[2];
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  MEMORY[0x1D82A3C74](v7, self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7[0]);
    v4 = v8;
    if (v8 == -1)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)previousNode
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::previousNode(self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7);
    v4 = 0;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, &v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)nextNode
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  int v8;
  _BYTE v9[87];
  char v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::nextNode(self->super._internal);
  v4 = v8;
  if (!v8)
  {
    v5 = (DOMNode *)kit(v7);
    v4 = 0;
    goto LABEL_3;
  }
  v5 = 0;
  if (v8 != -1)
LABEL_3:
    ((void (*)(char *, WebCore::Node **))off_1E9D6AFD0[v4])(&v10, &v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

@end
