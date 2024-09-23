@implementation WebCoreTextTrackRepresentationCocoaHelper

- (WebCoreTextTrackRepresentationCocoaHelper)initWithParent:(void *)a3
{
  WebCoreTextTrackRepresentationCocoaHelper *v4;
  WebCoreTextTrackRepresentationCocoaHelper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebCoreTextTrackRepresentationCocoaHelper;
  v4 = -[WebCoreTextTrackRepresentationCocoaHelper init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[WebCoreTextTrackRepresentationCocoaHelper setParent:](v4, "setParent:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WebCoreTextTrackRepresentationCocoaHelper setParent:](self, "setParent:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WebCoreTextTrackRepresentationCocoaHelper;
  -[WebCoreTextTrackRepresentationCocoaHelper dealloc](&v3, sel_dealloc);
}

- (void)setParent:(void *)a3
{
  id *parent;

  parent = (id *)self->_parent;
  if (parent)
    objc_msgSend(parent[3], "removeObserver:forKeyPath:", self, CFSTR("bounds"));
  self->_parent = a3;
  if (a3)
    objc_msgSend(*((id *)a3 + 3), "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 0, 0);
}

- (void)parent
{
  return self->_parent;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void (*v6[7])(_QWORD);

  v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v6[1] = (void (*)(_QWORD))3221225472;
  v6[2] = (void (*)(_QWORD))__92__WebCoreTextTrackRepresentationCocoaHelper_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = (void (*)(_QWORD))&unk_1E334F240;
  v6[4] = (void (*)(_QWORD))self;
  v6[5] = (void (*)(_QWORD))a3;
  v6[6] = (void (*)(_QWORD))a4;
  WebThreadRun(v6);
}

uint64_t __92__WebCoreTextTrackRepresentationCocoaHelper_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:", CFSTR("bounds"));
    if ((_DWORD)result)
    {
      result = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
      if (*(_QWORD *)(v1 + 48) == *(_QWORD *)(result + 24))
      {
        v2 = *(_QWORD *)(result + 16);
        v4[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
        v4[1] = v3;
        return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v2 + 24))(v2, v4);
      }
    }
  }
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

@end
