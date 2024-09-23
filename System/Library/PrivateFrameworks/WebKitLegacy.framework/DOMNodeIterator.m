@implementation DOMNodeIterator

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (self->super._internal)
    {
      -[DOMNodeIterator detach](self, "detach");
      internal = self->super._internal;
      if (*((_DWORD *)internal + 2) == 1)
      {
        v5 = MEMORY[0x1D82A41CC]();
        MEMORY[0x1D82A41D8](v5);
      }
      else
      {
        --*((_DWORD *)internal + 2);
      }
    }
    v6.receiver = self;
    v6.super_class = (Class)DOMNodeIterator;
    -[DOMObject dealloc](&v6, sel_dealloc);
  }
}

- (DOMNode)root
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unsigned)whatToShow
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 10);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (id)filter
{
  DOMObjectInternal *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = kit(*((DOMObjectInternal **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)expandEntityReferences
{
  return 0;
}

- (DOMNode)referenceNode
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 6));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)pointerBeforeReferenceNode
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((_BYTE *)self->super._internal + 56);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMNode)nextNode
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  WebCore::Node *v8;
  int v9;
  _BYTE v10[87];
  char v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::NodeIterator::nextNode(self->super._internal);
  v4 = v9;
  if (v9)
  {
    v5 = 0;
    if (v9 != -1)
LABEL_3:
      ((void (*)(char *, WebCore::Node **))off_1E9D6AF40[v4])(&v11, &v8);
  }
  else
  {
    v7 = v8;
    v8 = 0;
    v5 = (DOMNode *)kit(v7);
    if (v7)
    {
      if (*((_DWORD *)v7 + 6) == 2)
      {
        if ((*((_WORD *)v7 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v7);
      }
      else
      {
        *((_DWORD *)v7 + 6) -= 2;
      }
    }
    v4 = v9;
    if (v9 != -1)
      goto LABEL_3;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v5;
}

- (DOMNode)previousNode
{
  void *v3;
  int v4;
  DOMNode *v5;
  WebCore::Node *v7;
  WebCore::Node *v8;
  int v9;
  _BYTE v10[87];
  char v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::NodeIterator::previousNode(self->super._internal);
  v4 = v9;
  if (v9)
  {
    v5 = 0;
    if (v9 != -1)
LABEL_3:
      ((void (*)(char *, WebCore::Node **))off_1E9D6AF40[v4])(&v11, &v8);
  }
  else
  {
    v7 = v8;
    v8 = 0;
    v5 = (DOMNode *)kit(v7);
    if (v7)
    {
      if (*((_DWORD *)v7 + 6) == 2)
      {
        if ((*((_WORD *)v7 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v7);
      }
      else
      {
        *((_DWORD *)v7 + 6) -= 2;
      }
    }
    v4 = v9;
    if (v9 != -1)
      goto LABEL_3;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v5;
}

- (void)detach
{
  void *v2;
  _BYTE v3[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

@end
