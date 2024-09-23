@implementation TUIStructBuilder

- (TUIStructBuilder)initWithClosure:(id)a3 basedOn:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  TUIStructBuilder *v11;
  objc_super v13;

  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TUIStructBuilder;
  v11 = -[TUIStructBuilder init](&v13, "init");
  if (v11)
  {
    v11->_context = objc_msgSend(v10, "_context");
    v11->_closure.index = a3.var0;
    objc_storeStrong((id *)&v11->_basedOn, a4);
  }

  return v11;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  int v4;
  id v6[3];

  v4 = *(_DWORD *)&a4.var0;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, (double *)v6);
  TUI::Evaluation::Variables::Scope::define((uint64_t)&self->_scope, v4 << 16, v6);

}

- (void)setStructValue:(id)a3 forKey:(id)a4
{
  unsigned int v5;
  id v6;
  id v7;
  id v8;

  v5 = *(_DWORD *)&a4.var0 << 16;
  LODWORD(v7) = 18;
  v8 = a3;
  v6 = v8;
  TUI::Evaluation::Variables::Scope::define((uint64_t)&self->_scope, v5, &v7);

}

- (id)finalizeStruct
{
  uint64_t v3;
  unint64_t index;
  uint64_t v6;

  v3 = *((_QWORD *)self->_context + 72);
  index = self->_closure.index;
  if (TUIClosureNotNil(self->_closure.index)
    && *(_QWORD *)(v3 + 376) > index
    && *(_QWORD *)(v3 + 368) + 28 * index)
  {
    TUI::Evaluation::Variables::Capture::create(0, *((void **)self->_context + 71), &v6);
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basedOn, 0);
  TUI::Evaluation::Variables::Scope::~Scope((TUI::Evaluation::Variables::Scope *)&self->_scope);
}

- (id).cxx_construct
{
  TUI::Evaluation::Variables::Scope::Scope((TUI::Evaluation::Variables::Scope *)&self->_scope);
  return self;
}

@end
