@implementation TUIDynamicInstantiateOptions

- (TUIDynamicInstantiateOptions)initWithFetchWindow:(unint64_t)a3 fetchInitial:(unint64_t)a4 fetchDelta:(unint64_t)a5 fetchPadding:(unint64_t)a6 uniqueID:(id)a7
{
  TUIDynamicInstantiateOptions *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUIDynamicInstantiateOptions;
  result = -[TUIDynamicInstantiateOptions init](&v13, "init");
  if (result)
  {
    result->_fetchWindow = a3;
    result->_fetchDelta = a5;
    result->_fetchInitial = a4;
    result->_fetchPadding = a6;
    result->_uniqueID.offset = a7.var0;
  }
  return result;
}

+ (id)optionsWithFetchWindow:(unint64_t)a3 fetchInitial:(unint64_t)a4 fetchDelta:(unint64_t)a5 fetchPadding:(unint64_t)a6 uniqueID:(id)a7
{
  unint64_t v9;
  BOOL v11;
  uint64_t var0;
  BOOL v13;
  TUIDynamicInstantiateOptions *v15;

  v9 = a4;
  v11 = a4 == 0x7FFFFFFFFFFFFFFFLL && a3 == 0x7FFFFFFFFFFFFFFFLL;
  var0 = a7.var0;
  v13 = v11 || a5 == 0x7FFFFFFFFFFFFFFFLL;
  if (v13 && !TUIValueNotNil(a7.var0))
  {
    v15 = 0;
  }
  else
  {
    if (a6 == 0x7FFFFFFFFFFFFFFFLL)
      a6 = a5;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL && a3 != 0x7FFFFFFFFFFFFFFFLL)
      v9 = a3;
    v15 = -[TUIDynamicInstantiateOptions initWithFetchWindow:fetchInitial:fetchDelta:fetchPadding:uniqueID:]([TUIDynamicInstantiateOptions alloc], "initWithFetchWindow:fetchInitial:fetchDelta:fetchPadding:uniqueID:", a3, v9, a5, a6, var0);
  }
  return v15;
}

- (unint64_t)fetchWindow
{
  return self->_fetchWindow;
}

- (unint64_t)fetchDelta
{
  return self->_fetchDelta;
}

- (unint64_t)fetchInitial
{
  return self->_fetchInitial;
}

- (unint64_t)fetchPadding
{
  return self->_fetchPadding;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)uniqueID
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_uniqueID.offset;
}

@end
