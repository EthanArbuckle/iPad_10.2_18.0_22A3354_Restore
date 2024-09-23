@implementation _NSTextViewportLayoutObserver

- (_NSTextViewportLayoutObserver)initWithWeakObject:(id)a3
{
  _NSTextViewportLayoutObserver *v4;
  _NSTextViewportLayoutObserver *v5;

  v4 = -[_NSTextViewportLayoutObserver init](self, "init");
  v5 = v4;
  if (v4 && !objc_storeWeakOrNil(&v4->location, a3))
  {
    -[_NSTextViewportLayoutObserver dealloc](v5, "dealloc");
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_destroyWeak(&self->location);
  v3.receiver = self;
  v3.super_class = (Class)_NSTextViewportLayoutObserver;
  -[_NSTextViewportLayoutObserver dealloc](&v3, sel_dealloc);
}

- (id)object
{
  return objc_loadWeakRetained(&self->location);
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  id v6;
  char v7;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (void *)objc_msgSend(a3, "object");
  v6 = -[_NSTextViewportLayoutObserver object](self, "object");
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (id)description
{
  id v2;
  const __CFString *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v2 = -[_NSTextViewportLayoutObserver object](self, "object");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)objc_msgSend(v2, "description");
  else
    v3 = &stru_1E260C7D0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), NSStringFromClass(v5), v3);

  return v6;
}

@end
