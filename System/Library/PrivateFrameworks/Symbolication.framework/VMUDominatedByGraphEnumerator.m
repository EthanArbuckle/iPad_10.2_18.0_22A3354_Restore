@implementation VMUDominatedByGraphEnumerator

- (VMUDominatedByGraphEnumerator)initWithGraph:(id)a3 dominatorGraph:(id)a4
{
  VMUDominatorGraph *v6;
  VMUDominatedByGraphEnumerator *v7;
  VMUDominatorGraph *dominatorGraph;
  objc_super v10;

  v6 = (VMUDominatorGraph *)a4;
  v10.receiver = self;
  v10.super_class = (Class)VMUDominatedByGraphEnumerator;
  v7 = -[VMUGraphEnumerator initWithGraph:](&v10, sel_initWithGraph_, a3);
  dominatorGraph = v7->_dominatorGraph;
  v7->_dominatorGraph = v6;

  return v7;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  void (**v6)(id, uint64_t, uint64_t, uint64_t, char *);
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, uint64_t, uint64_t, uint64_t, char *))a4;
  v7 = -[VMUDominatorGraph dominator:](self->_dominatorGraph, "dominator:", v4);
  if ((_DWORD)v7 != -1)
  {
    v8 = 0;
    v6[2](v6, 0xFFFFFFFFLL, v4, v7, &v8);
  }

}

- (id)statusDisplayDescription
{
  return CFSTR("owned");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominatorGraph, 0);
}

@end
