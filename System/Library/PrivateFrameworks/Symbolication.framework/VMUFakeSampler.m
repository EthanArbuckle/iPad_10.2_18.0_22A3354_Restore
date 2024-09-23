@implementation VMUFakeSampler

- (VMUFakeSampler)initWithProcessObjectGraph:(id)a3
{
  id v5;
  VMUFakeSampler *v6;
  VMUFakeSampler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMUFakeSampler;
  v6 = -[VMUFakeSampler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "backtraceLength"))
  {
    -[VMUProcessObjectGraph threadNameForAddress:](self->_graph, "threadNameForAddress:", *(_QWORD *)objc_msgSend(v5, "stackFramePointers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread_%u"), objc_msgSend(v5, "thread"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
