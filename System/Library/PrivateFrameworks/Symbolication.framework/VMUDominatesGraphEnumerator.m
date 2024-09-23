@implementation VMUDominatesGraphEnumerator

- (VMUDominatesGraphEnumerator)initWithGraph:(id)a3 dominatorGraph:(id)a4
{
  VMUDominatorGraph *v6;
  VMUDominatesGraphEnumerator *v7;
  VMUDominatorGraph *dominatorGraph;
  objc_super v10;

  v6 = (VMUDominatorGraph *)a4;
  v10.receiver = self;
  v10.super_class = (Class)VMUDominatesGraphEnumerator;
  v7 = -[VMUGraphEnumerator initWithGraph:](&v10, sel_initWithGraph_, a3);
  dominatorGraph = v7->_dominatorGraph;
  v7->_dominatorGraph = v6;

  return v7;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  VMUDominatorGraph *dominatorGraph;
  id v8;
  _QWORD v9[4];
  id v10;
  int v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  dominatorGraph = self->_dominatorGraph;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__VMUDominatesGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
  v9[3] = &unk_1E4E01C78;
  v10 = v6;
  v11 = v4;
  v8 = v6;
  -[VMUDominatorGraph enumerateDirectDomineesForNodeName:withBlock:](dominatorGraph, "enumerateDirectDomineesForNodeName:withBlock:", v4, v9);

}

uint64_t __62__VMUDominatesGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t, char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0xFFFFFFFFLL, *(unsigned int *)(a1 + 40), a2, &v3);
}

- (id)statusDisplayDescription
{
  return CFSTR("owns");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominatorGraph, 0);
}

@end
