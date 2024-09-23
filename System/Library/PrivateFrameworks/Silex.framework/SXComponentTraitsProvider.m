@implementation SXComponentTraitsProvider

- (SXComponentTraitsProvider)initWithDOMObjectProvider:(id)a3
{
  id v5;
  SXComponentTraitsProvider *v6;
  SXComponentTraitsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentTraitsProvider;
  v6 = -[SXComponentTraitsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_DOMObjectProvider, a3);

  return v7;
}

- (unint64_t)traitsForComponent:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "traits");
  objc_msgSend(v4, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXComponentTraitsProvider DOMObjectProvider](self, "DOMObjectProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentStyleForComponent:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "traits") & 6) != 0)
      v5 |= 0x2AuLL;

  }
  return v5;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
