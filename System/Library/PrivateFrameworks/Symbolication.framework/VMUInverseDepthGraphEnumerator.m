@implementation VMUInverseDepthGraphEnumerator

- (VMUInverseDepthGraphEnumerator)initWithGraph:(id)a3 depthGraph:(id)a4
{
  VMUDepthGraph *v6;
  void *v7;
  VMUInverseDepthGraphEnumerator *v8;
  VMUDepthGraph *depthGraph;
  objc_super v11;

  v6 = (VMUDepthGraph *)a4;
  objc_msgSend(a3, "invertedGraph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)VMUInverseDepthGraphEnumerator;
  v8 = -[VMUGraphEnumerator initWithGraph:](&v11, sel_initWithGraph_, v7);

  depthGraph = v8->_depthGraph;
  v8->_depthGraph = v6;

  return v8;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  unsigned int v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unsigned int v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[VMUDepthGraph depthOfNode:](self->_depthGraph, "depthOfNode:", v4);
  -[VMUGraphEnumerator graph](self, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__VMUInverseDepthGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
  v10[3] = &unk_1E4E01CA0;
  v12 = v7;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "enumerateEdgesOfNode:withBlock:", v4, v10);

}

uint64_t __65__VMUInverseDepthGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "depthOfNode:", a4);
  if ((_DWORD)result == *(_DWORD *)(a1 + 48) - 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (id)statusDisplayDescription
{
  return CFSTR("higher");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthGraph, 0);
}

@end
