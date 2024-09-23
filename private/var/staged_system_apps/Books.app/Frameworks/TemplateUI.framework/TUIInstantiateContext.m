@implementation TUIInstantiateContext

- (TUIInstantiateContext)initWithDelegate:(id)a3 package:(id)a4 manager:(id)a5 identifierMap:(id)a6 environment:(id)a7 state:(id)a8 feedId:(id)a9
{
  id v15;
  id v16;
  id v17;
  TUIInstantiateContext *v18;
  id *p_isa;
  id v21;
  id v22;
  id obj;
  objc_super v24;

  obj = a3;
  v15 = a4;
  v21 = a5;
  v22 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TUIInstantiateContext;
  v18 = -[TUIInstantiateContext init](&v24, "init");
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    v18->_feedId.uniqueIdentifier = a9.var0;
    objc_storeWeak((id *)&v18->_delegate, obj);
    objc_storeStrong(p_isa + 6, a6);
    objc_storeStrong(p_isa + 7, a7);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 4, a5);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  TUI::Evaluation::Context *context;
  _QWORD *conformanceCache;
  void *v5;
  objc_super v6;

  context = (TUI::Evaluation::Context *)self->_context;
  if (context)
  {
    TUI::Evaluation::Context::~Context(context);
    operator delete();
  }
  conformanceCache = self->_conformanceCache;
  if (conformanceCache)
  {
    v5 = (void *)conformanceCache[9];
    if (v5)
    {
      conformanceCache[10] = v5;
      operator delete(v5);
    }
    operator delete();
  }
  v6.receiver = self;
  v6.super_class = (Class)TUIInstantiateContext;
  -[TUIInstantiateContext dealloc](&v6, "dealloc");
}

- (TUIPackage)package
{
  return self->_package;
}

- (id)serviceConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instantiateContext:serviceConformingToProtocol:", self, v4));

  return v6;
}

- (id)instantiateTemplate:(id)a3 bindings:(id)a4 actionObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  TUIPackageInternal *v12;
  TUIPackageInternal *v13;
  TUIPackageInternal *v14;
  _TUIInstantiateEntry *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *((_QWORD *)self->_context + 96);
  if (v11)
    *(_QWORD *)(v11 + 27848) = mach_absolute_time();
  if (!v8)
    goto LABEL_13;
  v12 = (TUIPackageInternal *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "package"));
  v13 = v12;
  if (v12 == self->_package)
  {

    if (v13)
    {
      kdebug_trace(725408464, 4, 0, 0, 0);
      -[TUIInstantiateContext clearErrors](self, "clearErrors");
      v15 = -[_TUIInstantiateEntry initWithTemplate:bindings:actionObject:]([_TUIInstantiateEntry alloc], "initWithTemplate:bindings:actionObject:", v8, v9, v10);
      v16 = objc_autoreleasePoolPush();
      TUI::Evaluation::Context::reset((TUI::Evaluation::Context *)self->_context);
      v17 = TUI::Evaluation::Context::instantiateEntry((id *)self->_context, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      objc_autoreleasePoolPop(v16);
      kdebug_trace(725408464, 5, 0, 0, 0);
      if (v11)
      {
        v19 = *(_QWORD *)(v11 + 27848);
        v20 = mach_absolute_time();
        v21 = v20 - v19;
        if (v19 >= v20)
          v21 = v19 - v20;
        *(_QWORD *)(v11 + 27816) += v21;
      }
      v13 = v18;

      v14 = v13;
      goto LABEL_12;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_12:

LABEL_14:
  return v14;
}

- (TUIInstantiatingEntry)entry
{
  return (TUIInstantiatingEntry *)*((id *)self->_context + 94);
}

- (id)saveState
{
  TUIInstantiateContextState *v3;
  id v4;
  TUIInstantiateContextState *v5;

  v3 = [TUIInstantiateContextState alloc];
  v4 = objc_msgSend(*((id *)self->_context + 20), "copy");
  v5 = -[TUIInstantiateContextState initWithViewStateMapping:](v3, "initWithViewStateMapping:", v4);

  return v5;
}

- (void)_context
{
  return self->_context;
}

- (id)actionObject
{
  return *((id *)self->_context + 68);
}

- (void)setEnvironment:(id)a3
{
  TUIEnvironment *v5;
  TUIEnvironment *environment;
  TUIEnvironment *v7;

  v5 = (TUIEnvironment *)a3;
  environment = self->_environment;
  v7 = v5;
  if (environment != v5 && !-[TUIEnvironment isEqualToEnvironment:](environment, "isEqualToEnvironment:", v5))
  {
    objc_storeStrong((id *)&self->_environment, a3);
    TUI::Evaluation::Context::setEnvironment((id *)self->_context, v7);
  }

}

- (NSUUID)UUID
{
  return -[TUIIdentifierMap UUID](self->_identifierMap, "UUID");
}

- (id)evaluationErrors
{
  return TUI::Evaluation::Context::errors((id *)self->_context);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)lengthFromValue:(SEL)a3
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  double v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 5);
  if (!TUIValueNotNil(a4.var0))
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a4.var0, v8);
  v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUI::Evaluation::ResolvedValue::lengthValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);

  return v6;
}

- (double)floatFromValue:(id)a3
{
  double result;

  -[TUIInstantiateContext floatFromValue:default:](self, "floatFromValue:default:", a3.var0, 0.0);
  return result;
}

- (double)floatFromValue:(id)a3 default:(double)a4
{
  id v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 1);
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, (double *)v8);
    a4 = TUI::Evaluation::ResolvedValue::floatValue(v8, (const TUI::Evaluation::Context *)self->_context);

  }
  return a4;
}

- (unint64_t)unsignedIntegerFromValue:(id)a3 default:(unint64_t)a4
{
  double v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 2);
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
    a4 = TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);

  }
  return a4;
}

- (int64_t)integerFromValue:(id)a3 default:(int64_t)a4
{
  double v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 2);
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
    a4 = TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);

  }
  return a4;
}

- (CGSize)sizeFromValue:(id)a3
{
  double width;
  double v6;
  CGFloat height;
  double v8;
  double v9;
  id v10[3];
  CGSize result;

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 8);
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, (double *)v10);
    width = TUI::Evaluation::ResolvedValue::sizeValue(v10, (const TUI::Evaluation::Context *)self->_context);
    height = v6;

  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)colorFromValue:(id)a3
{
  id v5;
  void *v6;
  id v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 10);
  if (!TUIValueNotNil(a3.var0))
    return 0;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, (double *)v8);
  v5 = TUI::Evaluation::ResolvedValue::colorValue(v8, (const TUI::Evaluation::Context *)self->_context);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)BOOLFromValue:(id)a3
{
  unsigned __int8 v5;
  double v7[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 3);
  if (!TUIValueNotNil(a3.var0))
    return 0;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v7);
  v5 = TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);

  return v5;
}

- (BOOL)BOOLForCondition:(id)a3
{
  TUI::Instruction::Decoder *var0;
  unsigned __int8 v5;
  _BYTE v7[8];
  id v8;

  var0 = (TUI::Instruction::Decoder *)a3.var0;
  if (!TUIConditionNotNil(a3.var0))
    return 1;
  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 0);
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, var0, (uint64_t)v7);
  v5 = TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);

  return v5;
}

- (id)stringFromValue:(id)a3
{
  id v5;
  void *v6;
  double v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 6);
  if (!TUIValueNotNil(a3.var0))
    return 0;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
  v5 = TUI::Evaluation::ResolvedValue::stringValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)objectFromValue:(id)a3
{
  id v5;
  void *v6;
  double v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 7);
  if (!TUIValueNotNil(a3.var0))
    return 0;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
  v5 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (CGAffineTransform)transformFromValue:(SEL)a3
{
  CGAffineTransform *result;
  __int128 v8;
  double v9[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 4);
  result = (CGAffineTransform *)TUIValueNotNil(a4.var0);
  if ((_DWORD)result)
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a4.var0, v9);
    TUI::Evaluation::ResolvedValue::transformValue((TUI::Evaluation::ResolvedValue *)v9, (const TUI::Evaluation::Context *)self->_context, retstr);

  }
  else
  {
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  return result;
}

- ($4AC7F32B1C626A3A04933030E84D26E0)springTimingParametersFromValue:(SEL)a3
{
  $4AC7F32B1C626A3A04933030E84D26E0 *result;
  id v8[3];

  -[TUIStatsEventCollector recordEvent:](self->_statsCollector, "recordEvent:", 28);
  result = ($4AC7F32B1C626A3A04933030E84D26E0 *)TUIValueNotNil(a4.var0);
  if ((_DWORD)result)
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a4.var0, (double *)v8);
    TUI::Evaluation::ResolvedValue::springTimingParameters(v8, (const TUI::Evaluation::Context *)self->_context, (uint64_t)retstr);

  }
  else
  {
    *(_OWORD *)&retstr->var0 = TUISpringTimingParametersZero;
    *(_OWORD *)&retstr->var2 = unk_22F518;
    retstr->var3.dy = 0.0;
  }
  return result;
}

- (id)stringFromName:(id)a3
{
  unint64_t v4;
  id v5;
  __CFString *v6;

  v4 = a3;
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    v5 = TUI::Symbol::Tab::string(*((TUI::Symbol::Tab **)self->_context + 70), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = &stru_243BF0;
  }
  return v6;
}

- (id)guideSpecFromValue:(id)a3
{
  TUI::Instruction::Decoder *var0;
  id v5;
  void *v6;
  id v8[3];

  var0 = (TUI::Instruction::Decoder *)a3.var0;
  if (!TUIValueNotNil(a3.var0))
    return 0;
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, var0, (double *)v8);
  v5 = TUI::Evaluation::ResolvedValue::guideValue(v8, (const TUI::Evaluation::Context *)self->_context);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)instantiateBinding:(id)a3 withDynamicProvider:(id)a4 childrenOfNode:(id)a5
{
  id v8;
  unsigned int var0;
  unint64_t v10;
  unsigned int v11;
  void *context;
  char v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a4;
  var0 = a5.var0;
  v10 = TUI::Evaluation::Context::childrenOfNode((uint64_t)self->_context, a5.var0);
  v11 = TUI::Evaluation::Context::closureForNode((uint64_t)self->_context, var0);
  context = self->_context;
  v13 = *((_BYTE *)context + 184);
  v14 = (id)objc_opt_class(*((_QWORD *)context + 21));
  if ((objc_opt_respondsToSelector(*((_QWORD *)context + 21), "builderClassForDynamicInstantiation") & 1) != 0)
    v14 = objc_msgSend(*((id *)context + 21), "builderClassForDynamicInstantiation");
  v15 = objc_retainAutorelease(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext snapshotWithClosure:](self, "snapshotWithClosure:", v11));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateAsBinding:options:flags:builderClass:nodes:snapshot:context:", *(unsigned int *)&a3, 0, 2 * (v13 & 1), v15, v10, v16, self));

  return v17;
}

- (unint64_t)updateWithEntry:(id)a3 withBuilder:(id)a4 environmentContainer:(id)a5
{
  return TUI::Evaluation::Context::updateEntryWithBuilderEnvironmentContainer((id *)self->_context, a3, a4, a5);
}

- (id)instantiateEnumerator:(id)a3 withChildrenOfNode:(id)a4 options:(id)a5
{
  id v8;
  _BYTE *context;
  char v10;
  unsigned int var0;
  unint64_t v12;
  unsigned int v13;
  id v14;
  void *v15;

  v8 = a5;
  context = self->_context;
  v10 = context[184];
  var0 = a4.var0;
  v12 = TUI::Evaluation::Context::childrenOfNode((uint64_t)context, a4.var0);
  v13 = TUI::Evaluation::Context::closureForNode((uint64_t)self->_context, var0);
  v14 = TUI::Evaluation::Context::instantiateEnumeratorWithNodes((uint64_t)context, a3.var0, v12, v13, v8, 2 * (v10 & 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (id)snapshotWithClosure:(id)a3
{
  TUIInstantiateContextSnapshot *v3;

  v3 = [TUIInstantiateContextSnapshot alloc];
  TUI::Evaluation::Context::newSnapshot();
}

- (unint64_t)evaluateEnumerator:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 block:(id)a8
{
  id v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  _DWORD *v18;
  unint64_t v19;
  Entry v20;
  unint64_t v22;
  uint64_t v23;

  v14 = a4;
  v15 = a8;
  v16 = !TUIEnumeratorNotNil(a3.var0);
  if (!v15)
    LOBYTE(v16) = 1;
  if (v16)
  {
    v19 = 0;
  }
  else
  {
    v17 = *((_QWORD *)self->_context + 72);
    if (*(_QWORD *)(v17 + 264) <= (unint64_t)a3.var0)
      v18 = 0;
    else
      v18 = (_DWORD *)(*(_QWORD *)(v17 + 256) + 16 * a3.var0);
    sub_87AD8((uint64_t)&v22, v18);
    v20 = (Entry)v23;
    v19 = TUI::Evaluation::Context::evaluateEnumeratorWithBlock((_QWORD *)self->_context, v22, v20, v14, a5, a6, a7.var0, v15);
  }

  return v19;
}

- (unint64_t)evaluateBinding:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 block:(id)a8
{
  id v14;
  id v15;
  Entry v16;
  _BOOL4 v17;
  unint64_t v18;
  Entry v19;
  Entry v20;
  unint64_t v21;

  v14 = a4;
  v15 = a8;
  v17 = !TUINameIsValid(*(_DWORD *)&a3);
  if (!v15)
    LOBYTE(v17) = 1;
  if (v17)
  {
    v21 = 0;
  }
  else
  {
    v18 = TUI::Package::Enumerator::Entry::binding((TUI::Package::Enumerator::Entry *)*(unsigned int *)&a3, v16);
    v20 = v19;
    v21 = TUI::Evaluation::Context::evaluateEnumeratorWithBlock((_QWORD *)self->_context, v18, v20, v14, a5, a6, a7.var0, v15);
  }

  return v21;
}

- (unint64_t)evaluateEnumerator:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 nodes:(id)a8 flags:(unint64_t)a9 containingObject:(id)a10 builder:(id)a11
{
  return TUI::Evaluation::Context::evaluateEnumeratorWithNodes((uint64_t)self->_context, a3.var0, a4, a5, a6, a7.var0, *(_QWORD *)&a8, a9, a10, a11);
}

- (unint64_t)evaluateBinding:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 nodes:(id)a8 flags:(unint64_t)a9 containingObject:(id)a10 builder:(id)a11
{
  return TUI::Evaluation::Context::evaluateBindingWithNodes((uint64_t)self->_context, *(_DWORD *)&a3, a4, a5, a6, a7.var0, *(_QWORD *)&a8, a9, (uint64_t)a10, a11);
}

- (void)evaluateEnumerator:(id)a3 withObject:(id)a4 nodes:(id)a5 containingObject:(id)a6 builder:(id)a7
{
  TUI::Evaluation::Context::evaluateEnumeratorWithNodes((uint64_t)self->_context, a3.var0, a4, *(_QWORD *)&a5, a6, a7);
}

- (void)evaluateBinding:(id)a3 withObject:(id)a4 nodes:(id)a5 containingObject:(id)a6 builder:(id)a7
{
  TUI::Evaluation::Context::evaluateBindingWithNodes((uint64_t)self->_context, *(_DWORD *)&a3, a4, *(_QWORD *)&a5, (uint64_t)a6, a7);
}

- (void)reportError:(unint64_t)a3
{
  TUI::Evaluation::Context::reportError((uint64_t)self->_context, a3, 0);
}

- (id)identifierWithNode:(id)a3
{
  return TUI::Evaluation::Context::identifierWithNode((uint64_t)self->_context, a3.var0);
}

- (id)modelIdentifierWithNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = TUI::Evaluation::Context::identifierWithNode((uint64_t)self->_context, a3.var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap UUID](self->_identifierMap, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_identifierByPrependingUUID:", v6));

  return v7;
}

- (id)modelIdentifierByAppendingString:(id)a3 node:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = TUI::Evaluation::Context::identifierWithNode((uint64_t)self->_context, a4.var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tui_identifierByAppendingString:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifierMap UUID](self->_identifierMap, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tui_identifierByPrependingUUID:", v10));

  return v11;
}

- (void)evaluateWithSnapshot:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t *context;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t *v13;
  std::__shared_weak_count *v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      context = (uint64_t *)self->_context;
      objc_msgSend(v6, "contextSnapshot");
      TUI::Evaluation::Context::evaluateWithSnapshot(context, &v13, v8);
      v10 = v14;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
    }
  }

}

- (void)clearErrors
{
  TUI::Evaluation::Context::clearErrors((id *)self->_context);
}

- (void)setStatsCollector:(id)a3
{
  id v5;
  _QWORD *context;
  void *v7;

  v5 = a3;
  objc_storeStrong((id *)&self->_statsCollector, a3);
  context = self->_context;
  v7 = (void *)context[67];
  context[67] = v5;

}

- (id)viewStateForNode:(id)a3 binding:(id)a4
{
  return TUI::Evaluation::Context::viewStateForNode((uint64_t)self->_context, a3.var0, *(_DWORD *)&a4);
}

- (void)defineBindingWithName:(id)a3 value:(id)a4
{
  Entry v6;
  objc_object *v7;

  v7 = (objc_object *)a4;
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    v6 = (Entry)a3;
    TUI::Evaluation::Context::pushBinding((TUI::Evaluation::Context *)self->_context, v6, v7);
  }

}

- (void)defineComponentBindingWithName:(id)a3 value:(id)a4
{
  Entry v6;
  id v7;

  v7 = a4;
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    v6 = (Entry)a3;
    TUI::Evaluation::Context::defineComponentBinding((uint64_t)self->_context, v6, v7);
  }

}

- (void)defineConstantWithName:(id)a3 value:(id)a4
{
  if (TUINameIsValid(*(_DWORD *)&a3) && TUIValueNotNil(a4.var0))
    TUI::Evaluation::Context::pushConstant((TUI::Instruction::Evaluation **)self->_context, *(_DWORD *)&a3, (TUI::Instruction::Decoder *)a4.var0);
}

- (void)defineBool:(BOOL)a3 withName:(id)a4
{
  TUI::Evaluation::Context *context;
  ResolvedValue v8;

  if (TUINameIsValid(*(_DWORD *)&a4))
  {
    context = (TUI::Evaluation::Context *)self->_context;
    v8._kind = 12;
    v8._object = 0;
    v8.var0._BOOL = a3;
    TUI::Evaluation::Context::pushConstant(context, *(_DWORD *)&a4, &v8);

  }
}

- (void)defineLet:(id)a3 closure:(id)a4
{
  unint64_t var0;
  TUI::Instruction::Evaluation **context;
  TUI::Instruction::Evaluation *v9;
  unsigned __int16 *v10;
  int v11;
  uint64_t v12;
  unsigned int v14;
  int v15;

  var0 = a3.var0.var0;
  if (TUIDefinitionNotNil(a3.var0.var0) && TUIValueNotNil(a3.var1.var0))
  {
    context = (TUI::Instruction::Evaluation **)self->_context;
    v9 = context[72];
    if (*((_QWORD *)v9 + 23) > var0)
    {
      v10 = (unsigned __int16 *)(*((_QWORD *)v9 + 22) + 12 * var0);
      if (v10)
      {
        v11 = v10[1];
        v12 = v10[2];
        if (v12 != 0xFFFF && v11 != 0xFFFF)
        {
          v14 = v11 | ((_DWORD)v12 << 16);
          v15 = *v10;
          if (*v10)
          {
            if (v15 == 2)
            {
              if (*((_DWORD *)v10 + 2) != -1)
                TUI::Evaluation::Context::pushFunction(context, *(_QWORD *)&a3, a4.var0);
            }
            else if (v15 == 1)
            {
              TUI::Evaluation::Context::pushNamedElement(context, v14, (TUI::Instruction::Decoder *)HIDWORD(*(unint64_t *)&a3));
            }
          }
          else
          {
            TUI::Evaluation::Context::pushConstant(context, v14, (TUI::Instruction::Decoder *)HIDWORD(*(unint64_t *)&a3));
          }
        }
      }
    }
  }
}

- (void)defineElement:(id)a3 closure:(id)a4
{
  if (TUIDefinitionNotNil(a3.var0.var0) && TUIElementNodeNotNil(a3.var1.var0))
    TUI::Evaluation::Context::pushDefinedElement((_QWORD *)self->_context, *(_QWORD *)&a3, a4.var0);
}

- (void)defineStyle:(id *)a3 closure:(id)a4
{
  uint64_t *context;
  $37BEA69CB2A2744B1AE9B34F7442AF12 v5;

  context = (uint64_t *)self->_context;
  v5 = *a3;
  TUI::Evaluation::Context::pushStyle(context, (int *)&v5, a4.var0);
}

- (void)defineAnimation:(id)a3 closure:(id)a4
{
  TUI::Evaluation::Context::pushAnimation((_QWORD *)self->_context, *(_QWORD *)&a3, a4.var0);
}

- (id)instantiateAnimationReference:(id)a3
{
  return TUI::Evaluation::Context::instantiateAnimationReference((_QWORD *)self->_context, *(_QWORD *)&a3);
}

- (void)instantiateElementReference:(id)a3 withChildrenOfNode:(id)a4
{
  TUI::Evaluation::Context::instantiateElementReferenceWithChildrenOfNode((uint64_t)self->_context, a3.var0, a4.var0);
}

- (void)instantiateNamedElementReference:(id)a3
{
  TUI::Evaluation::Context::instantiateNamedElementReference((_QWORD *)self->_context, a3.var0);
}

- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  TUIInstantiateCapturing *capture;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager dynamicRegistry](self->_manager, "dynamicRegistry"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stateProviderForKind:", v8));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dynamicStateForKind:instance:parameters:", v8, v9, v10));
  if (v13)
  {
    capture = self->_capture;
    if (capture)
      -[TUIInstantiateCapturing captureDynamicState:forKind:instance:parameters:](capture, "captureDynamicState:forKind:instance:parameters:", v13, v8, v9, v10);
  }

  return v13;
}

- (void)useGlobalsWithName:(id)a3
{
  TUI::Evaluation::Context::useGlobalsWithName((_QWORD *)self->_context, *(_DWORD *)&a3);
}

- (void)instantiateComponentWithReference:(id)a3 withChildrenOfNode:(id)a4
{
  TUI::Evaluation::Context::instantiateComponentWithChildrenOfNode((const TUI::Evaluation::Context *)self->_context, a3.var0, a4.var0);
}

- (void)updateComponentBody:(id)a3
{
  TUI::Evaluation::Context::instantiateComponentBody((TUI::Evaluation::Context *)self->_context, (TUIComponent *)a3, 1);
}

- (BOOL)updateComponentGlobals:(id)a3
{
  return TUI::Evaluation::Context::updateComponentGlobalsIfNeeded((TUI::Evaluation::Context *)self->_context, (TUIComponent *)a3);
}

- (void)instantiateRender:(id)a3 withChildrenOfNode:(id)a4
{
  TUI::Evaluation::Context::instantiateComponentRender((id *)self->_context, a3.var0, a4.var0);
}

- (id)componentViewStateWithName:(id)a3
{
  return TUI::Evaluation::Context::componentViewStateWithName((uint64_t)self->_context, *(_DWORD *)&a3);
}

- (id)_xpathForLocation:(id)a3
{
  __int16 var0;
  unint64_t v5;
  const TUI::Package::Buffer *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v12;
  unint64_t v13;

  var0 = a3.var0;
  v5 = a3.var0;
  if (!TUILocationNotNil(a3.var0))
    return 0;
  v6 = (const TUI::Package::Buffer *)*((_QWORD *)self->_context + 72);
  if (*((_QWORD *)v6 + 17) > v5 >> 12 && (v7 = (unsigned __int16 *)(*((_QWORD *)v6 + 16) + 8 * (v5 >> 12))) != 0)
  {
    v8 = *v7;
    v9 = (unint64_t)*((unsigned int *)v7 + 1) << 32;
    v10 = v8 << 16;
  }
  else
  {
    v9 = 0xFFFFFFFF00000000;
    v10 = 4294901760;
  }
  v13 = v9 | v10 | var0 & 0xFFF;
  v12 = TUI::Package::Location::Entry::description((TUI::Package::Location::Entry *)&v13, v6);
  return (id)objc_claimAutoreleasedReturnValue(v12);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)unresolvedValueForAttribute:(unsigned __int16)a3 node:(id)a4
{
  _QWORD *context;
  $738B17BD11CC339B30296C0EA03CEC2B *v5;
  unsigned __int16 v7;

  context = self->_context;
  v7 = a3;
  if (a3 == 0xFFFF)
    goto LABEL_5;
  if (a3 >= 0x100u)
    sub_87B1C("bitset test argument out of range");
  if (((*(_QWORD *)((char *)context + (((unint64_t)a3 >> 3) & 0x1FF8) + 248) >> a3) & 1) == 0)
LABEL_5:
    v5 = ($738B17BD11CC339B30296C0EA03CEC2B *)&TUIValueNil;
  else
    v5 = ($738B17BD11CC339B30296C0EA03CEC2B *)sub_1529C(context + 39, &v7) + 5;
  return ($738B17BD11CC339B30296C0EA03CEC2B)v5->var0;
}

- ($7E080378D8F67055EE0984892F39872B)propertyNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($7E080378D8F67055EE0984892F39872B)TUI::Instruction::Decoder::propertyName(v5, (uint64_t)self->_context, v6);
}

- (const)_resolvedValueForAttribute:(unsigned __int16)a3 node:(id)a4
{
  _QWORD *context;
  unsigned __int16 v6;

  context = self->_context;
  v6 = a3;
  if (a3 == 0xFFFF)
    return 0;
  if (a3 >= 0x100u)
    sub_87B1C("bitset test argument out of range");
  if (((*(_QWORD *)((char *)context + (((unint64_t)a3 >> 3) & 0x1FF8) + 280) >> a3) & 1) == 0)
    return 0;
  else
    return (const ResolvedValue *)(sub_1529C(context + 44, &v6) + 3);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)lengthForAttribute:(SEL)a3 node:(unsigned __int16)a4
{
  ResolvedValue *v6;

  v6 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a4, a5.var0);
  if (v6)
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUI::Evaluation::ResolvedValue::lengthValue((TUI::Evaluation::ResolvedValue *)v6, (const TUI::Evaluation::Context *)self->_context);
  else
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- (UIEdgeInsets)insetsForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    top = TUI::Evaluation::ResolvedValue::insetsValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)insetsForAttribute:(unsigned __int16)a3 withDefault:(UIEdgeInsets)a4 node:(id)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  ResolvedValue *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a5.var0);
  if (v10)
  {
    top = TUI::Evaluation::ResolvedValue::insetsValue((id *)v10, (const TUI::Evaluation::Context *)self->_context);
    left = v11;
    bottom = v12;
    right = v13;
  }
  v14 = top;
  v15 = left;
  v16 = bottom;
  v17 = right;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)floatForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
    return TUI::Evaluation::ResolvedValue::floatValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
  else
    return 0.0;
}

- (double)floatForAttribute:(unsigned __int16)a3 withDefault:(double)a4 node:(id)a5
{
  ResolvedValue *v7;

  v7 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a5.var0);
  if (v7)
    return TUI::Evaluation::ResolvedValue::floatValue((id *)v7, (const TUI::Evaluation::Context *)self->_context);
  else
    return a4;
}

- (int64_t)integerForAttribute:(unsigned __int16)a3 withDefault:(int64_t)a4 node:(id)a5
{
  ResolvedValue *v7;

  v7 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a5.var0);
  if (v7)
    return TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);
  else
    return a4;
}

- (unint64_t)unsignedIntegerForAttribute:(unsigned __int16)a3 withDefault:(unint64_t)a4 node:(id)a5
{
  ResolvedValue *v7;

  v7 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a5.var0);
  if (v7)
    return TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);
  else
    return a4;
}

- (CGSize)sizeForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  double width;
  double height;
  CGSize result;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    width = TUI::Evaluation::ResolvedValue::sizeValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)colorForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  id v6;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    v6 = TUI::Evaluation::ResolvedValue::colorValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (id)colorArrayForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  id v6;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    v6 = TUI::Evaluation::ResolvedValue::colorArrayValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (id)stringArrayForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  id v6;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    v6 = TUI::Evaluation::ResolvedValue::stringArrayValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (id)stringForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  id v6;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    v6 = TUI::Evaluation::ResolvedValue::stringValue((TUI::Evaluation::ResolvedValue *)v5, (const TUI::Evaluation::Context *)self->_context);
    v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (BOOL)BOOLForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
    LOBYTE(v5) = TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v5, (const TUI::Evaluation::Context *)self->_context);
  return (char)v5;
}

- (BOOL)BOOLForAttribute:(unsigned __int16)a3 withDefault:(BOOL)a4 node:(id)a5
{
  ResolvedValue *v7;

  v7 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a5.var0);
  if (v7)
    return TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);
  else
    return a4;
}

- (id)objectForAttribute:(unsigned __int16)a3 node:(id)a4
{
  ResolvedValue *v5;
  id v6;

  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a3, a4.var0);
  if (v5)
  {
    v6 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)v5, (const TUI::Evaluation::Context *)self->_context);
    v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (CGAffineTransform)transformForAttribute:(SEL)a3 node:(unsigned __int16)a4
{
  CGAffineTransform *result;
  __int128 v8;

  result = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a4, a5.var0);
  if (result)
  {
    TUI::Evaluation::ResolvedValue::transformValue((TUI::Evaluation::ResolvedValue *)result, (const TUI::Evaluation::Context *)self->_context, retstr);
  }
  else
  {
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  return result;
}

- ($4AC7F32B1C626A3A04933030E84D26E0)springTimingParametersForAttribute:(SEL)a3 node:(unsigned __int16)a4
{
  $4AC7F32B1C626A3A04933030E84D26E0 *result;

  result = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", a4, a5.var0);
  if (result)
  {
    TUI::Evaluation::ResolvedValue::springTimingParameters((id *)result, (const TUI::Evaluation::Context *)self->_context, (uint64_t)retstr);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = TUISpringTimingParametersZero;
    *(_OWORD *)&retstr->var2 = unk_22F518;
    retstr->var3.dy = 0.0;
  }
  return result;
}

- (unint64_t)animationCalculationModeAndCurveForNode:(id)a3
{
  uint64_t var0;
  void *v5;
  unint64_t v6;
  void *v7;

  var0 = a3.var0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext stringForAttribute:node:](self, "stringForAttribute:node:", 64, a3.var0));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ease-in-out")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ease-in")) & 1) != 0)
  {
    v6 = 0x10000;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ease-out")) & 1) != 0)
  {
    v6 = 0x20000;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("linear")) & 1) != 0)
  {
    v6 = 196608;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("sigmoid")))
  {
    v6 = 0x40000;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInstantiateContext stringForAttribute:node:](self, "stringForAttribute:node:", 46, var0));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("linear")) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("discrete")))
    {
      v6 |= 0x400uLL;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("paced")))
    {
      v6 |= 0x800uLL;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("cubic")))
    {
      v6 |= 0xC00uLL;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("cubic-paced")))
    {
      v6 |= 0x1000uLL;
    }
  }

  return v6;
}

- (id)guidesForNode:(id)a3
{
  uint64_t var0;
  ResolvedValue *v5;
  ResolvedValue *v6;
  ResolvedValue *v7;
  ResolvedValue *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  TUIGuides *v14;

  var0 = a3.var0;
  v5 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", 121, a3.var0);
  v6 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", 207, var0);
  v7 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", 205, var0);
  v8 = -[TUIInstantiateContext _resolvedValueForAttribute:node:](self, "_resolvedValueForAttribute:node:", 43, var0);
  if (v5)
  {
    v9 = TUI::Evaluation::ResolvedValue::guideValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v9);
  }
  if (v6)
  {
    v10 = TUI::Evaluation::ResolvedValue::guideValue((id *)v6, (const TUI::Evaluation::Context *)self->_context);
    v6 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v10);
  }
  if (v7)
  {
    v11 = TUI::Evaluation::ResolvedValue::guideValue((id *)v7, (const TUI::Evaluation::Context *)self->_context);
    v7 = (ResolvedValue *)objc_claimAutoreleasedReturnValue(v11);
  }
  if (v8)
  {
    v12 = TUI::Evaluation::ResolvedValue::guideValue((id *)v8, (const TUI::Evaluation::Context *)self->_context);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v5)
      goto LABEL_15;
  }
  else
  {
    v13 = 0;
    if (v5)
    {
LABEL_15:
      v14 = -[TUIGuides initWithLeading:trailing:top:bottom:]([TUIGuides alloc], "initWithLeading:trailing:top:bottom:", v5, v6, v7, v13);
      goto LABEL_16;
    }
  }
  if (v6 || v7 || v13)
    goto LABEL_15;
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)fontSpecForNode:(id)a3
{
  return TUI::Evaluation::Context::fontSpecForNode((uint64_t)self->_context);
}

- (id)pointerForNode:(id)a3
{
  return TUI::Evaluation::Context::pointerForNode((uint64_t)self->_context);
}

- (id)snapForAttribute:(unsigned __int16)a3 node:(id)a4
{
  return TUI::Evaluation::Context::snapForAttribute((const TUI::Evaluation::Context *)self->_context, a3);
}

- (id)pointerStyleForNode:(id)a3
{
  uint64_t v4;
  const TUI::Evaluation::Context *context;
  void *v6;
  uint64_t **v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int16 v12;

  v4 = objc_opt_class(TUIPointerStyle);
  context = (const TUI::Evaluation::Context *)self->_context;
  v12 = 153;
  if ((*((_BYTE *)context + 299) & 2) != 0)
  {
    v7 = sub_1529C((_QWORD *)context + 44, &v12);
    v8 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)(v7 + 3), context);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v6 = 0;
  }
  v9 = TUIDynamicCast(v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)focusStyleForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unsigned int v4;
  uint64_t v6;
  const TUI::Evaluation::Context *context;
  uint64_t **v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int16 v14;

  v4 = a3;
  v6 = objc_opt_class(TUIFocusStyle);
  context = (const TUI::Evaluation::Context *)self->_context;
  v14 = v4;
  if (v4 == 0xFFFF)
    goto LABEL_5;
  if (v4 >= 0x100)
    sub_87B1C("bitset test argument out of range");
  if (((*(_QWORD *)((char *)context + (((unint64_t)v4 >> 3) & 0x1FF8) + 280) >> v4) & 1) == 0)
  {
LABEL_5:
    v10 = 0;
  }
  else
  {
    v8 = sub_1529C((_QWORD *)context + 44, &v14);
    v9 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)(v8 + 3), context);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  v11 = TUIDynamicCast(v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)elementReferenceForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Instruction::Decoder::elementReference(v5, (uint64_t)self->_context, v6);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)nameReferenceForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Instruction::Decoder::nameReference(v5, (uint64_t)self->_context, v6);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)bindingNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)TUI::Instruction::Decoder::bindingName(v5, (uint64_t)self->_context, v6);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)constantNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)TUI::Instruction::Decoder::constantName(v5, (uint64_t)self->_context, v6);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)globalsNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)TUI::Instruction::Decoder::globalsName(v5, (uint64_t)self->_context, v6);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)lookupUnconditionalAttribute:(unsigned __int16)a3 attributes:(id)a4
{
  uint64_t var1;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t var0;
  unsigned __int16 *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int *v16;
  int *v17;
  unsigned int v18;
  $738B17BD11CC339B30296C0EA03CEC2B v20;
  uint64_t v21;

  v20.var0 = 0;
  var1 = a4.var1;
  if (a4.var1)
  {
    v5 = a3;
    v6 = 0;
    v7 = (_QWORD *)*((_QWORD *)self->_context + 72);
    var0 = a4.var0;
    v21 = a4.var1;
    do
    {
      if (v7[31] > (unint64_t)(v6 + var0) && (v9 = (unsigned __int16 *)(v7[30] + 8 * (v6 + var0))) != 0)
      {
        v10 = *v9;
        v11 = v7[60];
        if (v10 >= (v7[61] - v11) >> 1)
          v12 = 0xFFFF;
        else
          v12 = *(unsigned __int16 *)(v11 + 2 * v10);
        v13 = v9[1];
        v14 = *((unsigned int *)v9 + 1);
      }
      else
      {
        v13 = 0;
        v12 = 0xFFFF;
        v14 = 0xFFFFFFFFLL;
      }
      if (v12 == v5 && v13)
      {
        v15 = 12 * v14;
        while (1)
        {
          if (v7[29] <= v14)
          {
            v17 = &TUIConditionNil;
            v16 = &TUIValueNil;
          }
          else
          {
            v16 = (int *)(v15 + v7[28]);
            v17 = v16 + 1;
            if (!v16)
            {
              v17 = &TUIConditionNil;
              v16 = &TUIValueNil;
            }
          }
          v18 = *v16;
          if (TUIConditionIsNil(*v17))
            break;
          v15 += 12;
          ++v14;
          if (!--v13)
            goto LABEL_22;
        }
        v20.var0 = v18;
LABEL_22:
        var1 = v21;
      }
      ++v6;
    }
    while (v6 != var1);
  }
  return v20;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)closureForNode:(id)a3
{
  _QWORD *context;
  uint64_t v4;
  uint64_t v5;

  context = self->_context;
  v4 = context[72];
  if (*(_QWORD *)(v4 + 216) <= (unint64_t)a3.var0)
    v5 = 0;
  else
    v5 = *(_QWORD *)(v4 + 208) + 28 * a3.var0;
  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Evaluation::Context::closureForElement((uint64_t)context, v5);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)unconditionalValueForAttribute:(unsigned __int16)a3 node:(id)a4
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
}

- ($0220C184157FC9E8AD112820945A9326)letDefinitionWithNameAttribute:(unsigned __int16)a3 valueAttribute:(unsigned __int16)a4 node:(id)a5
{
  uint64_t v5;
  uint64_t var0;
  TUI::Instruction::Decoder *v8;
  const TUI::Evaluation::Context *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  var0 = a5.var0;
  v8 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a5.var0);
  v10 = TUI::Instruction::Decoder::definition(v8, (uint64_t)self->_context, v9);
  v11 = -[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v5, var0);
  v12 = TUILetDefinitionNil;
  v13 = *(_DWORD *)algn_2C95A4;
  v14 = TUIDefinitionNotNil(v10);
  if (v14)
    v15 = v10;
  else
    v15 = v12;
  if (v14)
    v16 = v11;
  else
    v16 = v13;
  return ($0220C184157FC9E8AD112820945A9326)(v15 | (v16 << 32));
}

- ($37BEA69CB2A2744B1AE9B34F7442AF12)styleDefinitionWithNode:(SEL)a3 nameAttribute:(id)a4 inheritAttribute:(unsigned __int16)a5
{
  uint64_t v6;
  uint64_t v7;
  $37BEA69CB2A2744B1AE9B34F7442AF12 *result;
  uint64_t v12;
  TUI::Instruction::Decoder *v13;
  const TUI::Evaluation::Context *v14;
  unsigned int v15;
  TUI::Instruction::Decoder *v16;
  const TUI::Evaluation::Context *v17;

  v6 = a6;
  v7 = a5;
  result = ($37BEA69CB2A2744B1AE9B34F7442AF12 *)-[TUIPackageInternal packageBuffer](self->_package, "packageBuffer");
  if (*(_QWORD *)&result[9].var0.var0 > (unint64_t)a4.var0
    && (v12 = *(_QWORD *)&result[8].var2.var0.var1 + 28 * a4.var0) != 0)
  {
    v13 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v7, a4.var0);
    v15 = TUI::Instruction::Decoder::definition(v13, (uint64_t)self->_context, v14);
    *(_OWORD *)&retstr->var0.var0 = TUIStyleDefinitionNil;
    *(_QWORD *)&retstr->var2.var0.var1 = qword_2C95B8;
    result = ($37BEA69CB2A2744B1AE9B34F7442AF12 *)TUIDefinitionNotNil(v15);
    if ((_DWORD)result)
    {
      v16 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v6, a4.var0);
      result = ($37BEA69CB2A2744B1AE9B34F7442AF12 *)TUI::Instruction::Decoder::styleReference(v16, (uint64_t)self->_context, v17);
      retstr->var0.var0 = v15;
      retstr->var1 = ($5B0274039C15E806FA91EF6B5728B838)(*(unsigned int *)(v12 + 16) | ((unint64_t)*(unsigned __int16 *)(v12 + 2) << 32));
      retstr->var2 = ($0F674443F67B1BBEFA3E91226872A32D)result;
      retstr->var3.var0 = *(_DWORD *)(v12 + 24);
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0.var0 = TUIStyleDefinitionNil;
    *(_QWORD *)&retstr->var2.var0.var1 = qword_2C95B8;
  }
  return result;
}

- ($0220C184157FC9E8AD112820945A9326)animationDefinitonWithNode:(id)a3 nameAttribute:(unsigned __int16)a4
{
  uint64_t v4;
  _QWORD *v7;
  unsigned int v8;
  uint64_t var0;
  TUI::Instruction::Decoder *v10;
  const TUI::Evaluation::Context *v11;
  int v12;
  int v13;
  unsigned int v14;
  _BOOL4 v15;

  v4 = a4;
  v7 = -[TUIPackageInternal packageBuffer](self->_package, "packageBuffer");
  if (v7[27] > (unint64_t)a3.var0 && 28 * a3.var0 + v7[26])
  {
    v10 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v4);
    v12 = TUI::Instruction::Decoder::definition(v10, (uint64_t)self->_context, v11);
    v13 = TUIAnimationDefinitionNil;
    v14 = dword_2C95C4;
    v15 = TUIDefinitionNotNil(v12);
    if (v15)
      v8 = v12;
    else
      v8 = v13;
    if (v15)
      var0 = a3.var0;
    else
      var0 = v14;
  }
  else
  {
    v8 = TUIAnimationDefinitionNil;
    var0 = dword_2C95C4;
  }
  return ($0220C184157FC9E8AD112820945A9326)(v8 | (unint64_t)(var0 << 32));
}

- ($0220C184157FC9E8AD112820945A9326)elementDefinitionWithNameAttribute:(unsigned __int16)a3 node:(id)a4
{
  uint64_t v5;
  _QWORD *v7;
  unsigned int v8;
  uint64_t var0;
  int v10;
  unsigned int v11;
  TUI::Instruction::Decoder *v12;
  const TUI::Evaluation::Context *v13;
  int v14;
  _BOOL4 v15;

  v5 = a3;
  v7 = -[TUIPackageInternal packageBuffer](self->_package, "packageBuffer");
  if (v7[27] > (unint64_t)a4.var0 && 28 * a4.var0 + v7[26])
  {
    v10 = TUIElementDefinitionNil;
    v11 = dword_2C95CC;
    v12 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v5);
    v14 = TUI::Instruction::Decoder::definition(v12, (uint64_t)self->_context, v13);
    v15 = TUIDefinitionNotNil(v14);
    if (v15)
      v8 = v14;
    else
      v8 = v10;
    if (v15)
      var0 = a4.var0;
    else
      var0 = v11;
  }
  else
  {
    v8 = TUIElementDefinitionNil;
    var0 = dword_2C95CC;
  }
  return ($0220C184157FC9E8AD112820945A9326)(v8 | (unint64_t)(var0 << 32));
}

- ($738B17BD11CC339B30296C0EA03CEC2B)enumeratorWithAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Instruction::Decoder::enumerator(v5, (uint64_t)self->_context, v6);
}

- ($0F674443F67B1BBEFA3E91226872A32D)animationReferenceForAttribute:(unsigned __int16)a3 node:(id)a4
{
  TUI::Instruction::Decoder *v5;
  const TUI::Evaluation::Context *v6;

  v5 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", a3, a4.var0);
  return ($0F674443F67B1BBEFA3E91226872A32D)TUI::Instruction::Decoder::animationReference(v5, (uint64_t)self->_context, v6);
}

- (id)baseURLForNode:(id)a3
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (_QWORD *)*((_QWORD *)self->_context + 72);
  if (v3[27] > (unint64_t)a3.var0
    && (v4 = v3[26] + 28 * a3.var0) != 0
    && (v5 = *(_DWORD *)(v4 + 24) & 0xFFF, v3[14] > v5)
    && (v6 = v3[13]) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6 + *(unsigned int *)(v3[15] + 4 * v5)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v7, *v3));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)includeTemplateWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t uniqueIdentifier;
  void *v17;
  void *v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  if (v4)
  {
    v5 = *((id *)self->_context + 95);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "package"));

    if ((objc_opt_respondsToSelector(v6, "prebuiltTemplates") & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v7, "path"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByStandardizingPath"));
      -[NSObject setPath:](v7, "setPath:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URL](v7, "URL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prebuiltTemplates"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

      if (v12)
      {
        TUI::Evaluation::Context::includeTemplate((uint64_t)self->_context, v12);
      }
      else
      {
        v14 = TUIInstantiationLog();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uniqueIdentifier = self->_feedId.uniqueIdentifier;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteURL"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
          v19 = 134218498;
          v20 = uniqueIdentifier;
          v21 = 2114;
          v22 = v17;
          v23 = 2114;
          v24 = v18;
          _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to find template: %{public}@ in package: %{public}@", (uint8_t *)&v19, 0x20u);

        }
      }

    }
    else
    {
      v13 = TUIInstantiationLog();
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_17D850((uint64_t)self, v7);
    }

  }
  else
  {
    -[TUIInstantiateContext reportError:](self, "reportError:", 1001);
  }

}

- (unint64_t)childCountForNode:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)self->_context + 72);
  if (*(_QWORD *)(v3 + 216) > (unint64_t)a3.var0 && (v4 = *(_QWORD *)(v3 + 208) + 28 * a3.var0) != 0)
    return *(unsigned __int16 *)(v4 + 4);
  else
    return 0;
}

- (BOOL)recordErrors
{
  return *((_BYTE *)self->_context + 552);
}

- (void)setRecordErrors:(BOOL)a3
{
  *((_BYTE *)self->_context + 552) = a3;
}

- (id)environmentChildContainersForContainer:(id)a3
{
  id v3;

  v3 = TUI::Evaluation::Context::environmentChildContainersForContainer((uint64_t)self->_context, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)environmentContainersUsingGlobals
{
  return objc_msgSend(*((id *)self->_context + 93), "objectEnumerator");
}

- (void)usedDynamicColor
{
  *((_QWORD *)self->_context + 74) |= 0x10uLL;
}

- (void)enumerateChildrenOfNode:(id)a3 block:(id)a4
{
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v6 = TUI::Evaluation::Context::childrenOfNode((uint64_t)self->_context, a3.var0);
  v7 = v6;
  if ((v6 & 0xFFFF00000000) != 0)
  {
    v8 = WORD2(v6);
    do
    {
      if (TUI::Evaluation::Context::evaluateCconditionForNode((const TUI::Evaluation::Context *)self->_context, v7))v9[2](v9, v7);
      ++v7;
      --v8;
    }
    while (v8);
  }

}

- (id)evaluateStringForAttribute:(unsigned __int16)a3 node:(id)a4
{
  id v5;
  void *v6;
  int v8;
  id v9;

  v8 = 0;
  v9 = 0;
  if (TUI::Evaluation::Context::evaluateAttributeForNode((uint64_t)self->_context, a3, a4.var0, (uint64_t)&v8))
  {
    v5 = TUI::Evaluation::ResolvedValue::stringValue((TUI::Evaluation::ResolvedValue *)&v8, (const TUI::Evaluation::Context *)self->_context);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)instantiateNode:(id)a3 withBuilder:(id)a4
{
  TUI::Evaluation::Context::instantiateNodeWithBuilder((uint64_t)self->_context, a3.var0, a4);
}

- (void)evaluateStates:(id)a3 block:(id)a4
{
  TUI::Evaluation::Context::evaluateStates((_QWORD *)self->_context, a3, a4);
}

- ($5B0274039C15E806FA91EF6B5728B838)childrenForNode:(id)a3
{
  return ($5B0274039C15E806FA91EF6B5728B838)TUI::Evaluation::Context::childrenOfNode((uint64_t)self->_context, a3.var0);
}

- (id)debugDumpEnvironmentContainerStructure:(id)a3
{
  NSMutableString *v3;

  v3 = TUI::Evaluation::Context::debugDumpEnvironmentContainerStructure((uint64_t)self->_context, a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)defineStruct:(id)a3 withName:(id)a4
{
  TUI::Evaluation::Context::defineStruct((TUI::Evaluation::Context *)self->_context, *(_DWORD *)&a4, (TUIStruct *)a3);
}

- (id)structForAttribute:(unsigned __int16)a3 node:(id)a4
{
  _QWORD *context;
  uint64_t **v6;
  id v7;
  void *v8;
  unsigned __int16 v10;

  context = self->_context;
  v10 = a3;
  if (a3 == 0xFFFF)
    goto LABEL_5;
  if (a3 >= 0x100u)
    sub_87B1C("bitset test argument out of range");
  if (((*(_QWORD *)((char *)context + (((unint64_t)a3 >> 3) & 0x1FF8) + 280) >> a3) & 1) == 0)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v6 = sub_1529C(context + 44, &v10);
    v7 = TUI::Evaluation::ResolvedValue::structValue((id *)v6 + 3, (const TUI::Evaluation::Context *)self->_context);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return v8;
}

- (void)resetInstantiationStats:(BOOL)a3
{
  sub_8783C((uint64_t)self->_context, a3);
}

- (TUIManager)manager
{
  return self->_manager;
}

- (TUIInstantiateContextDelegate)delegate
{
  return (TUIInstantiateContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUIIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (TUIDynamicControlling)dynamicController
{
  return (TUIDynamicControlling *)objc_loadWeakRetained((id *)&self->_dynamicController);
}

- (void)setDynamicController:(id)a3
{
  objc_storeWeak((id *)&self->_dynamicController, a3);
}

- (TUITransactionCoordinating)transactionCoordinator
{
  return (TUITransactionCoordinating *)objc_loadWeakRetained((id *)&self->_transactionCoordinator);
}

- (void)setTransactionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_transactionCoordinator, a3);
}

- (TUIInstantiateCapturing)capture
{
  return self->_capture;
}

- (void)setCapture:(id)a3
{
  objc_storeStrong((id *)&self->_capture, a3);
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIStatsEventCollector)statsCollector
{
  return self->_statsCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsCollector, 0);
  objc_storeStrong((id *)&self->_capture, 0);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_destroyWeak((id *)&self->_dynamicController);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
