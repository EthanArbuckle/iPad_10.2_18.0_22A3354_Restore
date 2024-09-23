@implementation SACallTree

- (SACallTree)initWithRootObjects:(id)a3
{
  id v4;
  SACallTree *v5;
  uint64_t v6;
  NSArray *rootObjects;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SACallTree;
  v5 = -[SACallTree init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rootObjects = v5->_rootObjects;
    v5->_rootObjects = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)rootFrames
{
  return (NSArray *)FilterArrayToCallTreeFrames(self->_rootObjects);
}

- (void)enumerateCallTreeFrames:(id)a3
{
  id v4;
  NSArray *rootObjects;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  rootObjects = self->_rootObjects;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SACallTree_enumerateCallTreeFrames___block_invoke;
  v7[3] = &unk_1E7148C40;
  v8 = v4;
  v6 = v4;
  +[SACallTreeFrame enumerateTree:block:]((uint64_t)SACallTreeFrame, rootObjects, v7);

}

void __38__SACallTree_enumerateCallTreeFrames___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isTruncatedLeafCallstack") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSArray)rootObjects
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObjects, 0);
}

@end
